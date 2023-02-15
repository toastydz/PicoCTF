# Obedient Cat
Author: dch0017

## Description
This file has a flag in plain sight (aka "in-the-clear"). Download flag.

## Steps to get our flag
We run `wget` to grab our file, and we see that it has the name `flag`. Then we ran the `file` command on our `flag` file to see that it is ASCII text. Then try and `cat` the file out to see that it gives us our flag:

```console
┌──(kali㉿kali)-[~/GeneralSkills/ObedeientCat]
└─$ wget https://mercury.picoctf.net/static/fb851c1858cc762bd4eed569013d7f00/flag -q

┌──(kali㉿kali)-[~/GeneralSkills/ObedeientCat]
└─$ file flag
flag: ASCII text

┌──(kali㉿kali)-[~/GeneralSkills/ObedeientCat]
└─$ cat flag
picoCTF{s4n1ty_v3r1f13d_28e8376d}
```