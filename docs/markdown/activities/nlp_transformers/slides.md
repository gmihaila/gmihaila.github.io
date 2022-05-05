---
title: Natural Language Processing and Transformers
description: Text classification is a very common problem that needs solving when dealing with text data. We’ve all seen and know how to use Encoder Transformer models like Bert and RoBerta for text classification but did you know you can use a Decoder Transformer model like GPT2 for text classification? In this tutorial, I will walk you through on how to use GPT2 from HuggingFace for text classification.
theme: default
_class: lead
paginate: true
backgroundColor: #fff
backgroundImage: url('https://marp.app/assets/hero-background.jpg')
size: 5:4
footer: '2022 George Mihaila'
---

<style>
img[alt~="center"] {
  display: block;
  margin: 0 auto;
}
</style>

# <!-- fit --> Natural Language Processing and Transformers

<br/><br/>

**George Mihaila**

*PhD Candidate Computer Science*
*University of North Texas*

<br/>

---
# About me

- Research Scientist at Amazon.
- PhD Candidate Computer Science at University of North Texas.
- Over 5 years of experience in the field of Deep Learning, Machine Learning and Natural Language Processing (NLP).
- Over 3 years experience in industry as Machine Leaning Engineer, Data Scientist and Research Scientist.
- Technical reviewer for 2 NLP Transformers models books: `Transformers for Natural Language Processing` (`1st` & `2nd` edition).
- In my free time I like traveling, cooking and small projects like writing tutorials on NLP/Deep Learning.

---
# Agenda

* Intro
  * Understanding Natural Language Processing
  * Word embeddings
* The Transformer model
* BERT model
  * Architecture
  * Inner Workings
  * Embeddings
* Sentiment Analysis
* Conclusions
* Q&A

<br>


---

# Intro

## Wikipedia

**Natural language processing (NLP)** is a subfield of linguistics, computer science, and artificial intelligence **concerned with the interactions between computers and human language** ...

... The result is a computer capable of **"understanding"** the contents of documents, including the contextual nuances of the language within them.




---
# Understanding Natural Language Processing

---
# Understanding Natural Language Processing

```python
example = "I love cats! Cats are very funny."
```

---
# Understanding Natural Language Processing

```python
example = "I love cats! Cats are very funny."
```

```python
vocabulary = ['i', 'love', 'cats', 'are', 'funny']
```

---
# Understanding Natural Language Processing

```python
example = "I love cats! Cats are very funny."
```

```python
vocabulary = ['i', 'love', 'cats', 'are', 'funny']
```

```python
word_id = {'i': 0, 'love': 1, 'cats': 2, 'are': 3, 'funny': 4}
```

---
# Understanding Natural Language Processing

```python
example = "I love cats! Cats are very funny."
```

```python
vocabulary = ['i', 'love', 'cats', 'are', 'funny']
```

```python
word_id = {'i': 0, 'love': 1, 'cats': 2, 'are': 3, 'funny': 4}
```

Encode text into numbers.


---



# Word embeddings
---
![bg vertical right fit:30% 60%](word_ids.png)

# Word embeddings

- Use numbers to represent words:
  ```python
  'love' : 1
  'cats' : 2
  'funny': 4
  ```

---
![bg vertical right fit:30% 60%](word_ids.png)
![bg fit](word_vectors.png)

# Word embeddings
- Use numbers to represent words:
  ```python
  'love' : 1
  'cats' : 2
  'funny': 4
  ```

- User vectors instead of numbers

  ```python
  'love' : [0.90, 3.10]
  'cats' : [3.40, 3.20]
  'funny': [0.45, 1.88]
  ```

---
![bg vertical right fit:30% 60%](word_ids.png)
![bg fit](word_vectors.png)

# Word embeddings
- Use numbers to represent words:
  ```python
  'love' : 1
  'cats' : 2
  'funny': 4
  ```

- User vectors instead of numbers
  ```python
  'love' : [0.90, 3.10]
  'cats' : [3.40, 3.20]
  'funny': [0.45, 1.88]
  ```

- **Word embeddings** are a type of word **representation** that allows words with similar meaning to have a similar representation.


---
# The Transformer

* Is a **deep neural network architecture** for **transforming one sequence into another one** with the help of two parts (**Encoder** and **Decoder**).
* Was first introduced by Google in 2017 in the paper [Attention Is All You Need](https://arxiv.org/pdf/1706.03762.pdf).
* Is based solely on attention mechanisms.
* It brought ***"the biggest leap forward in the past five years, and one of the biggest leaps forward in the history of Search."*** for Google.

---
# The Transformer

- Is a **deep neural network architecture** for **transforming one sequence into another one** with the help of two parts (**Encoder** and **Decoder**).
* It can ***transform*** an article to a summary or translate english to another language, etc.

![bg vertical right fit](transformers.png)

---
# The Transformer

- Is based solely on attention mechanisms.

![bg vertical right fit](self_attention.png)

* **Disclaimer:**
  - I will not cover attention since this is not the intent of this presentation.
  - [The Illustrated Transformer](http://jalammar.github.io/illustrated-transformer/) by [Jay Alammar](http://jalammar.github.io) is great resource!

---
# BERT

## Wikipedia

* Bidirectional Encoder Representations from Transformers (BERT) is a transformer-based machine learning technique for natural language processing (NLP) pre-training developed by Google.
* BERT was created and published in 2018 by Jacob Devlin and his colleagues from Google. 
* In 2019, Google announced that it had begun leveraging BERT in its search engine, and by late 2020 it was using BERT in almost every English-language query. 
* A 2020 literature survey concluded that "in a little over a year, BERT has become a ubiquitous baseline in NLP experiments".


---
# Architecture

- We only have the encoder side of Transformer:

![](transformers.png)
![bg vertical right fit 60% 60%](transformers_encoder_model.png)



---
# Inner Workings

- [Detailed diagram](https://raw.githubusercontent.com/gmihaila/ml_things/master/notebooks/pytorch/bert_inner_workings/bert_inner_workings.png)


---
![bg vertical right fit 60% 60%](bert_input_sequence.png)
# BERT Embeddings

* `"I love cats"` is passed to the BERT model.
* Output word embeddings for each word in the **Word Sequence**.
* Special symbol word at the beginning of any **Word Sequence**.
* `[CLS]` used to represent meaning of the **Word Sequence**.
* Context specific embeddings.



---
# Movie Review Sentiment Analysis

* We will target a particular Natural Language Processing (NLP) problem -  Sentiment Analysis.

* IMDB movie reviews sentiment dataset:
  * This is a dataset for binary sentiment classification containing a set of 25,000 highly popular movie reviews for training, and 25,000 for testing.


---
![bg vertical right fit 60% 60%](moview_review_representaiton_using_bert.png)
# Sentiment Analysis with BERT Embeddings

* Took `2,000` random movie reviews from the **IMDB movie reviews sentiment dataset**.
* Compressed each of the `768` embeddings representation in `2` components using **PCA**.
* Plot each movie review:
  `orange` - **positive**
  `blue` - **negative**

---
# Sentiment Analysis with BERT Embeddings

![](moview_review_representaiton_using_bert.png)

---
# Sentiment Analysis with BERT Embeddings

![](moview_review_representaiton_using_bert_outlier.png)

---
# Sentiment Analysis with BERT Embeddings

![bg vertical right fit 60% 60%](moview_review_representaiton_using_bert_outlier.png)


`I could not agree less with the rating that was given to this movie, and I believe this is a sample of how short minded 
most of spectators are all over the world. Really... Are you forgetting that Cinema used to be a kind of art before...`

* BERT model had some trouble understanding this review ?!

---
# K-means with BERT embeddings

* Use K-means clustering with BERT embeddings.
* We know we have two sentiments - number of clusters 2.

* ![](kmeans_2_bert_embeddings.png)


---

![bg left-bottom fit 100% 100%](moview_review_representaiton_using_bert.png)

![bg right-bottom fit 100% 100%](kmeans_2_bert_embeddings.png)

---
# Fine-grained Sentiment Analysis

* Sentiment classifiers are used in binary classification (just positive or just negative sentiment).
* Fine-grained sentiment classification is a significantly more challenging task!
* Typical breakdown of fine-grained sentiment:
![](https://camo.githubusercontent.com/925adaa041274057eeec6b903761e0f70701e4cca8937e280e65935fd4d4db24/68747470733a2f2f6d69726f2e6d656469756d2e636f6d2f6d61782f3730352f312a7567386b7971556c6e7145756f334c6848664e7970672e706e67)


---
# K-means with BERT embeddings

* Use K-means clustering with BERT embeddings.
* Try to find 3 sentiments (positive, neutral, negative) - number of clusters 3.
* ![](kmeans_3_bert_embeddings.png)


---

![bg left-bottom fit 100% 100%](moview_review_representaiton_using_bert.png)

![bg right-bottom fit 100% 100%](kmeans_3_bert_embeddings.png)


---
# K-means with BERT embeddings

* Use K-means clustering with BERT embeddings.
* Try to find 5 sentiments (positive, weakly_positive, neutral, weakly_negative, negative) - number of clusters 5.
* ![](kmeans_5_bert_embeddings.png)


---

![bg left-bottom fit 100% 100%](moview_review_representaiton_using_bert.png)

![bg right-bottom fit 100% 100%](kmeans_5_bert_embeddings.png)

---
# Try it out yourself

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/gmihaila/ml_things/blob/master/notebooks/pytorch/bert_inner_workings.ipynb) &nbsp;
[![Generic badge](https://img.shields.io/badge/GitHub-Source-greensvg)](https://github.com/gmihaila/ml_things/blob/master/notebooks/pytorch/bert_inner_workings.ipynb)


---
# Conclusions

* I showed you:
  * What word embeddings are.
  * What are Transformers and BERT models.
  * How BERT embeddings work.
* We did some sentiment analysis on a movie review dataset and how to find more sentiments.


---
# Check out my Notebooks Tutorials


| Name 	| Description 	| Links 	|
|:- |:- |:- |
| **:grapes: Better Batches with PyTorchText BucketIterator** | *How to use PyTorchText BucketIterator to sort text data for better batching.* |[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/gmihaila/ml_things/blob/master/notebooks/pytorch/pytorchtext_bucketiterator.ipynb) [![Generic badge](https://img.shields.io/badge/GitHub-Source-greensvg)](https://github.com/gmihaila/ml_things/blob/master/notebooks/pytorch/pytorchtext_bucketiterator.ipynb) [![Generic badge](https://img.shields.io/badge/Download-Notebook-red.svg)](https://www.dropbox.com/s/7gyq6qup6y43z9b/pytorchtext_bucketiterator.ipynb?dl=1) [![Generic badge](https://img.shields.io/badge/Article-Medium-black.svg)](https://gmihaila.medium.com/better-batches-with-pytorchtext-bucketiterator-12804a545e2a) [![Generic badge](https://img.shields.io/badge/Blog-Post-blue.svg)](https://gmihaila.github.io/tutorial_notebooks/pytorchtext_bucketiterator/) |
| **:dog: Pretrain Transformers Models in PyTorch using Hugging Face Transformers** | *Pretrain 67 transformers models on your custom dataset.* |[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/gmihaila/ml_things/blob/master/notebooks/pytorch/pretrain_transformers_pytorch.ipynb) [![Generic badge](https://img.shields.io/badge/GitHub-Source-greensvg)](https://github.com/gmihaila/ml_things/blob/master/notebooks/pytorch/pretrain_transformers_pytorch.ipynb) [![Generic badge](https://img.shields.io/badge/Download-Notebook-red.svg)](https://www.dropbox.com/s/rkq79hwzhqa6x8k/pretrain_transformers_pytorch.ipynb?dl=1) [![Generic badge](https://img.shields.io/badge/Article-Medium-black.svg)](https://gmihaila.medium.com/pretrain-transformers-models-in-pytorch-using-transformers-ecaaec00fbaa) [![Generic badge](https://img.shields.io/badge/Blog-Post-blue.svg)](https://gmihaila.github.io/tutorial_notebooks/pretrain_transformers_pytorch/) |
| **:violin: Fine-tune Transformers in PyTorch using Hugging Face Transformers** | *Complete tutorial on how to fine-tune 73 transformer models for text classification — no code changes necessary!* |[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/gmihaila/ml_things/blob/master/notebooks/pytorch/finetune_transformers_pytorch.ipynb) [![Generic badge](https://img.shields.io/badge/GitHub-Source-greensvg)](https://github.com/gmihaila/ml_things/blob/master/notebooks/pytorch/finetune_transformers_pytorch.ipynb) [![Generic badge](https://img.shields.io/badge/Download-Notebook-red.svg)](https://www.dropbox.com/s/tsqicfqgt8v87ae/finetune_transformers_pytorch.ipynb?dl=1) [![Generic badge](https://img.shields.io/badge/Article-Medium-black.svg)](https://medium.com/@gmihaila/fine-tune-transformers-in-pytorch-using-transformers-57b40450635) [![Generic badge](https://img.shields.io/badge/Blog-Post-blue.svg)](https://gmihaila.github.io/tutorial_notebooks/finetune_transformers_pytorch/)|
| **⚙️ Bert Inner Workings in PyTorch using Hugging Face Transformers** | *Complete tutorial on how an input flows through Bert.* |[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/gmihaila/ml_things/blob/master/notebooks/pytorch/bert_inner_workings.ipynb) [![Generic badge](https://img.shields.io/badge/GitHub-Source-greensvg)](https://github.com/gmihaila/ml_things/blob/master/notebooks/pytorch/bert_inner_workings.ipynb) [![Generic badge](https://img.shields.io/badge/Download-Notebook-red.svg)](https://www.dropbox.com/s/jeftyo6cebfkma2/bert_inner_workings.ipynb?dl=1) [![Generic badge](https://img.shields.io/badge/Article-Medium-black.svg)](https://gmihaila.medium.com/%EF%B8%8F-bert-inner-workings-1c3054cd1591) [![Generic badge](https://img.shields.io/badge/Blog-Post-blue.svg)](https://gmihaila.github.io/tutorial_notebooks/bert_inner_workings/)|
| **🎱 GPT2 For Text Classification using Hugging Face 🤗 Transformers** | *Complete tutorial on how to use GPT2 for text classification.* |[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/gmihaila/ml_things/blob/master/notebooks/pytorch/gpt2_finetune_classification.ipynb) [![Generic badge](https://img.shields.io/badge/GitHub-Source-greensvg)](https://github.com/gmihaila/ml_things/blob/master/notebooks/pytorch/gpt2_finetune_classification.ipynb) [![Generic badge](https://img.shields.io/badge/Download-Notebook-red.svg)](https://www.dropbox.com/s/6t6kvlewoabwxqw/gpt2_finetune_classification.ipynb?dl=1) [![Generic badge](https://img.shields.io/badge/Article-Medium-black.svg)](https://gmihaila.medium.com/gpt2-for-text-classification-using-hugging-face-transformers-574555451832) [![Generic badge](https://img.shields.io/badge/Blog-Post-blue.svg)](https://gmihaila.github.io/tutorial_notebooks/gpt2_finetune_classification/)|

---
# Q&A

Thank you!

---
# Contact 🎣

Let's stay in touch!


🦊 GitHub: [gmihaila](https://github.com/gmihaila)

🌐 Website: [gmihaila.github.io](https://gmihaila.github.io/)

👔 LinkedIn: [mihailageorge](https://www.linkedin.com/in/mihailageorge/)

📓 Medium: [@gmihaila](https://gmihaila.medium.com)

📬 Email: [georgemihaila@my.unt.edu.com](mailto:georgemihaila@my.unt.edu.com?subject=GitHub%20Website)


---
# Resources

- [@gmihaila](https://gmihaila.medium.com)
- [Text Classification](https://monkeylearn.com/text-classification/)
- [What is a transformer](https://medium.com/inside-machine-learning/what-is-a-transformer-d07dd1fbec04)
- [Google's Search Engine biggest leap](https://whatsnewinpublishing.com/google-has-made-one-of-the-biggest-leaps-forward-in-the-history-of-search-what-it-means-for-publishers/)
- [Understand transformers](https://www.analyticsvidhya.com/blog/2019/06/understanding-transformers-nlp-state-of-the-art-models/)
