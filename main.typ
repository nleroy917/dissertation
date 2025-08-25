#import "@local/dissertation:0.0.1": *

#show: dissertation.with(
  title: "Atacformer: Towards a transformer-based foundation model for analysis and interpretation of ATAC-seq Data",
  author: "Nathan J. LeRoy",
  university: "University of Virginia",
  school: "School of Engineering and Applied Science",
  degree: "Doctor of Philosophy"
)

#include "sections/dedication.typ"

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

#show: chapter.with(
  title: "Chapter 1",
  number: 1,
)
== Introduction
#include "sections/chapter1/introduction.typ"
== Results
#include "sections/chapter1/results.typ"
#pagebreak()

#show: chapter.with(
  title: "Chapter 2",
  number: 2,
)
== Introduction
#include "sections/chapter2/introduction.typ"
== Results
#include "sections/chapter2/results.typ"
#pagebreak()

= References
#bibliography(
  "refs.bib",
  style: "nature",
  title: none
)