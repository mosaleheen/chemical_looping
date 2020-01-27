#!/usr/bin/env python

from math import gcd
import numpy as np
import linecache

x_dim = [float(item) for item in linecache.getline('CONTCAR', 3).split()]
y_dim = [float(item) for item in linecache.getline('CONTCAR', 4).split()]
n_metal, n_oxygen = [float(item) for item in linecache.getline('CONTCAR', 7).split()]

area = np.linalg.norm(np.cross(x_dim, y_dim))

with open('OUTCAR', 'r') as f:
   total_surface_energy = float([line.split()[-1] for line in f if 'entropy=' in line][-1])
with open('unit_bulk_info', 'r') as f:
   unit_bulk = [item for line in f for item in line.split()]
x_metal, x_oxygen, unit_bulk_energy = [float(i) for i in unit_bulk]
with open('outcar_oxygen', 'r') as f:
   oxygen_energy = float([line.split()[-1] for line in f if 'entropy=' in line][-1])

surface_free_energy = (1/area)*(total_surface_energy - (n_metal/x_metal)*unit_bulk_energy - 0.5*oxygen_energy*(n_oxygen-(x_oxygen/x_metal)*n_metal))
#print(x_metal, x_oxygen, unit_bulk_energy, n_metal, n_oxygen, total_surface_energy, oxygen_energy)
#print(area)
print(surface_free_energy)
