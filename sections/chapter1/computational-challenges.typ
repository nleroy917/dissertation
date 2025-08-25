=== The high-dimensionality and inherent sparsity of scATAC-seq data
Single-cell ATAC-seq (scATAC-seq) data is characterized by its high dimensionality and inherent sparsity, posing significant challenges for computational analysis. Because each cell only contains two copies of each chromosome, and because the assay measures accessibility at a large number of genomic loci, the resulting data matrix is often extremely sparse and high-dimensional. This sparsity can make it difficult to accurately infer regulatory interactions and identify cell-type-specific patterns of chromatin accessibility. Furthermore, the high dimensionality of scATAC-seq data can make traditional statistical methods less effective @Cusanovich2015.

To address these challenges, researchers have developed new computational methods and tools specifically designed for scATAC-seq data. These approaches aim to improve data normalization, enhance signal detection, and facilitate the integration of scATAC-seq data with other single-cell modalities, such as scRNA-seq. By leveraging advances in machine learning and statistical modeling, these methods hold promise for unlocking the full potential of single-cell epigenomics in understanding gene regulation.

#figure(
  image("../../fig/chapter1/scatac-seq.svg"),
  caption: [Schematic of a scATAC-seq count matrix.]
) <scatac-seq-overview>
