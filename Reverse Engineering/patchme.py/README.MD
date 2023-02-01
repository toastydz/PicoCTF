# patchme.py
Author: dch0017

## Challenge Description
Can you get the flag?
Run this Python program in the same directory as this encrypted flag.

## Downloading Code
Let's download our python script and encrypted flag to a directory using `wget`:
```console
┌──(kali㉿kali)-[~/RevEng/patchmepy]
└─$ wget https://artifacts.picoctf.net/c/387/patchme.flag.py -q

┌──(kali㉿kali)-[~/RevEng/patchmepy]
└─$ wget https://artifacts.picoctf.net/c/387/flag.txt.enc -q

┌──(kali㉿kali)-[~/RevEng/patchmepy]
└─$ ls
flag.txt.enc  patchme.flag.py
```

## Running patchme.flag.py
```console
┌──(kali㉿kali)-[~/RevEng/patchmepy]
└─$ python3 patchme.flag.py
Please enter correct password for flag:
```

The python is asking for a password, entering random guesses do not give any additional information. Let's open the python script to see what is inside.

## Reading patchme.flag.py
At the bottom of our python script we see a function: `level_1_pw_check()`:
```python
def level_1_pw_check():
    user_pw = input("Please enter correct password for flag: ")
    if( user_pw == "ak98" + \
                   "-=90" + \
                   "adfjhgj321" + \
                   "sleuth9000"):
        print("Welcome back... your flag, user:")
        decryption = str_xor(flag_enc.decode(), "utilitarian")
        print(decryption)
        return
    print("That password is incorrect")
```
This function checks our password we input against the password it has stored here in plaintext. Let's put that password together again and try re-running our python script. 

## Re-running patchme.flag.py
```console
┌──(kali㉿kali)-[~/RevEng/patchmepy]
└─$ python3 patchme.flag.py
Please enter correct password for flag: ak98-=90adfjhgj321sleuth9000
Welcome back... your flag, user:
picoCTF{p47ch1ng_l1f3_h4ck_f01eabfa}
```