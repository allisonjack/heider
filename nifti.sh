#Convert from DICOM to compressed NiFTI

#!bin/bash
STUDYDIR=/Users/aj349/Documents/HEIDER

OUTSUBJ=9999_01

	for SUBJ in 9999.01; do
	
		for RAW in 002 004; do
	
			DICOMDIR=$STUDYDIR/DICOM/$SUBJ/$RAW
			OUTDIR=$STUDYDIR/PREPROC/$OUTSUBJ
		
			mkdir -p $OUTDIR
		
			dcm2nii -d n -p n -a n -o $OUTDIR $DICOMDIR/*
			
			# -d: date in filename (y/n, default y)
			# -p: protocol in filename (y/n, default y)
			# -a: anonymize (y/n, default y)
			# -o: output directory 
				
		done
	
	done
