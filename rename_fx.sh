#!bin/bash
 
STUDYDIR=~/HEIDER
SUBJLIST=$STUDYDIR/IDs.txt

SERIES=04

	while read -r SUBJ || [[ -n ''$SUBJ'' ]]; do
	
	PREPROC=$STUDYDIR/PREPROC/$SUBJ

	cp $PREPROC/s0${SERIES}a001.nii.gz $PREPROC/fx.nii.gz

	done < ''$SUBJLIST''
