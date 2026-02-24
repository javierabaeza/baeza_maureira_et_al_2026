#!/bin/bash

#####################################
#  GBSA
#####################################
# Combine the files GBSA from COMP, LIG y PROT
paste -d " " COMP/COMP.dat PROT/PROT.dat LIG/LIG.dat > gbsas.dat
# Calculate the final MM-GBSA energies
awk "{print \$1,\$2-\$4-\$6}" gbsas.dat > gbsas_1ov3_3fic.dat
rm gbsas.dat

#####################################
#  VDW
#####################################
paste -d " " COMP/Equil_MM_GBSA_updated.vdw.dat PROT/Equil_MM_GBSA_updated.vdw.dat LIG/Equil_MM_GBSA_updated.vdw.dat > vdws.dat
awk "{print \$1,\$2-\$4-\$6}" vdws.dat > vdw_1ov3_3fic.dat
rm vdws.dat

#####################################
#  ELECT
#####################################
paste -d " " COMP/Equil_MM_GBSA_updated.elect.dat PROT/Equil_MM_GBSA_updated.elect.dat LIG/Equil_MM_GBSA_updated.elect.dat > elect.dat
awk "{print \$1,\$2-\$4-\$6}" elect.dat > elect_1ov3_3fic.dat
rm elect.dat

#####################################
#  SOLV NON-POLAR
#####################################

# The energy is calculated by including SASA.
# Parameters from Abroshan et al. 2009 are used.
gamma=0.00542; # in kcal/mol A^-2
beta=0.92; # in kcal/mol

paste -d " " gbsas_1ov3_3fic.dat COMP/sasa.dat PROT/sasa.dat LIG/sasa.dat > sasas.dat
awk "{print \$1,\$4-\$6-\$8}" sasas.dat > tmp.dat
awk "{print \$1,\$2*$gamma+$beta}" tmp.dat > np_sasa_1ov3_3fic.dat
rm sasas.dat tmp.dat

#####################################
#  SOLV POLAR
#####################################
paste -d " " gbsas_1ov3_3fic.dat vdw_1ov3_3fic.dat elect_1ov3_3fic.dat np_sasa_1ov3_3fic.dat > polar.dat
awk "{print \$1,\$2-\$4-\$6-\$8}" polar.dat > polar_sasa_1ov3_3fic.dat
rm polar.dat

# Check the changes in energy.
xmgrace gbsas_1ov3_3fic.dat &
