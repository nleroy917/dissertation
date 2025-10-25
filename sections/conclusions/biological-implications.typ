== Biological Implications
Atacformer and its supporting models reveal that chromatin accessibility patterns encode a rich, learnable regulatory language. Several biological insights emerged from this work:

=== Contextual embeddings capture higher-order regulatory logic
The embedding space learned by Atacformer encodes features that correlate with promoter–enhancer distance, transcription factor distance, and cCRE classification. Regions with similar functional roles — such as active promoters or distal enhancers — cluster together in embedding space even without explicit supervision, suggesting that the model implicitly learns aspects of the gene regulatory grammar.

=== Detection of cryptic or alternative transcription start sites (icTSSs)
By analyzing discordant embeddings — regions annotated as distal yet positioned near promoter-like clusters — Atacformer revealed cryptic or weak promoters enriched for H3K4me3 signal. This highlights how embedding geometry can uncover functionally active elements overlooked by annotation-based pipelines, providing a new computational avenue for promoter discovery in specific cell types with scATAC-seq data alone.

=== Embedding distances reflect functional relatedness
The model's embedding distances correlate with co-accessibility and co-regulation, indicating that spatial proximity in the latent space approximates shared regulatory function. This opens possibilities for predicting enhancer–gene linkages or grouping regulatory elements by their shared transcriptional programs, akin to semantic similarity in NLP embeddings.

=== Integration across modalities via CRAFT
The CRAFT framework demonstrates that Atacformer's region embeddings can be co-embedded with Geneformer's transcriptomic embeddings, creating improved cell-level representations that integrate chromatin accessibility and gene expression. This enhanced cell-level embedding approach sets the stage for more robust cell-type annotation strategies in future scATAC-seq analysis pipelines.

Collectively, these findings suggest that transformer-based embeddings are not merely computationally powerful—they are biologically informative, capable of revealing latent regulatory structure and predicting functional relationships in the genome.
