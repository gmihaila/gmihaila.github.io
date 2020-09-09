# **:computer: Useful Code**


:mag_right:  Here is where I put Python :snake: code snippets that I use in my Machine Learning :robot: research work. I'm using this page to have code easily accessible  and to be able to share it with others. 


:electric_plug: **Tip**: use **Table of contents** on the *top-right side of the page* to avoid endless scrolling, and is a good idea to use **Copy to clipboard** button on the *upper right corner of each code cell* to get things done quickly.

<br>


### **Read FIle**

One liner to read any file:

```python
io.open("my_file.txt", mode='w', encoding='utf-8').write("Your text!")
```
**Details:** `import io`


### **Write File**

One liner to write a string to a file:

```python
io.open("my_file.txt", mode='r', encoding='utf-8').read()
```
**Details:** `import io`


### **Debug**

Start debugging after this line: 
```python
import pdb; pdb.set_trace()
```
**Details:** use  `dir()` to see all current variables, `locals()` to see variables and their values and  `globals()` to see all global variables with values.


### **Pip Install GitHub**

Install library directly from GitHub using pip:
```bash
pip install git+github_url
```
**Details:** add `@version_number` at the end to use a certain version to install.


### **Parse Argument**
Parse arguments given when running a `.py` file.
```python
parser = argparse.ArgumentParser(description='Description')
parser.add_argument('--argument', help='Help me.', type=str)
# parse arguments
args = parser.parse_args()
```
**Details:** `import argparse` and use `python script.py --argument something` when running script.


### **Doctest**

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

### ** **

```python

```

### ** **

```python

```

### ** **

```python

```
### **Quick file handling**

**Sample:**

```python
import io

# Write to `my_file.txt`
io.open("my_file.txt", mode='w', encoding='utf-8').write("Hello!"))

# Read from `my_file.txt`
io.open("my_file.txt", mode='r', encoding='utf-8').read()

```
**Details:** [machine_learning_things/master/file_handling](https://github.com/gmihaila/machine_learning_things/tree/master/file_%20handling)


### **:construction: ... Workign to add more things ... :construction:**

### 

**Sample:**

```python

```

**Details:**[machine_learning_things/]()

<br>

## **Machine Learning :robot:**

### **:construction: ... Workign to add more things ... :construction:**

### 

**Sample:**

```python

```

**Details:**[machine_learning_things/]()

<br>
