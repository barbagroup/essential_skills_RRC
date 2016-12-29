# GitHub Workflow

We've used GitHub so far as a tool to backup and restore our work across
different machines but always as a single user.

## how commits work

What exactly is a commit? We've talked about them up to this point as snapshots
of a file or files at a particular moment. That's an accurate description, but
it's also worth examining how commits are related to one another. This will help
develop intuition about why `git` handles certain situations the way that it
does.

When we learned about navigating the UNIX filesystem, we explained the file
structure as an inverted tree, where each folder can see all of the files and
folders below it, but can't see anything above it.

![unix_filetree](./imageplaceholder)

Commits have the exact opposite structure; the tree _isn't_ inverted, it's
right-side-up. If we think of the initial commit as the roots of the tree, each
commit can trace back to the initial commit via all of its ancestors, but has no
knowledge of any commits that come after it (its descendents).

## forks

## cloning

## pull requests

## adding commits to pull requests

# if there's time

## creating a local fork (e.g. a branch)

## merging branches locally


## interactive portion

students pair up (or triple, as needed). fork each others repos, clone the fork,
make a change, push the change up to the fork, then open a PR to the original
repo.

owner of repo comments on PR, try out line comments, request a change.
PR opener makes change, pushes that.
