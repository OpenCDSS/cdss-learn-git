#!/bin/sh
(set -o igncr) 2>/dev/null && set -o igncr; # this comment is required
# The above line ensures that the script can be run on Cygwin/Linux even with Windows CRNL
#
# This script currently does not work with Git Bash because the aws script #! shebang has a space in path to Python
# Instead, use the *.bat version of this script and run from a Windows command shell.

echo "Shell script current does not work.  Use *.bat version instead."
exit 1

#
# Copy the site/* contents to the learn.openwaterfoundation.org website
# - replace all the files on the web with local files
# - location is learn.openwaterfoundation.org/cdss-learn-git
# - must specify Amazon profile

# Set --dryrun to test before actually doing
dryrun=""
#dryrun="--dryrun"
s3Folder="s3://learn.openwaterfoundation.org/cdss-learn-git"

if [ "$1" == "" ]
	then
	echo ""
	echo "Usage:  $0 AmazonConfigProfile"
	echo ""
	echo "Copy the site files to the Amazon S3 static website folder:  $s3Folder"
	echo ""
	exit 0
fi

awsProfile="$1"

# First build the site so that the "site" folder contains current content.
# - "mkdocs serve" does not do this

cd ../mkdocs-project; mkdocs build --clean; cd ../build-util

# Now sync the local files up to Amazon S3
aws s3 sync ../mkdocs-project/site ${s3Folder} ${dryrun} --delete --profile "$awsProfile"
