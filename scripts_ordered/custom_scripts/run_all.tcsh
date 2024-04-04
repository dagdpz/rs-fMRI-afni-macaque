#!/bin/tcsh

# run the scripts for reorienting and processing the data 
tcsh reorient_flipped_LIP_to_LPI.tcsh 

tcsh run_13_aw.tcsh

#tcsh tcsh run_20_ap_vox.tcsh 

tcsh run_22_ap_roi.tcsh

tcsh run_30_pp_roi.tcsh
