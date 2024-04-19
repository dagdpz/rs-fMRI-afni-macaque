README.txt

Data
The data used with these scripts is from Linus_20230704. They are resting state recordings of an anesthetized monkey that were separated into two sessions (predrug and postdrug). 
A drug was applied to inhibit the resting state activity of the pulvinar in the right hemisphere. With these scripts we determined if there is a difference 
in the resting state activity of the whole brain when comparing the two different conditions.

mac_1003:			contains anatomical scans, 0101_T1w and 0102_T1w. T1w was used for skull-stripping and alignment to EPI for Linus20230704
mac_1004:			functional runs before drug injection (runs 1-6)
mac_1005:			functional runs after drug injection (runs 7-10)

MRI folder structure
Everything can be found in the /MRI folder. 
Archive: 			failed attempts, old versions, etc. These files serve no purpose anymore
data: 				original dicom files, unedited nifti files in bids-structure
Linus_analysis: 		analyzed data from Linus (recordings from 20230704 and 20131015) with and without smoothing
MACAQUE_DEMO:			the analyzed macaque demo provided by AFNI, the unmodified do_* and run_* scripts are also here 
Tests:				Testing certain things such as new scripts or modifications of already existing ones 

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Scripts

The two folders provided in github (scripts, scripts_ordered) contain the same files, but the 'scripts' folder can be copied like it is to start the data analysis for your dataset, no structural changes need to be made to this directory. the 'scripts_ordered' directory is ordered more intuetively but would need to be structured in the same way as 'scripts' to work for data analysis. Additionally, 'scripts_ordered' contains .json config files for dcm2bids and .ipynb scripts for further data analysis such as creating histograms of correlation coefficients for visualization and for statistical tests.

the do_* and run_* scripts were provided by the MACAQUE_DEMO from the AFNI docs and were modified to suit our data.
The scripts provided are used to analyze the dataset of Linus_20230704. Modify the path variables in the script to be suitable for your analysis.

All scripts were made to be run from the /scripts directory (exemplary structure in the MACAQUE_DEMO), meaning they should all (except for the .json files) be in one folder without other subdirectories. For that you can just copy the 'scripts' folder from github. If you want to use the provided .json files as config files for dcm2bids, move them into the /code directory created by dcm2bids_scaffold (described in dcm2bids).

A custom tcsh script was written to automate the process of correctly orienting anatomical and EPI recordings. 
Python scripts were written for further analysis and validation of the results. 

do_13_aw.tcsh: 		runs animal warper to perform alignment of subject to template and skull-stripping
run_13_aw.tcsh: 		loops do_13_aw over subjects and sessions 

do_20_ap_vox: 			uses afni_proc.py to align EPI recordings to skull-stripped anatomical in a voxelwise manner
run_20_ap_vox.tcsh: 		loops do_20_ap_vox over subjects and sessions 

do_22_ap_roi.tcsh: 		uses afni_proc.py to align EPI recordings to skull-stripped anatomical in a roi-based manner
run_22_ap_roi.tcsh: 		loops do_22_ap_roi over subjects and sessions 

do_30_pp_roi.tcsh: 		creates correlation matrix and plots of the roi-based analysis using 3dnetcorr and others
run_30_pp_roi.tcsh: 		loops do_30_pp_roi over subjects and sessions 

run_all.tcsh: 			assumes that you have a dcm2bids structure and runs all steps there:
				- reorient_flipped_LIP_to_LPI
				- all run_* scripts 
	
dcm2bids_scaffold_helper.tcsh: creates bids scaffold and helper files to write your config file. Three exemplary config files are provided.

dcm2bids_conv:			an example of a dcm2bids command which creates the bids structure and then moves the bids directory to the data_basic folder where the analysis with the run_* scripts continues

In case you do not want to run all scripts, you can run them separately with the dcm2bids package to convert DICOMs to NIFTI and with the run_* scripts. To run tcsh scripts type (e.g.) the following into the terminal: tcsh run_13_aw.tcsh

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

dcm2bids
How to get started is explained here: https://unfmontreal.github.io/Dcm2Bids/3.1.1/

But to give a brief overview:
- !Use '-h' as an options for the commands to view all options and their explanations!
- first run 'dcm2bids_scaffold', this command will create empty folders for the bids structure such as code (for the config file you will create later), sourcedata, etc.
- move your DICOM data into the sourcedata folder; it is fine to copy entire directories, does not need to be raw unordered dicoms 
- run 'dcm2bids_helper', this command creates json files that you can extract information from to create a config file. This step has to be done manually as you need to find unique identifiers for 
  the different NIFTI files you want to create. Three exemplary config files are provided and labeled according to their corresponding data
- after you manually created your config file, you run 'dcm2bids' where you specify the created config file among others. this command creates the final bids structure in the directory you specified
  and converts the Dicom files to NIFTI files

The script 'dcm2bids_scaffold_helper.tcsh' runs dcm2bids_scaffold and dcm2bids_helper. the script 'dcm2bids_conv' is an example of a dcm2bids command which creates the bids structure and then moves the bids directory to the data_basic folder where the analysis with the run_* scripts continues.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Requirements
For the scripts to work you need basic data with anatomical and functional scans which are ordered in the bids structure with a separation into sessions.
Atlas and template, provided in the MACAQUE_DEMO to copy into the directory one above 'scripts' (NMT_v2.1_sym; you will need the whole folder).
dcm2bids installed with conda, afni version 24.0.12 or newer, Python matplotlib.pyplot

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Instructions with Linus20230704 as an example

- Copy the 'scripts' folder from github: rs-fMRI-afni-macaque
- run the script 'dcm2bids_scaffold_helper.tcsh'
- put dicom data into the 'sourcedata' directory
- put the config file into the /bids_structure/code (in case of Linus20230704 you need one config file for every session, hence why there are two config files for that dataset)
- run 'dcm2bids_conv'
- copy the NMT_v2.1_sym folder into the directory one above scripts 
- run 'run_all.tcsh'

If you want to use any other dataset, modify the paths in these scripts: dcm2bids_scaffold_helper, dcm2bids_conv, all of the do_* and run_* scripts 
