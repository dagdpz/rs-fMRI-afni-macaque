# Code for converting the netts data of the correlation matrix into a long format CSV file

## Description

**a) Usage of this script**

This script is created to convert the data of the .netss file from run_30 (AFNI) into a long format and into a CSV file. This is crucial, since it is necessary for creating a violin plot (for instance) to work with a csv file. Additionally, comparisons and calculating is easier with a long fomat correlation matrix and with a CSV file. 

When extracting the time series data of each ROI, multiple files are generated—each named according to the number of a specific ROI, as indicated in the accompanying folders of the template or atlas files. The code processes these files by replacing the numerical identifiers with their corresponding ROI abbreviations. These abbreviations are then also used in the long-format correlation matrix. For example, the ROI CL_ACC is associated with the number 3.

In this code, initially, the user have to insert the name of the text files possesing their data of the correlation matrix. Then, they have to crete a name for the later CSV file. With the data of the correlation matrix, the code is extracting the number of ROIs being compared and the headerline. With this information, it can match the ROIs to the specific columns and lines as in the code for generating histograms. Then, the CSV files are created.

**b) Data**

The data used with these scripts is from the German Primate Center (DAG, Pinocchio/Linus/Norman/Rio/Curius). They are resting state recordings of anesthetized monkeys that were ones (in one dataset of Linus) separated into two sessions (predrug and postdrug). A drug was applied to inhibit the resting state activity of the pulvinar in the left hemisphere in one dataset of Linus.

**c) Supplementary informations**

These codes are created to be executed from jupyter notebook.

## Authors

* Tabea Bruening
* German Primate Center/DAG

