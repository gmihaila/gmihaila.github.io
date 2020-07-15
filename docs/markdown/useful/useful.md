# **:computer: Useful Code**

This is where I will put frequently used code of machine learning and python.

:mag_right: **Disclaimer:** These are things I find useful for me in my day to day work with python and machine learning. These materials are not designed to be in any kind of specific order. I will try to order them by the frquency that I use some of them.

:electric_plug: **Use:**

* **Table of contents** on the top-right side of the page to be snapy.
* **Copy to clipboard** button on the upper right coerner of each code cell.

<br>

## **Python :snake:**

### **argparse**

**Sample:**

```python
import argparse

# create arguments
parser = argparse.ArgumentParser(description='Details')
parser.add_argument('--some_argument', help='Description', type=str, default='value')

# parse arguments
args = parser.parse_args()
[print("--%s %s" % (arg, value)) for arg, value in args.__dict__.items()]

```

:arrow_right: [machine_learning_things/master/arguments](https://github.com/gmihaila/machine_learning_things/tree/master/arguments)

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
