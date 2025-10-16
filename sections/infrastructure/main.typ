#import "@local/dissertation:0.0.1": authors

#authors(
  authors: (
        ( name: "Nathan J. LeRoy", me: true, affiliations: [1, 2] ),
        ( name: "Julia Rymuza", me: false, affiliations: [1] ),
        ( name: "Donald Campbell", me: false, affiliations: [1] ),
        ( name: "Oleksandr Khoroshevskyi", me: false, affiliations: [1] ),
        ( name: "Seth Stadick", me: false, affiliations: [3] ),
        ( name: "Sang-Hoon Park", me: false, affiliations: [1] ),
        ( name: "Edward Chen", me: false, affiliations: [4] ),
        ( name: "Nathan C. Sheffield", me: false, affiliations: [1, 2] )
    ),
  affiliations: (
    "Department of Genome Sciences, School of Medicine, University of Virginia, 22908, Charlottesville VA",
    "Department of Biomedical Engineering, School of Medicine, University of Virginia, 22908, Charlottesville VA",
    "Life Sciences Group, Bio-Rad Laboratories, 1000 Alfred Nobel Dr, Hercules, 94547, California, USA",
    "Department of Computer Science, School of Engineering and Applied Sciences, University of Virginia, 22908, Charlottesville VA"
  )
)

== Introduction
#include "/sections/infrastructure/introduction.typ"

== Results
#include "/sections/infrastructure/results.typ"

== Discussion
#include "/sections/infrastructure/discussion.typ"

#if sys.inputs.at("partial", default: "false") == "true" [ 
  = References
  #bibliography(
    "/refs.bib",
    style: "nature",
    title: none
  ) 
]