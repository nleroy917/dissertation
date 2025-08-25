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
#outline(title: none)
#pagebreak()

= List of figures
#show outline.entry.where(level: 1): set text(weight: "regular") // dont bold figure list
#show outline.entry.where(level: 1): set block(above: 0.6em)
#outline(title: none, target: figure.where(kind: image))
#pagebreak()

= List of tables
#show outline.entry.where(level: 1): set text(weight: "regular") // dont bold figure list
#show outline.entry.where(level: 1): set block(above: 0.6em)
#outline(title: none, target: figure.where(kind: table))
#pagebreak()

// chapters
#include "sections/chapter1/__main.typ"
// #include "sections/chapter2/__main.typ"

= References
#bibliography(
  "refs.bib",
  style: "nature",
  title: none
)