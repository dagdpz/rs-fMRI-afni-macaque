# **script-organization**

## **TB_scripts_analysing**

* Contains scripts for analysing BIDS data
* Scripts for 3mm smoothing, without smoothing and for individual runs
* Each run\_all.tcsh script provides commands for the user to insert names or to copy a folder into the directory
* This run\_all script will do both, voxel-based and ROI-based analysis

## **TB_scripts_analysing_wnewrunall**

* Contains scripts for analysing BIDS data
* Scripts for 3mm smoothing, without smoothing and for individual runs
* Each run\_all.tcsh script provides commands for the user to insert names or to copy a folder into the directory
* Difference to run\_all.tcsh scripts from TB\_scripts_analysing : User can choose if he/she want the script to carry out a voxel-based, ROI-based or both types of analysis

## **TB_scripts_dcm2bids**

* Contains script which converts DICOM data into BIDS structure
* Provides commands for user to insert names

## **TB_scripts_dcm2bids_converting_analysing**

* Contains script which converts DICOM data into BIDS structure
* Provides commands for user to insert names
* Difference to TB\_scripts\_dcm2bids: user can decide via standard input if script should continue with analysis (start run_all)

## **TB_scripts_dcm2bids_preandpostdrug_2config**

* Contains script which converts DICOM data into BIDS structure
* Provides commands for user to insert names
* Difference to TB_scripts_dm2bids: script suppose that you have two configuration files with two different sessions and folder in which this data is

## **TB_scripts_analysing_runall_withbreak**

* Contains scripts for analysing BIDS data
* Scripts for 3mm smoothing, without smoothing and for individual runs
* Each run\_all.tcsh script provides commands for the user to insert names or to copy a folder into the directory
* User can choose if he/she want the script to carry out a voxel-based, ROI-based or both types of analysis
* Difference to TB\_scripts\_analysing\_wneweunall : I implemented a break between run\_13_aw.tcsh and following analysing scripts in which user is asked to check the results from the skull stripping. The exact name of the file which should be checked and the way to it is provided. The user can confirm it with a keyboard shortcut or they can abort the script.