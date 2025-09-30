#import "@local/dissertation:0.0.1": figure-caption-extended

#figure(
  image("/fig/atacformer/overview/context_length_dist.svg"),
  caption: "Distribution of context window lengths in the Atacformer training corpus."
) <atacformer-context-window-distribution>

#figure(
  image("/fig/atacformer/craft/luecken2021_by_modality.svg"),
  caption: "Dual UMAP visualization of both the ATAC and RNA co-embeddings."
) <atacformer-craft-by-modality>
#figure-caption-extended(caption: [
  *a.* ATAC and RNA co-embeddings visualized in a shared UMAP space, colored by modality. The two modalities are divided along a shared axis. *b.* ATAC and RNA co-embeddings visualized in a shared UMAP space, colored by cell-type. Cell-type information is preserved.
])

#figure(
  image("/fig/atacformer/extras/context_window_analysis.svg"),
  caption: "Atacformer is robust to severe degradation in context-window size."
) <atacformer-context-window-analysis>
#figure-caption-extended(caption: [
  *a.* Schematic showing how cells are tokenized in the Atacformer framework. When the number of tokens in a cell exceeds the context window of the model, we must choose which tokens to drop before processing. *b.* Schematic of the cut-off method, where we simply keep the first $C$ tokens in a cell, while disregarding the rest ($C$ being the context-window size). *c.* Schematic of the random sample method, where we randomly sample $C$ tokens from the cell, while discarding the rest. *d.* UMAP visualizations of embeddings generated from the Luecken2021 dataset using various context window sizes at inference time. A marked decrease in visually distinct clusters occurs after 512. *e.* Line plot of three clustering metrics as a function of context-window size. All plots and metrics utilized the ATAC encoder of the `craft-100k-hg38` model described in @atacformer-craft.
])

#figure(
  image("/fig/atacformer/clustering/ctft_before_after_comparison.svg"),
  caption: "Fine-tuning Atacformer for a cell-clustering task improves latent space separation of individual cells."
) <atacformer-clustering-ctft-before-after>
#figure-caption-extended(caption: [
  *a.* UMAP visualization of Luecken2021 dataset clustered using `atacformer-base` (before fine-tuning). *b.* UMAP visualization of Luecken2021 dataset clustered using `atacformer-ctft` showing a marked improvement in clustering ability
])

#figure(
  image("/fig/atacformer/batch_correction/batch_correction.svg"),
  caption: "Atacformer performs strong zero-shot batch correction on processed and unprocessed data."
) <atacformer-batch-correction>
#figure-caption-extended(caption: [
  *a.* Schematic overview of batch effects (top) and mitigation (bottom) when analyzing multiple datasets at once. *b.* UMAP visualizations of three PBMC dataset cell embeddings, colored by dataset. Atacformer visually exhibits equal or better clustering performance when directly producing embeddings of fragment files. *c.* UMAP visualizations of three PBMC dataset cell embeddings, colored by cell-type. Atacformer retains key biological information when directly producing embeddings of fragment files.
])

#figure(
  image("/fig/atacformer/bedbase/assay_cell_line_dists.svg"),
  caption: "Training dataset assay and cell line distribution for the bulk-ATAC model."
) <atacformer-bedbase-assay-cell-line-dists>
#figure-caption-extended(caption: [*a.* Distribution of assay types in the BEDbase bulk data training set. *b.* Distribution of the top 25 cell lines represented in the BEDbase bulk data training set.
])

#figure(
  image("/fig/atacformer/bedbase/cell_line_imputation/all_cell_lines_heatmap.svg"),
  caption: "Cell line imputation for missing BEDbase data using a fine-tuned Atacformer model on bulk-ATAC data."
) <atacformer-bedbase-cell-line-imputation>
#figure-caption-extended(caption: [*a.* Schematic of the imputation procedure. *b.* Confusion matrix for entire cell line dataset.
])