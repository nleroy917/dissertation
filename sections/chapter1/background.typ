=== Why does the same DNA makes different cells?
Inside the nucleus of all 30 trillion of our cells is about six feet of DNA tightly packed and coiled up into compact structures called chromosomes @Alberts2002. Remarkably, this DNA sequence is nearly identical across all cell types within an individual, yet it gives rise to extraordinary levels of heterogeneity in cell types, tissues, disease states, and physiological responses. This fundamental paradox raises a critical question: _how does a single, static genetic blueprint generate such diverse biological outcomes_?

While the DNA sequence itself is largely invariant across cell types, its interpretation is highly dynamic and context-specific. Cells achieve this through complex layers of gene regulation, which govern when, where, and to what extent specific genes are transcribed into RNA. At the heart of this regulatory machinery are elements like promoters, which initiate transcription near gene start sites, and enhancers, which can activate transcription at distant genomic loci in a cell-type–specific manner @Levine2003. These elements recruit combinations of transcription factors, cofactors, and RNA polymerases to modulate gene expression. Importantly, these interactions are influenced by the chromatin landscape, which determines the physical accessibility of DNA to regulatory proteins @Ong2011 (@gene-regulation). Thus, biological heterogeneity arises not only from differences in genetic code but from the selective and combinatorial usage of regulatory elements across different cell types, developmental stages, and environmental conditions.

#figure(
  image("../../fig/chapter1/gene-regulation.svg"),
  caption: [A schematic representation of gene regulation.]
) <gene-regulation>

=== The rise of epigenomics assays
The completion of the Human Genome Project @Lander2001 enabled the development of various 'omics technologies which, in turn, facilitated the exploration of gene regulation and epigenomics. Simultaneously, genome-wide association studies (GWAS) revealed that approximately 90% of disease-associated single nucleotide polymorphisms (SNPs) are located in non-coding regions of the genome, underscoring the crucial importance of studying gene regulation and epigenomics in human health and disease for driving this biological heterogeneity @Farh2015 @French2020. This discovery catalyzed the development of technologies to study regulatory elements, including DNA methylation analysis through bisulfite sequencing @Frommer1992 @Li2011, chromatin immunoprecipitation sequencing (ChIP-seq) @Robertson2007, DNase hypersensitivity sequencing (DNase-seq) @Boyle2008, Formaldehyde-Assisted Isolation of Regulatory Elements @Giresi2007, CUT&TAG @Kaya-Okur2019, Chromatin Conformation Capture @Belton2012,  and the Assay for Transposase-Accessible Chromatin using sequencing (ATAC-seq) @Buenrostro2013, with modern single-cell variants now available for many approaches @Rotem2015 @Smallwood2014 @Buenrostro2015. These methods are summarized in (@epigenetic-methods-overview).

#figure(
  table(
    columns: (0.5fr, auto),
    align: horizon,
    table.header(
      [Epigenomic assay], [What it measures],
    ),
    [DNA Methylation\
    (Bisulfite-seq)],
    [Cytosine methylation status via bisulfite conversion],
    [DNase-seq],
    [Chromatin accessibility via DNase I cleavage],
    [ChIP-seq],
    [Protein-DNA binding via immunoprecipitation],
    [ATAC-seq],
    [Chromatin accessibility via Tn5 transposase insertion],
    [FAIRE-seq],
    [Nucleosome-depleted regions via phenol-chloroform extraction],
    [CUT&Tag],
    [Targeted chromatin profiling via antibody-Tn5 fusion],
    [Hi-C],
    [3D chromatin conformation via proximity ligation],
  ),
  caption: "Summary of epigenomic assays and their biological insights"
) <epigenetic-methods-overview>

=== Assay for Transposase-Accessible Chromatin using sequencing (ATAC-seq) and its single-cell counterpart

Among these assays, ATAC-seq has emerged as a widely adopted method for studying gene regulation due to its simplicity, speed, and ability to generate high-resolution maps of chromatin accessibility from small amounts of input material. Unlike earlier methods, it requires no antibodies or extensive sample prep, making it especially well-suited for rare or primary cells. Its adaptability to single-cell formats has enabled high-throughput profiling of cell-type–specific regulatory landscapes, fueling discoveries in development, cancer, and immunology. By revealing open chromatin regions that mark active promoters, enhancers, and other regulatory elements, ATAC-seq provides critical insights into how gene expression is controlled across diverse biological contexts @Buenrostro2013.

#figure(
  image("../../fig/chapter1/atac-seq.svg"),
  caption: [Overview of the ATAC-seq procedure.]
) <atac-seq-overview>

The fundamental goal behind ATAC-seq is to identify regions of open chromatin across the genome, which are indicative of regulatory elements such as promoters and enhancers that control gene expression. The assay leverages the hyperactive Tn5 transposase enzyme, which preferentially inserts sequencing adapters into accessible regions of the genome where nucleosomes are absent or loosely bound @Buenrostro2013 (@atac-seq-overview\a). The Tn5 transposase simultaneously cleaves the DNA and ligates sequencing adapters in a process known as "tagmentation." This results in a library of DNA fragments that are significantly enriched for open chromatin regions (@atac-seq-overview\b).

These DNA fragments are then PCR-amplified to add sample-specific barcodes and sequencing primers, followed by high-throughput sequencing, typically using Illumina platforms (@atac-seq-overview\c). The resulting sequencing reads are aligned to a reference genome, and peaks of read enrichment are identified using computational tools such as MACS2 @Zhang2008. These peaks correspond to regions of accessible chromatin, providing insights into the regulatory landscape of the cell type under study (@atac-seq-overview\d).

ATAC-seq remains a staple in epigenomic research, however, its adaptation to single-cell formats (scATAC-seq) has revolutionized the field by enabling the profiling of chromatin accessibility at the resolution of individual cells @Buenrostro2015 @Cusanovich2015. This advancement allows researchers to dissect the regulatory heterogeneity _within_ seemingly homogeneous cell populations, identify rare cell types, and trace developmental trajectories based on chromatin dynamics. In scATAC-seq, individual cells are isolated using microfluidics or droplet-based platforms, and the ATAC-seq protocol is adapted to work with the limited DNA content of single cells. The resulting data provides cell-type–specific accessibility profiles that can be integrated with single-cell RNA sequencing to create comprehensive regulatory maps linking chromatin state to gene expression across diverse cell types and developmental stages.

While scATAC-seq has opened new avenues for understanding gene regulation, it also presents unique challenges, such as increased technical variability and the need for specialized computational tools to analyze the resulting data. Addressing these challenges will be crucial for fully realizing the potential of single-cell epigenomics in uncovering the complexities of gene regulation.