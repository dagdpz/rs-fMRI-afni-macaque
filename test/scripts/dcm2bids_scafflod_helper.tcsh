#!/bin/tcsh

# Requirements: dcm2bids installed, pref as conda environment 

set out_dir = ${PWD:h}/bids_structure

conda activate dcm2bids 

#Creates bids directories such as sourcedata, code, etc.; output directory (-o) doesn't need to exist beforehand, it is created by the command as well
# Creates structure one above the scripts directory
dcm2bids_scaffold -o ${out_dir}

# creates temporary files useful for creating final config file. 
dcm2bids_helper -d /MRI/Linus/20131015/ -o ${out_dir}/tmp_dcm2bids/helper
