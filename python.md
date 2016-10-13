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
In [5]: complex(x)
Out[5]: (3+0j)
```

```
In [6]: z = complex(x)
In [7]: z = z + 1j
In [8]: print(z)
Out[8]: (3+1j)
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


## Data structures

* Lists
* Dicts

## Control Flow

* Loops
* Conditionals

## Magics

`%hist -n`
`%edit`
`%run`
