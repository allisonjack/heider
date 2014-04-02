#!bin/bash
 
STUDYDIR=/Users/aj349/Documents/HEIDER
TEMPLATEDIR=$STUDYDIR/TEMPLATES

SUBJLIST=$TEMPLATEDIR/IDs.txt

	while read -r SUBJ || [[ -n "$SUBJ" ]]; do
	
	PREPROC=$STUDYDIR/PREPROC/$SUBJ

	cp $PREPROC/cos*.nii.gz $PREPROC/anat.nii.gz

	done < "$SUBJLIST"
