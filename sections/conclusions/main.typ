== Overview and Summary of Contributions
The goal of this work was to develop a unified framework for analyzing genomic interval data — particularly single-cell ATAC-seq (scATAC-seq) — through modern machine learning and transfer learning. This was achieved through three key contributions that together form a scalable and interpretable foundation for chromatin accessibility analysis. At its core, this dissertation conceptualizes genomic regions as discrete, linguistic, tokens, enabling the direct adaptation of natural language processing (NLP) concepts and modeling strategies to epigenomics.

First, we developed high-performance infrastructure for data preprocessing and standardization through the `gtars` toolkit. Written in Rust with Python bindings, gtars provides efficient handling of large-scale genomic interval data and utilities for defining region universes and tokenizing intervals. This framework transforms disparate, experiment-specific peak calls into a consistent vocabulary suitable for model training and transfer learning.

Second, we introduced scEmbed, a Word2Vec-inspired model demonstrating that pre-trained region embeddings can be reused across datasets. Trained on large chromatin accessibility corpora, scEmbed learns fixed embeddings for genomic regions that encode shared regulatory context. These embeddings enable rapid analysis and transferability across studies without retraining, establishing the feasibility and importance of stable, shared token vocabularies in genomic modeling.

Finally, we developed Atacformer, the central contribution that realizes the core vision of this work: a transformer-based foundation model that generates contextualized region embeddings by incorporating cell-level chromatin accessibility context. Atacformer captures complex regulatory dependencies and generalizes across biological conditions, performing well in zero-shot settings for clustering, annotation, and batch correction. In parallel, we introduced the CRAFT model, a dual-encoder architecture linking Atacformer with Geneformer to jointly model chromatin accessibility and gene expression, illustrating the potential for unified multiomic embeddings that was envisioned from the beginning of this research program.

Together, these components form a continuous pipeline from disparate, raw genomic intervals to contextual representations, which is anchored in shared vocabulary, interpretability, and scalability.

== Conceptual and Methodological Insights
The central conceptual insight of this work is that genomic regions can be treated as linguistic tokens, enabling direct transfer of NLP methodologies to regulatory genomics. This framing allows the application of embedding-based and transformer architectures to high-dimensional chromatin data.

scEmbed demonstrated that static embeddings of genomic regions can capture functional and contextual information, while Atacformer extended this idea to contextual embeddings that dynamically reflect the cell’s regulatory state. This shift from static to contextual representation parallels the evolution from Word2Vec to BERT in NLP—transforming what was once a static lookup table into a model capable of reasoning about meaning in context.

== Biological Implications
Atacformer and its supporting models reveal that chromatin accessibility patterns encode a rich, learnable regulatory language. Several biological insights emerged from this work:

=== Contextual embeddings capture higher-order regulatory logic
The embedding space learned by Atacformer encodes features that correlate with promoter–enhancer distance, transcription factor distance, and cCRE classification. Regions with similar functional roles — such as active promoters or distal enhancers — cluster together in embedding space even without explicit supervision, suggesting that the model implicitly learns aspects of the gene regulatory grammar.

=== Detection of cryptic or alternative transcription start sites (icTSSs)
By analyzing discordant embeddings — regions annotated as distal yet positioned near promoter-like clusters — Atacformer revealed cryptic or weak promoters enriched for H3K4me3 signal. This highlights how embedding geometry can uncover functionally active elements overlooked by annotation-based pipelines, providing a new computational avenue for promoter discovery in specific cell types with scATAC-seq data alone.

=== Embedding distances reflect functional relatedness
The model’s embedding distances correlate with co-accessibility and co-regulation, indicating that spatial proximity in the latent space approximates shared regulatory function. This opens possibilities for predicting enhancer–gene linkages or grouping regulatory elements by their shared transcriptional programs, akin to semantic similarity in NLP embeddings.

=== Integration across modalities via CRAFT
The CRAFT framework demonstrates that Atacformer's region embeddings can be co-embedded with Geneformer's transcriptomic embeddings, creating improved cell-level representations that integrate chromatin accessibility and gene expression. This enhanced cell-level embedding approach sets the stage for more robust cell-type annotation strategies in future scATAC-seq analysis pipelines.

Collectively, these findings suggest that transformer-based embeddings are not merely computationally powerful—they are biologically informative, capable of revealing latent regulatory structure and predicting functional relationships in the genome.

== Technical Limitations and Challenges
While this work represents significant progress toward applying foundation model principles to genomics, several key challenges remain.

=== Tokenization strategies
Model performance depends heavily on the definition of the region universe. Fixed vocabularies may omit relevant elements in underrepresented tissues. Future work could explore adaptive or hierarchical tokenization, integrating sequence-level or motif-based features to better capture regulatory diversity.

=== Data imbalance and diversity
Training data are biased toward well-characterized tissues and cell types, limiting generalization to rare or novel contexts. Expanding corpora to include diverse biological systems and leveraging augmentation or synthetic data generation will be essential for building truly generalizable models.

=== Interpretability
Although Atacformer embeddings align with known regulatory features, the models remain largely opaque. Methods such as attention map visualization, perturbation analysis, or integration with regulatory networks could help reveal why certain embedding clusters form and how they relate to transcriptional outcomes.

=== Computational scalability
Transformer models are computationally intensive, particularly for long genomic contexts. Efficiency could be improved through sparse attention, hierarchical context compression, or optimized vocabulary strategies that reduce token sequence length while preserving biological resolution.

This is important for practical deployment, especially as datasets continue to grow in size and complexity. Moreover, this makes the models more accessible to researchers and labs without extensive computational resources.

== Future Directions
This work opens several promising directions for future exploration:
	1.	Multi-scale tokenization — integrate nucleotide, motif, and region-level features.
	2.	Incorporation of 3D genome data — encode Hi-C–based contact priors or distance-aware attention.
	3.	Generative or contrastive pretraining — to improve representation learning and robustness.
	4.	Cross-species transfer learning — to identify conserved regulatory logic across organisms.
	5.	Open model sharing — release pre-trained models via Hugging Face to promote community benchmarking and reuse.

== Broader Impact and Closing Remarks
Modern NLP and computer vision have matured immensely through standardized tokenization, evaluation, and model-sharing ecosystems. Genomics has lacked such a unifying framework. Fragmented tools, inconsistent formats, and limited reproducibility have hindered progress particularly for machine learning applications.

This dissertation establishes a foundation for such a framework. By defining genomic regions as transferable tokens, it provides the conceptual and infrastructural basis for foundation models in regulatory genomics. The progression from gtars (infrastructure) to scEmbed (embedding prototype) to Atacformer (contextual foundation model) parallels the evolution from bag-of-words to transformers in NLP—transforming static, handcrafted features into dynamic, learnable representations of biological meaning.

Ultimately, this work demonstrates that gene regulation, like language, is compositional and contextual. Treating chromatin accessibility as a structured language enables not only better models but also deeper biological insight—revealing the syntax of regulation and setting the stage for a new generation of data-driven discovery in epigenomics.

#if sys.inputs.at("partial", default: "false") == "true" [ 
  = References
  #bibliography(
    "/refs.bib",
    style: "nature",
    title: none
  ) 
]