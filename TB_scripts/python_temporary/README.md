# Histogramm.ipynb

## Description
a) Usage of this code

This code is important to further analyse the data which was generated from AFNI. Therefore you have to copy the netcc files which were generated via run_30 and change them into textfiles. You can do that while exchanging '.netcc' with '.txt'. Then you have to change the variables 'file_predrug' and 'file_postdrug' with the names of your files. In these files you can find the correlation data which was used to generate the correlation matrices by AFNI. The exact data being used was 'CC' which is also used in these python scripts. To visualize how I set the variables, please refer to 'c) Supplementary information'.

b) Data

The data used with these scripts is from the German Primate Center (DAG, Pinocchio/Linus). They are resting state recordings of anesthetized monkeys that were separated into two sessions (predrug and postdrug). A drug was applied to inhibit the resting state activity of the pulvinar in the right hemisphere.

c) Supplementary informations

In the following correlation matrix you can see how I declinated the variables. The data in the file which is analysed with the python scripts is organized like a correlation matrix. With this code is only the data under the pink line used (left triangle).
![correlation](https://github.com/user-attachments/assets/59e2ddf9-aee6-474a-a357-acd36856c640)

## Installation
a) General Instructions

You can let this code run in jupyter notebook with the specific button.

## Authors
* Tabea Bruening
* German Primate Center/DAG

