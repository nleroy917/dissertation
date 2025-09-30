#import "@local/dissertation:0.0.1": authors

#authors(
  authors: (
        ( name: "Nathan J. LeRoy", me: true, affiliations: [1, 2] ),
        ( name: "Donald Campbell", me: false, affiliations: [1] ),
        ( name: "Oleksandr Khoroshevskyi", me: false, affiliations: [1] ),
        ( name: "Julia Rymuza", me: false, affiliations: [1] ),
        ( name: "Edward Chen", me: false, affiliations: [3] ),
        ( name: "Nathan C. Sheffield", me: false, affiliations: [1, 2] )
    ),
  affiliations: (
    "Department of Genome Sciences, School of Medicine, University of Virginia, 22908, Charlottesville VA",
    "Department of Biomedical Engineering, School of Medicine, University of Virginia, 22908, Charlottesville VA",
    "Department of Computer Science, School of Engineering and Applied Sciences, University of Virginia, 22908, Charlottesville VA"
  )
)

== Introduction
#include "/sections/infrastructure/introduction.typ"

== Results
#include "/sections/infrastructure/results.typ"

== Discussion
#include "/sections/infrastructure/discussion.typ"