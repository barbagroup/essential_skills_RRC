**Slicing** 

1- Write code using find() and string slicing to extract the number at the end of the line below. Convert the extracted value to
a floating point number and print it out. (Content took from online course "Python Data Structures" by Dr. Charles Severance)

```
text = "X-DSPAM-Confidence:    0.8475"
```

*Solution:*

```
In [126]: text = "X-DSPAM-Confidence:    0.8475"

In [127]: pos0 = text.find(':')  #They can also look for '0' but this is more problem dependent.
In [128]: str_num = text[pos0+1:]

In [129]: num_float = float(str_num)

In [130]: print(num_float)
0.8475
```
