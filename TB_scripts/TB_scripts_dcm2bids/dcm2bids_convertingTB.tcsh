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
echo "Please enter the name of the folder containing your DICOM data:"
set user_input = $<  # Takes the user input and stores it in the variable user_input

# Set the environment variable MY_FILE with the user input
setenv MY_FILE "$user_input"

# Locate the specified folder
set My_path = `find ~ -type d -name "$MY_FILE" -print -quit`
echo "This pathway is used in the following: $My_path "
echo "Please make sure that this is really the pathway which should be used (you can abort script by 'Ctrl C')"

# Set My_path as an environment variable so it is also available outside the script
setenv MY_PATH "$My_path"

#Promt the user to enter a subject ID (required for naming file)
echo "Please enter the subject ID:"
set user_input = $<

#Set the environment variable MY_ID with the user_input
setenv MY_ID "$user_input"

# Verification
echo "This subject ID is used in the following: $My_ID "

#Promt the user to enter the session name
echo "Please enter the session name:"
set user_input = $<

#Set the environment variable MY_SES with the user_input
setenv MY_SES "$user_input"

# Verification
echo "This session-name is used in the following: $My_SES "

#Display progress
echo "(1/5) Creating the initial folder structure and the scaffold with dcm2bids_scaffold"

#Create scaffold and folders
dcm2bids_scaffold --force

#Display progress
echo "(2/5) Generating sidecar files in the 'helper' folder with dcm2bids_helper"

#Run dcm2bids_helper to generate sidecar files
dcm2bids_helper -d "$MY_PATH"

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
echo "Please enter the configuration file name:"
set user_input = $<

#Set the environment variable MY_CONF with the user_input
setenv MY_CONF "$user_input"

#Display progress
echo "   "
echo "(4/5)  Converting DICOM files to BIDS format using dcm2bids "

#Convert DICOM to BIDS format
dcm2bids -d "$MY_PATH" -p "$MY_ID" -s "$MY_SES" -c code/"$MY_CONF" --auto_extract_entities

#Display progress
echo "(5/5) Demonstrating the BIDS directory structure to verify the results"

#Verification of the BIDS structure
tree sub-"$MY_ID"/


