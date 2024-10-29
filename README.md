# rs-fMRI-afni-macaque
Resting state fMRI analysis using MACAQUE_DEMO in AFNI

Initial version by Pascal G. (deleted by Tabea B and replaced with version of Tabea B which includes a part of Pascals script (Description/Data))
Further developed by Tabea B.

# **dcm2bids_convertingTB.tcsh**

## Description:

a) Usage of this script

This script is designed to convert DICOM files to the BIDS format, allowing for further use in other programs. It is set up so that the user only needs to run it once. Commands are provided via standard output, and the user is prompted to enter input as needed.

b) Data

The data used with these scripts is from the German Primate Center (DAG, Pinocchio/Linus). They are resting state recordings of anesthetized monkeys that were separated into two sessions (predrug and postdrug). 
A drug was applied to inhibit the resting state activity of the pulvinar in the right hemisphere.

## Installation

To run this script you have to make sure that you installed the following programs (instructions are for Linux):

a) Install 'Anaconda' (source: https://www.hostinger.com/tutorials/how-to-install-anaconda-on-ubuntu/)

    1) sudo apt-get update
    2) apt-get install wget
    3) wget https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh
    4) sha256sum Anaconda3-2022.05-Linux-x86_64.sh
    5) bash Anaconda3-2022.05-Linux-x86_64.sh

b) Install dcm2bids and dcm2niix with conda. You have to create an environment called "dcm2bids" in which you install dcm2bids and dcm2niix.

    1) conda create --name dcm2bids python=3.8
    2) conda activate dcm2bids
    3) conda install -c conda-forge dcm2niix
    4) conda install -c conda-forge dcm2bids
    
c) Place the script in your current working environment.
 
    1) sudo cp /path/to/your/script.sh /usr/local/bin
    2) chmod +x /path/to/your/script.sh
    3) run with tcsh script.tcsh
    
d) Copy folder with DICOM data into home directory

    1) cp /path/to/DICOMs /home/directory

d) Running script

* To run this script you have to be in the dcm2bids environment which you activate by command 'conda activate dcm2bids' and you have to be in pathway of folder where you want the BIDS-converted data to be (cd path/to/folder).
* Run it with command 'tcsh dcm2bids_convertingTB.tcsh'

## Example

This example is based on the data of this tutorial: https://unfmontreal.github.io/Dcm2Bids/3.1.1/tutorial/first-steps/

When I ran script, this is the output; words which are surrounded with '*' were inserted by myself via standard input:

```
The script will proceed through the following steps to ensure you know where potential issues may arise:
(1) Creation of the initial folder structure and scaffold
(2) Generation of sidecar files in the 'helper' folder
(3) Moving the configuration file in the 'code' folder-demand you to do it manually
(4) Conversion of DICOM files to BIDS format
(5) Demonstration of the BIDS directory structure
   
   
Please enter the name of the folder containing your DICOM data:
*In*
 This pathway is used in the following: /home/path/to/DICOMs/In 
 Please make sure that this is really the pathway which should be used (you can abort script by 'Ctrl C')
Please enter the subject ID:
*ID01*
Please enter the session name:
*examplesession*
(1/5) Creating the initial folder structure and the scaffold with dcm2bids_scaffold
INFO    | --- dcm2bids_scaffold start ---
INFO    | Running the following command: /home/tabea/anaconda3/envs/dcm2bids/bin/dcm2bids_scaffold --force
INFO    | OS version: Linux-5.15.0-124-generic-x86_64-with-glibc2.31
INFO    | Python version: 3.9.20 (main, Oct  3 2024, 07:27:41) [GCC 11.2.0]
INFO    | dcm2bids version: 3.2.0
INFO    | Checking for software update
INFO    | Currently using the latest version of dcm2bids.
INFO    | The files used to create your BIDS directory were taken from https://github.com/bids-standard/bids-starter-kit. 

INFO    | Tree representation of /home/tabea/dcm2bids-tutorial/test_script_TB/
INFO    | /home/tabea/dcm2bids-tutorial/test_script_TB/
INFO    | ├── code/
INFO    | ├── derivatives/
INFO    | ├── sourcedata/
INFO    | ├── tmp_dcm2bids/
INFO    | │   └── log/
INFO    | │       └── scaffold_20241028-124926.log
INFO    | ├── .bidsignore
INFO    | ├── CHANGES
INFO    | ├── dataset_description.json
INFO    | ├── participants.json
INFO    | ├── participants.tsv
INFO    | └── README
INFO    | Log file saved at /home/tabea/dcm2bids-tutorial/test_script_TB/tmp_dcm2bids/log/scaffold_20241028-124926.log
INFO    | --- dcm2bids_scaffold end ---
(2/5) Generating sidecar files in the 'helper' folder with dcm2bids_helper
INFO    | --- dcm2bids_helper start ---
INFO    | Running the following command: /home/tabea/anaconda3/envs/dcm2bids/bin/dcm2bids_helper -d /home/tabea/dcm2bids-tutorial/right_output/sourcedata/dcm_qa_nih/In
INFO    | OS version: Linux-5.15.0-124-generic-x86_64-with-glibc2.31
INFO    | Python version: 3.9.20 (main, Oct  3 2024, 07:27:41) [GCC 11.2.0]
INFO    | dcm2bids version: 3.2.0
INFO    | dcm2niix version: v1.0.20240202
INFO    | Checking for software update
INFO    | Currently using the latest version of dcm2bids.
INFO    | Currently using the latest version of dcm2niix.
INFO    | Running: dcm2niix -b y -ba y -z y -f %3s_%f_%p_%t -o /home/tabea/dcm2bids-tutorial/test_script_TB/tmp_dcm2bids/helper /home/tabea/dcm2bids-tutorial/right_output/sourcedata/dcm_qa_nih/In
INFO    | Check log file for dcm2niix output

INFO    | Helper files in: /home/tabea/dcm2bids-tutorial/test_script_TB/tmp_dcm2bids/helper

INFO    | Log file saved at /home/tabea/dcm2bids-tutorial/test_script_TB/tmp_dcm2bids/log/helper_20241028-124930.log
INFO    | --- dcm2bids_helper end ---

Please add the configuration file to the 'code' folder.
Once you have done that and want the code to continue, press 'y'.
If you want to abort, press 'n'.
*y*
Continuing...
Please enter the configuration file name:
*dcm2bids_config.json*
   
(4/5)  Converting DICOM files to BIDS format using dcm2bids 
INFO    | --- dcm2bids start ---
INFO    | Running the following command: /home/tabea/anaconda3/envs/dcm2bids/bin/dcm2bids -d /home/tabea/dcm2bids-tutorial/right_output/sourcedata/dcm_qa_nih/In -p ID01 -s examplesession -c code/dcm2bids_config.json --auto_extract_entities
INFO    | OS version: Linux-5.15.0-124-generic-x86_64-with-glibc2.31
INFO    | Python version: 3.9.20 (main, Oct  3 2024, 07:27:41) [GCC 11.2.0]
INFO    | dcm2bids version: 3.2.0
INFO    | dcm2niix version: v1.0.20240202
INFO    | Checking for software update
INFO    | Currently using the latest version of dcm2bids.
INFO    | Currently using the latest version of dcm2niix.
INFO    | participant: sub-ID01
INFO    | session: ses-examplesession
INFO    | config: /home/tabea/dcm2bids-tutorial/test_script_TB/code/dcm2bids_config.json
INFO    | BIDS directory: /home/tabea/dcm2bids-tutorial/test_script_TB
INFO    | Auto extract entities: True
INFO    | Reorder entities: True
INFO    | Validate BIDS: False

INFO    | Running: dcm2niix -b y -ba y -z y -f %3s_%f_%p_%t -o /home/tabea/dcm2bids-tutorial/test_script_TB/tmp_dcm2bids/sub-ID01_ses-examplesession /home/tabea/dcm2bids-tutorial/right_output/sourcedata/dcm_qa_nih/In
INFO    | Check log file for dcm2niix output

INFO    | SIDECAR PAIRING
INFO    | sub-ID01_ses-examplesession_task-rest_bold  <-  004_In_DCM2NIIX_regression_test_20180918114023
INFO    | No Pairing  <-  005_In_DCM2NIIX_regression_test_20180918114023
INFO    | No Pairing  <-  006_In_DCM2NIIX_regression_test_20180918114023
INFO    | No Pairing  <-  007_In_DCM2NIIX_regression_test_20180918114023
INFO    | sub-ID01_ses-examplesession_dir-AP_epi  <-  003_In_EPI_PE=AP_20180918121230
INFO    | sub-ID01_ses-examplesession_dir-PA_epi  <-  004_In_EPI_PE=PA_20180918121230
INFO    | sub-ID01_ses-examplesession_dir-RL_epi  <-  005_In_EPI_PE=RL_20180918121230
INFO    | sub-ID01_ses-examplesession_dir-LR_epi  <-  006_In_EPI_PE=LR_20180918121230
INFO    | Moving acquisitions into BIDS folder "/home/tabea/dcm2bids-tutorial/test_script_TB/sub-ID01/ses-examplesession".

INFO    | Logs saved in /home/tabea/dcm2bids-tutorial/test_script_TB/tmp_dcm2bids/log/sub-ID01_ses-examplesession_20241028-125005.log
INFO    | --- dcm2bids end ---
(5/5) Demonstrating the BIDS directory structure to verify the results
sub-ID01/
└── ses-examplesession
    ├── fmap
    │   ├── sub-ID01_ses-examplesession_dir-AP_epi.json
    │   ├── sub-ID01_ses-examplesession_dir-AP_epi.nii.gz
    │   ├── sub-ID01_ses-examplesession_dir-LR_epi.json
    │   ├── sub-ID01_ses-examplesession_dir-LR_epi.nii.gz
    │   ├── sub-ID01_ses-examplesession_dir-PA_epi.json
    │   ├── sub-ID01_ses-examplesession_dir-PA_epi.nii.gz
    │   ├── sub-ID01_ses-examplesession_dir-RL_epi.json
    │   └── sub-ID01_ses-examplesession_dir-RL_epi.nii.gz
    └── func
        ├── sub-ID01_ses-examplesession_task-rest_bold.json
        └── sub-ID01_ses-examplesession_task-rest_bold.nii.gz
```

## Author

* Tabea Bruening
* German Primate Center/DAG




