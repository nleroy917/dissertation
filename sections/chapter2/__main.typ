#import "@local/dissertation:0.0.1": chapter, authors

#show: chapter.with(
  title: "Chapter 2: Fast clustering and annotation of scATAC-seq data using pretrained region embeddings",
  number: 2,
)
#authors(
  authors: (
        ( name: "Nathan J. LeRoy", me: true, affiliations: [1,2] ),
        ( name: "Jason P. Smith", me: false, affiliations: [1,3,4] ),
        ( name: "Guangtao Zheng", me: false, affiliations: [5] ),
        ( name: "Julia Rymuza", me: false, affiliations: [1] ),
        ( name: "Erfaneh Gharavi", me: false, affiliations: [1,6] ),
        ( name: "Donald E. Brown", me: false, affiliations: [6,7] ),
        ( name: "Aidong Zhang", me: false, affiliations: [2,5,6] ),
        ( name: "Nathan C. Sheffield", me: false, affiliations: [1,2,3,4,5,6,8] )
    ),
  affiliations: (
    "Department of Genome Sciences, School of Medicine, University of Virginia, Charlottesville, VA 22908, USA",
    "Department of Biomedical Engineering, School of Medicine, University of Virginia, Charlottesville, VA 22904, USA",
    "Department of Biochemistry and Molecular Genetics, School of Medicine, University of Virginia, Charlottesville, VA 22908, USA",
    "Child Health Research Center, School of Medicine, University of Virginia, Charlottesville, VA 22908, USA",
    "Department of Computer Science, School of Engineering, University of Virginia, Charlottesville, VA 22908, USA",
    "School of Data Science, University of Virginia, Charlottesville, VA 22904, USA",
    "Department of Systems and Information Engineering, University of Virginia, Charlottesville, VA 22908, USA",
    "Department of Public Health Sciences, School of Medicine, University of Virginia, Charlottesville, VA 22908, USA"
  )
)

== Introduction to scEmbed
#include "introduction.typ"

== Results
#include "results.typ"
#pagebreak()