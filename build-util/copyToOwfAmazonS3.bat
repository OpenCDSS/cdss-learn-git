@echo off
rem
rem Copy the site/* contents to the learn.openwaterfoundation.org website.
rem - replace all the files on the web with local files

rem Set --dryrun to test before actually doing
set dryrun=""
rem dryrun="--dryrun"

set s3Folder="s3://learn.openwaterfoundation.org/cdss-learn-git"

if "%$1%" == "" (
	echo ""
	echo "Usage:  copyToOwfAmazonS3 AmazonConfigProfile"
	echo ""
	echo "Copy the site files to the Amazon S3 static website folder:  %s3Folder%"
	echo ""
)

set awsProfile=%1%

rem First build the site so that the "site" folder contains current content.
rem - "mkdocs serve" does not do this
cd ../mkdocs-project
mkdocs build --clean
cd ../build-util

@echo on

rem Now sync the local files up to Amazon S3
rem - apparently can't pass an empty argument so comment out %dryrun%
rem %dryrun%

call aws s3 sync ../mkdocs-project/site %s3Folder% --delete --profile %awsProfile%
