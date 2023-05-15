#!/bin/bash

# A practice script by Priyanka

cd /Users/priyankareddy/Desktop

mkdir PracticeFolder
cd /Users/priyankareddy/Desktop/PracticeFolder
mkdir Subj1
mkdir Subj2
cd /Users/priyankareddy/Desktop

export subjList=$1

for subj in `cat $subjList`
do
	echo $subj
	cd /Users/priyankareddy/Desktop/PracticeFolder/$subj
	
	mkdir Trial

	cd /Users/priyankareddy/Desktop
done

