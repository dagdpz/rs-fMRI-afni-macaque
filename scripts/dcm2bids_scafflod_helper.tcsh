##!/bin/tcsh

# Requirements: dcm2bids installed, pref as conda environment 

set out_dir = ${PWD}/bids_structure
set path_to_dicoms = /MRI/data/Pinocchio/20210625

conda activate dcm2bids 

#Creates bids directories such as sourcedata, code, etc.; output directory (-o) doesn't need to exist beforehand, it is created by the command as well
# Creates structure one above the scripts directory
dcm2bids_scaffold -o ${out_dir}

cp -r ${path_to_dicoms} ${PWD}/bids_structure/sourcedata

# creates temporary files useful for creating final config file. 
dcm2bids_helper -d ${PWD}/bids_structure/sourcedata/20210625 -o ${out_dir}/tmp_dcm2bids/helper
