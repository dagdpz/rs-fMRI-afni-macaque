#!/bin/tcsh

# reorient nifti files (func and anat) to orientation of NMT atlas (LPI)
# required: bids structure with ses-*, unprocessed nifti files in LIP orientation and coronal view flipped on its head 
# made to be run from the */scripts directory

#--------------------------------------------------------------------------------------------------

#set basic directory, list of all sessions and subject name in bids naming convention 
set subname       = sub-"$TSUBNAME"
set dir_basic     = ${PWD:h}/"$NAME_BIDS"
set all_ses       = ( ${dir_basic}/${subname}/ses-* )


# loop over sessions so that all func directories get reoriented. Set respective /func directory and list of all func runs.
foreach ses ( ${all_ses} )

	set dir_func = ${ses}/func
	set all_func = ( ${dir_func}/*bold*.nii.gz )
	set i = 1
	
	foreach func ( ${all_func} )
	
		 set temp_func = run-0${i}_LIP.nii.gz
		 set out_func = `basename "${func}"` #${subname}_ses-"$SESSIONNAME"_run-0${i}_bold.nii.gz
		 
		 # give the nifti file the correct header information
		 3dresample \
		 -input 		${func} \
		 -prefix 		${temp_func} \
		 -orient 		LIP
		 
		 # change orientation of the nifti file to LPI
		 3drefit \
		 -orient 		LPI \
		 ${temp_func}
		 
		 # flip the nifti file along the Z axis to have coronal in correct orientation 
		 3dLRflip \
		 -Z \
		 -prefix ${out_func} \
		 ${temp_func}
		 
		 # removing temp and incorretly oriented files, move correctly oriented file to func directory for analysis 
		 rm ${temp_func}
		 rm ${func}
		 mv ${out_func} ${dir_func}
		 
		 @ i = $i + 1
	end
end





set temp_anat = t1w_LIP.nii.gz


# the same as aove just for anatomical nifti files 
foreach ses ( ${all_ses} )
	
	set dir_anat = ${ses}/anat
	set all_anat = ${dir_anat}/*0101_T1w*.nii.gz
	set out_anat = `basename "${all_anat}"` #${subname}_sub-Pinocchio_ses-predrug_T1w.nii.gz
	
	3dresample \
	-input 		${all_anat} \
	-prefix 		${temp_anat} \
	-orient 		LIP
		 
	3drefit \
	-orient 		LPI \
	${temp_anat}
		 
	3dLRflip \
	-Z \
	-prefix ${out_anat} \
	${temp_anat}
	
	
	rm ${temp_anat}
	rm ${all_anat}
	mv ${out_anat} ${dir_anat}
end
