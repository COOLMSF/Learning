#!/usr/bin/python

# Write a simple keygen that generates keys which are:
#   - 16 chars long
#   - the sum of the ASCII values is 0x6e2 or 1762

import random

total = 1762
key   = ""

for i in range(15):
    #pick a random number in range(98, 122)
    x = random.randint(98,123)
    total -= x
    key += chr(x)

#print("total: " + str(total))
key += chr(total)

#hacky way to check that our key is valid, basically is our last chr printable
if total < 123:
    print("Key is: " + key)
