# Code for verifying the results and calculating the mean correlations and visualizing it with bar charts

## Description

**a) Usage of this script**

Sometimes it is difficult to keep an overview of all the results of the correlation matrices due to the length of the file. Then, errors could be overlooked, which can have severe consequences. To avoid this, a code was generated (this code) which creates three CSV files, containing every comparison for a specific hemisphere. In these files, the correlation is visible for both predrug and postdrug. The correlation values between the predrug and postdrug data are compared, and the difference (absolute and percentage) is calculated. Then, the values are sorted by the percentage difference. Besides this, the mean correlation values for the left, right, and both hemispheres are calculated between predrug and postdrug data. The result is presented via standard output and is visualized in a bar chart. Additionally, the percentage difference for each hemisphere is calculated and presented in a bar chart.

**b) Data**

The data used with these scripts is from the German Primate Center (DAG, Pinocchio/Linus). They are resting state recordings of anesthetized monkeys that were separated into two sessions (predrug and postdrug). A drug was applied to inhibit the resting state activity of the pulvinar in the left hemisphere.

**c) Supplementary informations**

These codes are created to be executed from jupyter notebook.

## Authors

* Tabea Bruening
* German Primate Center/DAG
