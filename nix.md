# First Commands

Not in order

`ls`, `cp`, `mv`, `cat`, `rm`, `rmdir`, `echo`, `touch`, `head`, `tail`,
`whoami`, `pwd`, `cd`

# Pipes

Introduce `wc`, `uniq`, `sort`, `less`, `grep`, `xargs`

# Editor

Use `nano` (probably) or `exofrills`

# Use SC style lesson plan

Exercises / challenges that involve downloading an existing data set and then
searching for something (be it NaNs or whatever)

# uber example

Download and unzip file from here: 

Should have folder `uber-trip-data`.  `cd` to that directory and take a look.

```console
$ cd uber-trip-data/
```

```console
$ ls
```

```console
taxi-zone-lookup.csv     uber-raw-data-janjune-15.csv.zip  uber-raw-data-may14.csv
uber-raw-data-apr14.csv  uber-raw-data-jul14.csv           uber-raw-data-sep14.csv
uber-raw-data-aug14.csv  uber-raw-data-jun14.csv
```

We have several raw data files (so named). `csv` files divided by month and also
a zip file. We'll leave the zip file alone for the moment. What questions can we
answer about this dataset from the command line?

First, it would help to know what these files contain. We can use `head` to
display the first ten lines of one of the raw files.

```console
$ head uber-raw-data-apr14.csv
```

```console
"Date/Time","Lat","Lon","Base"
"4/1/2014 0:11:00",40.769,-73.9549,"B02512"
"4/1/2014 0:17:00",40.7267,-74.0345,"B02512"
"4/1/2014 0:21:00",40.7316,-73.9873,"B02512"
"4/1/2014 0:28:00",40.7588,-73.9776,"B02512"
"4/1/2014 0:33:00",40.7594,-73.9722,"B02512"
"4/1/2014 0:33:00",40.7383,-74.0403,"B02512"
"4/1/2014 0:39:00",40.7223,-73.9887,"B02512"
"4/1/2014 0:45:00",40.762,-73.979,"B02512"
"4/1/2014 0:55:00",40.7524,-73.996,"B02512"
```

They weren't kidding when they said "raw" data. What do we have here? Looks like
a date and time (these are pickup times), the lat-long of the pickup location
and some "Base" id that we don't care about right now.

What can we take away from this?

For one, that the number of lines in this file is how many pickups Uber made
during the month of April, 2014. That sounds like interesting information. We
can use `wc` or `wordcount` to count the number of _lines_ in a file by using
the `-l` flag.

```console
$ wc -l uber-raw-data-apr14.csv
```

```console
564517 uber-raw-data-apr14.csv
```

We know now that Uber provided more than half a million rides in New York City
in April of 2014. Let's take a look at how that figure changes month-to-month!

We can run the same `wc` command but now use the `*` wildcard to get the
linecount of every file in the directory.


```console
$ wc -l *
```

```console
        0 taxi-zone-lookup.csv
   564517 uber-raw-data-apr14.csv
   829276 uber-raw-data-aug14.csv
   284595 uber-raw-data-janjune-15.csv.zip
   796122 uber-raw-data-jul14.csv
   663845 uber-raw-data-jun14.csv
   652436 uber-raw-data-may14.csv
  1028137 uber-raw-data-sep14.csv
  4818928 total
```

Cool, but the linecount of a zip file doesn't really make any sense. To be a
little more specific, restrict `wc` to only look at `csv` files.

```console
$ wc -l *.csv
```

```console
        0 taxi-zone-lookup.csv
   564517 uber-raw-data-apr14.csv
   829276 uber-raw-data-aug14.csv
   796122 uber-raw-data-jul14.csv
   663845 uber-raw-data-jun14.csv
   652436 uber-raw-data-may14.csv
  1028137 uber-raw-data-sep14.csv
  4534333 total
```

Better. `wc` outputs files in the order it gets them, which in this case is the
order they exist in the directory. And that's alphabetical order. The names of
months aren't hugely useful when sorting alphabetically.

Let's use the `sort` command to sort the results from `wc`. We can pipe the
output of `wc` to `sort` using the `|` character. Remember, the pipe takes the
output from the previous command and hands it off to the following command.

```console
$ wc -l *.csv | sort
```

```console
        0 taxi-zone-lookup.csv
  1028137 uber-raw-data-sep14.csv
  4534333 total
   564517 uber-raw-data-apr14.csv
   652436 uber-raw-data-may14.csv
   663845 uber-raw-data-jun14.csv
   796122 uber-raw-data-jul14.csv
   829276 uber-raw-data-aug14.csv
```

Hmmm.  That looks a little funny.  Can you see what `sort` did?

Yeah, it sorted things alphanumerically, which isn't helpful since it only looks
at leading digits. We want to use the number of lines in each file as the
sorting criteria.

To do this, we can use the `-n` flag with `sort` to specify a "numerical" sort.

This may start to look a little confusing, but remember, we're just building up
a command using smaller commands. We use the `-l` flag with `wc` to count the
number of lines, then pipe that output to `sort` where we use the `-n` flag to
require numerical sorting.

```console
$ wc -l *.csv | sort -n
```

```console
        0 taxi-zone-lookup.csv
   564517 uber-raw-data-apr14.csv
   652436 uber-raw-data-may14.csv
   663845 uber-raw-data-jun14.csv
   796122 uber-raw-data-jul14.csv
   829276 uber-raw-data-aug14.csv
  1028137 uber-raw-data-sep14.csv
  4534333 total
```

Ok! Now we have the raw data files sorted by number of lines, which we know is
equivalent to number of rides. And look, now the months are in the correct
order. That wasn't necessarily expected, but looking at this output we can see
that Uber is expanding at a pretty fast pace in 2014; they nearly doubled their
usage numbers in 5 months!

This data set is missing the last quarter of 2014, but we have the first half of
2015 available, so we can check if the trend continues (is there a ceiling for
Uber requests in NYC?)

First, unzip the file containing the 2015 data.

```console
$ unzip uber-raw-data-janjune-15.csv.zip
```

```console
Archive:  uber-raw-data-janjune-15.csv.zip
  inflating: uber-raw-data-janjune-15.csv  
   creating: __MACOSX/
  inflating: __MACOSX/._uber-raw-data-janjune-15.csv  
```

Now we know that whoever created this zip file uses a Mac. But that's not really
important. Let's take another look at the line counts.

```console
$ wc -l *.csv | sort -n
```

```console
        0 taxi-zone-lookup.csv
   564517 uber-raw-data-apr14.csv
   652436 uber-raw-data-may14.csv
   663845 uber-raw-data-jun14.csv
   796122 uber-raw-data-jul14.csv
   829276 uber-raw-data-aug14.csv
  1028137 uber-raw-data-sep14.csv
 14270480 uber-raw-data-janjune-15.csv
 18804813 total
```

Wow! 14+ million rides! Impressive! But this data layout is different from the
2014 data. The six months are all in the same file. Not cool. So what now? 

First, let's see what the data looks like in the combined file.

```console
$ head uber-raw-data-janjune-15.csv
```

```console
Dispatching_base_num,Pickup_date,Affiliated_base_num,locationID
B02617,2015-05-17 09:47:00,B02617,141
B02617,2015-05-17 09:47:00,B02617,65
B02617,2015-05-17 09:47:00,B02617,100
B02617,2015-05-17 09:47:00,B02774,80
B02617,2015-05-17 09:47:00,B02617,90
B02617,2015-05-17 09:47:00,B02617,228
B02617,2015-05-17 09:47:00,B02617,7
B02617,2015-05-17 09:47:00,B02764,74
B02617,2015-05-17 09:47:00,B02617,249
```

Very uncool. First, the data is in a different format than the previous files we
looked at. Worse, the first pickup listed is in May? Either the file is
mislabeled (bad) or it isn't even sorted (bad).

Let's look at a few more lines to see if we can figure out which bad scenario we
have. 

We can use `tail` to peek at the _last_ 10 lines in the file. How do those look?


```console
$ tail uber-raw-data-janjune-15.csv
```

```console
B02765,2015-05-08 15:42:00,B02764,79
B02765,2015-05-08 15:42:00,B02765,37
B02765,2015-05-08 15:42:00,B02765,161
B02765,2015-05-08 15:42:00,B02765,7
B02765,2015-05-08 15:43:00,B02711,25
B02765,2015-05-08 15:43:00,B02765,186
B02765,2015-05-08 15:43:00,B02765,263
B02765,2015-05-08 15:43:00,B02765,90
B02765,2015-05-08 15:44:00,B01899,45
B02765,2015-05-08 15:44:00,B02682,144
```

Not looking good.  Is this all just in May?  Let's look through a larger number of lines using `head` and see if we can find a ride that wasn't in May.  Use the `-n` flag with `head` to specify the number of lines to show (the default is 10).

```console
$ head -n 500 uber-raw-data-janjune-15.csv
```

```console
[snip]
B02598,2015-01-18 11:06:58,B02598,7
B02598,2015-01-18 18:55:46,B02598,141
B02598,2015-01-18 14:54:28,B02598,249
B02598,2015-01-18 20:48:57,B02598,90
B02598,2015-01-18 09:28:20,B02682,234
B02598,2015-01-18 19:31:14,B02764,13
B02598,2015-01-18 14:13:38,B02598,163
B02598,2015-01-18 22:53:57,B02598,90
B02598,2015-01-18 19:13:00,B02617,246
B02598,2015-01-18 14:53:36,B02598,161
B02598,2015-01-18 02:37:00,B02598,114
B02598,2015-01-18 18:47:01,B02598,113
B02598,2015-01-18 16:06:11,B02598,233
B02598,2015-01-18 15:36:12,B02598,162
B02598,2015-01-18 02:10:39,B02598,50
B02598,2015-01-18 12:18:57,B02764,142
B02598,2015-01-18 14:03:01,B02598,37
```

Ok. 500 lines in, we can see some January pickups. It looks like we have bad
option #2. The data is labeled correctly but isn't sorted. Time to sort it!

Sorting can be expensive, so rather than trying to sort the whole file at once,
let's copy a portion of the big file into a separate file. 

Use the same `head` command we just used, but now, instead of writing it to the
screen, we can _redirect_ that output to another file using `>`. We'll just call
that file `test.csv`.

```console
$ head -n 500 uber-raw-data-janjune-15.csv > test.csv
```


```console
$ man sort
```


```console
$ cat test.csv | sort -t "," -k2 | less
```


```console
$ cat test.csv | sort -t "," -k2 > test_sort.csv
```


```console
$ head test_sort.csv 
```


```console
B02598,2015-01-18 00:02:54,,144

B02598,2015-01-18 00:05:05,B02598,50

B02598,2015-01-18 00:06:19,B02598,107

B02598,2015-01-18 00:08:14,B02598,142

B02598,2015-01-18 00:16:58,B02598,107

B02598,2015-01-18 00:30:59,B02598,50

B02598,2015-01-18 00:36:16,B02598,211

B02598,2015-01-18 00:37:16,B02774,141

B02598,2015-01-18 00:45:16,,48

B02598,2015-01-18 00:47:08,B02617,68

```

```console
$ $XONSH_STORE_STDOUT=False
```


```console
$ history file
```


```console
$ exit
```
