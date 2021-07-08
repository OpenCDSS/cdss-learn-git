# Learn Git / Workflow Example for StateMod #

This lesson provides an example of implementing the CDSS Git Workflow on StateMod code using actual events,
in this case incorporation of a code suggestions from the original StateMod developer.
The lesson consists of reading the narrative of several merge tasks.
This explanation can be leveraged with similar version control activities.
CDSS uses a Feature Branch workflow.

**Expected completion time:  30-60 minutes**

The remainder of this page consists of the following sections.

* [StateMod Example Overview](#statemod-example-overview) - explanation of the example
* [Run git-check.sh](#run-git-checksh)
* [Merge 15.00.02 Changes from Legacy Development Environment](#merge-150002-changes-from-legacy-development-environment)
* [Merge 15.00.03 Changes from Legacy Development Environment](#merge-150003-changes-from-legacy-development-environment)
* [ Merge 8-bug-cm2015-crash Branch Changes from New Development Environment](#merge-8-bug-cm2015-crash-branch-changes-from-new-development-environment)

--------

## StateMod Example Overview ##

The OpenCDSS effort initially resulted in loading a recent history of StateMod source file versions into a GitHub repository,
through version 15.00.01 (see the StateMod developer documentation for information about this process).
This migration was performed by an experienced Git/GitHub user and involved some fundamental changes,
including changing all source file namess to lowercase and normalizing line endings to work for Windows and Linux development. 
StateMod has historically been developed using a Lahey Fortran compiler but the OpenCDSS effort is working to use the open source `gfortran` compiler,
which will increase access to the software.
The `gfortran` versions were verified to compile and run but the output was not validated against
Lahey versions.  Experience of running the StateMod 15.00.01 `gfortran` Windows version showed that the executable might crash
or gave different results.  These issues needed to be resolved and consequently
a [GitHub issue was created](https://github.com/OpenWaterFoundation/cdss-app-statemod-fortran/issues/8)
and a [branch called 8-bug-cm2015-crash](https://github.com/OpenWaterFoundation/cdss-app-statemod-fortran/tree/8-bug-cm2015-crash) was created to work on the code. 
This code built on the 15.00.01 version but was not merged into the `master` branch
(pending consultation with the original developer and implementation of automated testing tools).

At the same time, the original StateMod developer, who is not an experienced Git/GitHub user, created two additional versions of StateMod,
15.00.02 and 15.00.03, to address additional issues.
This occurred at the same time that this CDSS Git training documentation was being used to learn Git.
However, the original developer is not to the point of being
skilled with Git/GitHub and therefore created 15.00.02 and 15.00.03 using the legacy development environment.
The code for these versions used the 15.00.01 starting point from the legacy code, not the Git/GitHub version.

Consequently, there is a needed to merge in recent 15.00.02 and 15.00.03 code enhancements built on the legacy code as well as
review and merge in changes to address the `gfortran` version crash.
The following sections illustrate this process in order to educate the original developer.

## Run git-check.sh ##

The [`git-check.sh` script](../resources/git-bash/git-bash#git-checksh) is useful for summarizing the status of Git
repositories for a product, particularly in cases when multiple repositories are associated with a product.
To run from a Git Bash window, change to the `build-util` folder in the `cdss-app-statemod-fortran` repository
working files or type the path to the script.  The following is typical output.
The bottom of the output provides a summary.
If a need for action is detected, scroll back to see which repository needs attention.
Then take action and rerun the script until all repositories are "up to date".
This script can be run before starting work to understand when other peoples' work needs to be merged,
and at the end of work confirm that changes can be cleanly pushed to the remote repository.

```
sam (master) build-util $ ./git-check.sh



operatingSystem=mingw (used to check for Cygwin)
================================================================================
Checking status of repo:  cdss-app-statemod-fortran
Fetching origin
------------------
Up-to-date
------------------
USE Git Bash or other Windows git client with this repo (filemode=false).
================================================================================
Checking status of repo:  cdss-app-statemod-fortran-doc-dev
Fetching origin
------------------
Up-to-date
------------------
USE Git Bash or other Windows git client with this repo (filemode=false).
================================================================================
Checking status of repo:  cdss-app-statemod-fortran-doc-user
Fetching origin
------------------
Up-to-date
------------------
USE Git Bash or other Windows git client with this repo (filemode=false).
================================================================================
Checking status of repo:  cdss-app-statemod-fortran-test
Fetching origin
------------------
Up-to-date
Working files contain modified files that need to be committed, or staged files.
Working files contain 4 untracked files that need to be committed.
------------------
USE Git Bash or other Windows git client with this repo (filemode=false).
================================================================================
Number of up-to-date repositories:                                        4
Number of 'need to pull' repositories (remote commits available):         0
Number of 'need to push' repositories (local commits saved):              0
Number of diverged repositories (need to pull and push):                  0
Number of repositories with local changes (working and/or staged files):  1
================================================================================
```

## Merge 15.00.02 Changes from Legacy Development Environment ##

The 15.00.01 version existed in the `master` branch in Git/GitHub.
A new `8-bug-cm2015-crash` branch had been created and changes made to resolve the crash problem.
This initial work was successful in that the `cm2015B.rsp` StateMod dataset could be run with the `gfortran` version,
but the results differed from Lahey version.

Uncommitted working files will be left as is when switching before branches.
If uncommitted work exists in working files and `git checkout` is run, Git will generally provide
a suitable warning if appropriate.
For example, a suggestion will be printed to commit the changes in a branch before checking out the `master` branch.
Conversely, new files created on the `master` branch can transfer to a new branch's working files
because it is common to make a decision to create a branch subsequent to doing some work on `master`.
Git does provide the `git stash` command to save a copy of uncommitted work so that the files can be retrieved later
when the branch is checked out to continue work.

In the case of the example in this lesson, the changes for the `8-bug-cm2015-crash` branch were all committed to the branch.
Therefore, `git checkout master` could be executed with no issues, as shown below:

```sh
sam (master) cdss-app-statemod-fortran $ git checkout 8-bug-cm2015-crash
Switched to branch '8-bug-cm2015-crash'
sam (8-bug-cm2015-crash) cdss-app-statemod-fortran $ git status
On branch 8-bug-cm2015-crash
nothing to commit, working tree clean
sam (8-bug-cm2015-crash) cdss-app-statemod-fortran $ git checkout master
Switched to branch 'master'
Your branch is up-to-date with 'origin/master'.
sam (master) cdss-app-statemod-fortran $ git status
On branch master
Your branch is up-to-date with 'origin/master'.
nothing to commit, working tree clean
```

Because the `8-bug-cm2015-crash` branch changes have not been confirmed for release, set that branch aside
and focus on incorporating the 15.00.02 code changes.  The changes made to the `8-bug-cm2015-crash` branch will be addressed later.
The following steps are performed:

### Create an Issue on GitHub ###

[Issue #9 was created in GitHub](https://github.com/OpenWaterFoundation/cdss-app-statemod-fortran/issues/9) to describe the enhancement needed.

### Confrim that Local `master` Branch is Current ###

The new changes need to start with the current `master`:

```sh
sam (master) cdss-app-statemod-fortran $ git pull
Already up-to-date.
```

### Create and Checkout a Feature Branch ###

The work on 15.00.02 has already been done in the legacy environment by the original developer. 
However, if the work had not been done, then any number of files might be changed and iterative testing would occur.
It is important to isolate such work from the files in the `master` branch because `master` is intended to contain verified/tested work.
Therefore, create a new local branch and check it out.  The initial checkout will have exactly the same files as the `master` branch.

```sh
sam (master) cdss-app-statemod-fortran $ git branch 9-bug-xre-rule27
sam (master) cdss-app-statemod-fortran $ git checkout 9-bug-xre-rule27
Switched to branch '9-bug-xre-rule27'
```

### Review and Clean up the Contributed Code ###

Normally the changes would be made by editing the appropriate working files.
However, since the files have already been edited by the original developer, those files need to be copied into the working files.
Before blindly doing this, it is appropriate to compare the contributed files with those in working files,
in particular because the original developer is not yet using the new development environment.
The KDiff3 software can be used to compare the files and the following actions were taken.
Changes in the code include comment `rrb 2017/10/20`.

* `DirectWR.for`:
	+ Renamed to lowercase
	+ Changes seem reasonable, although `ndr` was used when maybe should have been `ndR` for consistency
	+ Clean up some extra spaces in inserts, mainly trailing
* `DivResP2.for`:
	+ Renamed to lowercase
	+ Changes seem reasonable, although `ndr` was used when maybe should have been `ndR` for consistency
	+ Clean up some extra spaces in inserts, mainly trailing
* `Divrpl.for`:
	+ Renamed to lowercase
	+ No changes in code so remove from files to commit
* `DNMFSO.FOR`:
	+ Renamed to lowercase
	+ Changes seem reasonable
* `IfrRigSP.for`:
	+ Renamed to lowercase
	+ Correct to use spaces instead of tabs for comments, for consistency
	+ Clean up some extra spaces in inserts, mainly trailing
* `OUTMON.FOR`:
	+ Renamed to lowercase
	+ Correct indentation spaces for alignment
* `SPlatte.for`:
	+ Renamed to lowercase
* `Statem.for`:
	+ Renamed to lowercase
	+ Removed mention of 15.00.03 since not implemented in this commit (will add for 15.00.03 commit)
	+ Fix typo throughout to correct spelling for `initialize`

### Merge the Code Contribution ###

Once the submitted files were changed as above and copied into the working files, they were committed to the repository
and the branch was merged, as follows:

```sh
sam (9-bug-xre-rule27 *) fortran $ git status
On branch 9-bug-xre-rule27
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   directwr.for
        modified:   divresp2.for
        modified:   dnmfso.for
        modified:   ifrrigsp.for
        modified:   outmon.for
        modified:   splatte.for
        modified:   statem.for

no changes added to commit (use "git add" and/or "git commit -a")

sam (9-bug-xre-rule27 *) fortran $ git add -A

sam (9-bug-xre-rule27 +) fortran $ git commit -m 'Fixes for XRE reporting bug for rule type 27'
[9-bug-xre-rule27 0606b1e] Fixes for XRE reporting bug for rule type 27
 7 files changed, 202 insertions(+), 46 deletions(-)

sam (9-bug-xre-rule27) fortran $ git checkout master
Switched to branch 'master'
Your branch is up-to-date with 'origin/master'.

sam (master) fortran $ git merge --no-ff 9-bug-xre-rule27
Merge made by the 'recursive' strategy.
 src/main/fortran/directwr.for |  47 +++++++++++----
 src/main/fortran/divresp2.for | 131 ++++++++++++++++++++++++++++++++++++------
 src/main/fortran/dnmfso.for   |   4 ++
 src/main/fortran/ifrrigsp.for |   8 ++-
 src/main/fortran/outmon.for   |   4 ++
 src/main/fortran/splatte.for  |   6 +-
 src/main/fortran/statem.for   |  48 +++++++++++-----
 7 files changed, 202 insertions(+), 46 deletions(-)

sam (master) fortran $ git push
Counting objects: 13, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (11/11), done.
Writing objects: 100% (13/13), 3.37 KiB | 0 bytes/s, done.
Total 13 (delta 10), reused 0 (delta 0)
remote: Resolving deltas: 100% (10/10), completed with 9 local objects.
To https://github.com/OpenWaterFoundation/cdss-app-statemod-fortran.git
   63ec920..63f1312  master -> master

sam (master) fortran $ git branch -d 9-bug-xre-rule27
Deleted branch 9-bug-xre-rule27 (was 0606b1e).
```

The files are then ready to make the changes for the next update, 15.00.03 as per the next section.

## Merge 15.00.03 Changes from Legacy Development Environment ##

The update to version 15.00.03 follows a sequence similar to the previous section.

### Create an Issue on GitHub ###

[Issue #10 was created in GitHub](https://github.com/OpenWaterFoundation/cdss-app-statemod-fortran/issues/10) to describe the enhancement needed.

### Confrim that Local `master` Branch is Current ###

The new changes need to start with the current `master` (no changes are expected because the work from the previous section is the most recent):

```sh
sam (master) cdss-app-statemod-fortran $ git pull
Already up-to-date.
```

### Create and Checkout a Feature Branch ###

The work on 15.00.03 has already been done in the legacy environment by the original developer. 
However, if the work had not been done, then any number of files might be changed and iterative testing would occur.
It is important to isolate such work from the files in the `master` branch because `master` is intended to contain verified/tested work.
Therefore, create a new local branch and check it out.  The initial checkout will have exactly the same files as the `master` branch.

```sh
sam (master) fortran $ git branch 10-bug-b44-elements
sam (master) fortran $ git checkout 10-bug-b44-elements
Switched to branch '10-bug-b44-elements'
```

### Review and Clean up the Contributed Code ###

Normally the changes would be made by editing the appropriate working files.
However, since the files have already been edited by the original developer, those files need to be copied into the working files.
Before blindly doing this, it is appropriate to compare the contributed files with those in working files,
in particular because the original developer is not yet using the new development environment.
The KDiff3 software can be used to compare the files and the following actions were taken.
Changes in the code include comment `rrb 2017/10/20`.

* `07_tec.doc`
	+ Don't yet have a home in the new repository.  Need to confirm content and will then include in repo.
	Added a GitHub issue as a reminder to deal with this.
* `GETPAR.FOR`
	+ Was provided by mistake.  Remove from commit list.
* `Statem.for`
	+ Was the same as 15.00.02 so start with the latest from master branch.
	+ Update the version to 15.00.03 and date 2017/11/13 as per historical conventions. 
	+ Add back the 15.00.03 history comments.
* `setpar.for`
	+ Minor cleanup of extra spaces, mainly trailing.
	+ Fix typo in spelling of `initialize`.
	+ Compiler complained about `paramrX` not having correct number of values,
	declared as array size 40 but new code has 41 values - **need to check with Ray Bennett**.
	+ Small file so take the opportunity to convert tabs to spaces in several comments.

### Merge the Code Contribution ###

Once the submitted files were changed as above and copied into the working files, they were committed to the repository
and the branch was merged, as follows:

```sh
sam (10-bug-b44-elements *) fortran $ git status
On branch 10-bug-b44-elements
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   ../../../.gitignore
        modified:   setpar.for
        modified:   statem.for

no changes added to commit (use "git add" and/or "git commit -a")
sam (10-bug-b44-elements *) fortran $ git add -A
sam (10-bug-b44-elements +) fortran $ git commit -m 'Changes from Ray Bennett for b44 data element inconsistencies'
[10-bug-b44-elements 8b290a2] Changes from Ray Bennett for b44 data element inconsistencies
 3 files changed, 64 insertions(+), 13 deletions(-)
```

At this point there is a question about one of the files so a merge with the `master` branch has not been done.

## Merge 8-bug-cm2015-crash Branch Changes from New Development Environment ##

The 15.00.03 changes are not yet merged into the `master` branch pending some feedback from Ray Bennett.
Consequently, in order to make progress on testing the b44 changes, make a branch off off the above
and blend in the previous 8-bug-cm2015-crash changes so can make a run and work on the xwb comparison.
Make a branch `8b-bug-cm2015-crash` for the following in order to make progress.
All changes have inline comment with `smalers`.

* `directwr.for`:
	+ version from 15.00.02 has changes that should be used
* `divcar1.for`:
	+ new array bounds fix version should be used so copy from 8 branch
* `divcarl.for`:
	+ new array bounds fix version should be used so copy from 8 branch
* `divresp2.for`:
	+ Ray changed recently so edit the 15.00.02 result
	+ near line 538 add code to split IF to deal with array bounds
	+ near line 625 add code to split IF to deal with array bounds
	+ near line 2036 add code to split IF to deal with array bounds
* `divrplp.for`:
	+ near line 530 add code to split IF to deal with array bounds
	+ near line 640 add code to split IF to deal with array bounds
* `dnmfso.for`:
	+ version from 15.00.02 has changes that should be used
* `ifrrigsp.for`:
	+ version from 15.00.02 has changes that should be used
* `outmon.for`:
	+ near line 420 add code to deal with array bounds
* `outpln.for`:
	+ new array bounds fix version should be used so copy from 8 branch
* `outplnmo.for`:
	+ new array bounds fix version should be used so copy from 8 branch
* `rsrspu.for`:
	+ new array bounds fix version should be used so copy from 8 branch
* `setpar.for`:
	+ version from 15.00.03 has changes that should be used
* `splatte.for`:
	+ version from 15.00.02 has changes that should be used
* `statem.for`:
	+ version from 15.00.03 has changes that should be used
	+ will need to increment the version after changes have been confirmed with Ray

Do a `make clean` and `make` and use the executable in comparison with the Lahey version.
