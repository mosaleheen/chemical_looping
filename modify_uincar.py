#!/usr/bin/env python
# -*-coding: utf-8 -*-

#modifyu_incar.py
#Mohammad Saleheen
#CREATED: 02-03-2020 




import numpy as np
import linecache
import itertools

atoms = [item for item in linecache.getline('POSCAR', 6).split()]
atom_type = len(atoms)

def check_atom_types(atom_type, line):
    tag, metal, oxygen = line.split()
    if atom_type == 2:                                       
        return '{} {} {}\n'.format(tag, metal, oxygen)    
    elif atom_type == 3:                                     
        return '{} {} {} 0\n'.format(tag, metal, oxygen)  
    elif atom_type == 4:                                     
        return '{} {} {} 0 0\n'.format(tag, metal, oxygen)
    else:                                                    
        print('There must be something wrong! Check POSCAR!') 
        exit()

fw = open('new_incar', 'w')
with open('INCAR', 'r') as f:
    for line in f:
        if 'LDAUJ' in line:
            fw.write(check_atom_types(atom_type, line))
        elif 'LDAUL' in line:
            fw.write(check_atom_types(atom_type, line))
        elif 'LDAUU' in line:
            fw.write(check_atom_types(atom_type, line))
        else:
            fw.write(line)
