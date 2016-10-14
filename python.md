# Python (IPython)

Python is a dynamic and high-level language that is easy to learn and it is fun to use. 

The classical Hello World program is as simple as:

`print("Hello World!!")`

Python itself is an **interpreter**, it translates Python *source code* into instructions that the computer can understand. It's a dynamic language (duck typing), i.e you don't need a type to invoke an existing method on an object. 

*"If it looks like a duck, swims like a duck, and quacks like a duck, then it probably is a duck."*

If you come from  different languages you probably code by doing scripts, with python we can do the same but we have other tools that allows as to work interactively. 

Let's work with one of these tools (Ipython).

Type in a terminal :

`ipython`

## Python is awesome! 

```
import this 
import antigravity
```

## Variable assignment, types and  duck typing

In Python is perfectly legal to do:

```
In [1]: x = 3
```
Try:

```
In [2]: x
Out[2]: 3
```

```
In [3]: print(x)
3
```

```
In [4]: type(x)
Out[4]: int
```


```
In [5]: float(x)
Out[5]: 3.0
```

```
In [6]: complex(x)
Out[6]: (3+0j)
```

```
In [7]: z = complex(x)
In [8]: z = z + 1j
In [9]: print(z)
Out[9]: (3+1j)
```

Regular arithmetic symbols are preserved except for the "power".

For example power to 2 would be:

`x**2`

### What about strings?

```
In [9]: y = "hello"

In [10]: y
Out[10]: 'hello'

In [11]: print(y)
hello

In [12]: type(y)
Out[12]: str

In [13]: s = "world"
```

What if we try to "sum" strings? 

```
In [14]: my_string = y+s

In [15]: print(my_string)
helloworld
```
Let's add a space in between:

```
In [16]: my_string = y +' '+ s

In [17]: print(my_string)
hello world
```

We can access the diferent elements of a string, for example:

```
In [18]: my_string[0]
Out[18]: 'h'

In [19]: my_string[8]
Out[19]: 'r'

In [20]: my_string[-1]
Out[20]: 'd'

In [21]: my_string[2:5]
Out[21]: 'llo'

In [22]: my_string[2:]
Out[22]: 'llo world'

In [23]: my_string[1:-1]
Out[23]: 'ello worl'
```

Strings has different methods that we can applied to them, for example:

Make all uppercase:

```
In [24]: my_string.upper()
Out[24]: 'HELLO WORLD'
```
Find where a character is or start:

```
In [25]: my_string.find('hello')
Out[25]: 0

In [26]: my_string.find('l')
Out[26]: 2
```

If you want to know all what you can do to a certain object, there is a magic command that will give you that information:

`dir(my_string)`



### Special variables

Python has a special type of variables that are built into the language: namely `True`, `False`, `None` and `NotImplemented`. 

**Boolean variables**

`True` and `False`.

In general, if the value is zero or empty, the it's converted to `False`. Otherwise, it'll be converted to `True`. 


```
In [27]: bool(0)
Out[27]: False

In [28]: bool("Do we need oxygen?")
Out[28]: True
```

It also applies to logic statements, for example:

```
In [28]: x=3
In [29]: y=5
In [30]: z=x>y

In [31]: z
Out[31]: False

In [32]: type(z)
Out[32]: bool

```


**None is not Zero**

It is used to indicate that no value was given or behaviour was defined. This is different than zero, an empty string, or some other nil value.


**NotImplemented is not None**

`NotImplemented` is used to indicate that a behaviour is not defined or that the action we are trying to execute is impossible. For example, `NotImplemented` is used under the covers when you try to devide a string by a float. We will end up with a `TypeError`. (Try it on the shell)


*Important notes*:

* Variables names can be upper or lower letters, and we can put digits (0-9) and underscores. However, they can not start with a digit.

* There are reserved words you can't use and you can find them in this [link](https://docs.python.org/2.5/ref/keywords.html).

* Variables are mutable.

* Standard data types: Numerical, String, **List**, Tuple, Dictionaries. (list are the default in python)

* Numerical types: `int`, `long` (long integers), `float` and `complex`.




## Data structures

Lists, dictionaries and tuples are kinds of *Collections*

- A *collection* allows us to put many values ina a single "variable". 
- They are convinient because we can carry all many values around in one convinient package.
- Simple variables are not collections.

### Lists


### Dictionaries



## Control Flow

* Loops
* Conditionals

## Magics

`%hist -n`
`%edit`
`%run`
