#!bin/bash
STUDYDIR=~/HEIDER

for SUBJ in 9999.01; do

	for RAW in 002 004; do
	
		DICOMDIR=$STUDYDIR/DICOM/$SUBJ/$RAW
		OUTDIR=$STUDYDIR/DICOM/$SUBJ/$RAW
	
		mkdir -p $OUTDIR
	
		z=1;
			for g in $DICOMDIR/*; do
			   mv $g $OUTDIR/$z
			   echo "converting $g to $z"
			   z=$( expr $z + 1 )
			done
	
	done

done
