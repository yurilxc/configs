#! /usr/bin/python2

import os
import re
import time

while True:
    time.sleep(2)
    r = re.compile(r'\s*')
    for line in os.popen('xmodmap'):
        line = r.split(line)
        if line[0] == 'lock':
            if '(0x42)' in line[2]:
                os.system('xmodmap ~/.config/wmStartupScripts/xmodmap_swap_capslock_control')
