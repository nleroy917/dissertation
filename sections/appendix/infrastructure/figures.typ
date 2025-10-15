#import "@local/dissertation:0.0.1": figure-caption-extended

#figure(
  image("/fig/gtokenizers/universe_results_overview.svg"),
  caption: "Universes overview and results of base-level overlap score."
) <universe-results-overview>
#figure-caption-extended(
  caption: [
    *a.* Different universes represent genome coverage by the collection to a different extent, example from the Random ATAC collection. Collection R consists of many different files, which are represented by the core signal track. Regions in R1, R2, R3 are best represented by CC, CCF and LH universes in terms of overlap. *b.* Average F#sub("10")-score for each collection and universes assessment. Across all collections, the HMM universe performs the best in terms of F#sub("10") score.
  ]
)