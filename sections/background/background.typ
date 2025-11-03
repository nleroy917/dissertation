=== Why does the same DNA makes different cells?
Inside the nucleus of all 30 trillion of our cells is about six feet of DNA tightly packed and coiled up into compact structures called chromosomes @Alberts2002. Remarkably, this DNA sequence is nearly identical across all cell types within an individual, yet it gives rise to extraordinary levels of heterogeneity in cell types, tissues, disease states, and physiological responses. This fundamental paradox raises a critical question: _how does a single, static genetic blueprint generate such diverse biological outcomes_?

While the DNA sequence itself is largely invariant across cell types, its interpretation is highly dynamic and context-specific. Cells achieve this through complex layers of gene regulation, which govern when, where, and to what extent specific genes are transcribed into RNA. At the heart of this regulatory machinery are elements like promoters, which initiate transcription near gene start sites, and enhancers, which can activate transcription at distant genomic loci in a cell-type–specific manner @Levine2003. These elements recruit combinations of transcription factors, activators, and RNA polymerases to modulate gene expression. However, for these proteins to access their target DNA sequences, the local chromatin must be in an _open_ or accessible state. This is why these interactions are fundamentally influenced by the chromatin landscape, which determines the physical accessibility of DNA to regulatory proteins. @Ong2011 (@gene-regulation). 

Briefly, promoters are DNA sequences located near gene start sites that serve as binding platforms for RNA polymerase and initiate transcription. Enhancers are regulatory sequences that can be located thousands of base pairs away from their target genes and boost transcription levels when bound by appropriate transcription factors. Transcription factors are proteins that bind to specific DNA sequences and either activate or repress gene expression. RNA polymerase is the enzyme responsible for transcribing DNA into RNA. Finally, chromatin refers to the complex of DNA and histone proteins that packages genetic material in the nucleus, with its structure determining which regions are accessible for transcription.

Thus, taken together, biological heterogeneity arises _not only_ from subtle differences in genetic code but from the selective and combinatorial usage of regulatory elements across different cell types, developmental stages, and environmental conditions. Because of this, understanding gene regulation is key to deciphering how the same DNA sequence can lead to diverse cellular identities and functions. In turn, this knowledge is critical for unraveling the molecular basis of health and disease, as dysregulation of these processes underlies many pathological conditions including cancer, developmental disorders, and immune dysfunction.

#figure(
  image("/fig/introduction/gene-regulation.svg"),
  caption: [A schematic representation of gene regulation.]
) <gene-regulation>

=== The rise of epigenomics assays
The completion of the Human Genome Project @Lander2001 in 2003 enabled various 'omics technologies which, as a result, facilitated the exploration of gene regulation and epigenomics. Simultaneously, genome-wide association studies (GWAS) revealed that approximately 90% of disease-associated single nucleotide polymorphisms (SNPs) are located in non-coding regions of the genome, underscoring the crucial importance of studying gene regulation and epigenomics in human health and disease for driving this biological heterogeneity @Farh2015 @French2020. This discovery catalyzed the development of numerous experimental approaches to study regulatory elements (@publication-trends).

To comprehensively map the regulatory landscape, researchers have developed complementary experimental strategies that interrogate different aspects of chromatin biology. These approaches can be organized into three conceptual categories based on what they measure: (1) epigenetic modifications that mark regulatory states, exemplified by DNA methylation analysis; (2) chromatin accessibility and protein-DNA interactions that indicate active regulatory elements, including DNase-seq, FAIRE-seq, ATAC-seq, ChIP-seq, and CUT&TAG; and (3) three-dimensional genome organization that constrains regulatory interactions, captured through Hi-C. Together, these techniques provide a multi-dimensional view of gene regulation. Each approach is described in detail below, organized by the biological question it addresses.

#figure(
  image("/fig/introduction/publication_trends.svg"),
  caption: [Trends in epigenomic assay publications over time. Data from PubMed searches for key epigenomic assays.]
) <publication-trends>

==== Mapping epigenetic modifications
DNA methylation represents one of the most stable epigenetic marks, serving as a foundational layer of gene regulation that can persist through cell division and development.

===== DNA methylation analysis through bisulfite sequencing
DNA methylation is a key epigenetic modification that plays a critical role in regulating gene expression by influencing chromatin structure and transcription factor accessibility @Jones2012 @Smith2013. DNA methylation analysis through bisulfite sequencing assesses cytosine methylation status at single-base resolution @Frommer1992 @Li2011. This technique involves treating DNA with bisulfite, which converts unmethylated cytosines to uracils, while leaving methylated cytosines unchanged. Subsequent sequencing of the treated DNA identifies methylated versus unmethylated cytosines, providing insights into the epigenetic regulation of gene expression through DNA methylation patterns.

==== Profiling protein-DNA interactions
Beyond static epigenetic marks, the dynamic binding of regulatory proteins to DNA determines which genes are actively transcribed. Two complementary approaches have emerged to map these interactions genome-wide.

===== Chromatin immunoprecipitation sequencing (ChIP-seq)
Transcription factors and histone modifications are central regulators of gene expression, and mapping their binding sites is essential for understanding gene regulatory networks @Barski2007 @Johnson2007. ChIP-seq is a powerful technique used to analyze protein-DNA interactions on a genome-wide scale @Robertson2007. It involves crosslinking proteins to DNA, followed by shearing the DNA and immunoprecipitating the protein of interest using specific antibodies. The associated DNA is then purified and sequenced, to identify binding sites and regulatory elements.

===== CUT&TAG
Building on the principles of ChIP-seq, CUT&TAG offers a more refined approach with improved sensitivity and reduced input requirements. CUT&TAG is a method used to profile protein-DNA interactions with high resolution and low input requirements @Kaya-Okur2019. It involves the use of a Tn5 transposase fused to an antibody that targets a specific protein of interest. This allows for the selective tagging and subsequent sequencing of accessible chromatin regions associated with the protein, providing insights into its regulatory role. Compared to traditional ChIP-seq, CUT&TAG offers improved signal-to-noise ratios and reduced background, making it particularly valuable for studying low-abundance proteins or working with limited cell numbers.

==== Measuring chromatin accessibility
While protein binding studies reveal where regulatory factors associate with DNA, chromatin accessibility assays provide a broader view of which genomic regions are available for regulatory interactions. These techniques have evolved from enzymatic digestion approaches to transposase-based methods, each offering unique advantages for mapping open chromatin.

===== DNase hypersensitivity sequencing (DNase-seq)
Because regulatory elements such as promoters and enhancers reside in regions of open chromatin, mapping DNase I hypersensitive sites has long been a key strategy for identifying functional regulatory elements across the genome @Thurman2012. DNase-seq is a technique used to map regions of open chromatin by identifying sites of DNase I hypersensitivity @Boyle2008. It involves treating nuclei with DNase I, which cleaves accessible DNA, followed by sequencing the resulting fragments. This method provides insights into chromatin accessibility and the regulatory landscape of the genome.

===== Formaldehyde-Assisted Isolation of Regulatory Elements (FAIRE-seq)
FAIRE-seq leverages the fact that active regulatory elements are often nucleosome-depleted, providing a complementary approach to DNase-based assays for detecting accessible chromatin. FAIRE-seq is a method used to identify nucleosome-depleted regions of the genome, which are indicative of regulatory elements @Giresi2007. It involves crosslinking chromatin with formaldehyde, followed by phenol-chloroform extraction to isolate DNA from nucleosome-depleted regions. The purified DNA is then sequenced to map these regulatory elements.

===== Assay for Transposase-Accessible Chromatin using sequencing (ATAC-seq)
Representing a technical advance over both DNase-seq and FAIRE-seq, ATAC-seq combines simplicity with sensitivity to provide robust accessibility maps. The Assay for Transposase-Accessible Chromatin using sequencing (ATAC-seq) @Buenrostro2013 is a method used to assess chromatin accessibility. It involves the use of a hyperactive Tn5 transposase to insert sequencing adapters into accessible regions of the genome. This technique allows for the identification of open chromatin regions and the characterization of regulatory elements. ATAC-seq has become a widely adopted method due to its simplicity, speed, and ability to generate high-resolution maps of chromatin accessibility from small amounts of input material.

==== Capturing three-dimensional genome organization
The spatial organization of chromatin in three dimensions adds another critical layer of gene regulation, as physical proximity between distant genomic elements enables long-range regulatory interactions.

===== Chromatin Conformation Capture (Hi-C)
Because genome folding constrains which regulatory elements can physically contact their target genes, Hi-C provides a powerful way to link chromatin architecture with gene regulation @Lieberman-Aiden2009 @Dixon2012. Hi-C is a technique used to study the three-dimensional organization of the genome. It involves crosslinking chromatin, followed by digestion with a restriction enzyme and ligation of the resulting fragments. This method identifies interactions between distant genomic regions, providing insights into the spatial organization of the genome @Belton2012. Specifically, Hi-C can identify topologically associating domains (TADs) and chromatin loops that bring enhancers into close proximity with their target promoters.

==== Integration and single-cell advances
The techniques described above provide complementary views of gene regulation, from epigenetic modifications to protein binding, chromatin accessibility, and three-dimensional organization. Importantly, many of these approaches have been successfully adapted to single-cell formats @Rotem2015 @Smallwood2014 @Buenrostro2015, enabling the dissection of regulatory heterogeneity within complex tissues and the identification of rare cell states that would be masked in bulk measurements. These methods are summarized in @epigenetic-methods-overview.

#figure(
  table(
    columns: (auto, auto),
    align: horizon,
    table.header(
      [Epigenomic assay], [What it measures],
    ),
    [DNA Methylation],
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

Among these assays, ATAC-seq has emerged as a widely adopted method for studying gene regulation due to its simplicity, speed, and ability to generate high-resolution maps of chromatin accessibility from small amounts of input material (@publication-trends). Unlike earlier methods, it requires no antibodies or extensive sample prep, making it especially well-suited for rare or primary cells. Its adaptability to single-cell formats has enabled high-throughput profiling of cell-type–specific regulatory landscapes, fueling discoveries in development, cancer, and immunology. By revealing open chromatin regions that mark active promoters, enhancers, and other regulatory elements, ATAC-seq provides critical insights into how gene expression is controlled across diverse biological contexts @Buenrostro2013.

#figure(
  image("/fig/introduction/atac-seq.svg"),
  caption: [Overview of the ATAC-seq procedure.]
) <atac-seq-overview>

The fundamental goal behind ATAC-seq is to identify regions of open chromatin across the genome, which are indicative of regulatory elements such as promoters and enhancers that control gene expression. The assay leverages the hyperactive Tn5 transposase enzyme, which preferentially inserts sequencing adapters into accessible regions of the genome where nucleosomes are absent or loosely bound @Buenrostro2013 (@atac-seq-overview\A). The Tn5 transposase simultaneously cleaves the DNA and ligates sequencing adapters in a process known as "tagmentation." This results in a library of DNA fragments that are significantly enriched for open chromatin regions (@atac-seq-overview\B).

These DNA fragments are then PCR-amplified to add sample-specific barcodes and sequencing primers, followed by high-throughput sequencing, typically using Illumina platforms (@atac-seq-overview\C). The resulting sequencing reads are aligned to a reference genome, and peaks of read enrichment are identified using computational tools such as MACS2 @Zhang2008. These peaks correspond to regions of accessible chromatin, providing insights into the regulatory landscape of the cell type under study (@atac-seq-overview\D).

ATAC-seq remains a staple in epigenomic research, however, its adaptation to single-cell formats (scATAC-seq) has revolutionized the field by enabling the profiling of chromatin accessibility at the resolution of individual cells @Buenrostro2015 @Cusanovich2015. This advancement allows researchers to dissect the regulatory heterogeneity _within_ seemingly homogeneous cell populations, identify rare cell types, and trace developmental trajectories based on chromatin dynamics. In scATAC-seq, individual cells are isolated using microfluidics or droplet-based platforms, and the ATAC-seq protocol is adapted to work with the limited DNA content of single cells. The resulting data provides cell-type–specific accessibility profiles that can be integrated with single-cell RNA sequencing to create comprehensive regulatory maps linking chromatin state to gene expression across diverse cell types and developmental stages.