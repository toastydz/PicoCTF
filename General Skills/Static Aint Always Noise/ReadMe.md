# Static Aint Always Noise
Author: dch0017

## Description
Can you look at the data in this binary: static? This BASH script might help!

## Getting our File
Let's get our file using `wget` and run `file` to see what we are working with:

```console
┌──(kali㉿kali)-[~/GeneralSkills/staticaintalways]
└─$ wget -q https://mercury.picoctf.net/static/ff4e569d6b49b92d090796d4631a2577/static

┌──(kali㉿kali)-[~/GeneralSkills/staticaintalways]
└─$ file static
static: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=17ad46e6c58b7c40148a89923e314662595d101b, not stripped
```

Another executable file, let's try `chmod` to edit our permissions and running it:

## Running File
```console
┌──(kali㉿kali)-[~/GeneralSkills/staticaintalways]
└─$ chmod +x static

┌──(kali㉿kali)-[~/GeneralSkills/staticaintalways]
└─$ ./static
Oh hai! Wait what? A flag? Yes, it's around here somewhere!
```

Not much info, but we can try the `strings` command to see if we can get more info.

## Strings and Regex
The `strings` command will go through our binary or exe files and pull out any alphanumeric strings. We can combine that with `egrep` to search and see if we find any strings that match the `regex` of our flag pattern. We know that the flag generally starts with `picoCTF` which is 7 letters, and is followed by a `{`.

Putting this all together we get the following command:

```console
┌──(kali㉿kali)-[~/GeneralSkills/staticaintalways]
└─$ strings static | egrep "[A-Za-z]{7}{"
picoCTF{d15a5m_t34s3r_ccb2b43e}
```