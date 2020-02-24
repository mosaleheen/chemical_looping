#/bin/bash -x
# simple script to look for local minimas
# by searching vibrational frequency directories
# and add energy and frequencies to "scf_data" file

if [ -d vib ]
then
	SCF=$(grep entropy= OUTCAR | tail -1 | rev | awk -F " " '{print $1}' | rev)
	echo $SCF >> ../scf_data
	if [ -f vib/freq.dat ]
	then 
	awk '{print $1}' vib/freq.dat >> ../scf_data
	else 
	echo 0 >> ../scf_data
	fi
fi
									

