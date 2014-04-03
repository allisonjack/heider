#!/bin/bash

STUDYDIR=~/HEIDER
ID=$STUDYDIR/IDs.txt

while read SUBJ || [[ -n ''$SUBJ'' ]]; do

	FEATDIR=$STUDYDIR/ANALYSIS/FSL/PRESTATS/${SUBJ}.feat
	LOUISEIN=$STUDYDIR/LOUISE_INPUTS/$SUBJ

	OUTLIERS=$STUDYDIR/PREPROC/$SUBJ/motion_outliers.txt
	PARFILE=$FEATDIR/mc/prefiltered_func_data_mcf.par
	
	paste $OUTLIERS $PARFILE >> $FEATDIR/confound_evs.txt
	paste $OUTLIERS $PARFILE >> $LOUISEIN/confound_evs.txt

done < ''$ID''
