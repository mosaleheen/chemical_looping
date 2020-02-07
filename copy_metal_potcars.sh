#!/bin/bash -x

# the purpose is copy to metal potcars used in metal oxides
# and format mp poscars a bit

count_Bi=$(grep -c Bi POSCAR)
count_Cd=$(grep -c Cd POSCAR)
count_Co=$(grep -c Co POSCAR)
count_Eu=$(grep -c Eu POSCAR)
count_Fe=$(grep -c Fe POSCAR)
count_Ge=$(grep -c Ge POSCAR)
count_In=$(grep -c In POSCAR)
count_Mn=$(grep -c Mn POSCAR)
count_Mo=$(grep -c Mo POSCAR)
count_Pb=$(grep -c Pb POSCAR)
count_Sb=$(grep -c Sb POSCAR)
count_Sn=$(grep -c Sn POSCAR)
count_Te=$(grep -c Te POSCAR)
count_V=$(grep -c V POSCAR)
count_W=$(grep -c W POSCAR)

z=0
pot_base="/home/work/ccei_biomass/users/saleheen/potpaw_pbe" # Change base directory here

if [ $count_Bi -gt $z ]
then
	sed -i '9,$ s/Bi//g' POSCAR
	cat $pot_base/Bi/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Cd -gt $z ]
then
	sed -i '9,$ s/Cd//g' POSCAR
	cat $pot_base/Cd/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Co -gt $z ]
then
	sed -i '9,$ s/Co//g' POSCAR
	cat $pot_base/Co/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Eu -gt $z ]
then
	sed -i '9,$ s/Eu//g' POSCAR
	cat $pot_base/Eu/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Fe -gt $z ]
then
	sed -i '9,$ s/Fe//g' POSCAR
	cat $pot_base/Fe_pv/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Ge -gt $z ]
then
	sed -i '9,$ s/Ge//g' POSCAR
	cat $pot_base/Ge_d/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_In -gt $z ]
then
	sed -i '9,$ s/In//g' POSCAR
	cat $pot_base/In_d/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Mn -gt $z ]
then
	sed -i '9,$ s/Mn//g' POSCAR
	cat $pot_base/Mn_pv/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Mo -gt $z ]
then
	sed -i '9,$ s/Mo//g' POSCAR
	cat $pot_base/Mo_pv/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Pb -gt $z ]
then
	sed -i '9,$ s/Pb//g' POSCAR
	cat $pot_base/Pb_d/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Sb -gt $z ]
then
	sed -i '9,$ s/Sb//g' POSCAR
	cat $pot_base/Sb/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Sn -gt $z ]
then
	sed -i '9,$ s/Sn//g' POSCAR
	cat $pot_base/Sn_d/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_Te -gt $z ]
then
	sed -i '9,$ s/Te//g' POSCAR
	cat $pot_base/Te/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_V -gt $z ]
then
	sed -i '9,$ s/V//g' POSCAR
	cat $pot_base/V_sv/POTCAR >> POTCAR             # Change you POTCAR Directory in here
elif [ $count_W -gt $z ]
then
	sed -i '9,$ s/W//g' POSCAR
	cat $pot_base/W_sv/POTCAR >> POTCAR             # Change you POTCAR Directory in here
else
	echo "Species do not exist"
fi
