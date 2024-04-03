#!/bin/tcsh



# creates bids structure by converting dicom to nifti and putting them into their respective directory
dcm2bids -d sourcedata/Linus/20131015 -s predrug -c code/dcm2bids_MRI_ses2_config.json -p Linus --auto_extract_entities


mkdir ${PWD:h}/data_basic

mv sub-Linus ${PWD:h}/data_basic



# run the scripts for reorienting and processing the data 
tcsh reorient_flipped_LIP_to_LPI.tcsh 

tcsh run_13_aw.tcsh

#tcsh tcsh run_20_ap_vox.tcsh 

tcsh run_22_ap_roi.tcsh

tcsh run_30_pp_roi.tcsh
