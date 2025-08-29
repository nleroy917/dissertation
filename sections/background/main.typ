#import "@local/dissertation:0.0.1": chapter

== A brief history of gene regulation and the study of chromatin accessibility
#include "/sections/background/background.typ"

== Computational challenges in single-cell ATAC-seq analysis
#include "/sections/background/computational-challenges.typ"

== Deep learning-based methods for scATAC-seq analysis
#include "/sections/background/deep-learning-methods.typ"

== Large, pre-trained foundation models for genomic data
#include "/sections/background/foundation-models.typ"

== Summary of computational methods for scATAC-seq analysis
#include "/sections/background/summary-of-methods.typ"

== Improving model sharing, efficiency, and flexibility of scATAC-seq foundation models
#include "/sections/background/thesis-setup.typ"

#if sys.inputs.at("partial", default: "false") == "true" [ 
  = References
  #bibliography(
    "/refs.bib",
    style: "nature",
    title: none
  ) 
]