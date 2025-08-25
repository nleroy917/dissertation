=== The high-dimensionality and inherent sparsity of scATAC-seq data
A scATAC-seq dataset is often represented as a binary matrix where rows correspond to cells, and columns correspond to genomic loci (@scatac-seq-overview). These matrices are characterized by their high dimensionality and inherent sparsity, posing significant challenges for computational analysis. Because each cell only contains two copies of each chromosome, and because the assay measures accessibility at upwards of 1 million genomic loci, the resulting data matrix is often extremely sparse and high-dimensional. This sparsity can make it difficult to accurately infer regulatory interactions and identify cell-type-specific patterns of chromatin accessibility. Furthermore, the high dimensionality of scATAC-seq data can make traditional statistical methods less effective @Cusanovich2015.

#figure(
  image("../../fig/chapter1/scatac-seq.svg"),
  caption: [Schematic of a scATAC-seq count matrix.]
) <scatac-seq-overview>

To address these challenges, researchers have developed new computational methods and tools specifically designed for scATAC-seq data. These approaches aim to improve data normalization, enhance signal detection, and facilitate the integration of scATAC-seq data with other single-cell modalities, such as scRNA-seq. By leveraging advances in machine learning and statistical modeling, these methods hold promise for unlocking the full potential of single-cell epigenomics in understanding gene regulation.

=== Early analysis methods
Soon after the onset of scATAC-seq analysis, several computational tools were developed to address the unique challenges posed by the data modality. Among those were BROCKMAN @DeBoer2018, chromVAR @Schep2017, Cicero @Pliner2018, SCRAT @Ji2017a, cisTopic @BravoGonzález-Blas2019, SnapATAC @Fang2021a.

BROCKMAN represents genomic sequences using gapped k-mers within transposase integration sites and applies principal component analysis (PCA) to capture variation in k-mer occupancy. chromVAR focuses on estimating the variability of chromatin accessibility across peaks that share common features, such as transcription factor motifs or specific k-mers. Cicero calculates gene activity scores by integrating accessibility at promoters with the regulatory potential of nearby peaks. cisTopic uses latent Dirichlet allocation (LDA), a Bayesian topic modeling method originally developed for natural language processing, to simultaneously uncover cell states (via topic-cell distributions) and putative regulatory regions (via region-topic distributions).

Another class of approaches, exemplified by what is often referred to as the Cusanovich2018 pipeline, employs latent semantic indexing (LSI). These methods begin by partitioning the genome into windows, normalizing read counts using the term frequency–inverse document frequency (TF-IDF) transformation. Dimensionality is then reduced using singular value decomposition (SVD), and a first round of clustering—termed “in silico cell sorting”—is performed to identify clades and call peaks within them. A second round of TF-IDF and SVD is applied using read counts in the called peaks to refine the clusters.

Other methods take different routes. The Gene Scoring approach computes gene-level accessibility scores by aggregating the accessibility of nearby peaks and weighting them based on their distance to the transcription start site (TSS), typically using an exponential decay function. scABC assigns global weights to cells by estimating background accessibility from reads in regions flanking peaks, then uses weighted k-medoids clustering based on peak-level accessibility. Scasat simplifies accessibility to binary values (present or absent), computes pairwise Jaccard distances between cells, and applies multidimensional scaling (MDS) for clustering. SCRAT summarizes read counts over predefined regulatory features such as transcription factor motifs or promoter regions. Lastly, SnapATAC segments the genome into uniform bins and corrects for library size differences using regression-based normalization, followed by PCA to identify key components for clustering analysis.

=== Deep learning-based methods

=== Large, pre-trained foundation models
