# This script uses FSL's BET (Brain Extraction Tool) to strip skull and other non-brain material from the structural image. 

#!bin/bash

STUDYDIR=~/HEIDER
 
cd $STUDYDIR

SUBJ=9999_01

ANATDIR=$STUDYDIR/PREPROC/${SUBJ}
ANAT=$ANATDIR/anat.nii.gz
 
bet $ANAT $ANATDIR/anat_brain.nii.gz -f .3 -g -.15 -o -m -R

#-f fractional intensity threshold (0 <-> 1); default=0.5
#	smaller values give larger brain outline estimates
#-g gradient (-1 <-> 1); default=0
#	positive values give larger brain outline at bottom, smaller at top
 
cd $ANATDIR
 
fslview anat_brain_overlay.nii.gz
 
#close fslview to return to command line
