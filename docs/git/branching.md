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

Slides

## When to branch?

A branch is a good idea if you want to try adding a big feature (for one
example). Making one small change might not require a whole branch (although you
_can_ still use a branch), but if you are going out on a limb and trying
something new out, a branch is an easy way to make a bunch of changes. If you
decide later that you don't want them, it's easy to get rid of them. If you want
to keep them, it's easy to merge them into your master branch.

```text
$ cd git/wordcount
```

Now check the status to make sure everything is clean.
```text
$ git status
```

```text
On branch master
nothing to commit, working tree clean
```

## `git branch`

`git status` tells us we're on the branch `master`, what other branches are
there? We can check using the `git branch` command:

```text
$ git branch
```

```
* master
```

There's only one branch at this point, called `master`. 

Let's create another branch. The easiest way to do this is using the `checkout`
command with the `-b` flag. If we use the `-b` flag, then we will create a new
branch and also switch to that branch. Let's try it:

```text
$ git checkout -b make_function
```

```text
Switched to a new branch 'make_function'
```

Ok, we switched to a new branch! Let's check `git branch` again:

```text
$ git branch
```

```
* make_function
  master
```

Now we have two branches and the `*` denotes which branch is active.

A quick `git status` shows us that the repo is clean and no changes have been
made.

```text
$ git status
```

```text
On branch make_function
nothing to commit, working tree clean
```

If we look at the contents of the folder, they also haven't changed.

```text
$ ls
```

```text
README.md  word_count.py
```

All we have done is change the name of the pointer tracking changes to the
repository. Let's make some changes.

Now let's check the diff

```text
$ git diff
```

```diff
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

That's a lot of changes, but I think it looks good. Let's commit it.

```text
$ git add word_count.py 
```

```text
$ git commit 
```

```text
[make_function 3196a4e] convert wordcount to function and add main function
 1 file changed, 14 insertions(+), 7 deletions(-)
```

After the changes, `word_count.py` should look like this:

```text
$ cat word_count.py 
```

```text
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

def main():
    happy = input("Enter a statement to word count: ")
    wordcount(happy)
```

Let's switch back to the `master` branch now.

```text
$ git checkout master
```

```text
Switched to branch 'master'
```

What's the status of `master`?

```text
$ git status
```

```text
On branch master
nothing to commit, working tree clean
```

All clean! What does `word_count.py` look like here?

```text
$ cat word_count.py 
```

```text
happy = input("Enter a statement to word count: ")

words = happy.split()
  1 add call to main

counts = {}
for word in words:
    counts[word] = counts.get(word, 0) + 1

print("The word frequency of your statement is: ")
print(counts)
```

It looks the same as it did before! We have added a commit on the
`make_function` branch, but `master` is separate from that so nothing has
changed here.

Ok, let's go back to the `make_function` branch. Since the branch already
exists, we don't need to use the `-b` flag.

```text
$ git checkout make_function 
```

```text
Switched to branch 'make_function'
```

And a quick `git branch` check to make sure we are where we thing we are:

```text
$ git branch
```

```
* make_function
  master
```

Ok. We should have checked before to make sure that the new version works. Let's
do that now.

```text
$ python word_count.py 
```

Oops. We defined `main` and `wordcount` but we forgot to call them!
Let's fix that and check that it works.

```text
$ python word_count.py 
```

```text
Enter a statement to word count: oh now it is working that is a good thing
The word frequency of your statement is: 
{'thing': 1, 'a': 1, 'now': 1, 'working': 1, 'good': 1, 'oh': 1, 'it': 1, 'is': 2, 'that': 1}
```

Better. 

```text
$ git diff
```

```diff
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

We just had to add the `main()` at the bottom of the script. Now let's commit
this change:

```text
$ git add word_count.py 
```

```text
$ git commit
```

```text
[make_function 1071b15] add call to main
 1 file changed, 2 insertions(+)
```

Now what does the log look like?

```text
$ git log --oneline
```

```text
1071b15 add call to main
3196a4e convert wordcount to function and add main function
3f62d8f Create README.md
de8fbc3 Add user-friendly print statement
09633c8 add helper text to input function
97fba8d allow user input of statement to word count
47f748f Add initial version of word count script
```

Ok, we added two extra commits on the `make_function` branch. 
What does the log look like on `master`? Let's check it out.

```text
$ git checkout master
```

```text
Switched to branch 'master'
```

```text
$ git log --oneline
```

```text
3f62d8f Create README.md
de8fbc3 Add user-friendly print statement
09633c8 add helper text to input function
97fba8d allow user input of statement to word count
47f748f Add initial version of word count script
```

Right, the `master` branch has the same log as before and doesn't have the two
commits that we added to the `make_function` branch.

## `diff` across branches

Up to now, we have used `git diff` to compare new changes to the most recent
commit, but you can also use `diff` to compare the state of two different
branches. Let's `diff` between `master` and `make_function`.

```text
$ git diff master make_function 
```

```diff
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

Cool!

## `git merge`

We have two branches and `make_function` has the new feature, which makes
`wordcount` a function. That's a better way to write scripts. Since the
`make_function` branch contains the feature that we want and we think that it's
ready to go, we can bring the contents of the `make_function` branch into the
`master` branch by using `git merge`.

To do a merge (locally), `git checkout` the branch you want to merge _INTO_.
Then type `git merge <branch>` where `<branch>` is the branch you want to merge
_FROM_.

We are on the `master` branch and want to merge in `make_function` so we do:

```text
$ git merge make_function 
```

```text
Updating 3f62d8f..1071b15
Fast-forward
 word_count.py | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)
```

Because the history of `master` and the history of `make_function` share common
ancestors and don't have any divergence descendents, we get a "fast-forward"
merge. That means that all of the changes we made in `make_function` look as if
they were made directly in `master`. 

Sometimes, you might want to force `git` to create a merge commit, so that you
know where a branch was merged in. In that case, you can prevent `git` from
doing a "fast-forward" by merging with the `-no-ff` flag.

(note that this command won't work now that we have _already_ merged in
`make_function`) 

``` 
$ git merge --no-ff make_function 
```

## Deleting your branch

Once you have merged your branch into `master` it doesn't really make sense to
keep it around. All of its information and history is now contained in `master`. 

Confirm first that you are on the `master` branch:

``` 
$ git branch 
``` 
``` 
make_function
* master
```

Confirmed. Now we can delete the `make_function` branch:

```text
$ git branch -d make_function 
```

```text
Deleted branch make_function (was 1071b15).
```

Note that if you use `git branch -d` it will only delete a branch if ALL of the
commits in that branch are also in `master`, so you won't accidentally lose any
of your commits.

## Pushing a branch to GitHub

You can also open Pull Requests between separate branches on GitHub. This often
presents a good way for collaborating with people who have access to the same
repository. You don't want to all be pushing to the `master` branch all the
time. Instead, each person can create their own branch, work separately, and
then open a pull request to merge that branch into `master.`

If you create a local branch in your repo, you can push it to GitHub as follows:

First, make sure that you are _on_ the branch that you want to push:

```text
$ git branch
```

```text
* make_function
master
```

Then run 

```text
$ git push -u origin <branch_name>
```

in this case

```text
$ git push -u origin make_function
```

to push the branch to GitHub.

## How do I know if I've already pushed a branch to GitHub?

If you have already done a `push -u`, then `git status` will contain an extra
line of output. For example:

```text
$ git status
```

```text
On branch make_function
Your branch is up-to-date with 'origin/make_function'.
nothing to commit, working tree clean
```

Note the additional line that "Your branch is up-to-date with
'origin/make_function'". If there is any mention of `origin/make_function` (or
whatever your branch name) then you have set up the branch on GitHub.

Of course, you can also just browse to your copy of the repo on GitHub and see
if the branch is there, but do whichever thing seems easiest to you.

