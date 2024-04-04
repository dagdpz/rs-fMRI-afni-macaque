#!/bin/tcsh


set subj = Linus

# creates bids structure by converting dicom to nifti and putting them into their respective directory
dcm2bids -d ${PWD:h}/bids_structure/sourcedata/Linus/20230704 -s predrug -c ${PWD:h}/bids_structure/code/Linus20230704_dcm2bids_MRI_ses1_config.json -p ${subj} --auto_extract_entities -o ${PWD:h}


mkdir ${PWD:h}/data_basic

mv ${PWD:h}/sub-${subj} ${PWD:h}/data_basic

