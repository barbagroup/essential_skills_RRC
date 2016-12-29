# Creating, editing, removing files

## Use a text editor

There are a *lot* of different text editors and a *lot* of strong
feelings about which of them is the best.

You can use any editor you like, but you _must_ know how to use at least one
terminal-friendly editor. In this workshop we are going to use `nano`. It's
simple and easy to use.

Make sure you're in your home directory (use `cd` and `pwd` to confirm) then type

```text
$ nano
```

This is a no-frills editor. Type something! How about a TODO list?

```text
TODO
* [x] Learn how to navigate using the terminal
* [ ] Learn how to create files
* [ ] Learn about pipes and redirects
```

At the bottom you'll notice a bunch of different options but we are concerned
with only two of them: `Write Out` (save) and `Exit`.

The caret (`^`) means the Control key. To save the TODO list, hit `Ctrl+o`, type
in a name (how about "TODO") and then hit `Enter`. `nano` will report that it
wrote some number of lines.

Now exit `nano` by typing `Ctrl+x`.

Use `ls` to see what happened:

```text
$ ls -F
```
```text
Desktop/  Documents/  Downloads/  Music/  Pictures/  Public/  TODO  Templates/  Videos/
```

There's the TODO list! If you want to edit the todo list, you can open it up in
`nano` (you can use tab completion for the filename, too!)

```text
$ nano TODO
```

Check off the second item on the todo list and then save and exit `nano`. Notice
that when you hit `Ctrl+o` to save an existing file, `nano` will automatically
fill in the name of the existing file. If you wanted to "Save As...", you can
simply change the name in the `Write Out` bar.

## Create an empty file

There are a few ways to create files on the command line. If you want to create
an "empty" file, you can use `touch`. Try it!

```text
$ touch newfile
```
```text
$ ls -F
```
```text
Desktop/    Downloads/  Pictures/  TODO        Videos/
Documents/  Music/      Public/    Templates/  newfile
```

You can open `newfile` in `nano` to confirm that it's empty. Then just exit out
using `Ctrl+x` since there's nothing to save!

## Create a directory

To create a new directory, use the `mkdir` command. We can create a `Research/`
folder in the home directory.

```text
$ mkdir Research
```
```text
$ ls -F
```
```text
Desktop/    Downloads/  Pictures/  Research/  Templates/  newfile
Documents/  Music/      Public/    TODO       Videos/
```

## Remove a file

We don't need that empty file sitting around, we can remove it. To remove a
file, use the `rm` command:

```text
$ rm newfile
```

Did anything happen?

```text
$ ls -F
```
```text
Desktop/    Downloads/  Pictures/  Research/  Templates/
Documents/  Music/      Public/    TODO       Videos/
```

Yes, `newfile` is gone. And this is something to be aware of: there is no
"Recycle Bin". There is no "Undo". That file is gone.

## Remove a directory

Let's try to remove the `Research` directory we created earlier.

```text
$ rm Research
```
```text
rm: cannot remove 'Research': Is a directory
```

`rm` only works with files by default. If you want to remove the directory you
need to use the `-r` flag to specify a _recursive_ removal.

**This will delete the directory and ALL of its contents. BE CAREFUL WHEN USING
THIS**

```text
$ rm -r Research
```
```text
$ ls -F
```
```text
Desktop/    Downloads/  Pictures/  TODO        Videos/
Documents/  Music/      Public/    Templates/
```

## Move/Rename a file

We know how to create and delete files and folders now. What about renaming a
file?

To rename a file, we use the `mv` command, which is short for "move". This may
seem a little bit odd at first, but renaming a file is the same as moving it to
a different location.

To start, let's make the file `TODO` lowercase. The syntax is `mv <old location>
<new location>`

```text
$ mv TODO todo
```
```text
$ ls -F
```
```text
Desktop/    Downloads/  Pictures/  Templates/  todo
Documents/  Music/      Public/    Videos/
```

We _moved_ the file `TODO` from `/home/<user>/TODO` to a new location, called
`/home/<user>/todo`. Since the directory doesn't change, the result is a
_renamed_ file. 

We can also move the `todo` list to a different folder:

```text
$ mv todo Desktop/
```
```text
$ ls -F
```
```text
Desktop/  Documents/  Downloads/  Music/  Pictures/  Public/  Templates/  Videos/
```

We specified `Desktop/` as the `<new location>` in the `mv` command. Since
`Desktop/` is a folder, `todo` will move inside that folder. 

```text
$ ls -F Desktop/
```
```text
todo workshop_data.zip
```

**Note:** As we see, if `<new location>` is a folder, then the file is moved
inside the folder. However, if `<new location>` is an existing _file_, then that
file will be overwritten.
