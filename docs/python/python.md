# Python (IPython)

Python is a dynamic and high-level language that is easy to learn and fun to use. 

The classic Hello World program is as simple as:

`print("Hello World!!")`

Python itself is an **interpreter**, it translates Python *source code* into
instructions that the computer can understand. It's a dynamic language (duck
typing), i.e you don't need a type to invoke an existing method on an object.

*"If it looks like a duck, swims like a duck, and quacks like a duck, then it
probably is a duck."*

If you come from different languages you probably code by doing scripts, with
Python we can do the same but we have other tools that allows us to work
interactively.

Let's work with one of these tools (IPython).

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
(3+1j)
```

Regular arithmetic symbols are preserved except for the "power" operator.

For example, raising `x` to the power of 2 would be:

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
** Note that the start index is inclusive and the end one is exclusive!!**

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

Strings have different methods that we can apply to them, for example:

Make all uppercase:

```
In [28]: my_string.upper()
Out[28]: 'HELLO WORLD'
```
Find where a character is or starts:

```
In [29]: my_string.find('hello')
Out[29]: 0

In [30]: my_string.find('l')
Out[30]: 2
```

If you want to know all of the available methods for a certain object, there is
a simple command that will give you that information:

`dir(my_string)`



### Special variables

Python has special variables that are built into the language: namely `True`,
`False`, `None` and `NotImplemented`.

**Boolean variables**

`True` and `False`.

In general, if the value is zero or empty, then it's converted to `False`.
Otherwise, it'll be converted to `True`.


```
In [31]: bool(0)
Out[31]: False

In [32]: bool("Do we need oxygen?")
Out[32]: True
```

It also applies to logic statements, for example:

```
In [33]: x = 3
In [34]: y = 5
In [35]: z = x > y

In [36]: z
Out[36]: False

In [37]: type(z)
Out[37]: bool

```

**None is not Zero**

It is used to indicate that no value was given or that the behavior was
undefined. This is different than zero, an empty string, or some other nil
value.


**NotImplemented is not None**

`NotImplemented` is used to indicate that a behavior is not defined or that the
action we are trying to execute is impossible. For example, `NotImplemented` is
used under the covers when you try to divide a string by a float. We will end up
with a `TypeError`. (Try it on the shell)


*Important notes*:

* Variables names can be upper- or lower-case letters, and we can put digits
  (0-9) and underscores. However, they can not start with a digit.

* There are reserved words you can't use and you can find them in
  this [link](https://docs.python.org/3/reference/lexical_analysis.html#keywords)

* Variables are mutable.

* Standard data types: Numerical, String, **List**, Tuple, Dictionaries. (list
  are the default in Python)

* Numerical types: `int`, `long` (long integers), `float` and `complex`.




## Data structures

Lists, dictionaries and tuples are kinds of *Collections*

- A *collection* allows us to put many values in a single "variable".
- They are convenient because we can carry many values around in one
  convenient package.
- Simple variables are not collections.

### Lists

* The beginning and end of a list is denoted by square brackets `[]` and its
  elements are separated by commas.
* A list element can be any Python object, even another list.
* List are MUTABLE, strings are NOT MUTABLE. (Note: there is a method called
  replace for strings but it creates a copy)

```
In [38]: my_list = [2, 50, 4, 61]
In [39]: print(my_list)
[2, 50, 4, 61]

In [40]: my_list[1] = 1

In [41]: print(my_list)
[2, 1, 4, 61]                 #Now we have a 1 instead of a 50 in the second place.
```

* `len()` function gives us the number of elements in the list.

* We can *concatenate* lists by using the operator `+`: 

```
In [42]: lst1 = [0,1,2,3]

In [43]: lst2 = ['a','b','c']

In [44]: conc = lst1 + lst2

In [45]: print(conc)
[0, 1, 2, 3, 'a', 'b', 'c']

```

* There are different methods to apply to a list (check them by typing
  `dir(lst1)`), an example is `append()`.

```
In [46]: lst1.append(4)

In [47]: print(lst1)
[0, 1, 2, 3, 4]

In [48]: lst1.append('five')

In [49]: lst1
Out[49]: [0, 1, 2, 3, 4, 'five']

In [50]: lst1.append([6, 7, 8])

In [51]: lst1
Out[51]: [0, 1, 2, 3, 4, 'five', [6, 7, 8]]
```
* Similar to strings we can access elements of a list by doing `list[i]` and
  also we can do slices.

```
In [52]: lst1[-1]
Out[52]: [6, 7, 8]

In [53]: lst1[5:]
Out[53]: ['five', [6, 7, 8]]
```

* We can check if something is or not in a list.

```
In [54]: my_numbers = [3, 17, 27, 19]

In [55]: 17 in my_numbers
Out[55]: True

In [56]: 2 in my_numbers
Out[56]: False

In [57]: 13 not in my_numbers
Out[57]: True
```
Note: This operators does NOT modify the list.

* A **list** is an ordered sequence. We can change the order by sorting the list. 
```
In [58]: names = ['Naty', 'Gil', 'Lorena', 'Chris']

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
If we specify the delimiter (it can be a space `' '`, a `;`, a `:`, whatever you want).
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
* Dictionaries don't maintain order, we index the the things we put in the
  dictionary with a "look up" tag. For example:

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

* We can use the operators `in` and `not in` to check if a key is or not in a
  dictionary.

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

*Note*: If we don't change the dictionary in between these operations, the keys
and values are displayed in order.

* We can get a list with pairs (key, value) by doing:
```
In [89]: print(ages.items())
dict_items([('Maria', 28), ('Lucas', 23), ('John', 30)])
```

* Dictionaries are good for counting how often we "see" something. 

There are another two built in data structures: tuples and sets. You can read
about them in the
Python
[documentation](https://docs.python.org/3/tutorial/datastructures.html#tuples-and-sequences).

*A quick insight into them:*

* **Tuples** are like lists but they are IMMUTABLE, which saves time in
  accessing memory. (Syntax `(element1, element2, ...)`)
* **Sets** are collections that have no order, no duplicate elements and their
  elements are [hashable](https://docs.python.org/3/glossary.html#term-hashable)
  which saves time when accessing memory. We can do operations like union,
  intersection, difference, and symmetric difference. (Syntax `{element1,
  element2, ...}` and an empty set is created by doing `set()`)


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

### Conditionals

The syntax is "If `x` true, then do something; otherwise, do something else."

**If** statement on its own:

```
In [97]: a = 8

In [98]: b = 3 

In [99]: if a > b :
    ...:     print('a is bigger than b')
    ...:
a is bigger than b
```

**If-else** statement: 
```
In [100]: x = float(input('Insert your number: '))
Insert your number: 711457

In [101]: if x % 17 == 0:
     ...:     print('Your number is a multiple of 17.')
     ...: else :
     ...:     print('Your number is not a multiple of 17.')

Your number is not a multiple of 17.
```

**If-elif-else** statement:

```
In [102]: a = 3

In [103]: b = 5

In [104]: if a > b:
     ...:     print('a is bigger than b.')
     ...: elif a < b:
     ...:     print('a is smaller than b.')
     ...: else:
     ...:     print('a is equal to b.')
     ...:
a is smaller than b.
```
*Note:* We can have as many `elif` as we want.


### Loops

Loops are useful for executing the same block multiple times. In Python we have
multiple looping formats: `while` loops, `for` loops, and comprehensions.

**While loops**

They are related to an `if` statement, they will compute **while** a condition is true.

```
In [105]: sec = 5
In [106]: while 0 < sec :
     ...:     print('You have {} seconds'.format(sec))
     ...:     sec -= 1
     ...: print('Boom!!!')
    ...:
You have 5 seconds
You have 4 seconds
You have 3 seconds
You have 2 seconds
You have 1 seconds
Boom!!!
```
*Note:* You have to be careful to not generate an infinite loop. 

**For loops**
It is usually more useful to iterate over a certain group of things or an "iterable".

```
In [107]: for i in range(5,0,-1):
    ...:     print('You have {} seconds'.format(i))
    ...: print('Boom!!!')
    ...: 
You have 5 seconds
You have 4 seconds
You have 3 seconds
You have 2 seconds
You have 1 seconds
Boom!!!
```

Another example:
```
In [108]: name = input('Insert your name: ')
Insert your name: Naty

In [109]: name
Out[109]: 'Naty'

In [110]: count = 1

In [111]: for letter in name:
    ...:     print('The {} letter is {}'.format(count,letter))
    ...:     count +=1
    ...:
The 1 letter is N
The 2 letter is a
The 3 letter is t
The 4 letter is y
```
We can loop over dictionaries too:

```
In [112]: d = {"name":"Lionel", "last_name": "Messi", "birthday": [6, 24, 1987]}

In [113]: for item in d.items():
     ...:     print(item)
     ...:
('birthday', [6, 24, 1987])
('name', 'Lionel')
('last_name', 'Messi')

In [114]: for key, value in d.items():
     ...:     print(key, value)
     ...:
birthday [6, 24, 1987]
name Lionel
last_name Messi
```

**Comprehensions**

`for` and `while` loops are really useful but they take at least "two lines",
and if you need to save the result of each loop in the iteration in a list, set,
etc. This takes at least "three lines". Thankfully, Python is so great that in
some cases we can reduce these cases to just ONE line! Let's see this with an
example:

*Normal loop:*

```
In [114]: fruits = ['apple', 'orange', 'grape', 'banana', 'pineapple', 'strawberry', 'watermelon']

In [115]: upper_fruits = []

In [116]: for fruit in fruits:
    ...:     upper_fruits.append(fruit.upper())

In [117]: upper_fruits
Out[117]: ['APPLE', 'ORANGE', 'GRAPE', 'BANANA', 'PINEAPPLE', 'STRAWBERRY', 'WATERMELON']
```

*Pythonic way:*

```
In [118]: upper_pythonic = [fruit.upper() for fruit in fruits]

In [119]: upper_pythonic
Out[119]: ['APPLE', 'ORANGE', 'GRAPE', 'BANANA', 'PINEAPPLE', 'STRAWBERRY', 'WATERMELON']
```

We can add a filter, for example:

```
In [120]: entries = [2, 11, 49, 3, 57, 33, 9]

In [121]: entries
Out[121]: [2, 11, 49, 3, 57, 33, 9]

In [122]: some = [x**2 for x in entries if x%3==0]

In [123]: some
Out[123]: [9, 3249, 1089, 81]

In [124]: orig = [int(x**(1/2)) for x in some]

In [125]: orig
Out[125]: [3, 57, 33, 9]
```

## IPython Magics

Sometimes when we are working on IPython we would like to select certain lines
and save them into a Python script. We can do that!

We can check the history of what we've done in the current session of IPython by
typing:

`%hist -n`

If we want to select certain lines and put them into a script, the command
`%edit` allow us to do this. Let's suppose we want lines 1, 3 and from 5-10; 
then we should do:

`%edit 1 3 5-10`

and this will open the default editor with the lines we want. 

Once we have that script saved if we want to run it we can use the command
`%run`:

`%run my_script.py`

## Exercises

**Slicing** 

1- Write code using `find()` and string slicing to extract the number at the end
of the line below. Convert the extracted value to a floating point number and
print it out. (Content taken from online course "Python Data Structures" by Dr.
Charles Severance)

```
text = "X-DSPAM-Confidence:    0.8475"
```

[*Solution*](./solutions/python.slicing.soln.md)

**Slicing and for loop** 

2- Write a code that grabs, from each word, all the letters except 'ball' at the
end of each one. Save the output in a list and print it out.

The original list is:

```
sports = ['Football', 'Volleyball', 'Basketball', 'Baseball', 'Handball', 'Softball']
```

And your output should look like:

```
['Foot', 'Volley', 'Basket', 'Base', 'Hand', 'Soft']
```

[*Solution*](./solutions/python.ball.soln.md)

**Dictionaries for counting**

3- Write a code that counts the frequency of each word that we have in the
phrase provided.

Tips: split the text and put the words in a list, use a dictionary to count the
repetitions.

(The idea of the following two exercises was inspired by content from the online
course "Python Data Structures" by Dr. Charles Severance)


```
happy = "I felt happy because I saw the others were happy and because I knew I should feel happy but I was not really happy"
```

Your output should look like:

```
{'happy': 4, 'really': 1, 'and': 1, 'feel': 1, 'others': 1, 'felt': 1, 'not': 1, 'the': 1, 'should': 1, 'knew': 1, 'was': 1, 'saw': 1, 'I': 5, 'but': 1, 'were': 1, 'because': 2}
```

Remember that dictionaries don't preserve order, therefore the items in your
output might be in a different order. However, you can still check if your
output is equal to the one we provide by doing a logical comparison using the
`==` operation, which should return `True` if you get it right.

**Optional**: Rewrite exercise 3 using the method `get()`. 

[*Solutions*](./solutions/python.dict.count.soln.md)

