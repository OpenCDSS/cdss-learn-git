# Learn Git / Configure Git #

Once Git client software has been installed it is necessary to set a few configuration properties to tell Git
the user information.
The configuration steps will need to be repeated each time Git software is installed, including each virtual machine,
and potentially for each tool if software stores Git configuration in different environments within Windows (such as Cygwin).
If the Git software is shared between users, then the properties need to be set for each user on the computer.
It is important as a software developer to know which Git configuration file(s) a software tool uses;
therefore, check that the properties are set when starting with a new computer or development environment.

***For OpenCDSS, it is assumed that at a minimum Git for Windows is installed on Windows computers***.

Several Git configuration properties are set by default and are typically OK because the Git software installer will
default for the computer operating system.  Only important changes are discussed here.

The following sections are included in this page:

* [Set Global Configuration Properties](#set-global-configuration-properties)
* [Location of Git Configuration Files](#location-of-git-configuration-files)

-----

## Set Global Configuration Properties ##

The following documentation summarizes how to set global Git configuration properties after installing software:

* [Getting Started - First Time Git Setup](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)

Typical configuration includes the following (replace the user information with appropriate values).
The editor that is specified will be used for commit messages if not specified on the command line (`git commit` rather than
`git commit -m 'commit message'`).

```
git config --global user.name "Joe Smith"
git config --global user.email joe.smith@yourorganization.com
git config --global core.editor someeditor

git config --list

user.name=Joe Smith
user.email=joe.smith@yourorganization.com
color.ui=auto
core.editor=vim
merge.conflictstyle=diff3
push.default=upstream
```

## Location of Git Configuration Files ##

Global configuration properties are typically saved in a hidden file named `.gitconfig` in the user's home folder
(`~/.gitconfig` on Linux and Cygwin and `C:\Users\userName\.gitconfig` on Windows).

***In all cases it is generally best to use `git` commands to modify and view configuration files.***

An example configuration file from Cygwin is:

```ini
[user]
        name = Steve Malers
        email = steve.malers@openwaterfoundation.org
[color]
        ui = auto
[core]
        editor = vim
[merge]
        conflictstyle = diff3
[push]
        default = upstream

```

and on Windows:

```ini
[user]
        name = Steve Malers
        email = steve.malers@openwaterfoundation.org
[core]
        editor = vim
[gui]
        recentrepo = C:/Users/sam/cdss-dev/Test/git-repos/test1
```

Configuration values are also saved in each repository in a file `.git/config`, for example as shown below.
Note that in this case some properties are used to indicate the remote (cloud) repository that is associated with the local repository.


```
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
        ignorecase = true
[remote "origin"]
        url = https://github.com/OpenWaterFoundation/cdss-learn-git.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
        remote = origin
        merge = refs/heads/master

```

To list user settings from the global (user) configuration file:

```
git config --list
```

