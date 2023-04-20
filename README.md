# cdss-learn-git #

Colorado's Decision Support Systems (CDSS) Git/GitHub training documentation.
See the [published CDSS / Learn Git documentation](http://opencdss.state.co.us/cdss-learn-git/).

## Introduction ##

This repository contains the source content of a MkDocs static website for CDSS Git/GitHub training.
The training lessons that are encapsulated in this repository are intended to provide
introductory Git training for those who have never before used Git (perhaps have not use version control at any level).
Advanced topics are also included in order to provide a CDSS perspective on version control and Git.
This documentation serves as a reference for all CDSS development.

MkDocs is used because it allows training materials to be created using Markdown,
content can be easily managed in Git/GitHub,
and the resulting static website is professional-looking, navigable, and useful.

## Repository Folder Structure ##

The repository contains a typical MkDocs project in the `mkdocs-project` folder.
Refer to [MkDocs documentation](http://www.mkdocs.org/) for guidance on creating MkDocs websites.
See also [OWF / Learn MkDocs](http://learn.openwaterfoundation.org/owf-learn-mkdocs/).

```
cdss-learn-git/         Git repository folder matching repository name.
  build-util/           Folder containing useful scripts.
  mkdocs-project/       Folder containing standard MkDocs project.
    docs/               Folder containing Markdown files.
    mkdocs.yml          Configuration file for the documentation.
    site/               Static website, dynamically created and in .gitignore.
  README.md             This file.
```

## Development Environment Folder Structure ##

The following folder structure is recommended for the development environment for this documentation.

```
C:\Users\user\            Windows user folder.
/c/Users/user/            Git Bash user folder.
  cdss-dev/               Development files for OpenCDSS products.
    Learn-Git/            Product folder for this documentation.
      git-repos/          Git reposities for the documentation (only one needed, below).
        cdss-learn-git/   The repository files as shown in the previous section.
```

## Prerequisites ##

The following software must be installed to view the documentation with MkDocs:

* [Python 3](https://www.python.org/downloads/)
* [MkDocs 1.0.4](http://www.mkdocs.org/)
* [Material Theme](https://squidfunk.github.io/mkdocs-material/).

## How to Edit/View/Deploy ##

1. **To view:**  Run `mkdocs serve` on the command line in the `mkdocs-project` folder.
Then view in a browser using address [http://localhost:8000](http://localhost:8000) (link will only work if the
site is being served locally).
2. **To edit:**  Use a text editor.  The web browser content will automatically refresh when changes are detected.
If the browser does not load content, it is usually because there is an error,
and a message will be printed in the command line window.
3. **To deploy:**  Run the `build-util/copy-to-co-dnr-gcp.sh` shell script in Git Bash.
This will require appropriate credentials for Google Cloud Platform.

## Contributing ##

Contributions can be made via normal Git/GitHub protocols:

1. Those with commit permissions can make changes to the repository.
2. Use GitHub Issues to suggest changes (preferred for small changes).
2. Fork the repository and use pull requests.

## License ##

The license for this documentation is the [Creative Commons CC-BY 4.0 license](LICENSE.md).

## Release Notes ##

The following release notes indicate major milestones in the update history for documentation.
See the Git repository issues for detailed information.

* 2023-04-20 - Updated documentation to fix broken links and remediate issues related to accessibility including alt text for images and heading structures.
* 2019-04-27 - Update to MkDocs 1.0.4 and opencdss.state.co.us.
* 2017-10-23 - Switch to Material theme, fill out content for additional pages, fix some broken links.
* 2017-10-01 - Initial version.
