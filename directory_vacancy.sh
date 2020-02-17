#!/bin/bash -x
# will create directories for submitting vacancy formation
# calculations, have to provide the integer argument of how many
# vacancy calculations needed.

start=1
stop=$1

mkdir $(eval echo vacancy_{$start..$stop})

for i in */
do
cp {INCAR,KPOINTS,CONTCAR,job*,POTCAR} $i/
cp /home/work/ccei_biomass/users/saleheen/job_scripts/job_farber_vaspstand.sh $i/
jobnam=`pwd | rev | awk -F "/" '{print $2}' | rev`
sed -i "s/saleheen/$jobnam/g" $i/job_farber_vaspstand.sh
done

