#include "/sections/conclusions/overview.typ"

#include "/sections/conclusions/conceptual-insights.typ"

#include "/sections/conclusions/cross-chapter-synthesis.typ"

#include "/sections/conclusions/biological-implications.typ"

#include "/sections/conclusions/limitations.typ"

#include "/sections/conclusions/future-directions.typ"

#include "/sections/conclusions/broader-impact.typ"

#if sys.inputs.at("partial", default: "false") == "true" [ 
  = References
  #bibliography(
    "/refs.bib",
    style: "nature",
    title: none
  ) 
]