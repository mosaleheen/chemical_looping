#!/usr/bin/env python
# calculating unit bulk energy from bulk conventional/computed cells which
# is mostly a supercell of the unit cell

from math import gcd
import linecache

n_metal, n_oxygen = [int(item) for item in linecache.getline('CONTCAR', 7).split()]
common_denom = gcd(n_metal, n_oxygen)
x_metal, x_oxygen = n_metal/common_denom, n_oxygen/common_denom

with open('OUTCAR', 'r') as f:
   total_bulk_energy = float([line.split()[-1] for line in f if 'entropy=' in line][-1])
unit_bulk_energy = total_bulk_energy / common_denom
with open('unit_bulk_info', 'w') as f:
   f.write('{}  {}  {}\n'.format(x_metal, x_oxygen, unit_bulk_energy)) 
