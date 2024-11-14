#!/bin/tcsh

#command general description of script
echo "This script will run all scripts which are necessary for the analysis of rsFMRI data"
echo "First we have to set specific variables; Please make sure that we are using the right folder with the right pathway/name"
echo "You can abort the script via 'Ctrl + C'"

#set variables which needs special care

# finding script folder
echo "Please insert the name of the scripts folder"
set dir_scr       = $<
# Locate the specified folder
set My_path = `find ~ -type d -name "$dir_scr" -print -quit`
echo "This pathway is used in the following: $My_path "

#Pathway to folder in which this should take place
echo "Please insert folder name in which script run_13 should take place"
set dir_inroot    = $<
# Locate the specified folder
set My_path_inroot = `find ~ -type d -name "$dir_inroot" -print -quit`
echo "This pathway is used in the following: $My_path_inroot "

#Name of folder of BIDs
echo "Please insert name of BIDs folder"
set name_bids = $<
echo "This name is used in the following $name_bids"
set dir_basic     = ${My_path_inroot}/${name_bids}

# set environment variables
setenv DIR_SCR $dir_scr
setenv MY_PATH $My_path
setenv DIR_INROOT $dir_inroot
setenv MY_PATH_INROOT $My_path_inroot
setenv NAME_BIDS $name_bids
setenv DIR_BASIC $dir_basic

#command general description of script
echo "Now this script will use these varibles to run the scripts 'run_13_aw, run_20_ap_vox, run_22_ap_roi, run_30_pp_roi' with their corresponding do*-scripts"  

#running run_13
echo "(1/4): Running run_13_aw.tcsh"
echo "This script will calculate nonlinear warps from the anatomical to a template space (here, NMT); map additional data (e.g., atlases and segmentations) between the spaces; also estimate skullstripping brainmasking of the anatomical volume."
tcsh run_13_awTB.tcsh

#running run_20
echo "(2/4): Running run_20_ap_vox.tcsh"
echo "This script will run afni_proc.py to generate a full FMRI processing script for *voxelwise* analysis, and carry out the processing.  This command uses the output of the *13_aw* scripts."
tcsh run_20_ap_voxTB.tcsh

#running run_22
echo "(3/4): Running run_22_ap_roi.tcsh"
echo "This script will Run afni_proc.py to generate a full FMRI processing script for *ROI-based* analysis, and carry out the processing.  This command uses the output of the *13_aw* scripts."
tcsh run_22_ap_roiTB.tcsh

#runing run_30
echo "(4/4): Running run_30_pp_roi.tcsh"
echo "This script will run some basic post-processing of interest.  Specifically, use the data that was processed for ROI-based analysis and calculate functional correlation matrices, based on average time series after afni_proc.py-processing, using ROIs from the @animal_warper mapping."
tcsh run_30_pp_roiTB.tcsh
