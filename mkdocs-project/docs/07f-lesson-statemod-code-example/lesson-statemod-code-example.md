# Learn Git / StateMod Code Example #

This lesson focuses on using Git and GitHub to manage StateMod code.
Complete the lesson by reading the information on this page and following links to other information.
Then apply what you have learned in your work.
The same concepts can be applied to other software, with variation in the development environment based on technologies.

**Estimated completion time:  60 minutes**

The remainder of this page discusses how to use Git/GitHub to manage the StateMod code.

## StateMod Code Version Control Considerations ##

* **StateMod code repository** - The Open Water Foundation has migrated CDSS software to a Git/GitHub repository
([cdss-app-statemod-fortran](https://github.com/OpenWaterFoundation/cdss-app-statemod-fortran)) and confirmed compilation with `gfortran`.
* **Developer documentation** - The Open Water Foundation created development documentation
[Learn StateMod (for Developers)](http://learn.openwaterfoundation.org/owf-learn-cdss-statemod-dev/),
which is currently in a [separate repository](https://github.com/OpenWaterFoundation/owf-learn-cdss-statemod-dev),
but is intended to be merged into the `doc-dev-mkdocs-project` folder in the StateMod code repository.
* **Develoment Environment** - Although the above environment and documentation include Eclipse/Photran,
initial work with the StateMod code used command-line compiling with the `makefile`,
rather than compiling from Eclipse/Photran.
This simplified approach is likely more consistent with previous developer approach using a text editor to edit code.
It is recommended that a simple approach be used initially and then phase in Eclipse/Photran as appropriate.
Getting over the training hump for Git/GitHub should be the first priority.
* **Support for Lahey and `gfortran` Compilers** - The `makefile` has been created to support both compilers
but StateMod developers need to collaborate to confirm.
Ideally `gfortran` can be used for CDSS going forward.
* **Support for Windows and Linux** - The `makefile` has been created to support both operating systems
but StateMod developers need to collaborate to confirm.
* **Support for 32 and 64-bit Windows** - The `makefile` has been created to support 32- and 64-bit Windows
but StateMod developers need to collaborate to confirm.
* **Software Validation** - Because the OpenCDSS effort is migrating to `gfortran` compiler,
it is necessary to ensure that the `gfortran` results match the Lahey results.
This should also be the focus of initial development.
The Open Water Foundation is working on a test repository to facilitate automated testing and comparison,
which can be used parallel to the software code repository.
A separate effort is attempting to manage StateCU and StateMod datasets in Git/GitHub and would
allow an integrated process for automated testing.
**More information on testing will be added to development documentation and this documentation.**

## Git Workflow for StateMod Dataset ##

The Git workflow for a StateMod model source code is similar to other workflows.
Refer to previous training lessons for instruction on how to use Git commands.
The following workflow can be understood best through first-hand experience.

1. Add an issue in the dataset repository using the GitHub ***Issues*** tool,
for example to address a software bug or enhancement.
2. Start on the `master` branch in working files.
3. Pull the `master` branch from the remote GitHub repository to ensure that the starting point is consistent with work that others have done.
4. Create a branch for the issue using the issue number in the branch name, for example, `5-bug-something`
5. Checkout the new branch so that the working files correspond to the branch.
6. Make changes to data set working files.
7. Review and validate changes using automated tests and visual inspection. **Need to implement standard automated tests.**
8. Add working files to staging and commit to the branch.
9. Checkout the `master` branch.  Do a pull to synchronize remote changes that have occurred since the local branch.
10. Merge the local branch using `git merge --no-ff branchname`.
Deal with merge conflicts if necessary.  Validate the version again if remote commits had to be merged.
11. Push the `master` branch to the remote GitHub repository so that others can see the changes.
12. Delete the local branch since no longer needed.
13. Package the software executable, documentation, etc. and distribute/deploy as per the product protocols.
For example, place the StateMod executable and documentation on the CDSS website.
