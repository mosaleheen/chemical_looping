#!/bin/bash -x
# when the convergence is tool slow/do not get converged, trying a crazy relaxed criteria
mkdir relaxed;
cp {INCAR,KPOINTS,POSCAR,POTCAR,job*} relaxed/;
sed -i "s/EDIFF=.*/EDIFF= 1E-3/g" relaxed/INCAR
sed -i "s/EDIFFG=.*/# EDIFFG= -0.05/g" relaxed/INCAR
