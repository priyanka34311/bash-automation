#!/bin/bash

# Script to create filelist_fix_training.txt

# Created in 201708 by Priyanka

export trainSubj=$1 icaDir=$2 parentDir=$3 subjDir=$4 createFileFixTrain=$5

if [ $createFileFixTrain -eq 1 ]
then
	echo "Creating filelist_fix_training.txt"
	cd $parentDir/$subjDir

for subj in `cat $trainSubj`
do
	echo $subj

	echo $parentDir/$subjDir/$subj/$icaDir >> filelist_fix_training.txt

done

fi 
