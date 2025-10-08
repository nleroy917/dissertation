=== Data collection and pre-processing <atacformer-data-processing>
To develop a large training dataset of single-cell ATAC-seq data, we identified, downloaded, and uniformly processed data from three main sources: 1) the Gene Expression Omnibus, 2) the Human Cell Atlas, and 3) the 10X genomics dataset repository. Detailed information on dataset contents and availability can be found in supplemental. All datasets, unless noted, were downloaded as raw `.fastq` files. We designed and built a multi-stage pipeline to uniformly process the `fastq` files. First, we utilized CellRanger ATAC `2.1.0` to convert the fastqs into processed fragment files. Next, each fragment file was imported and initially processed using SnapATAC2 @Zhang2024. We utilized all recommended parameters noted in the "atlas-scale analysis" tutorial ("https://kzhang.org/SnapATAC2/tutorials/atlas.html"). Both steps were parallelized on our computing cluster using the `looper` and `PEP` framework @Sheffield2021.

Next, we again leveraged SnapATAC2 to perform atlas-wide dimensionality reduction, batch correction, and clustering. We performed a two-stage clustering approach. First, a coarse clustering across the entire dataset using Leiden clustering @Traag2019, and then a secondary intra-cluster clustering also using leiden within each cluster. This yielded 359 distinct single-cell clusters within the atlas across all datasets. Each of the 359 clusters was pseudo-bulked into separate `.fragment.tsv` files for downstream analysis.

=== Generation of a uniform model vocabulary <atacformer-vocab-methods>
A uniform vocabulary is essential for genomic region tokenization. For this, we leveraged both public and previously developed tools by our lab for generating genomic interval consensus sets. We utilized `macs3` to perform peak-calling @Zhang2008 on each of the 359 pseudo-bulked fragment files, resulting in 359 corresponding `.narrowPeak` files. Specifically, we used the `peakcall` function with the following parameters: `-g hs -f BEDPE -q 0.01 --nomodel --shift -75 --extsize 200 --keep-dup all -B --SPMR`.

We next utilized our tool `uniwig` to unify all 359 peak sets into big wig (`.bw`) coverage tracks for the start, cores, and ends of all called peaks across all clusters. For `uniwig` we used the following parameters: `-m 5 -s 1 -y wig -z 2`. This resulted in three coverage track files for the starts, cores, and ends.

Finally, we used the coverage tracks as input into our previously published universe creation methods in `geniml` @Rymuza2024. Using both the coverage cutoff and hidden markov model (HMM) algorithms, two consensus sets were created. These two bedfiles were finally merged into one unifying vocabulary for the model using `bedtools merge` @Quinlan2010.

The final vocabulary has 890,704 distinct genomic regions into which all cells are tokenized.

=== Genomic interval tokenization <atacformer-tokenization-methods>
We conceptualized a unique tokenization method for our models that is designed to be as flexible and simple as possible, enabling broad use of Atacformer for many data types including bulk-ATAC seq data. Any entity that can be represented as a BED-file is valid input to the model. As an example, a single-cell from a scATAC-seq experiment can be thought of as a "bag of co-accessible regions"consisting of a few thousand open chromatin regions. Each of these regions is overlapped with the model's pre-defined vocabulary and serves as input to the embedding module and subsequent transformer encoder.

We leverage two highly-efficient methods for interval overlap computation: AIList @Feng2019 and BITS @Layer2013. We've implemented both algorithms in Rust and have made them available in Python for in-memory tokenization with a huggingface-compatible API. Code and documentation for our tokenizers can be found on GitHub in our `gtars` crate/package "https://github.com/databio/gtars".

=== ELECTRA pre-training methodology <atacformer-pretraining-methods>
To pretrain Atacformer on single-cell data, we employed an ELECTRA-style replaced-token detection strategy. While most transformer encoder models use masked language modeling (MLM) for self-supervised pretraining @Devlin2019a, we found that MLM was poorly aligned with the properties of our model and data modality in two key ways. First, MLM requires computing a full probability distribution over the vocabulary at each training step. With nearly 1 million tokens, this becomes computationally intractable. Only recently have methods emerged to address this issue. Motivated by the growing vocabulary sizes in modern large language models (LLMs), techniques like Liger kernels @Hsu2025 and Cut Cross Entropy @Wijmans2025 use linear-time approximations of cross entropy to dramatically reduce space and time complexity. We found these strategies applicable to Atacformer as well, since MLM is fundamentally a token prediction task. However, a second, more fundamental problem emerges: we identified that MLM effectively enforces an order among masked tokens, while shuffling the tokens should have no effect on the information content of a single-cell or corresponding regionset. More specifically, we recognized that the model predicting the correct tokens, but out of order was common and would provide an incorrect training signal to the model. 

ELECTRA side-steps both of these problems entirely by reframing the pre-training task as binary classification: for each token, the model predicts whether it was replaced or not. This approach does not depend on the model predicting tokens in a specific order, and moreover, doesn't require computing a probability for all 890K tokens. Although genomic coordinates offer a natural means to introduce sequence order, we sought to avoid the model overly relying on deterministic positional cues, instead incentivizing it to capture meaningful biological patterns and relationships. To that end, Atacformer is distinctly free of any form of positional information in its input embeddings.

=== Formal specification of tokenization and pre-training <atacformer-formal-methods>
We begin by fixing a *global vocabulary* $U$ of non-overlapping genomic regions derived from our consensus universe (see previous section):

$
U = \{ v_{1}, dots,v_{V}\}
$

For each single cell $c$ we observe an unordered set of raw, *co-accessible* regions

$
R_c = \{ r_1, dots, r_N_c \}
$

Tokenization reduces these raw intervals to their canonical vocabulary
representatives via a simple interval intersection:

$
I_c = { v in U ; exists r in R_c ; v inter r != emptyset }
$

We then map each vocabulary element to its integer identifier, producing
a sequence of token indices

$
T_c = { "id"(v) ; v in I_c }
$

To create a learning signal we apply *ELECTRA-style corruption* @Clark2020. Each
position $j$ is independently selected for replacement with probability $p = 0.45$:

$
delta_j ~ "Bernoulli"(p), z_j ~ "Unif"(U)
$

The corrupted token sequence is therefore: 

$
c, j = cases(
  z_j "if" delta_j = 1,
  T_{c,j} "if" delta_j = 0
)
$

Every token id is looked up in a shared embedding matrix
$E in bb(R)^(V times d)$ to obtain dense vectors

$
x_j = E_T_(c,j),
$

$
X_c = ( x_1, dots ,x_(|I_c|) )
$

These embeddings pass through $L$ stacked transformer encoder layers (no
positional encodings are supplied):

$
H^((0)) = X_c, ( H^(ell - 1) )
$

$
H^ell = "TransformerLayer"_ell
$

$
L = 1,dots,ell
$

The final contextual embedding at each position $j$ is
$
h_j = H_j^((L)).
$

A lightweight classifier head converts each contextual vector into the
probability that the original token was *replaced*:

$
s_j = W_o h_j + b, quad hat(y_j) = sigma(s_j).
$

Training minimizes the binary cross-entropy *replaced-token detection*
loss over all positions in the cell:


$
cal(L)_c = - sum_(j = 1)^(|I_c|)[delta_j log(hat(y_j)) + (1 - delta_j) log(1 - hat(y_j))]
$

Averaging $cal(L)_c$ over the mini-batch and optimizing with
AdamW completes the pre-training procedure.

=== Cell embedding calculation <atacformer-cell-embedding-methods>  

To generate single-cell embeddings, we first tokenize a single-cell
according to the steps outlined above. We then pass the tokens through
the model to obtain a contextualized embedding representation for each
region-token in that cell:

$
H^ell = "AtacformerBase"({ e_1, dots, e_j }) in bb(R)^(j times d_"model")
$

Where $e_j$ is the initial token embedding for the $j^"th"$
region token. We then obtain cell-embeddings by pooling all
contextualized region-embeddings through mean-pooling:

$
E_"cell" = 1/j sum_(i = 0)^(j - 1) h_i in bb(R)^(d_"model")
$

where $h_i$ is the contextualized embedding vector for the
$i^"th"$ token.

=== Triplet loss calculation <atacformer-triplet-loss-methods>

For cell-type fine-tuning we use a standard triplet-loss formula. For each training step, the model sees three cells: 1) an anchor cell which may be of any cell-type, 2) a positive example which is of the same cell-type as the anchor, and 3) a negative example which is of another cell-type than the anchor cell. We pass each cell through the model and mean-pool token embeddings to obtain a single embedding to represent the entire cell; one for the anchor ($a$), the positive ($p$), and the negative ($n$). Loss for a single mini-batch is computed as such:

$
"L(a,p,n)" = "max"{ d (a_i, p_i) - d\( a_i, n_i ) + "margin", 0}
$

where

$
d ( x_i, y_i ) = | x_i - y_i |_p
$

We use the torch module `torch.nn.TripletMarginLoss` with default values, $"margin" = 1.0$, and $p = 2.0$.


=== Datasets for clustering evaluation <atacformer-clustering-datasets-methods>
==== PBMC5k NextGEM v 1.1
For PBMC5K, we obtained raw matrix, peak, and barcode files from the 10X website: "https://www.10xgenomics.com/datasets/5-k-peripheral-blood-mononuclear-cells-pbm-cs-from-a-healthy-donor-next-gem-v-1-1-1-1-standard-2-0-0". These three files were converted to an `AnnData` object from the `scanpy` package.

==== Brain dataset
For the pre-annotated brain dataset, we utilize a multi-omic single-nucleus study of 191,890 nuclei in late-stage Alzheimer's disease (AD) @Morabito2021. Cells in this dataset were annotated using gene expression data to assign ground-truth labels to each cell. These labels were used for downstream clustering metrics evaluation.

==== Simulated
Evaluating model performance on real, pre-annotated datasets is subjected to the bias in the annotation procedure. This can cause misleading results according to inaccuracies in the labeling process. To that end, we supplemented our two datasets with a third, simulated dataset. Following a similar procedure to Chen et. al. @Chen2019, we generated a simulated scATAC-seq dataset using bulk-ATAC data from ENCODE. We first generate a peak by count matrix from 5 bulk-ATAC seq datasets: NK Cells (ENCSR305QTE), Memory B Cells (ENCSR610AQP), Naive B Cells (ENCSR685OFR), Dendritic Cells (ENCSR237VSF), CD4+ T cells (ENCSR841LHT), and CD8+ T cells (ENCSR476VJY). We leverage the simulation code provided by the Pinello lab: https://github.com/pinellolab/scATAC-benchmarking/blob/master/Synthetic_Data/Simulate_scATAC/BoneMarrow/simulate_bonemarrow_depth.ipynb

=== PBMC dataset cell-type annotation <atacformer-pbmc-annotation-methods>
Because ground-truth labels are necessary for adequately assessing the clustering performance of cell-embeddings, we performed cell-type annotation on all three datasets. Each annotation was performed in an identical manner. To do so, we followed a very similar approach to the cell-type annotation approach described by LeRoy _et. al._ [@LeRoy2024]. Briefly, we leveraged a pre-trained scEmbed model trained specifically on a high-quality blood dataset, Luecken2021[@Luecken2021]. Embeddings were generated for both the reference dataset (Luecken2021) and the query datasets (PBMC 1/5/10k). Then, using the shared latent space, we performed a K-nearest-neighbors (KNN) label transfer task. We used `scEmbed` from the `geniml` module on GitHub: "https://github.com/databio/geniml" and the `KNeighborsClassifier` from `sklearn.neighbors`. Due to the intrinsic sparsity of many detailed T-cell subtypes, we collapsed these rare variants into broader T-cell categories. This aggregation prevents overfragmentation during clustering, ensuring a more statistically robust and biologically meaningful representation of T-cell populations.


// Fragment file ingestion and tokenization

// Fragment files are ingested using our gtars package.

// Fragment agreement evaluation metrics

// Processing time
// To measure processing time, we leverage the python standard library `time` module.

=== Bulk training data selection <atacformer-bulk-training-data-methods>

To generate a large dataset for fine-tuning on bulk data, we first started with all bed-files annotated with hg38 on BEDbase. Because Atacformer has a context window of 8,192 tokens, we next filtered down these bedfiles into a subset that could reasonable fit within this context window, subsampling tokens as necessary. We set the cutoff for number of regions in the bedfile to be 81,920 (10x the context window).

We tokenized the BED files that met this criteria and used them as input into the training pipeline, subsampling tokens from the file when necessary.

=== TSS distance annotation of our universe <atacformer-tss-annotation>

To annotate the distance to the nearest TSS to each token in our vocabulary, we first downloaded the most recent comprehensive gene annotation (GTF) file from GENCODE("https://www.gencodegenes.org/human/release_38.html"). We filtered this file to obtain just the TSS annotations using common unix command-line tools like `awk` and `sort`.

Next we leveraged `bedtools` to obtain distances to the nearest TSS. Specifically, we used the `bedbase closest` command with the `-t first` flag to ensure each region in our universe was only associated with one TSS.

=== Spearman correlation <atacformer-spearman-methods>

The spearman corrrelation can be computed as follows:

$
rho = 1 - (6 sum d_i^2) / (n ( n^2 - 1 ))
$

where $d_{i}$ is the difference between the two ranks of each
observation and $n$ is the number of observations. To compute the value,
we leveraged the `scipy.stats` module and the `spearmanr` function.


=== Multiome data processing <atacformer-multiome-methods>

To curate a large multiome dataset, we downloaded and processed four datasets: three from the 10X genomics dataset repository and then the previously described Luecken2021 dataset @Luecken2021. The three 10X datasets were: 1) brain3k multiome "https://www.10xgenomics.com/datasets/frozen-human-healthy-brain-tissue-3-k-1-standard-2-0-0, 2) kidney22k "https://www.10xgenomics.com/datasets/human-kidney-cancer-nuclei-isolated-with-chromium-nuclei-isolation-kit-saltyez-protocol-and-10x-complex-tissue-dp-ct-sorted-and-ct-unsorted-1-standard", and 3) pbmc10k multiome "https://www.10xgenomics.com/datasets/10-k-human-pbm-cs-multiome-v-1-0-chromium-controller-1-standard-2-0-0". For each dataset, we downloaded the cell by feature matrix as a matrix-market file (`.mtx`), the barcodes as a `.txt` file, and the features as a `.tsv` file. We combined these files into an `.h5ad` file for each dataset using the `scanpy`, `pandas` and `scipy` python packages.

Each dataset was tokenized into the universe as previously described and used for training CRAFT.

CRAFT architecture

The CRAFT architecture closely follows the design of the CLIP model, which jointly trains two separate encoders to project different modalities into a shared latent space. In our implementation, we replaced the original CLIP encoders with domain-specific architectures: the ATAC encoder was substituted with the atacformer, a transformer-based model tailored for chromatin accessibility data, and the RNA encoder was replaced with geneformer, optimized for gene expression profiles:


```python
# adapted from Radford2021 (Fig 3).
# gene_encoder  - Geneformer
# atac_encoder  - Atacformer
# R[n, h, w, c] - minibatch of aligned RNA-seq profiles
# A[n, l]       - minibatch of aligned ATAC-seq profiles
# W_i[d_i, d_e] - learned proj of rna profile to embed
# W_t[d_t, d_e] - learned proj of atac profile to embed
# t             - learned temperature parameter

# extract feature representations of each modality
R_f = gene_encoder(R) #[n, d_i]
A_f = atac_encoder(A) #[n, d_t]

# joint multimodal embedding [n, d_e]
R_e = l2_normalize(np.dot(R_f, W_i), axis=1)
A_e = l2_normalize(np.dot(A_f, W_t), axis=1)

# scaled pairwise cosine similarities [n, n]
logits = np.dot(R_e, A_e.T) * np.exp(t)

# symmetric loss function
labels = np.arange(n)
loss_r = cross_entropy_loss(logits, labels, axis=0)
loss_a = cross_entropy_loss(logits, labels, axis=1)
loss = (loss_r + loss_a)/2
```

We train CRAFT starting with a pre-traiend Geneformer and Atacformer model. Namely, we use `Geneformer/gf-12L-30M-i2048` and `databio/atacformer-base-hg38"` respectively. We trained for 15 epochs using a linear learning rate scheduler with a maximum learning rate of $5"e"-5$.

pbmc5k dataset processing for RNA-imputation experiments

To prepare a dataset, we utilize closely follow the "RNA integration" tutorial offered by the SnapATAC2 documentation: "https://scverse.org/SnapATAC2/tutorials/annotation.html". Briefly, the pbmc5k dataset was imported from SnapATAC2, filtered, dimensionality-reduced, and subsequent cell-type annotation was performed using `scvi`.

=== CRAFT RNA decoder <atacformer-craft-rna-decoder-methods>

Using `pytorch`, we built a small decoder to predict a cell's RNA-expression profile from its corresponding shared latent space ATAC embedding. We used a simple feedforward neural network with one hidden layer. 

To obtain the shared latent space embedding from the ATAC data, we first encoded the cell's ATAC profile using an encoder network. The encoder consisted of a fully connected layer that projected the high-dimensional ATAC input into a lower-dimensional latent space, followed by a non-linear activation function (ReLU). The output of this encoder served as the input to the RNA decoder.

The overall architecture thus consisted of an ATAC encoder, which mapped the input ATAC features to a latent representation, and an RNA decoder, which predicted the RNA expression profile from this latent space.

=== Annotation of Atacformer universe for TSS distance and region type
To annotate the distance to the nearest TSS to each token in our vocabulary, we first downloaded the most recent comprehensive gene annotation (GTF) file from GENCODE("https://www.gencodegenes.org/human/release_38.html"). We filtered this file to obtain just the TSS annotations using common unix command-line tools like `awk` and `sort`. Next we leveraged `bedtools` to obtain distances to the nearest TSS. Specifically, we used the `bedbase closest` command with the `-t first` flag to ensure each region in our universe was only associated with one TSS.

Similarly, we downloaded the latest cCRE annotations from ENCODE screen (https://screen.encodeproject.org) for hg38. We utilized bedtools intersect to annotate each region with a discrete label (pELS, dELS, CTCF, etc).

=== H3K4me3 null distribution generation <atacformer-ictss-null-distribution-methods>
To evaluate H3K4me3 signal enrichment in our icTSS regions across cell types, we first generated a null distribution representing the expected signal overlap in randomly selected genomic regions of comparable size. Specifically, we randomly sampled $N$ regions from the Atacformer universe – where $N$ equals the number of icTSS regions in each set (B cells and monocytes) – using standard Unix command-line utilities such as shuf. This sampling procedure was repeated 500 times to build a distribution of random region sets. For each set, we computed the mean coverage using bigWigAverageOverBed from the bigtools package @Huey2024, then averaged the resulting signal across all regions. The resulting distribution was plotted as a histogram, and the same statistic was computed for the true icTSS regions to quantify their enrichment relative to the null.
