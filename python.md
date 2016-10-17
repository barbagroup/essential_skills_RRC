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

We can access the different elements of a string, for example:

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

`NotImplemented` is used to indicate that a behavior is not defined or that the action we are trying to execute is impossible. For example, `NotImplemented` is used under the covers when you try to divide a string by a float. We will end up with a `TypeError`. (Try it on the shell)


*Important notes*:

* Variables names can be upper or lower letters, and we can put digits (0-9) and underscores. However, they can not start with a digit.

* There are reserved words you can't use and you can find them in this [link](https://docs.python.org/2.5/ref/keywords.html).

* Variables are mutable.

* Standard data types: Numerical, String, **List**, Tuple, Dictionaries. (list are the default in python)

* Numerical types: `int`, `long` (long integers), `float` and `complex`.




## Data structures

Lists, dictionaries and tuples are kinds of *Collections*

- A *collection* allows us to put many values in a a single "variable". 
- They are convenient because we can carry all many values around in one convenient package.
- Simple variables are not collections.

### Lists

* The beginning and end of a list is denoted by square brackets `[]` and it's elements separated by commas. 
* A list element can be any Python object, even another list.
* List are MUTABLE, strings are NOT MUTABLE. (Note: there is a method called replace for strings but it creates a copy)

```
In [33]: my_list = [2,50,4,61]
In [34]: print (my_list)
[2, 50, 4, 61]

In [35]: my_list[1] = 1

In [36]: print (my_list)
[2, 1, 4, 61]                 #Now we have a 1 instead of a 50 in the second place.
```

* `len()` function fives as the number of elements of the list.

* We can *concatenate* lists by using the operator `+`: 

```
In [37]: lst1 = [0,1,2,3]

In [38]: lst2 = ['a','b','c']

In [39]: conc = lst1 + lst2

In [40]: print(conc)
[0, 1, 2, 3, 'a', 'b', 'c']

```

* There are different methods to apply to a list (check them by typing `dir(lst1)`), an example is `append()`.

```
In [41]: lst1.append(4)

In [42]: print(lst1)
[0, 1, 2, 3, 4]

In [43]: lst1.append('five')

In [44]: lst1
Out[38]: [0, 1, 2, 3, 4, 'five']

In [45]: lst1.append([6,7,8])

In [46]: lst1
Out[46]: [0, 1, 2, 3, 4, 'five', [6, 7, 8]]
```
* Similar to strings we can access elements of a list by doing `list[i]` and also we can do slices.

```
In [47]: lst1[-1]
Out[47]: [6, 7, 8]

In [48]: lst1[6:]
Out[48]: [[], [6, 7, 8]]
```

* We can check if something is or not in a list.

```
In [49]: my_numbers = [3,17,27,19]

In [50]: 17 in my_numbers
Out[50]: True

In [51]: 2 in my_numbers
Out[51]: False

In [52]: 13 not in my_numbers
Out[52]: True
```
Note: This operators does NOT modify the list.

* A **list** is an ordered sequence. We can change the order by sorting a list. 
```
In [53]: names = ['Naty','Gil','Lorena','Chris']

In [54]: names.sort()

In [55]: print(names)
['Chris', 'Gil', 'Lorena', 'Naty']
```

* **Strings** and **lists**. The `split()` function.
```
In [56]: string = 'Just three words'

In [57]: str_list = string.split()

In [58]: print(str_list)
['Just', 'three', 'words']
```
Python takes care of long spaces, for example:
```
In [59]: line = 'A lot of       space'

In [60]: stuff = line.split()

In [61]: print(stuff)
['A', 'lot', 'of', 'space']
```
If we specify the delimiter (it can be a space `' '`, a `;`, a `:`, what ever you want).
```
In [62]: line = 'A lot of       space'

In [63]: stuff = line.split(' ')

In [64]: print(stuff)
['A', 'lot', 'of', '', '', '', '', '', '', 'space']
```
`;` and many other characters are not delimiters by default:

```
In [65]: s = 'a;b;c'

In [66]: thing  = s.split()

In [67]: print(thing)
a;b;c

In [68]: thing = s.split(';')

In [69]: print(thing)
['a', 'b', 'c']
```

### Dictionaries

* Dictionaries are also a type of collections and they are MUTABLE too. 

**Difference between lists and dictionaries:**

* List: a linear collection of values that stay in order.
* Dictionary: A "bag" of values, each with it's own label (key).
* Dictionaries don't maintain order, we index the the things we put in the dictionary with a "look up" tag. For example:

```
In [70]: bag = {}

In [71]: bag['money'] = 12

In [72]: bag['candy'] = 5 

In [73]: bag['tissues'] = 7 

In [74]: print(bag)
{'tissues': 7, 'money': 12, 'candy': 5}

In [75]: print(bag['money'])
12

In [76]: bag['money'] += 2

In [77]: print(bag)
{'tissues': 7, 'money': 14, 'candy': 5}

```

* We can use the operators `in` and `not in` to check if a key is or not in a dictionary.

```
In [78]: 'book' in bag
Out[78]: False

In [79]: 'candy' in bag
Out[79]: True

In [80]: 'cigarette' not in bag
Out[80]: True
```

* Retrieving keys and values.

```
In [90]: ages = {'John': 30, 'Maria': 28, 'Lucas': 23}

In [91]: print(ages.keys())
dict_keys(['Maria', 'Lucas', 'John'])

In [92]: print(ages.values())
dict_values([28, 23, 30])
```
*Note*: If we din't change the dictionary in between these operations, the keys and values correspond each other in order.

* We can get a list with pairs (key, value) by doing:
```
In [93]: print(ages.items())
dict_items([('Maria', 28), ('Lucas', 23), ('John', 30)])
```

* Dictionaries are good for counting how often do we "see" something. (**This can be an exercise after we show them for loops**)


There are other tow types of data structures tuples and sets, you can read about them in the python [documentation](https://docs.python.org/3/tutorial/datastructures.html#tuples-and-sequences). 

*A quick insight into them:*

* **Tuples** are like lists but they are IMMUTABLE, what saves time in accessing memory. (Syntax `(element1, element2, ...)`)
* **Sets** are collections that have no order, no duplicate elements and their elements are [hashable](https://docs.python.org/3/glossary.html#term-hashable) what saves time in accessing memory. We can do operation like union, intersection, difference, and symmetric difference. (Syntax `{element1, element2, ...}` and an empty set is created by doing `set()`)



## Control Flow

* Loops
* Conditionals

## Magics

`%hist -n`
`%edit`
`%run`




