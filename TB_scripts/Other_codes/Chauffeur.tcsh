#!/bin/tcsh

# Visualization using AFNI's chauffeur_afni
# Underlay: The NMT template (symmetric, skull-stripped, 0.5 mm resolution) is used as the anatomical reference
# Overlay: The CHARM atlas mapped to NMT space is used; sub-brick 5 is selected to display multiple ROIs
# Output: An image montage is generated with the specified display settings

@chauffeur_afni                                                     \
        -ulay    NMT_v2.1_sym_05mm_SS.nii.gz'[0]'                   \
        -olay    CHARM_in_NMT_v2.1_sym_05mm.nii.gz'[5]'            \
        -prefix  Visualisation_CHARM                                \
        -montx   5 -monty 3                                         \
        -set_xhairs OFF                                             \
        -label_mode 1 -label_size 4                                 \
        -cbar "ROI_i256"                                            \
        -save_ftype PNG                                             \
        -do_clean
