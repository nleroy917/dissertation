#import "@local/dissertation:0.0.1": *

#show: dissertation.with(
  title: "Transformer-based foundation models and high-performance computational tools for chromatin accessibility analysis",
  author: "Nathan J. LeRoy",
  university: "University of Virginia",
  school: "School of Engineering and Applied Science",
  degree: "Doctor of Philosophy"
)

= Acknowledgements
#include "sections/acknowledgements.typ"
#pagebreak()

= Abstract
#include "sections/abstract.typ"
#pagebreak()

= Table of contents
#outline(title: none, depth: 3)
#pagebreak()

= List of figures
#outline(title: none, target: figure.where(kind: image))
#pagebreak()

= List of tables
#outline(title: none, target: figure.where(kind: table))
#pagebreak()

// chapters
#show: chapter.with(
  title: "Introduction to gene regulation, ATAC-seq and current analytical challenges"
)
#include "sections/background/main.typ"
#pagebreak()


#show: chapter.with(
  title: "Background and related work in natural language processing (NLP)"
)
#include "sections/nlp-background/main.typ"
#pagebreak()

#show: chapter.with(
  title: "Efficient computational tools for creating genomic interval vocabularies and tokenization frameworks for modern machine learning applications"
)
#include "sections/infrastructure/main.typ"
#pagebreak()


#show: chapter.with(
  title: "Fast clustering and annotation of scATAC-seq data using pretrained region embeddings"
)
#include "sections/scembed/main.typ"
#pagebreak()

#show: chapter.with(
  title: "Atacformer: A transformer-based foundation model for analysis and interpretation of ATAC-seq data"
)
#include "sections/atacformer/main.typ"
#pagebreak()

#show: chapter.with(
  title: "Conclusions and future work"
)
#include "sections/conclusions/main.typ"
#pagebreak()

= References
#bibliography(
  "refs.bib",
  style: "nature",
  title: none
)
#pagebreak()

#show: appendix.with(title: "Supplemental figures and tables")
#include "sections/appendix/figures.typ"
#pagebreak()

#show: appendix.with(title: "Extended methods")
#include "sections/appendix/methods.typ"

