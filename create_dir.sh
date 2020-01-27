#!/bin/bash -x

for i in *.cell; 
do nam=`echo $i | sed 's/.cell//g'`; 
mkdir $nam; 
mv $nam.cell $nam/;
cd $nam/;
cp ../b*/* .;  
looping_poscar.sh;
cd ../;
done
