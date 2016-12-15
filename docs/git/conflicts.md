# Conflicts

The last section went over one scenario where two different changesets are
brought together. `git` used the 'recursive' strategy to smash the changes
together and we got something called a 'merge commit' (again, more on this
later).

`git` was able to merge the two histories together because they were mostly
independent. One change was to the script `word_count.py`, the other was
creating a file called `README.md`. Not much overlap there. What about if there
are changes made to the same file in two places?

Time to find out!


## Edit on GitHub

Edit the file `word_count.py` using GitHub's online editor and change the first line of the script to read: 

```python
happy = input("Enter a statement to check word frequency: ")
```

Commit your changes on GitHub. 

## Edit locally

Using `nano`, edit `word_count.py` and change the first line of the script to read:

```python
happy = input("Enter a phrase to word count:")
```

Commit your changes to this file locally. 


We now have changes made to the same file in two different places. What happens
if we `push`?

```diff
$ git push
```
```diff
To github.com:gforsyth/wordcount.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'git@github.com:gforsyth/wordcount.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details
```

The same thing as before -- if there are changes on a remote you have to `pull`
them in before you can `push`.


```diff
$ git pull
```
```diff
remote: Counting objects: 3, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), done.
From github.com:gforsyth/wordcount
   2f53c34..a717ad5  master     -> origin/master
Auto-merging word_count.py
CONFLICT (content): Merge conflict in word_count.py
Automatic merge failed; fix conflicts and then commit the result.
```

Ahh, that's different... 

`git` is very clever, but if you make changes to the same line in two different
places, how can `git` know which change should take precedence? In this case, it
needs human input to decide how to proceed.

We're in uncharted waters, what should we do? 

When in doubt, `git status`.

```diff
$ git status
```
```diff
On branch master
Your branch and 'origin/master' have diverged,
and have 1 and 1 different commits each, respectively.
  (use "git pull" to merge the remote branch into yours)
You have unmerged paths.
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)

Unmerged paths:
  (use "git add <file>..." to mark resolution)

	both modified:   word_count.py

no changes added to commit (use "git add" and/or "git commit -a")
```

`status` tells us that the two repositories have diverged. And we have to fix
the conflicts and then run `git commit`.

How do we know what the conflicts are?

## Resolving conflicts

`git status` told us that the file `word_count.py` is the trouble maker. Let's
look at it.

```diff
$ cat word_count.py 
```
```bash
<<<<<<< HEAD
happy = input("Enter a phrase to word count: ")
=======
happy = input("Enter a statement to check word frequency: ")
>>>>>>> a717ad59e716184700199769a1f17b2f92874167

words = happy.split()

counts = {}
for word in words:
    counts[word] = counts.get(word, 0) + 1

print("The word frequency of your statement is: ")
print(counts)
```

Because `git` didn't know how to fix the conflict, it has highlighted the
problem area for us by surrounding it with chevrons. 

The two versions of the same line are separated by the `=`s

There are also labels telling us where each version is from: `HEAD` refers to
the local repository, the commit hash is the commit we made on GitHub.

To resolve the conflict, open the file in `nano` and edit it to combine the two
versions of the `input` statement in whatever way you think is best. Make sure
to remove all of the chevrons and the equal signs when you are done.

We ended up with this:

```diff
$ cat word_count.py 
happy = input("Enter a phrase to check word frequency: ")

words = happy.split()

counts = {}
for word in words:
    counts[word] = counts.get(word, 0) + 1

print("The word frequency of your statement is: ")
print(counts)
```

Now that we have manually resolved the conflict, what do we do? 
`git status` told us, let's check again:

```diff
$ git status
```
```diff
On branch master
Your branch and 'origin/master' have diverged,
and have 1 and 1 different commits each, respectively.
  (use "git pull" to merge the remote branch into yours)
You have unmerged paths.
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)

Unmerged paths:
  (use "git add <file>..." to mark resolution)

	both modified:   word_count.py

no changes added to commit (use "git add" and/or "git commit -a")
```

Right, we need to stage the changes me made. 

```diff
$ git add word_count.py
```

And now it's time to `commit`!

```diff
$ git commit
```
```diff
Merge branch 'master' of github.com:gforsyth/wordcount

# Conflicts:
#	word_count.py
#
# It looks like you may be committing a merge.
# If this is not correct, please remove the file
#	.git/MERGE_HEAD
# and try again.


# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
# On branch master
# Your branch and 'origin/master' have diverged,
# and have 1 and 1 different commits each, respectively.
#   (use "git pull" to merge the remote branch into yours)
#
# All conflicts fixed but you are still merging.
#
# Changes to be committed:
#	modified:   word_count.py
#
```

That's different. When you `git commit` after resolving a conflict, `git` will
autofill a message for you. You are welcome to use the automatic message, or
replace it with something else, it's up to you.

Save and quit and we should see the following:

```diff
[master d31e6b9] Merge branch 'master' of github.com:gforsyth/wordcount
```

We have resolved the conflict! That wasn't so bad, was it? Now that we fixed the conflict, we just have to push it back up to GitHub.

```diff
$ git push
```
```diff
Counting objects: 6, done.
Delta compression using up to 12 threads.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (6/6), 608 bytes | 0 bytes/s, done.
Total 6 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To github.com:gforsyth/wordcount.git
   a717ad5..d31e6b9  master -> master
```
