Chromatin accessibility profiling is a powerful approach for understanding gene regulation, a key determinant of cellular identity and function. Despite the availability of nearly 10,000 publicly accessible scATAC-seq experiments, unifying this data for meaningful downstream analysis remains a significant challenge. Existing tools often struggle with the scale, heterogeneity, and sparsity of single-cell chromatin accessibility datasets, limiting their utility for tasks such as clustering, cell-type annotation, and cross-dataset reference mapping.

Transfer learning, particularly with large pre-trained models, has shown promise in scRNA-seq applications by enabling improved cell type identification and integration across studies. However, its application to scATAC-seq remains underexplored, despite similar structural and analytical challenges shared between the modalities.

This dissertation explores transformer-based transfer learning approaches tailored for scATAC-seq data. We present a suite of deep learning frameworks that leverage large public datasets to improve the analysis of new, unseen experiments. Across multiple benchmarks, these approaches demonstrate improved computational efficiency, analytical performance, and generalization across biological contexts, laying the groundwork for scalable, standardized analysis of chromatin accessibility data.

In Chapter 1, we review the current landscape of scATAC-seq analysis, detailing existing workflows, their limitations, and the growing interest in developing general-purpose foundation models for chromatin data interpretation.

In chapter 2, we provide essential background on natural language processing (NLP) techniques, focusing on transformer architectures and self-supervised learning methods that have revolutionized text analysis. We discuss how these concepts can be adapted to genomic data, highlighting parallels between language and DNA sequences.

In Chapter 3, we describe supporting infrastructure for high-throughput, efficient scATAC-seq data processing. This includes Rust-based genomic tokenizers for rapid interval processing, the uniwig tool for consensus set generation, and PEPhub for project metadata standardization and management.

In Chapter 4, we extend prior work on self-supervised representation learning by adapting genomic region embeddings to the single-cell setting. We introduce early transfer learning pipelines that use these embeddings as input for downstream scATAC-seq tasks, forming a foundation for generalizable models.

In Chapter 5, we introduce Atacformer, a transformer-based model specifically designed to learn contextualized representations of genomic interval data. We describe its architecture, training strategy, and application to tasks such as clustering and annotation, showing how it benefits from pretraining and transfer learning.

In Chapter 5, we outline the limitations of our approach and identify key directions for future work. These include better benchmarking standards, integration with multi-omic datasets, and refining tokenization strategies to improve generalization and interpretability.

Together, these chapters provide a comprehensive framework for applying modern machine learning techniques to scATAC-seq analysis, with a focus on flexible, transferable models that bridge the gap between isolated experiments and unified biological insight.