#!/bin/bash -x

mkdir tight/;
cp {INCAR,KPOINTS,POTCAR,job*,CONTCAR} tight/;
mv tight/CONTCAR tight/POSCAR;
sed -i "s/EDIFF=.*/EDIFF= 1E-5/g" tight/INCAR;
sed -i "s/# EDIFFG.*/EDIFFG= -0.05/g" tight/INCAR;

