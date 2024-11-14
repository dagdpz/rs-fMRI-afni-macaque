#!/bin/tcsh

# PP: post-proc with 3dNetCorr et al. for ROI-based calcs

# This script runs a corresponding do_*.tcsh script, for a given
# subj+ses pair.  It could be adapted to loop over many subj+ses values.

# To execute:  
#     tcsh RUN_SCRIPT_NAME

# --------------------------------------------------------------------------

# upper directories
set dir_log       = ${DIR_INROOT}/logs
set dir_swarm     = ${DIR_INROOT}/swarm 

# running 
set scr_swarm     = ${dir_swarm}/swarm_30_pp_roiTB.tcsh  # cmds to run, 1 per line
set scr           = ${DIR_SCR}/do_30_pp_roiTB.tcsh       # processing scr to use

# --------------------------------------------------------------------------

# make directory for storing text files to log the processing
\mkdir -p ${dir_log}
\mkdir -p ${dir_swarm}

# clear away older warm/cmd script, if it exists
if ( -e ${scr_swarm} ) then
    \rm ${scr_swarm}
endif

# --------------------------------------------------------------------------

# Make list of subj to proc; could be done many ways (e.g., direct list)
cd ${DIR_BASIC}
set all_subj = ( sub-* )
cd -

echo ""
echo "++ Proc command:  30_pp_roiTB"
echo ""
echo "++ Found ${#all_subj} subj:"
echo ""

# 1) loop over all subjs, and build a 'swarm' script to run each cmd
# 2) proc each ses separately: assume each session has own anat and func
foreach subj ( ${all_subj} ) 

    # list all ses per subj
    cd ${DIR_BASIC}/${subj}
    set all_ses = ( ses-* )
    cd -

    foreach ses ( ${all_ses} )

        echo "++ Prepare cmd for:  ${subj} --- ${ses}"

        set log = ${dir_log}/log_30_pp_roiTB_${subj}_${ses}.txt

        # Build 'swarm' script ('-x' for verbosity; don't use '-e').
        # Make log with 'tee'.
        echo "time tcsh -xf ${scr}  ${subj} ${ses} \\"   >> ${scr_swarm}
        echo "       |& tee ${log}"                      >> ${scr_swarm}

    end
end

# --------------------------------------------------------------------

# return to script dir and execute 'swarm' script
cd ${DIR_SCR}

echo "++ Executing 'swarm' cmd script: ${scr_swarm}"

tcsh ${scr_swarm}
