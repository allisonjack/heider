#!bin/bash

STUDYDIR=~/HEIDER
STATDIR=$STUDYDIR/ANALYSIS/FSL/INDIV_DIFF
ID=$STUDYDIR/IDs.txt

STATFILE=$STUDYDIR/motion_outliers_count.txt
printf "ID\toutlier.count\n" >> $STATFILE

while read -r SUBJ || [[ -n ''$SUBJ'' ]]; do

	PREPROC=$STUDYDIR/PREPROC/$SUBJ

	INPUT=$PREPROC/fx.nii.gz	
	TRIM=$PREPROC/fx_trim.nii.gz

	OUTPUT=$PREPROC/motion_outliers.txt
	DVARS=$PREPROC/dvars_values.txt

	fslroi $INPUT $TRIM 5 176

 	fsl_motion_outliers -i $TRIM -o $OUTPUT --dvars -s $DVARS

	touch $OUTPUT
 
 	MOCOUNT=$(awk '{print NF}' $OUTPUT | sort -nu | tail -n 1)
  	
 	printf "${SUBJ}\t${MOCOUNT}\n" >> $STATFILE

done < $ID
