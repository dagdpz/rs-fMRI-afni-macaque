#!/bin/tcsh

# Overview of the process
echo "The script will proceed through the following steps to ensure you know where potential issues may arise:"
echo "(1) Creation of the initial folder structure and scaffold"
echo "(2) Generation of sidecar files in the 'helper' folder"
echo "(3) Moving the configuration file in the 'code' folder-demand you to do it manually"
echo "(4) Conversion of DICOM files to BIDS format"
echo "(5) Demonstration of the BIDS directory structure"
echo "   "
echo "   "

# Prompt the user to enter the DICOMs folder name
echo "Please enter the name of the first folder containing your DICOM data:"
set user_input = $<  # Takes the user input and stores it in the variable user_input

# Set the environment variable MY_FILE with the user input
setenv MY_FILE "$user_input"

# Locate the specified folder
set My_path = `find ~ -type d -name "$MY_FILE" -print -quit`
echo "This pathway is used in the following: $My_path "
echo "Please make sure that this is really the pathway which should be used (you can abort script by 'Ctrl C')"

# Set My_path as an environment variable so it is also available outside the script
setenv MY_PATH1 "$My_path"

# Prompt the user to enter the DICOMs folder name
echo "Please enter the name of the second folder containing your DICOM data:"
set user_input = $<  # Takes the user input and stores it in the variable user_input

# Set the environment variable MY_FILE with the user input
setenv MY_FILE "$user_input"

# Locate the specified folder
set My_path = `find ~ -type d -name "$MY_FILE" -print -quit`
echo "This pathway is used in the following: $My_path "
echo "Please make sure that this is really the pathway which should be used (you can abort script by 'Ctrl C')"

# Set My_path as an environment variable so it is also available outside the script
setenv MY_PATH2 "$My_path"

#Promt the user to enter a subject ID (required for naming file)
echo "Please enter the subject ID:"
set user_input = $<

#Set the environment variable MY_ID with the user_input
setenv MY_ID "$user_input"

#Promt the user to enter the first session name
echo "Please enter the session name:"
set user_input = $<

#Set the environment variable MY_SES with the user_input
setenv MY_SES1 "$user_input"

#Promt the user to enter the first session name
echo "Please enter the second session name:"
set user_input = $<

#Set the environment variable MY_SES with the user_input
setenv MY_SES2 "$user_input"


#Display progress
echo "(1/5) Creating the initial folder structure and the scaffold with dcm2bids_scaffold"

#Create scaffold and folders
dcm2bids_scaffold --force

#Display progress
echo "(2/5) Generating sidecar files in the 'helper' folder with dcm2bids_helper"

#Run dcm2bids_helper to generate sidecar files
dcm2bids_helper -d "$MY_PATH1"

#Run dcm2bids_helper to generate sidecar files
dcm2bids_helper -d "$MY_PATH2"

#Prompt the user to add the configuration file
echo "  "
echo "Please add the configuration file to the 'code' folder."
echo "Once you have done that and want the code to continue, press 'y'."
echo "If you want to abort, press 'n'."

# Wait for user input
set user_input = "$<"

# Decision based on user input
if ( "$user_input" == "y" ) then
    echo "Continuing..."
    # Here goes the code that should continue
else if ( "$user_input" == "n" ) then
    echo "Aborting..."
    exit 1  # The script will abort
else
    echo "Invalid input. Please restart the script."
    exit 1  # Script aborts on invalid input
endif

#Promt the user to enter the name of the configuration file
echo "Please enter the first configuration file name:"
set user_input = $<

#Set the environment variable MY_CONF with the user_input
setenv MY_CONF1 "$user_input"

#Promt the user to enter the name of the configuration file
echo "Please enter the second configuration file name:"
set user_input = $<

#Set the environment variable MY_CONF with the user_input
setenv MY_CONF2 "$user_input"

#Display progress
echo "   "
echo "(4/5)  Converting DICOM files to BIDS format using dcm2bids "

#Convert DICOM to BIDS format
dcm2bids -d "$MY_PATH1" -p "$MY_ID" -s "$MY_SES1" -c code/"$MY_CONF1" --auto_extract_entities

#Convert DICOM to BIDS format
dcm2bids -d "$MY_PATH2" -p "$MY_ID" -s "$MY_SES2" -c code/"$MY_CONF2" --auto_extract_entities

#Display progress
echo "(5/5) Demonstrating the BIDS directory structure to verify the results"

#Verification of the BIDS structure
tree sub-"$MY_ID"/

#Move BIDS structure into another folder
mkdir ${PWD}/data_BIDS
mv sub-"$MY_ID" data_BIDS

#Prompt the user to decide if script should continue with analysing data
echo "Do you want me to continue with analysing the data?"
echo "If you want me to do this, copy the specific 'scripts' folder in the pathway from which you ran this script and press 'y'"
echo "If you don't want me to do this, press 'n'"

# Wait for user input
set user_input = "$<"

#Decision based on user input
if ( "$user_input" == "y" ) then
    echo "Continuing..."
    echo "  "
    cd scripts/
    tcsh run_all.tcsh
else if ( "$user_input" == "n" ) then
    echo "Aborting..."
    exit 1  # The script will abort
else
    echo "Invalid input. Please restart the script."
    exit 1  # Script aborts on invalid input
endif
    




