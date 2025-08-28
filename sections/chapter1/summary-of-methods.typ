#figure(
  table(
    columns: (auto, auto, auto, auto, auto),
    align: horizon,
    table.header(
      [Method], [Released], [Description], [Language], [Type], 
    ),
    // early, less robust methods
    [chromVar], [2017], [Quantifies variability in chromatin accessibility across TF motifs/k-mers.], [R], [Tools],
    [BROCKMAN], [2018], [Uses gapped k-mers + PCA to capture sequence determinants of accessibility.], [R], [Tools],
    [scABC], [2018], [Clusters scATAC-seq by weighted k-means and identifies cell-type–specific peaks.], [R], [Tools],
    [Cicero], [2018], [Infers gene activity scores and enhancer–promoter connections from scATAC-seq.], [R], [Tools],
    [cisTopic], [2019], [Topic modeling (LDA) to uncover regulatory programs from accessibility data.], [R, Python], [Tools],
    // more mature, end-to-end methods
    [ArchR], [2021], [End-to-end scalable scATAC-seq analysis toolkit (QC, clustering, peak calling).], [R], [End-to-end],
    [Signac], [2021], [Seurat extension for multi-omic single-cell chromatin accessibility analysis.], [R], [End-to-end],
    [SnapATAC], [2021], [Scalable clustering + integration framework for scATAC-seq profiles.], [R], [End-to-end],
    [EpiScanpy], [2021], [Extends Scanpy for single-cell epigenomic assays (ATAC, DNA meth, etc.).], [Python], [End-to-end],
    [SnapATAC2], [2023], [Rust-backed, optimized reimplementation of SnapATAC with high scalability.], [Python], [End-to-end],
    // deep learning methods
    [SCALE], [2019], [Variational autoencoder for scATAC-seq data dimensionality reduction.], [Python], [Deep learning],
    [scBasset], [2022], [Sequence-based CNN for scATAC-seq data analysis and motif discovery.], [Python], [Deep learning],
    [PeakVI], [2022], [Variational autoencoder with emphasis on batch correction and interpretability.], [Python], [Deep learning],
    // cutting edge, transformer-based methods
    [EpiAgent], [2024], [Transformer foundation model for scATAC-seq analysis tasks.], [Python], [Foundation model],
    [ChromFound], [2025], [Large-scale foundation model for multi-omic chromatin accessibility integration.], [Python], [Foundation model],
  ),
  caption: "Summary of computational approaches for scATAC-seq data"
) <summary-of-scatac-methods>