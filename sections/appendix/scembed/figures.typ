#import "@local/dissertation:0.0.1": figure-caption-extended

#figure(
  image("/fig/scembed/epoch-tests.svg"),
  caption: "Epoch tests show that scEmbed learns well after 100 epochs."
) <scembed-epoch-tests>

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
  image("/fig/scembed/projection_ragi_normality.svg"),
  caption: "Distributions of the RAGI scores for all subsampled cells."
) <scembed-ragi-normality>
#figure-caption-extended(
  caption: [
    *a.* Distribution of RAGI scores for cells with embeddings from the new model versus projection through the model trained on the Buenrostro2018 dataset. *b.* QQ plots of the RAGI scores for cells with embeddings from the new model versus projection through the model trained on the Buenrostro2018 dataset.
  ]
)

#figure(
  table(
    columns: (auto, auto),
    align: horizon,
    table.header(
      [scEmbed label], [Cellcano label],
    ),
    [B1 B], [B cells],
    [CD4+ T activated], [CD4 T cells],
    [CD4+ T naive], [CD4 T cells],
    [CD8+ T], [CD8 T cells],
    [CD8+ T naive], [CD8 T cells],
    [CD14+ Mono], [Monocytes],
    [cDC2 Dendritic cells],
    [NK NK cells],
    [Naive CD20+ B], [B cells]
  ),
  caption: "Label mapping between scEmbed and cellcano for consistent comparison of classification performance."
) <scembed-cellcano-label-mapping>

#figure(
  image("/fig/scembed/cellcano-tsne.svg"),
  caption: "Cellcano cell type annotations for PBMC dataset."
) <scembed-cellcano-tsne>