#!/bin/bash

script_name=$(basename $0)
cd "${PROJECT_PATH}/"

if [ $# -gt 0 ]
then
	case $1 in
		b) type='bug' ;;
		e) type='epic' ;;
		f) type='feature' ;;
		h) type='hotfix' ;;
		*) echo 'Invalid type!' ; exit ;;
	esac
else
	type='master'
fi

if [ $# -gt 1 ]
then
	if [[ $2 =~ [0-9]+[_]?[a-z]* ]]
	then
		task=$2
	else
		echo 'Invalid task!' ; exit
	fi
else
	task='0'
fi

if [ $# -gt 2 ]
then
	if [[ $3 =~ [A-Z]+ ]]
	then
		prefix=$3
	else
		echo 'Invalid prefix!' ; exit
	fi
else
	prefix='PZ'
fi

if [ $# -gt 3 ]
then
	echo "Usage: ${script_name} [ type [ task [ prefix ]]]"
	exit
fi

if [ $type == 'master' ]
then
	branch="master"
	echo "Selected master branch:"
elif [ $task != '0' ]
then
	branch="${type}/${prefix}-${task}"
	echo "Selected branch ${branch}:"
else
	branch=""
	echo "Selected invalid branch:"
fi

if [ -z $branch ]
then
	echo
	echo 'Done!'
	exit
fi

echo
echo "Downloading branches from remote repository..."
git fetch origin

echo
echo "Switching to master branch..."
git checkout master

echo
echo "Updating master branch from remote repository..."
git pull

if [ $branch == 'master' ]
then
	echo
	echo 'Done!'
	exit
fi

echo
echo "Switching to branch ${branch}..."
git checkout $branch

if [ $? -ne 0 ]
then
	echo
	echo "Creating new branch ${branch}..."
	git checkout -b $branch
fi

echo
echo "Updating branch ${branch} from remote repository..."
git pull

if [ $? -ne 0 ]
then
	echo
	echo "Uploading branch to remote repository..."
	git push --set-upstream origin $branch
fi

echo
echo "Applying changes from master branch..."
git merge master

echo "Updating branch in remote repository..."
echo
git push

echo
echo 'Done!'
