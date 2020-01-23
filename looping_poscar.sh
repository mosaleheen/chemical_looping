#!/bin/bash -x

###################################################################################################
#                                                                                                 # 
#                 Purpose : Create a POSCAR file from a .cell file (as it is)                     #
#                  Author : Mohammad Shamsus Saleheen, Department of Chemical Engineering,USC	  #
#                    Date : 12-13-2013                                                            #                                                                            
#            Modification :                                                                       #                                                                
# Reasons of Modification :                                                                       #                                                                 
#                   Usage :./General-Poscar.sh arg1 arg2 ...					  #                         
#                           Provide the arguments in the same order you want your POSCAR file to  #
#		            be in. All you need are a .cell file from material studio and the     #
#                           path to POTCAR files.                                                 #
###################################################################################################


dos2unix *.cell > /dev/null 2> /dev/null


sed -i '/%BLOCK LATTICE_CART/d' *.cell
sed -i '/%ENDBLOCK LATTICE_CART/d' *.cell
sed -i '/%BLOCK POSITIONS_FRAC/d' *.cell
sed -i '/%ENDBLOCK POSITIONS_FRAC/,$d' *.cell
sed -i '/^$/d' *.cell

echo System >> POSCAR
echo 1.00000000000000 >> POSCAR
head -3 *.cell >> POSCAR
sed -i '5G' POSCAR
sed -i '6G' POSCAR
sed -i '7 a Selective dynamics' POSCAR
sed -i '8 a Direct' POSCAR

count_O=$(grep -c O *.cell)
count_Bi=$(grep -c Bi *.cell)
count_Cd=$(grep -c Cd *.cell)
count_Co=$(grep -c Co *.cell)
count_Eu=$(grep -c Eu *.cell)
count_Fe=$(grep -c Fe *.cell)
count_Ge=$(grep -c Ge *.cell)
count_In=$(grep -c In *.cell)
count_Mn=$(grep -c Mn *.cell)
count_Mo=$(grep -c Mo *.cell)
count_Pb=$(grep -c Pb *.cell)
count_Sb=$(grep -c Sb *.cell)
count_Sn=$(grep -c Sn *.cell)
count_Te=$(grep -c Te *.cell)
count_V=$(grep -c V *.cell)
count_W=$(grep -c W *.cell)



z=0
pot_base="/home/work/ccei_biomass/users/saleheen/potpaw_pbe" # Change base directory here

if [ $count_Bi -gt $z ]
then
sed -i "6 s/$/   Bi/g" POSCAR
sed -i "7 s/$/   $count_Bi/g" POSCAR
grep " Bi " *.cell | sed -e "s/ Bi  //" -e "s/   /  /g" -e "s/$/   T   T   T/" | sort -k3 >> POSCAR
cat $pot_base/Bi/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Cd -gt $z ]
then
sed -i "6 s/$/   Cd/g" POSCAR
sed -i "7 s/$/   $count_Cd/g" POSCAR
grep " Cd " *.cell | sed -e "s/ Cd  //" -e "s/   /  /g" -e "s/$/   T   T   T/" | sort -k3 >> POSCAR
cat $pot_base/Cd/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Co -gt $z ]
then
sed -i "6 s/$/   Co/g" POSCAR
sed -i "7 s/$/   $count_Co/g" POSCAR
grep " Co " *.cell | sed -e "s/ Co  //" -e "s/   /  /g" -e "s/$/   T   T   T/" | sort -k3 >> POSCAR
cat $pot_base/Co/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Eu -gt $z ]
then
sed -i "6 s/$/   Eu/g" POSCAR
sed -i "7 s/$/   $count_Eu/g" POSCAR
grep " Eu " *.cell | sed -e "s/ Eu  //" -e "s/   /  /g" -e "s/$/   T   T   T/" | sort -k3 >> POSCAR
cat $pot_base/Eu/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Fe -gt $z ]
then
sed -i "6 s/$/   Fe/g" POSCAR
sed -i "7 s/$/   $count_Fe/g" POSCAR
grep " Fe " *.cell | sed -e "s/ Fe  //" -e "s/   /  /g" -e "s/$/   T   T   T/" | sort -k3 >> POSCAR
cat $pot_base/Fe_pv/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Ge -gt $z ]
then
sed -i "6 s/$/   Ge/g" POSCAR
sed -i "7 s/$/   $count_Ge/g" POSCAR
grep " Ge " *.cell | sed -e "s/ Ge  //" -e "s/   /  /g" -e "s/$/   T   T   T/" | sort -k3 >> POSCAR
cat $pot_base/Ge_d/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_In -gt $z ]
then
sed -i "6 s/$/   In/g" POSCAR
sed -i "7 s/$/   $count_In/g" POSCAR
grep " In " *.cell | sed -e "s/ In  //" -e "s/   /  /g" -e "s/$/   T   T   T/" | sort -k3 >> POSCAR
cat $pot_base/In_d/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Mn -gt $z ]
then
sed -i "6 s/$/   Mn/g" POSCAR
sed -i "7 s/$/   $count_Mn/g" POSCAR
grep " Mn " *.cell | sed -e "s/ Mn  //" -e "s/   /  /g" -e "s/$/   T   T   T/" | sort -k3 >> POSCAR
cat $pot_base/Mn_pv/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Mo -gt $z ]
then
sed -i "6 s/$/   Mo/g" POSCAR
sed -i "7 s/$/   $count_Mo/g" POSCAR
grep " Mo " *.cell | sed -e "s/ Mo  //" -e "s/   /  /g" -e "s/$/   T   T   T/" | sort -k3 >> POSCAR
cat $pot_base/Mo_pv/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Pb -gt $z ]
then
sed -i "6 s/$/   Pb/g" POSCAR
sed -i "7 s/$/   $count_Pb/g" POSCAR
grep " Pb " *.cell | sed -e "s/ Pb  //" -e "s/   /  /g" -e "s/$/   T   T   T/" | sort -k3 >> POSCAR
cat $pot_base/Pb_d/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Sb -gt $z ]
then
sed -i "6 s/$/   Sb/g" POSCAR
sed -i "7 s/$/   $count_Sb/g" POSCAR
grep " Sb " *.cell | sed -e "s/ Sb  //" -e "s/   /  /g" -e "s/$/   T   T   T/" | sort -k3 >> POSCAR
cat $pot_base/Sb/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Sn -gt $z ]
then
sed -i "6 s/$/   Sn/g" POSCAR
sed -i "7 s/$/   $count_Sn/g" POSCAR
grep " Sn " *.cell | sed -e "s/ Sn  //" -e "s/   /  /g" -e "s/$/   T   T   T/" | sort -k3 >> POSCAR
cat $pot_base/Sn_d/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Te -gt $z ]
then
sed -i "6 s/$/   Te/g" POSCAR
sed -i "7 s/$/   $count_Te/g" POSCAR
grep " Te " *.cell | sed -e "s/ Te  //" -e "s/   /  /g" -e "s/$/   T   T   T/" | sort -k3 >> POSCAR
cat $pot_base/Te/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_V -gt $z ]
then
sed -i "6 s/$/   V/g" POSCAR
sed -i "7 s/$/   $count_V/g" POSCAR
grep " V " *.cell | sed -e "s/ V  //" -e "s/   /  /g" -e "s/$/   T   T   T/" | sort -k3 >> POSCAR
cat $pot_base/V_sv/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_W -gt $z ]
then
sed -i "6 s/$/   W/g" POSCAR
sed -i "7 s/$/   $count_W/g" POSCAR
grep " W " *.cell | sed -e "s/ W  //" -e "s/   /  /g" -e "s/$/   T   T   T/" | sort -k3 >> POSCAR
cat $pot_base/W_sv/POTCAR >> POTCAR             # Change you POTCAR Directory in here
else
echo "Species do not exist"
fi

if [ $count_O -gt $z ]
then
sed -i "6 s/$/   O/g" POSCAR
sed -i "7 s/$/   $count_O/g" POSCAR
grep " O " *.cell | sed -e "s/ O  //" -e "s/   /  /g" -e "s/$/   T   T   T/" | sort -k3 >> POSCAR
cat $pot_base/O/POTCAR >> POTCAR             # Change you POTCAR Directory in here
else
echo "Species do not exist"
fi


