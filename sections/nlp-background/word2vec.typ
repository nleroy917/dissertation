=== From words to numbers: the challenge of word representation
A core challenge in natural language processing is how to represent words in a way that a machine learning model can understand. Fundamentally, a neural network is only capable of processing numerical data. This means that before we can apply neural networks to text, we need a way to convert words into numbers. Specifically this means converting something like the sentence: `"The cat sat on the mat."` into a numerical format that a neural network can understand. This is not a trivial task, as words are discrete symbols that do not have an inherent numerical representation.

=== One-hot encoding
A simple and intuitive way to represent words numerically is through one-hot encoding. In this approach, we first create a vocabulary of all unique words in our dataset. Each word is then represented as a vector of zeros with a single one at the index corresponding to that word in the vocabulary. For example, if our vocabulary consists of the words `["the", "cat", "sat", "on", "mat"]`, the word "cat" would be represented as such (@word-representations\A): 

#align(center)[
```
[0, 1, 0, 0, 0]
```
]

While one-hot encoding is straightforward, it has several limitations. First, it results in high-dimensional and sparse vectors, especially for large vocabularies. Second, it does not capture any semantic relationships between words; for instance, "cat" and "dog" would be represented as completely orthogonal vectors despite their semantic similarity. These limitations motivated the development of more sophisticated word representation techniques.

=== Distributed representations
To address the limitations of one-hot encoding, researchers developed distributed representations, also known as word embeddings. In this approach, words are represented as dense vectors in a continuous vector space, where semantically similar words are mapped to nearby points. This allows the model to capture relationships between words based on their contexts. For example, in a well-trained embedding space, the vectors for "king" and "queen" would be close to each other, and the relationship between "king" and "queen" could be represented as a vector offset, such as "king" - "man" + "woman" = "queen" (@word-representations\B).

The question then becomes: how do we learn these embeddings? One influential method for learning word embeddings is Word2Vec, which we will discuss next.

=== Word2vec
Perhaps one of the most influential methods for learning word embeddings is Word2Vec, introduced by Mikolov et al. in 2013 @Mikolov2013a. Word2Vec is a shallow, two-layer neural network that is trained to predict the context words surrounding a target word in a sentence. There are two main architectures for Word2Vec: Continuous Bag of Words (CBOW) and Skip-Gram. In the CBOW architecture, the model predicts a target word based on its surrounding context words (@word-representations\C). Conversely, in the Skip-Gram architecture, the model predicts the context words given a target word (@word-representations\D). Both architectures learn to represent words as dense vectors in a continuous vector space, where semantically similar words are mapped to nearby points.

Briefly, the training process involves sliding a window over a text corpus and using the words within that window to update the word vectors. The objective is to maximize the probability of predicting the context words given the target word (or vice versa, depending on the architecture). This is typically done using techniques like negative sampling or hierarchical softmax to efficiently approximate the softmax function over a large vocabulary.

The actual embeddings are obtained from the weights of the hidden layer after training. Importantly, words in the training process are fed to the model as one-hot encoded vectors, but this has the consequence of acting as a lookup table to retrieve the corresponding dense embedding vector from the hidden layer weights. For example, if we denote the one-hot encoded vector for a word as `one-hot` and the weight matrix of the hidden layer as `W_h`, the embedding for that word can be computed as:

$
"e"_"cat" = W_h^T dot "one-hot"
$
#align(center)[or,]
$
"e"_"cat" = mat(
  w_"1,1", w_"1,2", ..., w_"1,V";
  w_"2,1", w_"2,2", ..., w_"2,V";
  dots.v, dots.v, dots.down, dots.v;
  w_"d,1", w_"d,2", ..., w_"d,V"
) dot 
mat(
  0;
  1;
  dots.v;
  0
) =
mat(
  w_"1,1" dot 0 + w_"1,2" dot 1 + ... + w_"1,V" dot 0;
  w_"2,1" dot 0 + w_"2,2" dot 1 + ... + w_"2,V" dot 0;
  dots.v;
  w_"d,1" dot 0 + w_"d,2" dot 1 + ... + w_"d,V" dot 0
) =
// mat(
//   0 + w_"1,2", ..., 0;
//   0 + w_"2,2", ..., 0;
//   dots.v;
//   0 + w_"V,2", ..., 0
// ) =
mat(
  w_"1,2";
  w_"2,2";
  dots.v;
  w_"d,2"
)
$

Word2Vec embeddings have been highly successful in capturing semantic relationships between words and have been widely adopted in various NLP tasks. Extensions and improvements upon Word2Vec, such as GloVe @Pennington2014, FastText @Bojanowski2017, and Doc2Vec @Le2014 have further advanced the field of word embeddings. These methods have laid the groundwork for more complex models, including those based on transformers, which we will explore in subsequent sections. However, *the critical insight from Word2Vec — that words can be meaningfully represented in a continuous vector space based on their contexts — remains foundational to modern NLP and our own work on genomic interval analysis*. Each word gets its own vector in a high-dimensional space, and the relationships between these vectors capture semantic similarities and differences.

#figure(
  image("/fig/nlp-background/word-representations.svg"),
  caption: [Different methods for representing words numerically: one-hot encoding vs. distributed representations.]
) <word-representations>