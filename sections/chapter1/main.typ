#import "@local/dissertation:0.0.1": chapter

== A brief history of gene regulation and the study of chromatin accessibility
#include "/sections/chapter1/background.typ"

== Computational challenges in single-cell ATAC-seq analysis
#include "/sections/chapter1/computational-challenges.typ"

== Deep learning-based methods for scATAC-seq analysis
#include "/sections/chapter1/deep-learning-methods.typ"

== Large, pre-trained foundation models for genomic data
#include "/sections/chapter1/foundation-models.typ"

== Summary of computational methods for scATAC-seq analysis
#include "/sections/chapter1/summary-of-methods.typ"

== Improving model sharing, efficiency, and flexibility of scATAC-seq foundation models
#include "/sections/chapter1/thesis-setup.typ"

#pagebreak()

#if sys.inputs.at("partial", default: "false") == "true" [ 
  = References
  #bibliography(
    "/refs.bib",
    style: "nature",
    title: none
  ) 
]