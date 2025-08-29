#import "@local/dissertation:0.0.1": *

#show: dissertation.with(
  title: "Atacformer: Towards a transformer-based foundation model for analysis and interpretation of ATAC-seq Data",
  author: "Nathan J. LeRoy",
  university: "University of Virginia",
  school: "School of Engineering and Applied Science",
  degree: "Doctor of Philosophy",
  dedication: "To my family and friends, for their unwavering support and encouragement.",
)

= Abstract
#include "sections/abstract.typ"
#pagebreak()

= Acknowledgements
#include "sections/acknowledgements.typ"
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
#include "sections/chapter1/main.typ"


// #show: chapter.with(
//   title: "Methods overview"
// )
// #include "sections/chapter2/main.typ"


#show: chapter.with(
  title: "Fast clustering and annotation of scATAC-seq data using pretrained region embeddings"
)
#include "sections/chapter3/main.typ"


= References
#bibliography(
  "refs.bib",
  style: "nature",
  title: none
)
#pagebreak()

#show: appendix.with(title: "Extended methods")
#include "sections/appendix/main.typ"

