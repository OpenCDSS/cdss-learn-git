# cdss-learn-git #

Colorado's Decision Support Systems (CDSS) Git/GitHub training.

## Introduction ##

This repository contains the source content of a MkDocs static website for CDSS Git/GitHub training.
The training lessons that are encapsulated in this repository are intended to provide
introductory Git training for those who have never before used Git (perhaps have not use version control at any level).
Advanced topics are also included in order to provide a CDSS perspective on version control and Git.
This documentation serves as a reference for all CDSS development.

MkDocs is used because it allows training materials to be created using Markdown,
content can be easily managed in Git/GitHub,
and the resulting static website is professional-looking, navigable, and useful.

## Repository Contents ##

The repository contains a typical MkDocs project in the `mkdocs-project` folder.
Refer to [MkDocs documentation](http://www.mkdocs.org/) for guidance on creating MkDocs websites.

## Prerequisites ##

The following software must be installed to view the documentation with MkDocs:

* [Python 2 or 3](https://www.python.org/downloads/)
* [MkDocs 16+](http://www.mkdocs.org/)

## How to Edit/View/Deploy ##

1. **To view:**  Run `mkdocs serve` on the command line in the `mkdocs-project` folder.
Then view in a browser using address [http://localhost:8000](http://localhost:8000) (link will only work if the
site is being served locally).
2. **To edit:**  Use a text editor.  The web browser content will automatically refresh when changes are detected.
If the browser does not load content, it is usually because there is an error,
and a message will be printed in the command line window.
3. **To deploy:**  Run an appropriate script in the `build-util` folder to copy to cloud storage.
This will require appropriate credentials for the receiving cloud system.

## Contributing ##

Contributions can be made via normal Git/GitHub protocols:

1. Those with commit permissions can make changes to the repository.
2. Use GitHub Issues to suggest changes (preferred for small changes).
2. Fork the repository and use pull requests.

## Credits ##

Maintainers:

* Steve Malers, Open Water Foundation (@smalers)

Contributors:

* None yet.

## License ##

The license is being determined as part of the OpenCDSS effort.
