# Conflicts

## 
```diff
$ git add word_count.py
```
```diff
$  git commit -v
[master ad6cb94] change wording in initial prompt
 1 file changed, 1 insertion(+), 1 deletion(-)
```

```diff
$ git push
To github.com:gforsyth/wordcount.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'git@github.com:gforsyth/wordcount.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details
```

```diff
$ git pull
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

```diff
$ git status
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
```diff
$ cat word_count.py 
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

```diff
$ git status
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
```
gil@theo ~/wordcount master 🐚  git add word_count.py
```
```
gil@theo ~/wordcount master 🐚  git status
On branch master
Your branch and 'origin/master' have diverged,
and have 1 and 1 different commits each, respectively.
  (use "git pull" to merge the remote branch into yours)
All conflicts fixed but you are still merging.
  (use "git commit" to conclude merge)

Changes to be committed:

	modified:   word_count.py
```

```
gil@theo ~/wordcount master 🐚  git commit
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

```diff
[master d31e6b9] Merge branch 'master' of github.com:gforsyth/wordcount
```

```diff
$ git push
Counting objects: 6, done.
Delta compression using up to 12 threads.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (6/6), 608 bytes | 0 bytes/s, done.
Total 6 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To github.com:gforsyth/wordcount.git
   a717ad5..d31e6b9  master -> master
```
