#!/bin/bash -x

sed -i "s/EDIFF=.*/EDIFF= 1E-3/g" INCAR
sed -i "s/EDIFFG=.*/# EDIFFG= -0.05/g" INCAR
