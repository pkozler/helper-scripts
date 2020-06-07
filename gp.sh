#!/bin/bash

script=$(basename $0)
cd "${PROJECT_PATH}/"

if [ $# -gt 2 ]
then
	echo 'Invalid parameters!'
	exit
fi

branch="$(git symbolic-ref HEAD 2>/dev/null)" ||
branch="" # detached HEAD

if [ -z "${branch}" ]
then
	echo 'Unnamed branch - operation canceled!'
	exit
fi

branch=${branch##refs/heads/}
task=$(echo $branch| cut -d'/' -f 2)

echo "Task: ${task}"

echo
echo 'Checking...'
git status

if [ $# -lt 1 ]
then
	echo
	echo 'Missing commit message - performing push only...'
else
	commit=$(echo "${task} ${1}")

	echo
	echo $commit

	echo
	echo 'Moving changes to the staging area...'
	git add .

	echo
	echo 'Saving changes to the local repository...'

	git commit -m"$commit"
fi

echo
echo 'Updating remote repository...'
git push

if [ $? -ne 0 ]
then
	echo
	echo 'Update failed - updating local repository...'
	git pull

	echo
	echo 'Updating remote repository...'
	git push

	if [ $? -ne 0 ]
	then
		echo
		echo 'Unable to update - operation aborted!'
		exit
	fi
fi

echo
echo 'Operation successfully completed!'
