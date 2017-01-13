# Intro to testing

Before starting with a quick introduction to testing, we want to make sure you
install `pytest`, the Python testing tool that we will use for writing our
tests. 

If you haven't installed `pytest`, you can do it using conda, open a terminal
and type:

```text
$ conda install pytest
```

Alright! Now we can start by writing some code and some tests for it. If you
want to read more about the documentation of `pytest` here is a [link](http://doc.pytest.org/en/latest/contents.html) where you can find all its 
documentation.

## Testing a dot_product function

First of all let's open a terminal and create a new file called
`my_dot_product.py`. If you are using `nano` type in a terminal:

```text
$ nano my_dot_product.py`
```

Now, we write our dot product function:

```python
def dot_product (a,b):
    res = 0
    for i in range(len(a)):
        res += a[i] * b[i]
    return res     
```

Right under our function we can add our first test. What can be a good test?
Let's try checking if the dot product of zero's vectors returns zero.

```python
def test_dot_zeros():
    a=[0,0]
    b=[0,0]
    assert dot(a,b)==0
```

We save our file, and in the terminal we run:

```text
$ pytest dot_product.py`
```
and you should see something like this:

```text
============================= test session starts ==============================
platform linux -- Python 3.5.2, pytest-3.0.5, py-1.4.31, pluggy-0.4.0
rootdir: /home/naty/tmp/testing, inifile: 
plugins: xonsh-0.5.2
collected 1 items 

dot_product.py .

=========================== 1 passed in 0.05 seconds ===========================
```




