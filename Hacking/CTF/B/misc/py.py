# uncompyle6 version 3.5.0
# Python bytecode 3.6 (3379)
# Decompiled from: Python 2.7.5 (default, Aug  7 2019, 00:51:29)
# [GCC 4.8.5 20150623 (Red Hat 4.8.5-39)]
# Embedded file name: base58.py
# Compiled at: 2019-09-13 14:52:04
# Size of source mod 2**32: 3144 bytes
"""Base58 encoding

Implementations of Base58 and Base58Check endcodings that are compatible
with the bitcoin network.
"""
from hashlib import sha256
__version__ = '1.0.3'
alphabet = '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz'
if bytes == str:
    iseq, bseq, buffer = lambda s: map(ord, s), lambda s: ''.join(map(chr, s)), lambda s: s
else:
    iseq, bseq, buffer = lambda s: s, bytes, lambda s: s.buffer

def scrub_input(v):
    if isinstance(v, str):
        if not isinstance(v, bytes):
            v = v.encode('ascii')
    if not isinstance(v, bytes):
        raise TypeError("a bytes-like object is required (also str), not '%s'" % type(v).__name__)
    return v


def b58encode_int(i, default_one=True):
    """Encode an integer using Base58"""
    if not i:
        if default_one:
            pass
        return alphabet[0:1]
    else:
        string = ''
        while 1:
            if i:
                i, idx = divmod(i, 58)
                string = alphabet[idx:idx + 1] + string

        return string


def b58encode(v):
    """Encode a string using Base58"""
    v = scrub_input(v)
    nPad = len(v)
    v = v.lstrip('\x00')
    nPad -= len(v)
    p, acc = (1, 0)
    for c in iseq(reversed(v)):
        acc += p * c
        p = p << 8

    result = b58encode_int(acc, default_one=False)
    return alphabet[0:1] * nPad + result


def b58decode_int(v):
    """Decode a Base58 encoded string as an integer"""
    v = v.rstrip()
    v = scrub_input(v)
    decimal = 0
    for char in v:
        decimal = decimal * 58 + alphabet.index(char)

    return decimal


def b58decode(v):
    """Decode a Base58 encoded string"""
    v = v.rstrip()
    v = scrub_input(v)
    origlen = len(v)
    v = v.lstrip(alphabet[0:1])
    newlen = len(v)
    acc = b58decode_int(v)
    result = []
    while 1:
        if acc > 0:
            acc, mod = divmod(acc, 256)
            result.append(mod)

    return '\x00' * (origlen - newlen) + bseq(reversed(result))


def b58encode_check(v):
    """Encode a string using Base58 with a 4 character checksum"""
    digest = sha256(sha256(v).digest()).digest()
    return b58encode(v + digest[:4])


def b58decode_check(v):
    """Decode and verify the checksum of a Base58 encoded string"""
    result = b58decode(v)
    result, check = result[:-4], result[-4:]
    digest = sha256(sha256(result).digest()).digest()
    if check != digest[:4]:
        raise ValueError('Invalid checksum')
    return result


if __name__ == '__main__':
    if b58encode(input()) == '3sLBBYq91BUxPzp7tRuYNKvUNQ2hedyw6ydjzNbf9rJbYq9Ue6xzr9aL6rEDwUQZRGnZPGGgwM2PspAeVcCCjyrNQqDV5PhvaZpwj5ZMaXaFuGjiXK1gf72U325dx6n1RFKiBF3C9dYRTj86aqxZ5HN53KLaW7oBoXwJjbsNFdci8A2kQM':
        print('flag is coming...')
    else:
        print('There is no problem that your input is wrong.')
