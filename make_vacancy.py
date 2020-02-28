#!/usr/bin/env python

import sys
import itertools

# script to create a vacancy in poscar,
# needs the coordinate of the atom to be removed
# as an argument

# coordinate of oxygen atom to remove
if len(sys.argv) > 2:
 x_oxygen = sys.argv[1:]
 x_oxygen = "  ".join(x_oxygen)
else:
 x_oxygen = sys.argv[1]

#try:
fw = open('POSCAR', 'w')
with open('CONTCAR') as fr:
    for index, line in enumerate(fr.readlines()):
        if index == 6:
            metal, oxygen = line.split()
            fw.write('   {}   {}\n'.format(metal, int(oxygen) - 1))
        elif x_oxygen in line:
            pass
        else:
            fw.write(line)

#except:
#    print('Provide a x fractional coordinate of oxygen to remove atom')

