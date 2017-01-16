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

What if we add another test? Like one that checks for the product of 
perpendicular vectors. 

```python
def test_dot_perp():
    a=[0,1]
    b=[1,0]
    assert dot(a,b)==0
```

Again, we save our file, and in the terminal we run:

```text
$ pytest dot_product.py`
```

and the output now looks like this:

```text
============================= test session starts ==============================
platform linux -- Python 3.5.2, pytest-3.0.5, py-1.4.31, pluggy-0.4.0
rootdir: /home/naty/tmp/testing, inifile: 
plugins: xonsh-0.5.2
collected 2 items 

dot_product.py ..

=========================== 2 passed in 0.02 seconds ===========================
``` 

Do you notice the difference? Now, we collect 2 items (referring to both tests)
and we have two "." after `dot_product.py` that indicate two passed tests. 

So far our test are passing, but what else can we test, what if we force it to fail? Will our program work if we try to do the dot product of two vectors
with different length? Let's write a test and try it out. 

To do this we use the raise of errors that pytest provide, therefore we need to
`import pytest` at the beginning of our script and then we add our "length" 
tests (when `a` is longest than `b` and viceversa).

```python
def test_dot_a_lt_b():
    a = [1,2]
    b = [1,1,2]
    with pytest.raises(AssertionError):
        dot(a,b)

def test_dot_b_lt_a():
    a = [1,2,1]
    b = [1,1]
    with pytest.raises(AssertionError):
        dot(a,b)
```

We run it and we see:

```text
============================= test session starts ==============================
platform linux -- Python 3.5.2, pytest-3.0.5, py-1.4.31, pluggy-0.4.0
rootdir: /home/naty/tmp/testing, inifile: 
plugins: xonsh-0.5.2
collected 4 items 

dot_product.py ..FF

=================================== FAILURES ===================================
_______________________________ test_dot_a_lt_b ________________________________

    def test_dot_a_lt_b():
        a = [1,2]
        b = [1,1,2]
        with pytest.raises(AssertionError):
>           dot(a,b)
E           Failed: DID NOT RAISE <class 'AssertionError'>

dot_product.py:25: Failed
_______________________________ test_dot_b_lt_a ________________________________

    def test_dot_b_lt_a():
        a = [1,2,1]
        b = [1,1]
        with pytest.raises(AssertionError):
>           dot(a,b)

dot_product.py:31: 
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 

a = [1, 2, 1], b = [1, 1]

    def dot (a,b):
        res = 0
        for i in range(len(a)):
>           res += a[i] * b[i]
E           IndexError: list index out of range

dot_product.py:6: IndexError
====================== 2 failed, 2 passed in 0.10 seconds ======================
```

As we expected two of the tests failed. We can fix our function by inserting an
assertion that checks for same length. We add at the beginning of the function
that line. Your function should look like this:

```python
def dot (a,b):
    assert len(a)==len(b)  #This is the line we added
    res = 0
    for i in range(len(a)):
        res += a[i] * b[i]
    return res
```

Let's run the tests again and see what we get now. 

```text
============================= test session starts ==============================
platform linux -- Python 3.5.2, pytest-3.0.5, py-1.4.31, pluggy-0.4.0
rootdir: /home/naty/tmp/testing, inifile: 
plugins: xonsh-0.5.2
collected 4 items 

dot_product.py ....

=========================== 4 passed in 0.03 seconds ===========================
```

And they all pass! 

We can keep writing tests, and improving our function but maybe you have noticed that the first two tests are exactly the same, and last two too. Instead of 
writing them separately we can use some tools that pytest provide and our tests
will look cleaner. 

For the first case, where we want the result of the dot product to match an
expected value we will re-designed our test in the following way:

```python
@pytest.mark.parametrize("a,b,expected",[
    ([0,0],[0,0], 0), 
    ([0,1],[1,0],0),
    ([1,2],[2,-1],0),])

def test_assert_equal(a,b,expected):
    assert dot(a,b)==expected
```

In this case we have 3 cases `(a,b,expected)` in a list that will go over our 
test. After we run the tests in the terminal we'll see:  

```text
============================= test session starts ==============================
platform linux -- Python 3.5.2, pytest-3.0.5, py-1.4.31, pluggy-0.4.0
rootdir: /home/naty/tmp/testing, inifile: 
plugins: xonsh-0.5.2
collected 5 items 

dot_product.py .....

=========================== 5 passed in 0.02 seconds ===========================
```



  
   

