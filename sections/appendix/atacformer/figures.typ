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