=== Aim 4: Token-Level Interpretability — Mining Attention for Regulatory Relationships

// PARAGRAPH 1: Motivation
// - Current limitation: interpretation and analysis of contextualized region embeddings remains underdeveloped
// - While Atacformer demonstrates strong performance on cell-level tasks, we cannot extract mechanistic insights about regulatory grammar
// - This limits our ability to translate model outputs into biological understanding
// - Current work focuses on cell-level embeddings (clustering, annotation)
// - Transformer attention matrices encode token-token relationships
// - Opportunity: extract biological insights from attention patterns at the region level
// - Hypothesis: attention weights reveal regulatory connections (promoter-enhancer links, TF co-regulation)
// - Parallel: attention analysis in NLP has revealed syntactic relationships

// PARAGRAPH 2: Proposed Approach (Part 1: Attention Pattern Analysis)
// - Extract attention weights between region pairs across many cells
// - Identify consistently high-attention pairs across cell types (stable regulatory links)
// - Identify cell-type-specific attention patterns (dynamic regulation)
// - Cluster attention patterns to discover co-regulated modules
// - Compare to known interactions: Hi-C contacts, ChIA-PET loops, eQTL links

// PARAGRAPH 3: Proposed Approach (Part 2: Regulatory Hypothesis Generation)
// - Use attention to predict:
//   * Enhancer-gene assignments (attention between enhancer region and promoter)
//   * TF binding co-occurrence (regions with shared attention patterns)
//   * Compensatory regulatory elements (redundant enhancers)
// - Validate predictions experimentally: CRISPRi silencing of predicted enhancers
// - Build regulatory network graphs from attention-derived edges

// PARAGRAPH 4: Technical Challenges
// - Attention weights are noisy; difficult to distinguish signal from noise
// - Multiple attention heads may capture different aspects (which to trust?)
// - Scaling: analyzing attention across millions of cells is computationally intensive
// - Ground-truth validation is expensive and limited in scope
// - Risk of circular reasoning: model trained on accessibility, attention may reflect input patterns

// PARAGRAPH 5: Expected Impact
// - Generate testable hypotheses about enhancer-promoter wiring
// - Discover novel regulatory relationships not captured by sequence motifs alone
// - Provide mechanistic insights: why certain regions cluster in embedding space
// - Complement 3D genome methods (Hi-C) with functional accessibility data
// - Tool for regulatory network reconstruction in cell types lacking experimental data
