#!/bin/tcsh

#command general description of script
echo "This script will run all scripts which are necessary for the analysis of rsFMRI data"
echo "First we have to set specific variables; Please make sure that we are using the right folder with the right pathway/name"
echo "You can abort the script via 'Ctrl + C'"
echo "   "

#set variables which needs special care

#Name of folder of BIDs
echo "Please insert name of BIDS folder"
set name_bids = $<
echo "This name is used in the following $name_bids"

#set environment variables
setenv NAME_BIDS "$name_bids"

#Name of subject
echo "Please insert name of the subject"
set tsubname = $<
echo "This name is used in the following $tsubname"

#set environment variables
setenv TSUBNAME "$tsubname"

#Prompt the user to add the anatomical template
echo "  "
echo "Please add the template to the folder above the script (template for Macaques we use is 'NMT_v2.1_sym')"
echo "If you did it, press 'y'."
echo "If you want to abort the script, press 'n'."

# Wait for user input
set user_input = "$<"

# Decision based on user input
if ( "$user_input" == "y" ) then
    echo "Continuing..."
else if ( "$user_input" == "n" ) then
    echo "Aborting script..."
    exit 1  # Script aborts
else
    echo "Invalid input. Please restart the script."
    exit 1  # Script aborts on invalid input
endif

#Prompt the user to choose if they would like their anatomical data to be changed
echo "  "
echo "In the following you can choose if we should change the orientation of your anatomical data into the LIP templates orientation"
echo "If you want us to do so, press 'y'."
echo "If you want to just go on with the analysis, press 'n'."

# Wait for user input
set user_input = "$<"

#Prompt the user to choose if they would like their anatomical data to be changed
echo "  "
echo "In the following you can choose which analysis type we should conduct"
echo "If you want us to a voxel-based analysis, type in 'vw'"
echo "If you want us to do a ROI-based analysis, type in 'roiw'"
echo "If you want us to do both, type in 'both'"

# Wait for user input
set type_analysis = "$<"

# Decision based on user input
if ( "$user_input" == "y" ) then
    echo "Continuing..."
    # run the scripts for reorienting and processing the data 
    echo "First our data will put in shape of LPI template"
    tcsh reorient_flipped_LIP_to_LPI.tcsh 
    echo "(1/4): Running run_13_aw.tcsh"
    echo "This script will calculate nonlinear warps from the anatomical to a template space (here, NMT); map additional data (e.g., atlases and segmentations) between the spaces; also estimate   skullstripping brainmasking of the anatomical volume."
    tcsh run_13_aw.tcsh
    echo "  "
    echo "PLEASE READ THE NEXT INSTRUCTIONS CAREFULLY, IT IS IMPORTANT FOR THE QUALITY OF YOUR RESULTS"
    echo "  "
    echo "Please check for the results of the skull stripping in the file 'sub-"$tsubname"_anat_nsu.nii.gz' which is in the folder 'data_13_aw/sub-"$tsubname"/ses-YOURSESION"
    echo "If necessary, perform the skull stripping manually using AFNI or MRIcron"
    echo "Save the file with the same name in the folder and remove the former one"
    echo "Once you have done that, please confirm by entering 'y'"
    echo "If you want to abort the scipt, press 'n'"

    set user_skullstripping = $<
    if ( "$user_skullstripping" == "y" ) then
     echo "Continuing.."
    else if ("$user_skullstripping" == "n") then
     echo "Aborting script.."
     exit 1
    else
     echo "Invalid input. Please restart the script."
     exit 1
    endif
    
    if ( "$type_analysis" == "vw" ) then
    #running run_20
    echo "(2/4): Running run_20_ap_vox.tcsh"
    echo "This script will run afni_proc.py to generate a full FMRI processing script for *voxelwise* analysis, and carry out the processing.  This command uses the output of the *13_aw* scripts."
    tcsh run_20_ap_vox.tcsh
    
    else if ("$type_analysis" == "roiw" ) then
    #running run_22
    echo "(3/4): Running run_22_ap_roi.tcsh"
    echo "This script will run afni_proc.py to generate a full FMRI processing script for *ROI-based* analysis, and carry out the processing.  This command uses the output of the *13_aw* scripts."
    tcsh run_22_ap_roi.tcsh
    #running run_30
    echo "(4/4): Running run_30_pp_roi.tcsh"
    echo "This script will run some basic post-processing of interest.  Specifically, use the data that was processed for ROI-based analysis and calculate functional correlation matrices, based on average  time series after afni_proc.py-processing, using ROIs from the @animal_warper mapping."
    tcsh run_30_pp_roi.tcsh
    
    else if ("$type_analysis" == "both" ) then
    #running run_20
    echo "(2/4): Running run_20_ap_vox.tcsh"
    echo "This script will run afni_proc.py to generate a full FMRI processing script for *voxelwise* analysis, and carry out the processing.  This command uses the output of the *13_aw* scripts."
    tcsh run_20_ap_vox.tcsh
    #running run_22
    echo "(3/4): Running run_22_ap_roi.tcsh"
    echo "This script will run afni_proc.py to generate a full FMRI processing script for *ROI-based* analysis, and carry out the processing.  This command uses the output of the *13_aw* scripts."
    tcsh run_22_ap_roi.tcsh
    #running run_30
    echo "(4/4): Running run_30_pp_roi.tcsh"
    echo "This script will run some basic post-processing of interest.  Specifically, use the data that was processed for ROI-based analysis and calculate functional correlation matrices, based on average  time series after afni_proc.py-processing, using ROIs from the @animal_warper mapping."
    tcsh run_30_pp_roi.tcsh
    
    else
        echo "Invalid  input. Please restart the script."
    exit 1  # Script aborts on invalid input
    endif

else if ( "$user_input" == "n" ) then
    echo "Continuing with run_13_aw.tcsh"
    #command general description of script
    echo "Now this script will use these varibles to run the scripts 'run_13_aw, run_20_ap_vox, run_22_ap_roi, run_30_pp_roi' with their corresponding do*-scripts"  
    #running run_13
    echo "(1/4): Running run_13_aw.tcsh"
    echo "This script will calculate nonlinear warps from the anatomical to a template space (here, NMT); map additional data (e.g., atlases and segmentations) between the spaces; also estimate   skullstripping brainmasking of the anatomical volume."
    tcsh run_13_aw.tcsh
    echo "  "
    echo "PLEASE READ THE NEXT INSTRUCTIONS CAREFULLY, IT IS IMPORTANT FOR THE QUALITY OF YOUR RESULTS"
    echo "  "
    echo "Please check for the results of the skull stripping in the file 'sub-"$tsubname"_anat_nsu.nii.gz' which is in the folder 'data_13_aw/sub-"$tsubname"/ses-YOURSESION"
    echo "If necessary, perform the skull stripping manually using AFNI or MRIcron"
    echo "Save the file with the same name in the folder and remove the former one"
    echo "Once you have done that, please confirm by entering 'y'"
    echo "If you want to abort the scipt, press 'n'"

    set user_skullstripping = $<
    if ( "$user_skullstripping" == "y" ) then
     echo "Continuing.."
    else if ("$user_skullstripping" == "n") then
     echo "Aborting script.."
     exit 1
    else
     echo "Invalid input. Please restart the script."
     exit 1
    endif
   
     if ( "$type_analysis" == "vw" ) then
    #running run_20
    echo "(2/4): Running run_20_ap_vox.tcsh"
    echo "This script will run afni_proc.py to generate a full FMRI processing script for *voxelwise* analysis, and carry out the processing.  This command uses the output of the *13_aw* scripts."
    tcsh run_20_ap_vox.tcsh
    
    else if ("$type_analysis" == "roiw" ) then
    #running run_22
    echo "(3/4): Running run_22_ap_roi.tcsh"
    echo "This script will run afni_proc.py to generate a full FMRI processing script for *ROI-based* analysis, and carry out the processing.  This command uses the output of the *13_aw* scripts."
    tcsh run_22_ap_roi.tcsh
    #running run_30
    echo "(4/4): Running run_30_pp_roi.tcsh"
    echo "This script will run some basic post-processing of interest.  Specifically, use the data that was processed for ROI-based analysis and calculate functional correlation matrices, based on average  time series after afni_proc.py-processing, using ROIs from the @animal_warper mapping."
    tcsh run_30_pp_roi.tcsh
    
    else if ("$type_analysis" == "both" ) then
    #running run_20
    echo "(2/4): Running run_20_ap_vox.tcsh"
    echo "This script will run afni_proc.py to generate a full FMRI processing script for *voxelwise* analysis, and carry out the processing.  This command uses the output of the *13_aw* scripts."
    tcsh run_20_ap_vox.tcsh
    #running run_22
    echo "(3/4): Running run_22_ap_roi.tcsh"
    echo "This script will run afni_proc.py to generate a full FMRI processing script for *ROI-based* analysis, and carry out the processing.  This command uses the output of the *13_aw* scripts."
    tcsh run_22_ap_roi.tcsh
    #running run_30
    echo "(4/4): Running run_30_pp_roi.tcsh"
    echo "This script will run some basic post-processing of interest.  Specifically, use the data that was processed for ROI-based analysis and calculate functional correlation matrices, based on average  time series after afni_proc.py-processing, using ROIs from the @animal_warper mapping."
    tcsh run_30_pp_roi.tcsh
    
    else
        echo "Invalid  input. Please restart the script."
    exit 1  # Script aborts on invalid input
    endif    
else
    echo "Invalid input. Please restart the script."
    exit 1  # Script aborts on invalid input
endif
