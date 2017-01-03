# Branching and merging

## Branching as a local fork

We have learned how to use forks and Pull Requests on GitHub in order to
collaborate with colleagues. The model of forking a personal copy of a repo,
making an individual change and then folding that change back into the original
(upstream) source is a very useful workflow. 

The fork and PR model is a version of `git`'s own branch-and-merge
functionality, in which commits can follow separate paths (called branches) and
then be brought back together.

## How commits work

What exactly is a commit? We've talked about them up to this point as snapshots
of a file or files at a particular moment. That's an accurate description, but
it's also worth examining how commits are related to one another. This will help
develop intuition about why `git` handles certain situations the way that it
does.

When we learned about navigating the UNIX filesystem, we explained the file
structure as an inverted tree, where each folder can see all of the files and
folders below it, but can't see anything above it.

![unix_filetree](../nix/figures/filetree.svg)

Commits have the exact opposite structure; the tree _isn't_ inverted, it's
right-side-up. If we think of the initial commit as the roots of the tree, each
commit can trace back to the initial commit via all of its ancestors, but has no
knowledge of any commits that come after it (its descendents).

```
$ cd git/wordcount
```
```
$ git status
```
```
  1 convert wordcount to function and add main function
On branch master
nothing to commit, working tree clean
```
```
$ git checkout -b make_function
```
```
Switched to a new branch 'make_function'
```
```
$ git status
```
```
On branch make_function
nothing to commit, working tree clean
```
```
$ ls
```
```
README.md  word_count.py
```

Edit word_count

```
$ git diff
```
```
diff --git a/word_count.py b/word_count.py
index 66135a8..5a05630 100644
--- a/word_count.py
+++ b/word_count.py
@@ -1,10 +1,17 @@
-happy = input("Enter a statement to word count: ")
+def wordcount(happy):
+    """
+    Splits the input string and performs a frequency word check
+    """
 
-words = happy.split()
+    words = happy.split()
 
-counts = {}
-for word in words:
-    counts[word] = counts.get(word, 0) + 1
+    counts = {}
+    for word in words:
+        counts[word] = counts.get(word, 0) + 1
 
-print("The word frequency of your statement is: ")
-print(counts)
+    print("The word frequency of your statement is: ")
+    print(counts)
+
+def main():
+    happy = input("Enter a statement to word count: ")
+    wordcount(happy)
```
```
$ git add word_count.py 
```
```
$ git commit 
```
```
[make_function 3196a4e] convert wordcount to function and add main function
 1 file changed, 14 insertions(+), 7 deletions(-)
```
```
$ cat word_count.py 
```
```
def wordcount(happy):
    """
    Splits the input string and performs a frequency word check
    """

    words = happy.split()

    counts = {}
    for word in words:
        counts[word] = counts.get(word, 0) + 1

    print("The word frequency of your statement is: ")
    print(counts)

  1 def wordcount(happy):
def main():
    happy = input("Enter a statement to word count: ")
    wordcount(happy)
```
```
$ git diff
```
```
$ git status
```
```
On branch make_function
nothing to commit, working tree clean
```
```
$ git checkout master
```
```
Switched to branch 'master'
```
```
$ git diff
```
```
$ git status
```
```
On branch master
nothing to commit, working tree clean
```
```
$ cat word_count.py 
```
```
happy = input("Enter a statement to word count: ")

words = happy.split()
  1 add call to main

counts = {}
for word in words:
    counts[word] = counts.get(word, 0) + 1

print("The word frequency of your statement is: ")
print(counts)
```
```
$ git branch
```
```
  make_function
* master
```
```
$ git checkout make_function 
```
```
Switched to branch 'make_function'
```
```
$ git branch
```
```
* make_function
  master
```
```
$ git status
```
```
On branch make_function
nothing to commit, working tree clean
```
```
$ python word_count.py 
```
edit to add call to main
```
$ python word_count.py 
```
```
Enter a statement to word count: oh now it is working that is a good thing
The word frequency of your statement is: 
{'thing': 1, 'a': 1, 'now': 1, 'working': 1, 'good': 1, 'oh': 1, 'it': 1, 'is': 2, 'that': 1}
```
```
$ git diff
```
```
diff --git a/word_count.py b/word_count.py
index 5a05630..e66dafd 100644
--- a/word_count.py
+++ b/word_count.py
@@ -15,3 +15,5 @@ def wordcount(happy):
 def main():
     happy = input("Enter a statement to word count: ")
     wordcount(happy)
+
+main()
```
```
$ git add word_count.py 
```
```
$ git commit
```
```
[make_function 1071b15] add call to main
 1 file changed, 2 insertions(+)
```
```
$ git log --oneline
```
```
1071b15 add call to main
3196a4e convert wordcount to function and add main function
3f62d8f Create README.md
de8fbc3 Add user-friendly print statement
09633c8 add helper text to input function
97fba8d allow user input of statement to word count
47f748f Add initial version of word count script
```
```
$ git checkout master
```
```
Switched to branch 'master'
```
```
$ git log --oneline
```
```
3f62d8f Create README.md
de8fbc3 Add user-friendly print statement
09633c8 add helper text to input function
97fba8d allow user input of statement to word count
47f748f Add initial version of word count script
```
```
$ git diff master make_function 
```
```
diff --git a/word_count.py b/word_count.py
index 66135a8..e66dafd 100644
--- a/word_count.py
+++ b/word_count.py
@@ -1,10 +1,19 @@
-happy = input("Enter a statement to word count: ")
+def wordcount(happy):
+    """
+    Splits the input string and performs a frequency word check
+    """
 
-words = happy.split()
+    words = happy.split()
 
-counts = {}
-for word in words:
-    counts[word] = counts.get(word, 0) + 1
+    counts = {}
+    for word in words:
+        counts[word] = counts.get(word, 0) + 1
 
-print("The word frequency of your statement is: ")
-print(counts)
+    print("The word frequency of your statement is: ")
+    print(counts)
+
+def main():
+    happy = input("Enter a statement to word count: ")
+    wordcount(happy)
+
+main()
```
```
$ git merge make_function 
```
```
Updating 3f62d8f..1071b15
Fast-forward
 word_count.py | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)
$ git log --oneline
1071b15 add call to main
3196a4e convert wordcount to function and add main function
3f62d8f Create README.md
de8fbc3 Add user-friendly print statement
09633c8 add helper text to input function
97fba8d allow user input of statement to word count
47f748f Add initial version of word count script
```
```
$ git branch
```
```
  make_function
* master
```
```
$ git branch -d make_function 
```
```
Deleted branch make_function (was 1071b15).
```
