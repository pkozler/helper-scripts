#!/bin/bash

project_path='/c/shipgratis/'
script_name=$(basename $0)

cd $project_path

if [ $# -gt 2 ]
then
	echo 'Invalid parameters!'
	exit
fi

branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
branch_name="" # detached HEAD

if [ -z "${branch_name}" ]
then
	echo 'Unnamed branch - operation canceled!'
	exit
fi

branch_name=${branch_name##refs/heads/}
task_name=$(echo $branch_name| cut -d'/' -f 2)

echo "Task: ${task_name}"

echo
echo 'Checking...'
git status

if [ $# -lt 1 ]
then
	echo
	echo 'Missing commit message - operation canceled!'
	exit
fi

commit_message="${task_name} ${1}"

echo
echo $commit_message

echo
echo 'Moving changes to the staging area...'
git add .

echo
echo 'Saving changes to the local repository...'
git commit -m $(echo commit_message)

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