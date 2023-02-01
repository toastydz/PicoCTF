# crackme-py
Author: dch0017

## Challenge Description
Description

## Downloading Code
Once we download the code, we can pop it open in our favorite ISE/text editor. 

## Secret At Top
Pretty short script, and we have a secret stored at the top:
```python
# Hiding this really important number in an obscure piece of code is brilliant!
# AND it's encrypted!
# We want our biggest client to know his information is safe with us.
bezos_cc_secret = "A:4@r%uL`M-^M0c0AbcM-MFE0cdhb52g2N"

# Reference alphabet
alphabet = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ"+ \
            "[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"

```

## ROT47
Right below that we have a `decode_secret` function that has the description about `ROT47`, so let's try to decode that.

Using [cyberchef](https://gchq.github.io/CyberChef/#recipe=ROT47(47)&input=QTo0QHIldUxgTS1eTTBjMEFiY00tTUZFMGNkaGI1MmcyTg) we see that the flag was indeed encoded using ROT47.

## Flag
```
picoCTF{1|\/|_4_p34|\|ut_4593da8a}
```
