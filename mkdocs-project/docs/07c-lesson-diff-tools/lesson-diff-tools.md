# Learn Git / Difference Tools #

This lesson provides information about difference/comparison tools available to use with Git.

**Expected completion time: ?**

**This lesson is incomplete.**

It is important to be able to compare versions of files, including different repository branch/commits, and working files.
Other Git tools such as `git blame` and `git log` are useful for understanding changes,
but a visual comparison across multiple files is often needed.
Git includes a `git diff` command that provides basic functionality and
the difference feature can also utilize third-party comparison tool such as KDiff3.
KDiff3 is a very useful tool because it allows comparing large folders, for example full copies of two different
software or dataset versions.

More content will be added to this page in the future.

See also:

* [`git diff` documentation](https://git-scm.com/docs/git-diff) - basic tool to compare files
* [KDiff3](http://kdiff3.sourceforge.net/) - useful tool for comparing files

## Comparing Full Versions ##

It may be helpful to compare two full folder structures for source code or a dataset.
It may be cumbersome to do this with Git tools.
Therefore, one approach is:

1. One copy of the files is the working files for the current branch, as usual.
2. Clone a second copy of the repository into another folder, clearly named as a temporary version.
Check out the branch/tag/commit that is relevant.
3. Use KDiff3 or other tools to do the comparison.

A similar approach was used to load StateCU and StateMod code into the repository, where one copy of files was the repository files
and the other was a date-stamped folder.
A comparison of files guided cleanup as files were moved to the repository as versions.
