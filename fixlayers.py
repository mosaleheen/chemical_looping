#!/usr/bin/env python

import sys
import itertools
try:
    # argument to be provided to fix atoms below this z value
    fix_below_z = float(sys.argv[1])
    f_write = open('new_pos', 'w')
    with open('POSCAR') as f_read:
        # read first 9 lines and write them to a new file
        for line in itertools.islice(f_read, 9):
            f_write.write(line)
        # read the rest of the file., i.e. coordinates and freeze atoms
        # below the given value
        for line in itertools.islice(f_read, None):
            x, y, z, rel_0, rel_1, rel_2 = line.split()
            if float(z) < fix_below_z:
                fix_atom = 'F  F  F'
                f_write.write(' {}  {}  {}   {}\n'.format(x, y, z, fix_atom))
            else:
                f_write.write(' {}  {}  {}   {}  {}  {}\n'.format(
                    x, y, z, rel_0, rel_1, rel_2))
except:
    print('Provide a z fractional coordinate to freeze atoms')
