# Code for generating line plots and conducting statistical tests

## Description

**a) Usage of this script**

*Cort_Cort_line.ipynb:*

In this directory, there is a script that creates a line plot comparing the mean values of different types of brain connections in monkeys. Specifically, it compares the mean values of:
a) intrahemispheric vs. interhemispheric correlations,
b) intrahemispheric vs. homotopic correlations, and
c) intrahemispheric vs. heterotopic correlations.

Subsequently, statistical tests are conducted, including a Friedman test and a Wilcoxon signed-rank test. Additionally, separate diagrams are generated to compare the same connection types between two monkeys (L1 and L2).

*Medial_pul_Cort.ipynb:*

This script is designed to display the medial pulvino-cortical correlation values from both the left and right hemispheric medial pulvinar to intra- and interhemispheric cortical areas. To achieve this, the data is first sorted, and statistical tests (Friedman test and Wilcoxon signed-rank test) are performed. Finally, a diagram is plotted to compare the mean values of the aforementioned connection types.

*Inactivation_line_diagram.ipynb*

This script visualizes the medial pulvino-cortical correlation patterns before and after drug injection, and includes statistical analyses.

**b) Data**

The data used with these scripts is from the German Primate Center (DAG, Pinocchio/Linus/Rio/Norman/Curius). They are resting state recordings of anesthetized monkeys that were in one monkeys datatset separated into two sessions (predrug and postdrug). A drug was applied to inhibit the resting state activity of the pulvinar in the left hemisphere.

**c) Supplementary informations**

These codes are created to be executed from jupyter notebook.

## Authors

* Tabea Bruening
* German Primate Center/DAG

