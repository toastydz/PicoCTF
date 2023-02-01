# File-Run1
Author: dch0017

## Challenge Description
A program has been provided to you, what happens if you try to run it on the command line?

## Downloading File
We are asked to try and run this file on the command line. We just need two( or three) commands: </br>
`wget` to download the file.
`chmod` to modify our permissions on the file so we can execute it.
Optionally: `file` to verify that it is an executable file.

Once we do that it spits out our flag.

## Console

```console
┌──(kali㉿kali)-[~/RevEng/filerun1]
└─$ wget https://artifacts.picoctf.net/c/309/run --quiet

┌──(kali㉿kali)-[~/RevEng/filerun1]
└─$ file run
run: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=9fa9c4d805e9a77142375b406526cb97b1aae60b, for GNU/Linux 3.2.0, not stripped

┌──(kali㉿kali)-[~/RevEng/filerun1]
└─$ chmod +x run

┌──(kali㉿kali)-[~/RevEng/filerun1]
└─$ ./run
The flag is: picoCTF{U51N6_Y0Ur_F1r57_F113_e5559d46}

```