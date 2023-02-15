# First Grep
Author: dch0017

## Description
Can you find the flag in file? This would be really tedious to look through manually, something tells me there is a better way.

## (e)Grep
This appears to be a basic `grep` challenge. We get a file and running file shows us it is a very long ASCII text file.

I like to use [egrep](https://linux.die.net/man/1/egrep) for these, to add some regex to the mix in case the flag is encoded some way.

With some simple regex our command to get the flag is:
```console
┌──(kali㉿kali)-[~/GeneralSkills/FirstGrep]
└─$ cat file | egrep "[A-Za-z]{7}{"
picoCTF{grep_is_good_to_find_things_dba08a45}
```