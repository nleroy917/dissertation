#import "@local/dissertation:0.0.1": figure-caption-extended

#figure(
  image("/fig/scembed/luecken2021-umaps.svg"),
  caption: "scEmbed clusters cells from the Luecken2021 dataset."
) <scembed-luecken2021-umaps>
#figure-caption-extended(
  caption: [
    *a.* UMAP of scEmbed cell embeddings when training the model on all cell-types in the dataset, showing distinct clusters for each cell type. *b.* UMAP of the scEmbed cell embeddings after training only on T Cells.
  ]
)

#figure(
  image("/fig/scembed/projection-methods.svg"),
  caption: "scEmbed enables knowledge transfer to unseen datasets."
) <scembed-projection-methods>
#figure-caption-extended(
  caption: [
    *a.* Diagram showing scEmbed’s three projection paths. *b.* Overview of the standard 'no-projection' data flow. *c.* Overview of three data flows for new data. EV-projection places the new data in the same latent space as the reference data.
  ]
)

#figure(
  image("/fig/scembed/cellcano-tsne.svg"),
  caption: "Cellcano cell type annotations for PBMC dataset."
) <scembed-cellcano-tsne>