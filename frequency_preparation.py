#!/usr/bin/env python
# -*-coding: utf-8 -*-

#vibrational_frequency.py
# A python script to generate files required for vibrational frequency calculations 
# for adsrobates on metal oxides
# Mohammad Saleheen
import os
import glob
from shutil import copy2
import linecache

# define the name of the directory to be created
path = 'vib'
try:
    os.mkdir(path)
    # copying the files required for frequency calculation from the current directory
    copy2('KPOINTS', path)                 
    copy2('POTCAR', path)                  
    for file in glob.glob('job*'):         
        copy2(file, path)
    # get the number of surface and adsorbate atoms, its metal oxide
    # hence the first two elements represent surface atoms
    atoms = [int(item) for item in linecache.getline('CONTCAR', 7).split()]
    surface_atoms=atoms[0]+atoms[1]          
    total_atoms= sum(atoms)                  
    adsorbate_atoms=total_atoms-surface_atoms
    # get the absolute magnetization value from OSZICAR to set it for NUPDOWN
    #with open ('OSZICAR','r') as fr:
    #    mag = abs(float([line.split()[-1] for line in fr if 'mag=' in line][-1]))
    # prepare the displacecar file
    with open(path+'/DISPLACECAR','w') as fw:
        for index in range(1, total_atoms+1):
            if index > surface_atoms:
                fw.write('{:0.3f}   {:0.3f}   {:0.3f}\n'.format(0.015, 0.015, 0.015))
            else:
                fw.write('{:0.3f}   {:0.3f}   {:0.3f}\n'.format(0.000, 0.000, 0.000))
    # prepare the POSCAR from the optimized CONTCAR, this is just fixing all the surface atoms
    # the first nine lines of poscar do not involve any coordinates
    poscar_info = 9
    fw = open(path+'/POSCAR','w')
    with open('CONTCAR','r') as fr:
        for index, line in enumerate(fr, start=1):
            if not line.strip():
                break
            elif poscar_info < index <= surface_atoms+poscar_info:
                x, y, z = line.split()[:3]
                fw.write('  {}  {}  {}   F   F   F\n'.format(x,y,z))
            else:
                fw.write(line)
    fw.close()
    # prepare the incar file with necessary modifications for dynamical matrix calculation
    fw = open(path+'/INCAR', 'w')          
    with open('INCAR', 'r') as fr:         
        for line in fr:
            # set a high EDIFFG that can't be reached within the required ionic steps
            if line.startswith('EDIFFG'):  
                fw.write('EDIFFG= 1E-10\n')
            # dynamical matrix calculations require damped md with zero time step, so that vasp does not move the ions
            elif line.startswith('IBRION'):
                fw.write('IBRION= 3\n')
                fw.write('ICHAIN= 1\n')
                fw.write('POTIM= 0\n')
            # changing the nsw to 3N+1
            elif line.startswith('NSW'):
                fw.write('NSW= {}\n'.format(int(3*adsorbate_atoms+1)))
            else:                          
                fw.write(line)
    fw.close()
except OSError:
    print ("Creation of the directory %s failed" % path)
    exit()
