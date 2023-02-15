# Wave a flag
Author: dch0017

## Description
Can you invoke help flags for a tool or binary? This program has extraordinarily helpful information...

## Beginning Steps
We are given one file, to download and it is called `warm`. Let's grab it using `wget` and run `file` to see what it is:
```console
┌──(kali㉿kali)-[~/GeneralSkills/WaveAFlag]
└─$ wget -q https://mercury.picoctf.net/static/a00f554b16385d9970dae424f66ee1ab/warm

┌──(kali㉿kali)-[~/GeneralSkills/WaveAFlag]
└─$ file warm
warm: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=985d9586d46e8651ab66c2fbb5a5473492466aa3, with debug_info, not stripped

```

## ELF Executable
We see that the file is an executable file using the [ELF format](https://en.wikipedia.org/wiki/Executable_and_Linkable_Format). Let's edit our permissions on the file using `chmod` so we can run the file.

```console
┌──(kali㉿kali)-[~/GeneralSkills/WaveAFlag]
└─$ chmod +x warm

┌──(kali㉿kali)-[~/GeneralSkills/WaveAFlag]
└─$ ./warm
Hello user! Pass me a -h to learn what I can do!
```

## Passing in parameters
Okay, we can succesfully run the program and now it is asking us to pass in a `-h`, which is commonly used for help syntax in programs. Doing that gives us our flag:

```console
┌──(kali㉿kali)-[~/GeneralSkills/WaveAFlag]
└─$ ./warm -h
Oh, help? I actually don't do much, but I do have this flag here: picoCTF{b1scu1ts_4nd_gr4vy_18788aaa}
```