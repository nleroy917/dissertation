#import "@local/dissertation:0.0.1": chapter

#show: chapter.with(
  title: "Chapter 1: Introduction to gene regulation, ATAC-seq and current analytical challenges",
  number: 1,
)

== A brief history of gene regulation and the study of chromatin accessibility
#include "/sections/chapter1/background.typ"

== Computational challenges in single-cell ATAC-seq analysis
#include "/sections/chapter1/computational-challenges.typ"

== Deep learning-based methods for scATAC-seq analysis
#include "/sections/chapter1/deep-learning-methods.typ"

== Large, pre-trained foundation models for genomic data
#include "/sections/chapter1/foundation-models.typ"

#pagebreak()

#if sys.inputs.at("partial", default: "false") == "true" [ 
  = References
  #bibliography(
    "/refs.bib",
    style: "nature",
    title: none
  ) 
]