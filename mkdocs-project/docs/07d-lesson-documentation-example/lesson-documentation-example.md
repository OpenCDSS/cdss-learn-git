# Learn Git / Documentation Example #

This lesson provides guidelines for using Git/GitHub to develop CDSS documentation,
in particular stand-alone, web-enabled, navigable documents.
Documentation is important in order to capture knowledge and educate others.
Complete the lesson by reading the information on this page and following links to other information.
Then apply what you have learned in your work.

**Estimated completion time: 15-30 minutes**

Examples of CDSS documentation include the following and are discussed below:

* [Training Documentation](#training-documentation) - training documentation intended for users of software and data
* [Dataset Documentation](#dataset-documentation) - describes model datasets
* [Software Developer and User Documentation](#software-developer-and-user-documentation) - to facilitate development and use of software

-----------

## Training Documentation ##

Training documentation is similar to this documentation and serves the purpose of providing
background information and context, step-by-step examples to encourage hands-on learning,
emphasizing best practices, and serving as a reference.
Creating effective training documentation can be challenging depending on the audience and complexity of the material.

The OpenCDSS effort is implementing new web-enabled, navigable, searchable documentation in the form of static websites.
The Open Water Foundation has created [Learn MkDocs](http://learn.openwaterfoundation.org/owf-learn-mkdocs/)
documentation to explain how to use the open source MkDocs software
to create such documentation.
Such documentation can be maintained in version control in Git/GitHub, viewed on a local computer during editing,
and deployed as a static website for public access.

The approach being taken in OpenCDSS is to maintain new training documentation as separate repositories rather than,
for example, as a folder within a software or dataset repository.
This allows contributors to the documentation to use tools and skills that are suited to documentation,
rather than requiring programming skills, for example.
However, it may make sense to include training materials with software in some cases.

Legacy training materials such as Word/PDF and PowerPoint/PDF documents will find a home as CDSS product repositories are fully implemented.

OpenCDSS training materials are initially being hosted on the [Open Water Foundation / Learn website](http://learn.openwaterfoundation.org/) but will be
transitioned to an OpenCDSS or other State of Colorado website when sufficient content and cloud hosting structure is enabled.

### Git Workflow for Word/PowerPoint/PDF Documentation ###

It may be appropriate to include Word/PowerPoint/PDF documents in a repository, for example for legacy training materials.
A decision should be made as to whether to include those files in an existing repository such as StateMod code or StateMod dataset.

Word and PowerPoint files are considered the master copy of the documentation, but quite often PDF is distributed.
Version control typically only stores the original files. Derived forms (such as PDF) that can be created
during the build/distribution process ideally don't need to be saved in the repository.
However, automated conversion of Word/PowerPoint files to PDF has not typically been done for legacy documentation
because it may require special software at a cost.
More attention needs to be given to implementing a standard automated conversion process,
in which case PDF files would be created when needed, and would not be committed to the repository (use `.gitignore` to ignore).
Until a different approach is determined,
it may be necessary to commit PDF versions of training documentation to the repository to facilitate access and deployment.
These issues will be evaluated more as OpenCDSS progresses.
Content maintainers should make decisions based on the specific case.

### Git Workflow for Training Documentation ###

The following workflow summarizes the steps that should typically occur for training documentation.
Refer to other sections of this documentation for background on using Git/GitHub.
If the content will be maintained within a software or dataset repository, use a folder such as `doc-user-training`.
The Open Water Foundation has made recommendations for folder structure in the 
[Learn MkDocs](http://learn.openwaterfoundation.org/owf-learn-mkdocs/) documentation.

#### New Documentation Repository ####

If a new documentation product needs to be created, first create a repository in GitHub,
for example similar to [CDSS / Learn Git](https://github.com/OpenWaterFoundation/cdss-learn-git).

#### New Contributor to Documentation ####

If a new contributor will be working on documentation, they need to clone a copy of the repository.
If the contributor has write access, they can clone directly to the local computer and commit to the repository.
If they are not part of the core development team, they should fork the repository on GitHub and use the pull request approach.

#### General Workflow ####

The following is the general workflow for editing documentation,
and can best be understood through first-hand experience:

1. Add an issue in the documentation repository using the GitHub ***Issues*** tool.
2. Start on the `master` branch in working files.
3. Pull the `master` branch from the remote GitHub repository to ensure that the starting point is consistent with work that others have done.
4. Create a branch for the issue using the issue number in the branch name, for example, `5-enhance-abc-doc`
5. Checkout the new branch.
6. Make changes to content.  If a MkDocs project, view the output in a browser as per MkDocs features.
7. Once changes have been reviewed, add working files to staging and commit to the branch.
8. Checkout the `master` branch.  Do a pull to synchronize remote changes that have occurred since
the local branch.
9. Merge the local branch using `git merge --no-ff branchname`
Deal with merge conflicts if necessary.  Review to validate.
10. Push the `master` branch to the remote GitHub repository.
11. Delete the local branch since no longer needed.
12. Package the documentation and distribute/deploy as per the product protocols.
For example, for a MkDocs site, push to a cloud-hosted static website location.

## Dataset Documentation ##

CDSS model dataset documentation such as for StateMod and StateCU has traditionally been created
in Word/PDF form rather than version-controlled interactive format.
Word/PDF reports typically consist of a main report body and appendices.
See the [CDSS Modeling Dataset Documentation web page](http://cdss.state.co.us/DSSDocuments/Pages/ModelingDatasetDocumentation.aspx).
Basin model documentation also often includes numerous technical memoranda that describe specific water supply systems.
Using PDF format for documentation facilitates distribution of a single report file.

Using web-enabled documentation for dataset documentation is an option but is a decision for modelers and the State CDSS management team.
If it is used as an option then the other sections of this page can be adapted for model dataset documentation.

One improvement to managing model dataset files is to use Git/GitHub to provide version control for the dataset.
If this approach is taken, then an enhancement to datasets is the use of `README.md` files in dataset folders
to explain the contents of those folders.
See the [StateMod Dataset Example section](../07e-lesson-statemod-dataset-example/lesson-statemod-dataset-example)
for information about using Git/GitHub for a model dataset.

## Software Developer and User Documentation ##

Software developer and user documentation for CDSS software has traditionally been developed using Word/PDF format and
this will likely continue unless resources are available to try other formats such as MkDocs.

However, because the legacy documentation primarily focuses on using the software rather than describing how to use the development environment,
there is an opportunity to explore using interactive documentation for developer documentation, and this is being explored in the OpenCDSS effort.
For example, the following developer documentation has been created by the Open Water Foundation as StateCU and StateMod have
been migrated to Git/GitHub and open source `gfortran` compiler:

* [Learn StateCU (for Software Developers)](http://learn.openwaterfoundation.org/owf-learn-cdss-statecu-dev/)
* [Learn StateMod (for Software Developers)](http://learn.openwaterfoundation.org/owf-learn-cdss-statemod-dev/)

Because developer documentation is closely tied to the software code, it makes sense to include such documentation
in the software code repositories so that developers update the documentation if the development environment changes.

The Git workflow for updating such documentation is similar to that of code changes and maintaining training documentation.

A basic enhancement to documentation is to use `README.md` files in software code folders to better explain the folder structure.
OpenCDSS is also exploring the use of Doxygen to auto-generate useful documentation products,
which is explained in new software development documentation.
