#!/bin/bash -x

###################################################################################################
#                                                                                                                                                                                               
#                 Purpose : To make a POSCAR file from .cell file format (using existing catalyst base CONTCAR)
#                  Author : Mohammad Shamsus Saleheen, Department of Chemical Engineering,USC
#                    Date : 12-13-2013                                                                                                                                        
#            Modification :                                                                                                                                       
#  Reasons of Modification:                                                                                                                                        
#                                                                                                                                                                     
####################################################################################################


dos2unix *.cell > /dev/null 2> /dev/null


sed -i '1,7d' *.cell
sed -i '/%ENDBLOCK POSITIONS_FRAC/,$d' *.cell

z=0
nc=$(grep -w -c C *.cell)
nh=$(grep -w -c H *.cell)
pot_base="/home/work/ccei_biomass/users/saleheen/potpaw_pbe"

mv CONTCAR* POSCAR

sed -i '/^[[:space:]]*$/,$d' POSCAR 

if [ $nc -gt $z ]
then
	sed -i "6 s/$/    C /g" POSCAR
	sed -i "7 s/$/    $nc/g" POSCAR
	cat $pot_base/C/POTCAR >> POTCAR
        grep  " C " *.cell | sed -e 's/ C  //' -e 's/   /  /g' -e 's/$/   T   T   T/' >> POSCAR 
fi

if [ $nh -gt $z ]
then
	sed -i "6 s/$/   H   /g" POSCAR
	sed -i "7 s/$/    $nh/g" POSCAR
	cat $pot_base/H/POTCAR >> POTCAR
        grep  " H " *.cell | sed -e 's/ H  //' -e 's/   /  /g' -e 's/$/   T   T   T/' >> POSCAR
fi


rm *.cell


