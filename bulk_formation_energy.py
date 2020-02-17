#!/usr/bin/env python
# calculating bulk crystal formation energy of metal oxides
# from bulk metal and gaseous oxygen

from math import gcd
import numpy as np
import linecache
import os

e_oxygen = -9.85858254518912/2.0
n_metal, n_oxygen = [int(item) for item in linecache.getline('CONTCAR', 7).split()]
common_denom = gcd(n_metal, n_oxygen)
x_metal, x_oxygen = n_metal/common_denom, n_oxygen/common_denom

with open('OUTCAR', 'r') as f:
   total_bulk_energy = float([line.split()[-1] for line in f if 'entropy=' in line][-1])
bulk_unit_energy = total_bulk_energy / common_denom

bulk_metal_atoms, = [float(item) for item in linecache.getline('metal/CONTCAR', 7).split()]

dir= 'metal/OUTCAR'
if os.path.exists(dir):
    with open (dir, 'r') as f:
        if 'CPU' in f.read():
            f.seek(0)
            bulk_metal = float([line.split()[-1] for line in f if 'entropy=' in line][-1])
        else:
            print('Incomplete calculation')
            exit()

bulk_form_energy = bulk_unit_energy - (x_metal/bulk_metal_atoms)*bulk_metal - x_oxygen*e_oxygen
bulk_form_per_oxygen = bulk_form_energy / x_oxygen

print('Bulk formation energy per oxygen atom: {}'.format(bulk_form_per_oxygen))
