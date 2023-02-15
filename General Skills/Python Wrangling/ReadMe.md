# Python Wrangling
Author: dch0017

## Description
Python scripts are invoked kind of like programs in the Terminal... Can you run this Python script using this password to get the flag?

## Beginning Steps
We are given three separate files to start off:</br>
A python file `ende.py`</br>
A text file `pw.txt`</br>
An encrypted flag `flag.txt.en`

## Python script
After downloading the files, let's go ahead and take a look at the python script:
```python
import sys
import base64
from cryptography.fernet import Fernet



usage_msg = "Usage: "+ sys.argv[0] +" (-e/-d) [file]"
help_msg = usage_msg + "\n" +\
        "Examples:\n" +\
        "  To decrypt a file named 'pole.txt', do: " +\
        "'$ python "+ sys.argv[0] +" -d pole.txt'\n"



if len(sys.argv) < 2 or len(sys.argv) > 4:
    print(usage_msg)
    sys.exit(1)



if sys.argv[1] == "-e":
    if len(sys.argv) < 4:
        sim_sala_bim = input("Please enter the password:")
    else:
        sim_sala_bim = sys.argv[3]

    ssb_b64 = base64.b64encode(sim_sala_bim.encode())
    c = Fernet(ssb_b64)

    with open(sys.argv[2], "rb") as f:
        data = f.read()
        data_c = c.encrypt(data)
        sys.stdout.write(data_c.decode())


elif sys.argv[1] == "-d":
    if len(sys.argv) < 4:
        sim_sala_bim = input("Please enter the password:")
    else:
        sim_sala_bim = sys.argv[3]

    ssb_b64 = base64.b64encode(sim_sala_bim.encode())
    c = Fernet(ssb_b64)

    with open(sys.argv[2], "r") as f:
        data = f.read()
        data_c = c.decrypt(data.encode())
        sys.stdout.buffer.write(data_c)


elif sys.argv[1] == "-h" or sys.argv[1] == "--help":
    print(help_msg)
    sys.exit(1)


else:
    print("Unrecognized first argument: "+ sys.argv[1])
    print("Please use '-e', '-d', or '-h'.")
```

So we can see that the program takes command line arguments to either encrypt or decrypt a file. We should use `-d` for our decryption of our `flag.txt.en` file. Also, if we pay attention to the order there should be 4 arguments:</br>
sys.argv[0]: will be our program we are running `ende.py`</br>
sys.argv[1]: will be our choice of encrypting or decrypting, so in this case `-d`</br>
sys.argv[2]: will be our file that needs decrypting `flag.txt.en`</br>
sys.argv[3]: is optional and will be our password used to decrypt the file, or the contents of `pw.txt`


## Running Program
First let's get the contents of `pw.txt` so we have that for our command later:
```console
┌──(kali㉿kali)-[~/GeneralSkills/PyWrangling]
└─$ cat pw.txt
dbd1bea4dbd1bea4dbd1bea4dbd1bea4
```

Now for the actual decryption we run the following command to get our flag:
```console
┌──(kali㉿kali)-[~/GeneralSkills/PyWrangling]
└─$ python3 ende.py -d flag.txt.en dbd1bea4dbd1bea4dbd1bea4dbd1bea4
picoCTF{4p0110_1n_7h3_h0us3_dbd1bea4}
```