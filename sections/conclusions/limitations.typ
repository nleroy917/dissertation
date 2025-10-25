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
