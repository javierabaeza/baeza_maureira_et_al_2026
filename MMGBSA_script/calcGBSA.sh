#!/bin/bash

# The energy is calculated by including SASA.
# Parameters from Abroshan et al. 2009 are used.
gamma=0.00542; # in kcal/mol A^-2
beta=0.92; # in kcal/mol

# Combine the potential energy (bond+angle+dihed+imprp+elect+vdw) and SASA values.
paste -d " " Equil_MM_GBSA_updated.pot.dat sasa.dat > tmp.dat

# Calculate SASA gamma + beta (like in Abroshan et al.)
awk "{print \$1,\$2+\$4*$gamma+$beta}" tmp.dat > LIG.dat
rm tmp.dat

# Check the differences in energies
xmgrace LIG.dat Equil_MM_GBSA_updated.pot.dat &
