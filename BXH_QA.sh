#!bin/bash
 
#This script creates BXH headers and performs QA analysis
 
STUDYDIR=~/HEIDER
 
cd $STUDYDIR
	
	for SUBJ in 9999_01; do
	
	OUTDIR=$STUDYDIR/PREPROC/$SUBJ
		 
		for SRS in fx; do
			analyze2bxh ${OUTDIR}/${SRS}.nii.gz ${OUTDIR}/${SRS}.bxh
			fmriqa_generate.pl $OUTDIR/${SRS}.bxh $OUTDIR/QA_${SRS}
		done
	
	done
