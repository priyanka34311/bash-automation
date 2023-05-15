#!/bin/bash

## This script computes mean displacement values (mm) 

#export REL_ON=$1
#export ABS_ON=$2
#export PARENTDIR=$3
#export SUBJDIR=$4
#export ICADIR=$5

PARENTDIR=/data/microcorr5/rsfMRITestForPriyanka/Subjects
SUBJDIR=Subj001
ICADIR=rsfmri_SingleSession.ica

MATDIR=$PARENTDIR/$SUBJDIR/$ICADIR/mc/prefiltered_func_data_mcf.mat
REGDIR=$PARENTDIR/$SUBJDIR/$ICADIR/reg
REFVOL=$REGDIR/example_func.nii.gz
IDENT=/netopt/rhel7/versions/fsl/fsl_5.0.8/etc/flirtsch/ident.mat   
RMSOUT_ABS=$PARENTDIR/$SUBJDIR/$ICADIR/rmsdiff_abs.txt
RMSOUT_REL=$PARENTDIR/$SUBJDIR/$ICADIR/rmsdiff_rel.txt

# Computes Absolute Displacement (mm)

cd $MATDIR
vols=$(ls -l | wc -l)
echo There are $vols volumes.

cd $PARENTDIR/$SUBJDIR/$ICADIR

for ((i = 0; i < $vols; ++i)) 
do                   
	printf -v num '%04d' $i
        rmsdiff $MATDIR/MAT_${num} $IDENT $REFVOL > $RMSOUT_ABS
done

# Computes Relative Displacement (mm)


cd $MATDIR
vols=$(ls -l | wc -l)
echo There are $vols volumes.

cd $PARENTDIR/$SUBJDIR/$ICADIR

j=1
             for ((i = 1; i < $vols; ++i)); do                   
		printf -v num '%04d' $i
		lag=$((i-j))
		printf -v num_lag '%04d' $lag
                rmsdiff $MATDIR/MAT_${num} $MATDIR/MAT_${num_lag} $REFVOL > $RMSOUT_REL
        
	     done


