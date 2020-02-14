#!/usr/bin/env python
# calculating vacancy formation energy for the bulk metal oxides

from pathlib import Path
import os
## parameter definition
# energy of an oxygen atom
e_oxygen = -9.85858254518912/2.0

# check if the calculation is finished
with open ('OUTCAR', 'r')as f:
    if 'CPU' in f.read():
        f.seek(0)
        bulk_energy = float([line.split()[-1] for line in f if 'entropy=' in line][-1])
    else: 
        print('Bulk calculation still running')
        exit()
#print('Bulk energy: {}'.format(bulk_energy))
num_vacancy = len([i for i in os.listdir('.') if os.path.isdir(i)])
for i in range(1, num_vacancy+1):
    dir= 'vacancy_'+ str(i)+'/OUTCAR'
    if os.path.exists(dir):
        with open (dir, 'r') as f:
            if 'CPU' in f.read():
                f.seek(0)
                vacancy_energy = float([line.split()[-1] for line in f if 'entropy=' in line][-1])
                vac_form_energy = vacancy_energy + e_oxygen - bulk_energy
                print('Vacancy energy {}: {} and formation energy: {}'.format(i, vacancy_energy, vac_form_energy))
            else:
                print('Vacancy {} is still running'.format(i))
                f.seek(0)
                vacancy_energy = float([line.split()[-1] for line in f if 'entropy=' in line][-1])                
                vac_form_energy = vacancy_energy + e_oxygen - bulk_energy                                         
                print('Vacancy energy {}: {} and formation energy: {}'.format(i, vacancy_energy, vac_form_energy))
