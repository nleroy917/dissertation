=== Aim 2: Intelligent Tokenization — Information-Dense Context Windows Through Adaptive Region Selection

// PARAGRAPH 1: Motivation
// - Current approach: include all peaks in a cell (often 20K-50K regions)
// - Transformer context windows are limited (current models: 2K-8K tokens)
// - Many peaks are housekeeping regions or low-information elements
// - Analogy: stop words in NLP — common but not semantically important
// - Opportunity: filter or weight regions by regulatory importance

// PARAGRAPH 2: Proposed Approach (Part 1: Importance Scoring)
// - Develop scoring function for genomic regions based on:
//   * TF binding site density
//   * Distance to TSSs (prioritize promoters and proximal enhancers)
//   * Conservation scores
//   * ChromHMM state annotations
//   * Variance across cell types (high variance = cell-type-specific = important)
// - Machine learning approach: train classifier to predict "regulatory impact"
// - Create tiered vocabularies: core regions (always include) vs. context-dependent regions

// PARAGRAPH 3: Proposed Approach (Part 2: Implicit Ordering)
// - Current models use "bag of peaks" — no positional information
// - Future: incorporate genomic order while maintaining efficiency
// - Options:
//   * Learned positional embeddings based on genomic coordinates
//   * Hierarchical structure: group regions by chromosome or TAD
//   * Distance-aware attention mechanisms
// - Challenge: balance between genomic locality and computational tractability

// PARAGRAPH 4: Technical Challenges
// - Defining "importance" without ground-truth labels
// - Risk of removing biologically relevant but rare peaks
// - Balancing informativeness with coverage
// - Computational cost of ordering or distance calculations
// - Validation: how to prove importance scoring improves downstream tasks?

// PARAGRAPH 5: Expected Impact
// - Fit more biological context into fixed-size transformer windows
// - Focus model attention on functionally relevant regulatory elements
// - Enable longer effective context (more cells or regions per batch)
// - Improve interpretability by highlighting key regulatory regions
// - Reduce training time and inference cost by processing fewer tokens
