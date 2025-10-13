Below is a summary of models and methods from the NLP literature that have been discussed in this chapter:
#figure(
  table(
    columns: (auto, auto, auto),
    align: horizon,
    table.header(
      [Method], [Year], [Description]
    ),
    // Word representation methods
    [One-hot encoding], [Early], [Represents words as sparse binary vectors with single 1 at vocabulary index.],
    [Word2Vec], [2013], [Shallow neural network learning dense word embeddings via context prediction.],
    [GloVe], [2014], [Global vector representations combining matrix factorization with local context.],
    [FastText], [2017], [Extension of Word2Vec incorporating subword information for rare words.],
    
    // Sequential models
    [RNN], [1980s], [Recurrent networks processing sequences with hidden state memory.],
    [LSTM], [1997], [Long Short-Term Memory networks addressing vanishing gradient problem.],
    [GRU], [2014], [Gated Recurrent Units as simplified alternative to LSTMs.],
    [Seq2seq], [2014], [Encoder-decoder framework for sequence-to-sequence tasks.],
    
    // Transformer era
    [Transformer], [2017], [Self-attention based architecture processing sequences in parallel.],
    [Linformer], [2020], [Low-rank approximation of attention for linear complexity.],
    [Longformer], [2020], [Sparse attention with sliding window and global tokens.],
    [FlashAttention], [2022], [IO-aware exact attention computation for memory efficiency.],
    
    // Foundation models
    [GPT], [2018-2023], [Generative pre-trained transformer models for text generation.],
    [CLIP], [2021], [Contrastive language-image pre-training for multimodal understanding.],
    [PaLM], [2022], [Pathways Language Model demonstrating emergent capabilities at scale.],
  ),
  caption: "Summary of NLP techniques and models"
) <summary-of-nlp-methods>