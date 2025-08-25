#import "@local/dissertation:0.0.1": *

#show: dissertation.with(
  title: "Atacformer: Towards a transformer-based foundation model for analysis and interpretation of ATAC-seq Data",
  author: "Nathan J. LeRoy",
  university: "University of Virginia",
  school: "School of Engineering and Applied Science",
  degree: "Doctor of Philosophy",
  dedication: "To my family and friends, for their unwavering support and encouragement.",
)

= Acknowledgements
#include "sections/acknowledgements.typ"

= Abstract
#include "sections/abstract.typ"

= Table of contents
#outline(title: none)
#pagebreak()

= List of figures
#outline(title: none, target: figure.where(kind: image))
#pagebreak()

// chapters
#include "sections/chapter1/__main.typ"
#include "sections/chapter2/__main.typ"

= References
#bibliography(
  "refs.bib",
  style: "nature",
  title: none
)