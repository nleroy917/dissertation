#import "@local/dissertation:0.0.1": authors, informational-note

#authors(
  authors: (
        ( name: "Nathan J. LeRoy", me: true, affiliations: [1,2] ),
        ( name: "Guangtao Zheng", me: false, affiliations: [3] ),
        ( name: "Oleksandr Khoroshevskyi", me: false, affiliations: [1] ),
        ( name: "Donald Campbell", me: false, affiliations: [1] ),
        ( name: "Aidong Zhang", me: false, affiliations: [3] ),
        ( name: "Nathan C. Sheffield", me: false, affiliations: [1,2] )
    ),
  affiliations: (
    "Department of Genome Sciences, School of Medicine, University of Virginia, 22908, Charlottesville VA",
    "Department of Biomedical Engineering, School of Medicine, University of Virginia, 22908, Charlottesville VA",
    "Department of Computer Science, School of Engineering and Applied Sciences, University of Virginia, 22908, Charlottesville VA"
  )
)

#informational-note([
  This chapter is adapted from the following preprint: \
  LeRoy _et al._ @LeRoy2025a, which introduced Atacformer, a transformer-based foundation model for analysis and interpretation of ATAC-seq data.
])

== Introduction to Atacformer
#include "/sections/atacformer/introduction.typ"

== Results
#include "/sections/atacformer/results.typ"

== Discussion
#include "/sections/atacformer/discussion.typ"

#if sys.inputs.at("partial", default: "false") == "true" [ 
  = References
  #bibliography(
    "/refs.bib",
    style: "nature",
    title: none
  ) 
]