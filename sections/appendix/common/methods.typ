=== Clustering methodologies
We use three clustering algorithms: Hierarchical clustering (HC), k-means clustering, and Louvain clustering. For HC and k-means, we use the `scikit-learn` implementations. When ground-truth labels were known for a particular dataset, we used the number of unique labels to set the number of clusters to generate. Otherwise, we used prior knowledge to estimate the number of unique cell populations we would expect to find. For Louvain clustering, we use the `scanpy` implementation. Louvain is agnostic to a specified number of clusters. As such, we iteratively applied clustering to datasets while slowly increasing the resolution value from 0 to 3. With each iteration, the number of clusters was stored in a list along with the corresponding resolution. Once complete, we employed binary search on the list to identify the resolution that gave us the desired number of clusters. This value was used to generate the final clustering solution.

=== Embedding visualization
We used uniform manifold approximation and projection (UMAP) to visualize single-cell embeddings @McInnes2020. We used the `umap-learn` Python package and specified two dimensions for each visualization. In addition, a random state of 42 was set for visualization workflows. All other parameters were set to package defaults

=== Clustering evaluation
Three scores are employed when a dataset has ground-truth labels: The adjusted rand index (ARI), the adjusted mutual info score (AMI), and the homogeneity score. 

==== Adjusted Rand Index
The ARI is a metric for evaluating the similarity between two data clusterings. This is achieved by counting pairs that are assigned to the same cluster label. Mathematically, it is computed by:

$
"ARI" = (sum_(i j) binom(n_"ij", 2) - [sum_i binom(a_i, 2) sum_j binom(b_j, 2)] \/binom(n,2) ) / (1/2 [ sum_i binom(a_i,2) + sum_j binom(b_j,2)] - [sum_i binom(a_i,2) sum_j binom(b_j,2)] \/ binom(n,2))
$


where $n_(i j)$, $a_i$, $b_j$ are diagonal values, row sums, and column sums respectively from the contingency table that describes the frequency distribution of the cluster labels from ground-truth and predicted clusterings. We use the adjusted rand score function from the `scikit-learn` python package.

==== Adjusted Mutual Info Score
The AMI, intuitively, is a measure of the amount of information that two clusterings share. It's used to evaluate how well two clusterings agree with each other @Vinh2009. We compute AMI through the `scikit-learn` package using the adjusted mutual info score function.

==== Homogeneity Score
The homogeneity score is an entropy-based external cluster evaluation metric that measures how far from perfect an incorrect clustering solution is @Rosenberg2007. We employ the `scikit-learn` homogeneity score function to measure this metric for each dataset.


=== Cell-type classification evaluation <classification-methods>
When ground-truth labels are known, we evaluate cell-type classification performance using accuracy, precision, recall, and F1 score. These metrics provide a comprehensive view of the model's performance in assigning the correct cell types to individual cells.

==== F1 score
The F1 score is the harmonic mean of precision and recall, and provides a balance between these two measures. Precision is the number of true positives divided by the sum of true positives and false positives, and recall is the number of true positives divided by the sum of true positives and false negatives. Formally, these are defined as:

$
"P" = "TP"/("TP" + "FP")
$

$
"R" = "TP"/("TP" + "FN")
$

The F1 score is defined as:

$
"F1" = 2 × "P" × "R"/("P" + "R")
$

To compute these measures, we compare the predicted labels, denoted as $L_p = l_(p 1), l_(p 2), ..., l_(p n)$, to the ground truth labels, denoted as $L_g = l_(g 1), l_(g 2), ..., l_(g n)$, where n is the total number of data points (or clusters). We utilize the metrics.f1 score function from `scikit-learn` to compute this value.

#pagebreak()
