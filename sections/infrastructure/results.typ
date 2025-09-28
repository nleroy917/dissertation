#import "@local/dissertation:0.0.1": *;
#figure(
  image("/fig/gtokenizers/overview.svg"),
  caption: [Overview and benchmarking of gtokenizers, a Rust-based library for genomic interval tokenization.]
) <gtokenizers-overview>
#figure-caption-extended(caption:
[
  *a*, Schematic of natural language tokenization. NLP tokenizers typically break sentences up into words or word-pieces. *b*, Schematic illustrating gtokenizers applied to regulatory elements (e.g., cCREs) for standardized interval representation. *c*, Architecture of gtokenizers, with a core implementation in Rust and support for multiple language bindings (e.g., CLI, R, Python, WebAssembly). *d*, Runtime benchmarking across three query sizes (1M, 100K, 10K regions) against existing tools (bedtools, bedops, bedtk) and Rust-based implementations (`gtars/bits`, `gtars/alist`), demonstrating scalability and performance.
])

=== Overview of genomic interval tokenizers
Modern deep‑learning workflows in natural language processing require tokenizers to convert new text into the model’s fixed vocabulary, enabling consistent inputs for downstream processing. Tokens in language models correspond to discrete words or subword units (@gtokenizers-overview\A). In the genomic domain, a comparable process is necessary: machine learning models that treat genomic intervals as discrete units, like words in a sentence, must map each dataset to a common set of regions, or a vocabulary for genomic intervals @Gharavi2021 @Gharavi2024 @Zheng2024 @Rymuza2024 @LeRoy2024 This vocabulary ensures data across experiments are represented in a standardized, comparable way (@gtokenizers-overview\B). Different datasets can thus be interpreted with the same model architecture and feature space, just as diverse text inputs are aligned via tokenization in NLP.

We implemented two overlap methods in `gtars-tokenizers`: `gtars/bits`, which uses binary interval tree search (BITS) @Layer2013, and `gtars/alist`, which uses an Augmented Interval List (AIList) @Feng2019. Both methods are implemented in Rust for performance and memory efficiency. To maximize flexibility and usability, we provide bindings for `gtars/tokenizers` in Python, R, and WebAssembly, as well as a command-line interface (CLI) (@gtokenizers-overview\C). This allows users to integrate genomic interval tokenization into their existing workflows, whether they are using Python-based machine learning libraries like TensorFlow or PyTorch, R-based bioinformatics tools, or require a web-based solution for use in a browser.

=== Gtars tokenizers are highly performant
To highlight the performance of `gtars/tokenizers`, we benchmarked it against existing tools for genomic interval tokenization. We compare `gtars/tokenizers` to `bedtools`, `bedops`, and `bedtk`. These tools focus on general-purpose genomic interval arithmetic and are not optimized for machine learning applications. We found `gtars/tokenizers` to be consistently as fast or faster than existing tools (@gtokenizers-overview\D). For large universes with >1 million intervals (like those used in genomic interval machine learning), `gtars-tokenizers` is around 2- 3x faster than `bedtools` and `bedops`, while being comparable to `bedtk`. This pattern holds across different query sizes (1M, 100K, and 10K regions), demonstrating the scalability and performance of `gtars/tokenizers`.

=== Gtars works seamlessly with modern machine learning infrastructure
The gtars-tokenizer implementation is compatible with the Hugging Face tokenizers API, enabling seamless integration with the broader Hugging Face ecosystem. The `gtars` tokenizers are near-drop-in replacements for existing Hugging Face tokenizers, meaning users can pass them to the HuggingFace transformers package functions and classes using the same ergonomics as a standard NLP workflow. The consistent interface makes it easy for ML engineers to adapt to training models on genomic interval data. It also means that the downstream outputs of the training process will seamlessly integrate with popular downstream frameworks and tools that rely on the Hugging Face tokenizers standard, such as PyTorch Lightning, AllenNLP, and evaluation libraries like Evaluate, PEFT, and Weights & Biases. To highlight this, we provide a brief example of how someone can use our tokenizers to preprocess data for a simple neural network built with PyTorch. The snippet first creates a new tokenizer from a BED-file, and then uses it to preprocess data for a neural network.

```python
import torch
import gtars.tokenizers as Tokenizer

tokenizer = Tokenizer.from_bed("path/to/bed/file.bed")
network = torch.nn.Embedding(tokenizer.vocab_size, 64)

query_intervals = [("chr1", 1000, 2000), ("chr2", 3000, 4000)]
tokens = tokenizer.tokenize(query_intervals)["input_ids"]
out = network(torch.tensor(tokens))
```

=== Gtars tokenizers are available in a wide array of computing environments.
To maximize usability, we expose the Rust core of gtars-tokenizers as a Rust library crate, as a command-line tool, with R bindings, Python bindings, and for WebAssembly (WASM). This broad set of interfaces ensures that the same high-performance engine can serve diverse communities -- from machine learning researchers to bioinformaticians and end-users in web tools -- without duplicating functionality or compromising performance. It also reduces maintenance requirements for the community because a single fast interface can be deployed in many situations.

