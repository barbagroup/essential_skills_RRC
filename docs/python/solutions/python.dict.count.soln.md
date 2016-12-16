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

*Solution*

```
In [135]: happy = "I felt happy because I saw the others were happy and because I knew I should feel happy
    ...:  but I was not really happy"

In [136]: words = happy.split()

In [137]: counts = {}

In [138]: for word in words:
     ...:     if word not in counts:
     ...:         counts[word] = 1
     ...:     else:
     ...:         counts[word] += 1
     ...: 

In [139]: print(counts)
{'happy': 4, 'really': 1, 'and': 1, 'feel': 1, 'others': 1, 'felt': 1, 'not': 1, 'the': 1, 'should': 1, 'knew': 1, 'was': 1, 'saw': 1, 'I': 5, 'but': 1, 'were': 1, 'because': 2}

```
*Solution using `get()`*

```
In [140]: happy = "I felt happy because I saw the others were happy and because I knew I should feel happy
    ...:  but I was not really happy"

In [141]: words = happy.split()

In [142]: counts = {}
In [143]: for word in words:
     ...:     counts[word] = counts.get(word, 0) +1 
     ...:

In [144]: print(counts)
{'happy': 4, 'really': 1, 'and': 1, 'feel': 1, 'others': 1, 'felt': 1, 'not': 1, 'the': 1, 'should': 1, 'knew': 1, 'was': 1, 'saw': 1, 'I': 5, 'but': 1, 'were': 1, 'because': 2}

```
