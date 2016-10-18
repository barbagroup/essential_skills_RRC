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

We can access the different elements of a string and slices of it, for example:

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

Slices also allow us to pick specific elements from specific slices, for example:

```
In [24]: my_string[::2]
Out[24]: 'hlowrd'

In [25]: my_string[1:-1:2]
Out[25]: 'el ol'

In [26]: my_string[2::3]
Out[26]: 'l r'

In [27]: my_string[::-1]
Out[27]: 'dlrow olleh'

```


Strings has different methods that we can applied to them, for example:

Make all uppercase:

```
In [28]: my_string.upper()
Out[28]: 'HELLO WORLD'
```
Find where a character is or start:

```
In [29]: my_string.find('hello')
Out[29]: 0

In [30]: my_string.find('l')
Out[30]: 2
```

If you want to know all what you can do to a certain object, there is a magic command that will give you that information:

`dir(my_string)`



### Special variables

Python has a special type of variables that are built into the language: namely `True`, `False`, `None` and `NotImplemented`. 

**Boolean variables**

`True` and `False`.

In general, if the value is zero or empty, the it's converted to `False`. Otherwise, it'll be converted to `True`. 


```
In [31]: bool(0)
Out[31]: False

In [32]: bool("Do we need oxygen?")
Out[32]: True
```

It also applies to logic statements, for example:

```
In [33]: x=3
In [34]: y=5
In [35]: z=x>y

In [36]: z
Out[36]: False

In [37]: type(z)
Out[37]: bool

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
In [38]: my_list = [2,50,4,61]
In [39]: print (my_list)
[2, 50, 4, 61]

In [40]: my_list[1] = 1

In [41]: print (my_list)
[2, 1, 4, 61]                 #Now we have a 1 instead of a 50 in the second place.
```

* `len()` function fives as the number of elements of the list.

* We can *concatenate* lists by using the operator `+`: 

```
In [42]: lst1 = [0,1,2,3]

In [43]: lst2 = ['a','b','c']

In [44]: conc = lst1 + lst2

In [45]: print(conc)
[0, 1, 2, 3, 'a', 'b', 'c']

```

* There are different methods to apply to a list (check them by typing `dir(lst1)`), an example is `append()`.

```
In [46]: lst1.append(4)

In [47]: print(lst1)
[0, 1, 2, 3, 4]

In [48]: lst1.append('five')

In [49]: lst1
Out[49]: [0, 1, 2, 3, 4, 'five']

In [50]: lst1.append([6,7,8])

In [51]: lst1
Out[51]: [0, 1, 2, 3, 4, 'five', [6, 7, 8]]
```
* Similar to strings we can access elements of a list by doing `list[i]` and also we can do slices.

```
In [52]: lst1[-1]
Out[52]: [6, 7, 8]

In [53]: lst1[6:]
Out[53]: [[], [6, 7, 8]]
```

* We can check if something is or not in a list.

```
In [54]: my_numbers = [3,17,27,19]

In [55]: 17 in my_numbers
Out[55]: True

In [56]: 2 in my_numbers
Out[56]: False

In [57]: 13 not in my_numbers
Out[57]: True
```
Note: This operators does NOT modify the list.

* A **list** is an ordered sequence. We can change the order by sorting a list. 
```
In [58]: names = ['Naty','Gil','Lorena','Chris']

In [59]: names.sort()

In [60]: print(names)
['Chris', 'Gil', 'Lorena', 'Naty']
```

* **Strings** and **lists**. The `split()` function.
```
In [61]: string = 'Just three words'

In [62]: str_list = string.split()

In [63]: print(str_list)
['Just', 'three', 'words']
```
Python takes care of long spaces, for example:
```
In [64]: line = 'A lot of       space'

In [65]: stuff = line.split()

In [66]: print(stuff)
['A', 'lot', 'of', 'space']
```
If we specify the delimiter (it can be a space `' '`, a `;`, a `:`, what ever you want).
```
In [67]: line = 'A lot of       space'

In [68]: stuff = line.split(' ')

In [69]: print(stuff)
['A', 'lot', 'of', '', '', '', '', '', '', 'space']
```
`;` and many other characters are not delimiters by default:

```
In [70]: s = 'a;b;c'

In [71]: thing  = s.split()

In [72]: print(thing)
a;b;c

In [73]: thing = s.split(';')

In [74]: print(thing)
['a', 'b', 'c']
```

### Dictionaries

* Dictionaries are also a type of collections and they are MUTABLE too. 

**Difference between lists and dictionaries:**

* List: a linear collection of values that stay in order.
* Dictionary: A "bag" of values, each with it's own label (key).
* Dictionaries don't maintain order, we index the the things we put in the dictionary with a "look up" tag. For example:

```
In [75]: bag = {}

In [76]: bag['money'] = 12

In [77]: bag['candy'] = 5 

In [78]: bag['tissues'] = 7 

In [79]: print(bag)
{'tissues': 7, 'money': 12, 'candy': 5}

In [80]: print(bag['money'])
12

In [81]: bag['money'] += 2

In [82]: print(bag)
{'tissues': 7, 'money': 14, 'candy': 5}

```

* We can use the operators `in` and `not in` to check if a key is or not in a dictionary.

```
In [83]: 'book' in bag
Out[83]: False

In [84]: 'candy' in bag
Out[84]: True

In [85]: 'cigarette' not in bag
Out[85]: True
```

* Retrieving keys and values.

```
In [86]: ages = {'John': 30, 'Maria': 28, 'Lucas': 23}

In [87]: print(ages.keys())
dict_keys(['Maria', 'Lucas', 'John'])

In [88]: print(ages.values())
dict_values([28, 23, 30])
```
*Note*: If we din't change the dictionary in between these operations, the keys and values correspond each other in order.

* We can get a list with pairs (key, value) by doing:
```
In [89]: print(ages.items())
dict_items([('Maria', 28), ('Lucas', 23), ('John', 30)])
```

* Dictionaries are good for counting how often do we "see" something. (**This can be an exercise after we show them for loops**)


There are other tow types of data structures tuples and sets, you can read about them in the python [documentation](https://docs.python.org/3/tutorial/datastructures.html#tuples-and-sequences). 

*A quick insight into them:*

* **Tuples** are like lists but they are IMMUTABLE, what saves time in accessing memory. (Syntax `(element1, element2, ...)`)
* **Sets** are collections that have no order, no duplicate elements and their elements are [hashable](https://docs.python.org/3/glossary.html#term-hashable) what saves time in accessing memory. We can do operation like union, intersection, difference, and symmetric difference. (Syntax `{element1, element2, ...}` and an empty set is created by doing `set()`)


** Example: look for an element in a list and in a set (%timeit)**

```
In [90]: rg = range(50000)

In [91]: lst = list(rg)

In [92]: %time (40035 in lst)
CPU times: user 4 ms, sys: 0 ns, total: 4 ms
Wall time: 1.91 ms
Out[92]: True

In [93]: st = set(rg)

In [94]: %time (40035 in st)
CPU times: user 0 ns, sys: 0 ns, total: 0 ns
Wall time: 14.3 µs
Out[94]: True

In [95]: %time (51000 in lst)
CPU times: user 4 ms, sys: 0 ns, total: 4 ms
Wall time: 2.36 ms
Out[95]: False

In [96]: %time (51000 in st)
CPU times: user 0 ns, sys: 0 ns, total: 0 ns
Wall time: 12.9 µs
Out[96]: False
```


## Control Flow

* Loops
* Conditionals

## Magics

`%hist -n`
`%edit`
`%run`




