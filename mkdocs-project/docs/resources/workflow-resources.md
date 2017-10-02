# Git Workflow / Overview

Git "workflow" refers to the day-to-day steps that occur to modify and add content in a Git repository.
The workflow model focus on naming conventions for branches and processes to branch and merge.
The workflow model that is chosen will depend on the size of the team and protocols for branching/merging,
testing, and releasing software.

This documentation includes the following sections:

* Git Workflow Approaches:
	+ Resources:
		- [See discussion in Git in Practice by Mike McQuaid](https://www.manning.com/books/git-in-practice)
		- [A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/) - often-referenced model by Vincent Driessen,
		where the master branch is "stable" and a development branch is created for ongoing development
		- [Jeremy Helms Gist on Branching](https://gist.github.com/digitaljhelms/4287848) - the above, with some different naming conventions,
		appealing because the "master" branch is the development branch (rather than stable) and a "stable" branch is used for stable releases
		after integration testing
	+ [Feature Branch](feature-branch) - simple approach to use feature/bug fix branches off of master
	+ [Git Flow](git-flow) - comprehensive implementation of Vincent Driessen's model with helper scripts
* Branching (a way to do work in an isolated sandbox and then merge back into the master branch):
	* Resources:
		+ [Git Branching - Basic Branching and Merging](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging)
		+ [Git Branching - Remote Branches](https://git-scm.com/book/en/v2/Git-Branching-Remote-Branches)
	* [Branch Naming](branch-naming)
* Tagging (a way to indicate a named version that can be accessed later, for example a major release or milestone):
	* Resources:
		+ Note that tags must be independently pushed to the remote using the same syntax as pushing a branch (but use tag name) - pushing the branch will not push tags
		+ [Git Basics - Tagging](https://git-scm.com/book/en/v2/Git-Basics-Tagging)
* Merging (the process of combining one branches edits with another branch):
	+ Resources:
		- [Fast-Forward Git Merge](https://ariya.io/2013/09/fast-forward-git-merge) - explanation of fast-forward merge (and why it may not be desirable)
		- [Atlassian tutorial:  Merging vs. Rebasing](https://www.atlassian.com/git/tutorials/merging-vs-rebasing)
		- [Atlassian article:  Git team workflows: merge or rebase](https://www.atlassian.com/git/articles/git-team-workflows-merge-or-rebase) - useful information on rebasing/merging
	+ [Merge via Issue Suggestion](merge-via-issue-suggestion) - contributor provides a suggestion using issue tracker forum
	+ [Merge via Change Set](merge-via-change-set) - contributor provides suggested changes via a change set email
	+ [Merge via Pull Request](merge-via-pull-request) - contributor provides suggested changes via a pull request
* Continuous Integration (a way to run automated tests on a schedule to detected problems with committed code)
	+ Resources:
		- [Travis-CI](https://travis-ci.org/) - popular tool integrated with GitHub
