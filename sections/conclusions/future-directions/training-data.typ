=== Future aim 1: Scaling the Training Atlas

// PARAGRAPH 1: Motivation
// - Current limitation: training data biased toward certain tissues, cell types, and experimental conditions
// - Our curated corpora, while large, remain biased toward well-characterized systems
// - Foundation models in NLP benefit from massive, diverse training data
// - Genomics needs equivalent: tens or hundreds of millions of cells across all human tissues
// - Data diversity is key to generalization and reducing bias
// - Current models trained on ~10-20M cells from limited tissue types
// - Known biases: over-representation of immune cells, under-representation of rare tissues
==== Motivation
Atacformer was trained on a substantial corpus of single-cell ATAC-seq data (\~1.2 million cells); however, this training set remains biased toward well-characterized tissues, cell types, and experimental conditions. Specifically, the dataset is currently dominated by brain, immune, and tonsil cells (@atacformer-overview\B). This biases is reflected in model performance, with reduced accuracy when procession datasets originating from biological contexts outside the models training distribution (kidney, liver, rare cell types). In contrast, foundation models in natural language processing (NLP) have demonstrated that massive, diverse training corpora are critical for achieving strong generalization and reducing bias @Brown2020. To achieve similar benefits in regulatory genomics, we propose to scale the training atlas to encompass tens or hundreds of millions of cells spanning all major human tissues, developmental stages, and disease states. Indeed, foundation models for transcriptomics are already being trained on datasets of this scale with an updated Geneformer model being trained on over 100 million cells @Chen2024b and the release of Tahoe-x1, a new transcriptomics foundation model trained on 100 million cells @Gandhi2025. Expanding the training corpus for chromatin accessibility models like Atacformer is a logical next step to improve generalization and reduce bias in downstream analyses.

// PARAGRAPH 2: Proposed Approach
// - Systematic collection from public repositories (GEO, SRA, HCA, CellXGene)
// - Target: 100M+ cells spanning all major tissues, developmental stages, disease states
// - Prioritize underrepresented systems: neuron subtypes, rare immune populations, organoids
// - Establish quality control pipeline for heterogeneous data sources
// - Create stratified training sets ensuring balanced representation

// PARAGRAPH 3: Technical Challenges
// - Data harmonization across platforms, protocols, sequencing depths
// - Computational cost of training on 100M+ cells
// - Storage and data management infrastructure
// - Batch effect correction at unprecedented scale
// - Ensuring data use complies with sharing agreements and ethics approvals

// PARAGRAPH 4: Expected Impact
// - Models that generalize to any cell type, including rare and novel populations
// - Reduced bias in cell annotation and clustering
// - Better zero-shot performance on completely new tissues
// - Foundation for clinical applications requiring diverse disease contexts
// - Community resource: open training corpus for reproducibility and benchmarking
