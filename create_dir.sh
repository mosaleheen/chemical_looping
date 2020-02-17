#!/bin/bash -x
# for any files with .cell extension, create same named directory,
# create poscar file from the .cell file, copy required input files,
# modify the +u parameters of INCAR file, and set the job name. 
for i in *.cell; 
do nam=`echo $i | sed 's/.cell//g'`; 
mkdir $nam; 
mv $nam.cell $nam/;
cd $nam/;
# copying the input files required for vasp calculation from previous surface calculation
cp ../../input_*/* .
# create poscar file for adsrobed species from .cell and surface CONTCAR
adsorbed_poscar.sh;
# modify u parameters of INCAR file (different from surface calculations due to addition of adsorbed species) 
modify_uincar.py;
# mv the newly created new_incar to INCAR 
mv new_incar INCAR
# change the job name, just add species name after oxide name previously added
old=`pwd | rev | awk -F "/" '{print $3}' | rev`; 
new=`pwd | rev | awk -F "/" '{print $2}' | rev`; 
sed -i "s/$old/${old}_${new}/g" job*

cd ../;
done
