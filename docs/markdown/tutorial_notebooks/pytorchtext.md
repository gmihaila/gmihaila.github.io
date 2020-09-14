#  PyTorchText


[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/gmihaila/ml_things/blob/master/notebooks/pytorch/pytorchtext.ipynb)
[![Generic badge](https://img.shields.io/badge/GitHub-Source-greensvg)](https://github.com/gmihaila/ml_things/blob/master/notebooks/pytorch/pytorchtext.ipynb)
[![Generic badge](https://img.shields.io/badge/Download-Notebook-red.svg)](https://www.dropbox.com/s/bzsg91p4nx8ldsf/pytorchtext.ipynb?dl=1)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)



## Example on how to batch text sequences with **BucketIterator**

This notebook is an example of using **pytorchtext** powerful **BucketIterator** function which allows grouping examples of similar lengths to provide the most optimal batching method.

The batching problem provides a lot of gain for recurrent models (RNN, GRU, LSTM) and transformers models (bert, roBerta, gpt2, xlnet, etc.). Basically any model that can deal with variable input batches.

I will not train any model in this notebook. There are other notebooks where I use this batching method to train models.

The purpose is to use an example datasets and batch it using **torchtext** with **BucketIterator** and show how it groups text sequences of similar length in batches.

<br>

## How to use this notebook? 

I am using the [Large Movie Review Dataset v1.0](http://ai.stanford.edu/~amaas/data/sentiment/) dataset which contains **positive sentiments** and **negative sentiments** of movie review. This dataset requires using *Supervised Training* with *Binary Classification*.

The code is made with reusability in mind. It can be easily adapted for other text datasets and other NLP tasks. 

Comments should provide enough guidance to easily adapt this notebook to your needs.

This code is designed mostly for **classification tasks** in mind, but it can be adapted for **dialogue generation tasks**.

<br>

**Notes:**
 * This notebooks is a code adaptation of a few sources I foudn online: [torchtext_translation_tutorial](https://pytorch.org/tutorials/beginner/torchtext_translation_tutorial.html), [pytorch/text - GitHub](https://github.com/pytorch/text), [torchtext documentation](https://torchtext.readthedocs.io/en/latest/index.html#) and [A Comprehensive Introduction to Torchtext](https://mlexplained.com/2018/02/08/a-comprehensive-tutorial-to-torchtext/).

<br>

## Downloads

Download the IMDB Movie Reviews sentiment dataset and unzip it locally.

**Code Cell:**
```shell
# download the dataset
!wget -q -nc http://ai.stanford.edu/~amaas/data/sentiment/aclImdb_v1.tar.gz
# unzip it
!tar -zxf /content/aclImdb_v1.tar.gz
```
**Output:**
```shell
```

<br>

## Installs

I will use [ftfy](https://ftfy.readthedocs.io/en/latest/) to fix any bad Unicode there might be in the text data files. 

Since we don't know for sure of anything is wrong with the text files its safer to run all text through ftfy.

**Code Cell:**
```shell
# install ftfy to fix any text encoding issues
!pip install -q ftfy
```
**Output:**
```shell
|████████████████████████████████| 71kB 1.9MB/s 
 Building wheel for ftfy (setup.py) ... done
```

<br>

## Imports

Import python all needed python packages. 

**Code Cell:**
```python
import io
import os
from tqdm.notebook import tqdm
from ftfy import fix_text
from torchtext import data
```
**Output:**
```shell
```

<br>

## Helper Functions

I've created the **file_tsv** function in order to concatenate all text files into a single `.tsv` file.

Since I'll use the **TabularDataset** from `pytorch.data` I need to pass tabular format file. 

For text data I find the Tab Separated Values format easier to deal with - don't need to import pandas for this.

**Code Cell:**
```python
def file_tsv(partition_path, save_path='./'):
"""Parse each file in partition and keep track of sentiments.
Create a list of paris [tag, text]
"""

# list of all examples in format [tag, text]
examples = []
print(partition_path)
# for each sentiment
for sentiment in tqdm(['pos', 'neg']):
  # find path for sentiment
  sentiment_path = os.path.join(partition_path, sentiment)
  # get all files from path sentiment
  files_names = os.listdir(sentiment_path)
  # for each file in path sentiment
  for file_name in files_names:
    # get file content
    file_content = io.open(os.path.join(sentiment_path, file_name), mode='r', encoding='utf-8').read()
    # fix any format errors
    file_content = fix_text(file_content)
    # append sentiment and file content
    examples.append([sentiment, file_content])
# create a TSV file with same format `sentiment  text`
examples = ["%s\t%s"%(example[0], example[1]) for example in examples]
# create file name
tsv_filename = os.path.basename(partition_path) + '_pos_neg_%d.tsv'%len(examples)
# write to file
io.open(os.path.join(save_path, tsv_filename), mode='w', encoding='utf-8').write('\n'.join(examples))

return tsv_filename
```
**Output:**
```shell
```


<br>

## Convert data to `.tsv`

I will call the **file_tsv** function for each of the two partitions **train** and **test**. 

The function will return the path where the `.tsv` file is saved so we can use it later in pytorchtext.

**Code Cell:**
```python
# path where to save tsv file
data_path = '/content'

# convert train files to tsv file 
train_filename = file_tsv(partition_path='/content/aclImdb/train', save_path=data_path)

# convert test files to tsv file
test_filename = file_tsv(partition_path='/content/aclImdb/test', save_path=data_path)
```
**Output:**
```shell
/content/aclImdb/train
100% |████████████████████████████████| 2/2 [00:39<00:00, 19.80s/it]

/content/aclImdb/test
100% |████████████████████████████████| 2/2 [00:19<00:00, 9.97s/it]
```

<br>

## PyTorchText Setup

Here I will setup the dataset to be processed by PyTrochText. I will try to add as many useful comments as possible to make the code very easy to adapt to other projects.

### Setup data fields

Here I setup data fields for PyTorchText. We have to tell the library how to handle each column of the `.tsv` file. For this we need to create `data.Field` objects for each column.

The tokenizer for text column is a simple split on white-space tokenizer. Depending on the project, it can be changed to any tokenizer. It needs to take as input text and output a list.

The label tokenizer is not actually a tokenizer. It just encodes the **pos**into **1** and **neg** into **0**.

Since we have two `.tsv` files it's great that we can use the `.split` function from **TabularDataset** to handle two files at the same time one for train and the other one for test.

Find more details about **torchtext.data** functionality [here](https://torchtext.readthedocs.io/en/latest/data.html#dataset-batch-and-example).

**Code Cell:**
```python
# text tokenizer function - simple white-space split
text_tokenizer = lambda x : x.split()
# label tokenizer - encode labels to int 0:negative and 1:positive
label_tokenizer = lambda x: 0 if x=='neg' else 1

# data fiels for text column - invoke tokenizer
TEXT = data.Field(sequential=True, tokenize=text_tokenizer, lower=False)
# data field for labels - invoke tokenize label encoder
LABEL = data.Field(sequential=True, tokenize=label_tokenizer, use_vocab=False)

# create data fields at tuples of description variable and data fiels
datafields = [("label", LABEL),
              ("text", TEXT)]

# since we have have tab separated data we use TabularDataset
train_split, test_split = data.TabularDataset.splits(
                                                path=data_path, # path to data
                                                train=train_filename, 
                                                validation=test_filename,
                                                format='tsv',
                                                skip_header=False, # important
                                                fields=datafields)
```
**Output:**
```shell
```

<br>

### Bucket Iterator

Here is where the magic happens! We pass in the **train_split** and **test_split** TabularDatasets splits into **BucketIterator** to create the actual batches.

It's very nice that pytorchtext can handle splits! We need to tell the BucketIterator the batch size for both our splits.

The **sort_key** parameter is very important. It is used to order text sequences in batches. Since we want to batch sequence of text with similar length, we will use a simple function that returns the length of our text (`len(x.text)`).

It is important to keep `sort=False` and `sort_with_batch=True` to sort the batches only and not the whole dataset.

Find more details in the pytorchtext **BucketIterator** documentation [here](https://torchtext.readthedocs.io/en/latest/data.html#bucketiterator) - look at the **BPTTIterator** because it has same parameters except the **bptt_len** argument.

**Code Cell:**
```python
# batch size used for train
train_batch_size = 10

# batch size used for test
test_batch_size = 20

# bucket similar length text sequences together to create batches
train_iterator, val_iterator = data.BucketIterator.splits(
    (train_split, test_split), # datasets for iterator to draw data from
    batch_sizes=(train_batch_size, test_batch_size),
    device='cpu', # if we want to load batches on specific device
    sort_key=lambda x: len(x.text), # what function should use to group batches
    repeat=True, # repeat the iterator for multiple epochs(DON'T TRUST)
    sort=False, # avoid sorting all data using sort_key
    shuffle=True, # if data needs to be shuffled each time batches are created
    sort_within_batch=True # only sort each batch using sort_key (better to use)
    )
```
**Output:**
```shell
```

<br>

### Sample batch

Now let's see how a batch looks like!

The print format is: `label sequence_length  tokenized_text`.

We see the labels as **0** and **1** values along with the length of tokens for that text sequence and along with the list of tokens from that sequence.

It looks like the lengths of sequences for this batches are very close together! This actually works!

**Note:**
I would call `.create_batches()` after each epoch. The `repeat=True` in **BucketIterator** should allow more epochs to run but I don't trust it!

**Code Cell:**
```python
# create batches - needs to be called after each epoch
train_iterator.create_batches()

# loop through each batch
for batch in train_iterator.batches:
  print(len(batch))

  # print each example
  for example in batch:
    print(example.label, len(example.text), example.text)
  print('\n')
  
  break
```
**Output:**
```shell
10
0 212 ['Sometimes', 'a', 'premise'...
1 212 ["I've", 'loved', 'all', 'of...
0 213 ['Apparently', 'most', 'view...
0 214 ['This', 'movie', 'had', 'th...
1 215 ['This', 'is', 'the', 'Neil'...
0 215 ['Hanna-Barbera', 'sucks', '...
...
```

<br>

## Train Loop Example

Now let's print a list of lengths of each sequence in a batch, to see if the **BucketIterator** works as promised.

We can see how nicely examples of similar length are grouped together by length in a single batch.

After each epoch, new batches of similar length are generated when `shuffle=True`.

It looks like we have setup everything we need to train a model!

**Code Cell:**
```python
# example of number of epochs
epochs = 1

# loop through each epoch
for epoch in range(epochs):
  # create batches - needs to be called after each epoch
  train_iterator.create_batches()

  # get each batch
  for batch in train_iterator.batches:
    # put all example.text of batch in single array
    batch_text = [example.text for example in batch]
    # put all example.label of batch in single array
    batch_label = [example.label for example in batch]
    # get maximum sequence length in batch - used for padding
    max_sequence_len = max([len(text) for text in batch_text])

    # CODE HERE TO FEED BATCHES TO MODEL
    
    print([len(text) for text in batch_text])
```
**Output:**
```shell
[200, 200, 200, 201, 201, 203, 203, 203, 203, 203]
[127, 127, 127, 127, 127, 127, 128, 128, 128, 128]
[213, 214, 214, 214, 216, 216, 216, 216, 217, 217]
[238, 238, 239, 240, 240, 241, 241, 241, 241, 241]
[197, 197, 198, 198, 198, 198, 199, 199, 200, 200]
[354, 355, 355, 357, 359, 360, 360, 360, 360, 361]
[251, 252, 256, 257, 258, 259, 260, 260, 260, 260]
[148, 148, 148, 148, 148, 148, 149, 149, 149, 149]
[122, 122, 122, 122, 123, 123, 123, 123, 123, 123]
[223, 223, 226, 227, 227, 228, 228, 229, 229, 229]
[89, 89, 90, 91, 92, 93, 94, 94, 94, 94]
[131, 131, 132, 132, 132, 132, 132, 133, 133, 133]
...
```
