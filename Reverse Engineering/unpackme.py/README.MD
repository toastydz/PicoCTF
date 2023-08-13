# unpackme.py
Author: dch0017

## Challenge Description
Can you get the flag?
Reverse engineer this Python program.

## Downloading Code
Let's download our python script using `wget`:
```console
kali㉿kali$ wget -q https://artifacts.picoctf.net/c/465/unpackme.flag.py

kali㉿kali$ ls
unpackme.flag.py
```

## Running unpackme.flag.py
Let's try running the program:
```console
┌──(kali㉿kali)-[~/RevEng/unpackmepy]
└─$ python3 unpackme.flag.py
What's the password? flag
That password is incorrect.
```

No luck there, let's crack it open and see what's inside.

## Opening unpackme.flag.py
```python
import base64
from cryptography.fernet import Fernet

payload = b'gAAAAABiMD06eCisTWoohiYL5jHGdCte5LAviTFguZQSIyRLAWICJpmdrgxhdTB923h6eksddKpKH41I5-HGzI6xGF_7eb_1u0S2Phw2NvYGTF1KzE1-AU66FfIW6QXWnCpPHOS9CatNBuFXuyjEAx86Rld2E7GjvuKEOJJXx_GZE2JgAxnDmvcewoksfjVCCAwNqzixpUPKkIET2xmO4EsDqK4CUG8_JxP0HwSEzW4PH-hVpZrkyse4EodFPsjs7NVJF0hL1_8bP1TCiEEnFn7hCoTRRvlpYQ=='

key_str = 'correctstaplecorrectstaplecorrec'
key_base64 = base64.b64encode(key_str.encode())
f = Fernet(key_base64)
plain = f.decrypt(payload)
exec(plain.decode())
```

We have an encrypted program, that is decoded using [Fernet](https://cryptography.io/en/latest/fernet/) with the key as: `correctstaplecorrectstaplecorrec` base64 encoded.

## Decoding
So we see that the payload is already decoded and saved as the variable `plain` for us. Then on the final line it is executed to run the script which asks us for the password. Let's just put in a `print` statement above the `exec` command so that it prints out the plaintext for us:
```python
plain = f.decrypt(payload)
print(plain.decode())
exec(plain.decode())
```

Now let's try running again.

## Running unpackme.py again
```console
┌──(kali㉿kali)-[~/RevEng/unpackmepy]
└─$ python3 unpackme.flag.py

pw = input('What\'s the password? ')

if pw == 'batteryhorse':
  print('picoCTF{175_chr157m45_cd82f94c}')
else:
  print('That password is incorrect.')


What's the password? batteryhorse
picoCTF{175_chr157m45_cd82f94c}
```

It prints out what the password should be and our flag, so we enter `batteryhorse` and we get our flag!
