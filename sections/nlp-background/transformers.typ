=== Transformers
Transformers are a type of neural network architecture that has gained significant popularity in recent years, particularly for natural language processing tasks. Introduced in the paper "Attention is All You Need" by Vaswani et al. in 2017 @Vaswani2017, transformers leverage a mechanism called self-attention to process input sequences in parallel, rather than sequentially as RNNs and LSTMs do. This enables two things: first, transformers can capture long-range dependencies in the data more effectively, as there is no more "distance" between words in a sequence; and second, they can be trained more efficiently on large datasets due to their parallelizable architecture. Specifically, they consume sequences as a whole instead of word-by-word, allowing for much faster training times (@w2v-rnn-transformer\C).

#figure(
  image("/fig/nlp-background/w2v-rnn-transformer.svg"),
  caption: [Evolution of word representation and sequence modeling techniques in NLP: from Word2Vec to RNNs to Transformers.]
) <w2v-rnn-transformer>

=== Self attention
The core innovation of transformers is the self-attention mechanism, which allows the model to weigh the importance of different words in a sequence when updating their representations. In self-attention, each word in the input sequence is transformed into three vectors: a query vector, a key vector, and a value vector. The attention score between two words is computed as the dot product of the query vector of one word and the key vector of another word, followed by a softmax operation to obtain a probability distribution. This score determines how much attention one word should pay to another when updating its representation. The final output for each word is then computed as a weighted sum of the value vectors of all words in the sequence, where the weights are given by the attention scores.

Mathematically, the self-attention mechanism can be expressed as follows:
$
"Attention"(Q, K, V) = sigma("QK"^T)/sqrt(d_k) dot V
$

where $"Q"$, $"K"$, and $"V"$ are the matrices of query, key, and value vectors for all words in the sequence, and $d_k$ is the dimensionality of the key vectors. The division by $sqrt(d_k)$ is a scaling factor that helps stabilize the gradients during training.

A key thing to note is that in self-attention, each word can attend to all other words in the sequence, allowing the model to capture complex dependencies and relationships between words regardless of their positions. This is in contrast to RNNs, where the influence of earlier words can diminish over time due to the sequential processing.

While powerful, the self-attention mechanism can be computationally intensive, especially for long sequences, as it requires computing attention scores for all pairs of words. This leads to $O(n^2)$ complexity, where $n$ is the length of the input sequence.

This complexity resulted in difficulties when scaling up transformers to very long sequences, such as entire documents or genomic regions. To address this, various modifications and optimizations have been proposed, such as sparse attention mechanisms, which limit the number of words each word can attend to, and hierarchical transformers, which process sequences at multiple levels of granularity.

=== Approximations of self-attention
After the original transformer architecture was introduced, several variants and improvements have been proposed to enhance its performance and efficiency, particularly within the self-attention mechanism. We describe some notable examples in turn.

==== Low-rank & kernel-based approximations
A first class of methods reduces the quadratic cost of self-attention by approximating the attention matrix with low-rank or kernel-based decompositions. One example is Linformer, which projects the sequence dimension into a lower-rank space, yielding linear complexity while retaining competitive accuracy on many NLP tasks @Wang2020a. Nyströmformer applies the Nyström method to approximate the softmax kernel, further reducing memory usage while scaling to longer contexts @Xiong2021. Finally, Performer takes a different approach, introducing FAVOR+ random feature maps to approximate the softmax kernel directly in linear time @Choromanski2021. These methods sacrifice exactness but offer strong trade-offs between efficiency and fidelity.

==== Sparse attention mechanisms
Another approach is to approximate self-attention using sparse matrices, exploiting the intuition that not all pairwise interactions are necessary. Sparse Transformer introduced block-sparse patterns to limit computations without major accuracy loss @Child2019. One example is Longformer, which extended this idea with a sliding-window local attention pattern augmented by global tokens for tasks like question answering @Beltagy2020. Another, BigBird, combined local, global, and random sparse connections, providing both empirical scalability and theoretical guarantees of universality @Zaheer2021. These structured sparsity patterns allow transformers to process sequences with tens of thousands of tokens while retaining exact attention within the restricted subsets.

==== Algorithmic improvements
A final line of work focuses on re-engineering the exact attention operation itself to be more memory- and bandwidth-efficient. One of the most well-known is FlashAttention. FlashAttention reformulates attention as a sequence of IO-aware matrix multiplications, using tiling and recomputation to eliminate the need to materialize the full attention matrix in GPU memory @Dao2022. FlashAttention v2 further generalized these kernels for both training and inference, showing substantial speedups on modern accelerators @Dao2023. Related libraries, such as xFormers, provide a general framework for fused attention kernels with minimal memory overhead. Unlike low-rank or sparse approaches, these methods compute attention exactly but achieve significant gains by exploiting hardware efficiency.
