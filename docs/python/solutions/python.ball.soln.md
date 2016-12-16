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

*Solution*:
```
In [131]: sports = ['Football', 'Volleyball', 'Basketball', 'Baseball', 'Handball', 'Softball']

In [132]: random = []

In [133]: for sport in sports:
     ...:     word = sport[:-4]
     ...:     random.append(word)
     ...:

In [134]: print(random)
['Foot', 'Volley', 'Basket', 'Base', 'Hand', 'Soft']

```
