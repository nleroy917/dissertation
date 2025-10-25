=== Aim 5: Ultra-Long Context — Scaling to Bulk ATAC-seq and Comprehensive Genomic Coverage

// PARAGRAPH 1: Motivation
// - scATAC-seq: sparse, 2K-20K peaks per cell
// - Bulk ATAC-seq: dense, 50K-200K peaks in a single experiment
// - Current models cannot handle full bulk datasets due to context limits
// - Opportunity: analyze entire regulatory landscapes at once
// - NLP has developed long-context architectures (Longformer, BigBird) for 16K+ tokens
// - Genomics could benefit from similar approaches

// PARAGRAPH 2: Proposed Approach (Part 1: Long-Context Architectures)
// - Adapt sparse attention mechanisms:
//   * Longformer: local attention + global attention on key tokens
//   * BigBird: random attention + local + global
//   * Memory-efficient attention (Flash Attention)
// - Target: 100K+ token capacity (full bulk ATAC-seq sample)
// - Hierarchical modeling: first encode local regions, then global context

// PARAGRAPH 3: Proposed Approach (Part 2: Bulk-Specific Pretraining)
// - Train on bulk ATAC-seq datasets (ENCODE, Roadmap Epigenomics)
// - Task: predict masked regions or signal intensity
// - Transfer to scATAC-seq: use bulk-pretrained model as initialization
// - Hybrid training: alternate between bulk (long context) and single-cell (sparse context)

// PARAGRAPH 4: Technical Challenges
// - Memory requirements scale quadratically with sequence length (even with sparse attention)
// - Training instability with very long sequences
// - Validating that model actually uses long-range context (vs. local shortcuts)
// - Computational cost: training on 100K-token sequences is expensive
// - Balancing bulk and single-cell objectives (different data characteristics)

// PARAGRAPH 5: Expected Impact
// - Enable comprehensive analysis of bulk ATAC-seq with same framework
// - Capture long-range regulatory interactions (e.g., distant enhancers)
// - Unified model for both bulk and single-cell data
// - Better understanding of global regulatory architecture
// - Applications: predict impact of structural variants, model entire locus regulation
