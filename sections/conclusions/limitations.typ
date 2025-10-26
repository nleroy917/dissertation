== Technical limitations and challenges
Through the development of gtars, scEmbed, and Atacformer, we have gained critical insights into the capabilities and constraints of our current approaches. The challenges encountered throughout this research have revealed important boundaries of existing methods and highlighted opportunities for future innovation. Key technical limitations identified through this work include:

- *Data imbalance and diversity:* Training data remain biased toward well-characterized tissues, cell types, and experimental conditions, limiting generalization to rare or novel biological contexts.

- *Tokenization strategies:* Current approaches employ relatively simple, fixed-region tokenization that makes critical assumptions about regulatory element boundaries and completely omits order and spacing information between regions.

- *Interpretability:* While models demonstrate strong performance on cell-level tasks, interpretation of contextualized region embeddings remains underdeveloped, limiting our ability to extract mechanistic insights about regulatory grammar and interactions.

- *Computational scalability:* Computational demands present dual challenges—scaling down to enable accessible inference for resource-constrained researchers, and scaling up to extend context length for processing comprehensive genomic datasets like bulk ATAC-seq and multiomic experiments.

We expand on these limitations in the next section, outlining specific research aims to address each challenge and advance the state of the art in computational epigenomics.