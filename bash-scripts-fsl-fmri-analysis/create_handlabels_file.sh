# Hand label good and bad components for all subjects selected to be in the Training sample

export trainSubj=$1 subjDir=$2 icaDir=$3 parentDir=$4 doLabeling=$5

#if [ $doLabeling -eq 1 ]
#then

cd $parentDir/$subjDir

for tsubj in `cat $trainSubj`
do
	echo Label good and bad components of $tsubj

	
	cd $tsubj
	cd $icaDir

	firefox report.html

	read -p "Create a text file called hand_labels_noise.txt and list the bad components in the following format: [1,2,...,N]. Save this file in the current directory (i.e. the ICA 			 Directory. Press any key to continue"

	cd $parentDir/$subjDir
done

#fi
