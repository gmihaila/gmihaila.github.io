# **:computer: Useful Code**


:mag_right:  Here is where I put Python :snake: code snippets that I use in my Machine Learning :robot: research work. I'm using this page to have code easily accessible  and to be able to share it with others. 


:electric_plug: **Tip**: use **Table of contents** on the *top-right side of the page* to avoid endless scrolling, and is a good idea to use **Copy to clipboard** button on the *upper right corner of each code cell* to get things done quickly.

<br>


## **Read FIle**

One liner to read any file:

```python
io.open("my_file.txt", mode='r', encoding='utf-8').read()
```
**Details:** `import io`


## **Write File**

One liner to write a string to a file:

```python
io.open("my_file.txt", mode='w', encoding='utf-8').write("Your text!")
```
**Details:** `import io`


## **Debug**

Start debugging after this line: 
```python
import pdb; pdb.set_trace()
```
**Details:** use  `dir()` to see all current variables, `locals()` to see variables and their values and  `globals()` to see all global variables with values.


## **Pip Install GitHub**

Install library directly from GitHub using pip:
```bash
pip install git+github_url
```
**Details:** add `@version_number` at the end to use a certain version to install.


## **Parse Argument**
Parse arguments given when running a `.py` file.
```python
parser = argparse.ArgumentParser(description='Description')
parser.add_argument('--argument', help='Help me.', type=str)
# parse arguments
args = parser.parse_args()
```
**Details:** `import argparse` and use `python script.py --argument something` when running script.


## **Doctest**

How to run a simple unittesc using function documentaiton. Useful when need to do unittest inside notebook:
```python
# function to test
def add(a, b):
'''
>>> add(2, 2)
5
'''
return a + b
# run doctest
import doctest
doctest.testmod(verbose=True)
```
**Details:** [ml_things]()

## **PyTorch Device**

How to setup `device` in PyTorch to detect if GPU is available. If there is no GPU available it will default to CPU.

```python
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
```

## **Fix Text**

I use this package everytime I read text data from a source I don't trust. Since text data is always messy, I always use it. It is great in fixing any bad Unicode.

```python
fix_text(text="Text to be fixed")
```
**Details:** Install it `pip install ftfy` and import it `from ftfy import fix_text`.

## **Current Date**

How to get current date in Python. I use this when need to name log files:
```python
from datetime import date

today = date.today()

# dd/mm/YY in string format
today.strftime("%d/%m/%Y")
```
**Details:** More details [here](https://www.programiz.com/python-programming/datetime/current-datetime)


## **Current Time**

Get current time in Python:

```python
from datetime import datetime

# datetime object containing current date and time
now = datetime.now()

# dd/mm/YY H:M:S
now.strftime("%d/%m/%Y %H:%M:%S")
```
**Details:** More details [here](https://www.programiz.com/python-programming/datetime/current-datetime)


## **PyTorch Dataset**

Code sample on how to create a PyTorch Dataset. The `__len__(self)` function needs to return the number of examples in your dataset and `_getitem__(self,item)` will use the index `item` to select an example from your dataset:

```python
from torch.utils.data import Dataset, DataLoader

class PyTorchDataset(Dataset):
  """PyTorch Dataset.
  """

  def __init__(self,):
    return

  def __len__(self):
    return 

  def __getitem__(self, item):
    return

# create pytorch dataset
pytorch_dataset = PyTorchDataset()
# move pytorch dataset into dataloader
pytorch_dataloader = DataLoader(pytorch_dataset, batch_size=32, shuffle=True)
```
**Details:** Find more details [here](https://pytorch.org/tutorials/beginner/data_loading_tutorial.html)


<br>
