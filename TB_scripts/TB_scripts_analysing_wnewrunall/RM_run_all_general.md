# **run_all.tcsh** - general informations

## Description

a) Usage of this script

* This script is designed to analyse MRI data which was already converted into the BIDS structure. Therefore it uses the scripts 'run\_13.tcsh', run\_20\_ap\_vox.tcsh', 'run\_22_ap\_roi.tcsh', 'run\_30\_pp\_roi.tcsh' with their corresponding 'do\_*' scripts and 'reorient\_flipped\_LIP\_to\_LPI.tcsh'. Further descriptions of the individual scripts are listed in 'Supplementary informations'. To analyse the data, this script will first ask several questions about the name of the BIDS folder and the name of the subject. Then it will ask the user if the data should first be reorientated to fit the LIP template. The user can answer with inserting specific keyboard shortcut like commanded via standard output from the script itself. The further process relays on the users input. When you want to see how an example output would look like, please refer to the section 'Example'. 
* I mentioned in the headline that this is only the general information of the script. The reason for that is that I created three folders with three different scripts. One will fullfill a 3mm smoothing on the data ('TB\_scripts\_analysing\_smoothing3mm') while the other is not doing a smoothing at all ('TB\_scripts\_analysing\_wosmoothing'). The third folder contains scripts which can be runned individually with 3mm smoothing and without ('TB\_scripts\_analysing\_individual\_executable'). So you can rerun a individual script when one did not work properly. You can decide which you want to use and then you can copy the specific scripts folder, or in the case of an individual run, the specific do and run scripts, into your analysing directory.
* This run_all.tcsh script is different, because now the user can choose the analysis type and type in their choice via standard input. In the former run\_all.tcsh script the user couldn't choose and the script did both voxel-based and ROI-based analysis.
   
b) Data

The data used with these scripts is from the German Primate Center (DAG, Pinocchio/Linus). They are resting state recordings of anesthetized monkeys that were separated into two sessions (predrug and postdrug). A drug was applied to inhibit the resting state activity of the pulvinar in the right hemisphere.

c) Supplementary informations
   
   * reorient\_flipped\_LIP\_to\_LPI.tcsh: Take current anatomical data and change its orientation so it fits the LPI template
   
   * run\_13.tcsh                        : Run @animal warper to calculate nonlinear warps from the anatomical to a template space (here, NMT); map additional data (e.g., atlases and segmentations) between  the spaces; also estimateskullstripping/brainmasking of the anatomical volume.
   
   * run\_20\_ap\_vox.tcsh               : Run afni\_proc.py to generate a full FMRI processing script for voxelwise analysis, and carry out the processing. This command uses the output of the 13\_aw scripts.

   * run\_22\_ap\_roi.tcsh               : Run afni\_proc.py to generate a full FMRI processing script for ROI-based analysis, and carry out the processing. This command uses the output of the 13\_aw scripts.

   * run\_30.\_pp\_roi.tcsh              : Run some basic post-processing of interest. Specifically, use the data that was processed for ROI-based analysis and calculate functional correlation matrices, based on average time series after afni_proc.py-processing, using ROIs from the @animal\_warper mapping.
   
   * The corresponding do\_* scripts are included in the run\_* scripts and are responsible for it to run 
   * Information is from the README file from the MACAQUE\_DEMO\_REST
   * The do\_* and run\_* scripts are from the MACAQUE\_DEMO\_REST and are changed to fit this run\_all.tcsh script and make it more user friendly. The same is done with 'reorient\_flipped\_LIP\_to\_LPI.tcsh' which was initially created by Pascal G.
   
## Installation

a) General Instructions 
   * This script is designed to run with afni version 'AFNI_24.3.06 'Elagabalus'' and newer. 
   * Before you run this script, you have to make sure that:

      1) Your BIDS data is in another folder (in upper directory)
      2) Your AFNI binaries are updates (!)
        * You can update them with: @update.afni.binaries
      3) You have everything installed which is necessary to analyse the data
        * You can check that with : afni\_system\_check.py -check\_all
      4) You change your name of the anatomical data so that there is '0101\_T1w.tcsh' in the end

b) Running script

   * This script is made to be runned from the scripts directory which should be in a folder with the BIDS structure and the template, the scripts folder should be only filled with the scripts and above should be the BIDS structure and the template
   * You can run this script with 'tcsh run\_all.tcsh'
   
## Example
This example is based on the data of this tutorial: https://unfmontreal.github.io/Dcm2Bids/3.1.1/tutorial/first-steps/

When I ran script, this is the output; words which I surrounded afterwards with '*' were inserted by myself via standard input:

```
This script will run all scripts which are necessary for the analysis of rsFMRI data
First we have to set specific variables; Please make sure that we are using the right folder with the right pathway/name
You can abort the script via 'Ctrl + C'
   
Please insert name of BIDS folder
*In*
This name is used in the following In
Please insert name of the subject
*ID01*
This name is used in the following ID01
  
Please add the template to the folder above the script (template for Macaques we use is 'NMT_v2.1_sym')
If you did it, press 'y'.
If you want to abort the script, press 'n'.
*y*
Continuing...
  
In the following you can choose if we should change the orientation of your anatomical data into the LIP templates orientation
If you want us to do so, press 'y'.
If you want to just go on with the analysis, press 'n'.
*n*
  
In the following you can choose which analysis type we should conduct
If you want us to a voxel-based analysis, type in 'vw'
If you want us to do a ROI-based analysis, type in 'roiw'
If you want us to do both, type in 'both'
*vw*
Continuing with xy

...
```

## Authors

* Tabea Bruening
* German Primate Center/DAG
* AFNI/MACAQUE\_DEMO\_REST
* Pascal G.
   
     
