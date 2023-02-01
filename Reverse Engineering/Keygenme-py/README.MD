# Keygenme-py
Author: dch0017

## Challenge Description
Description

## Downloading Code
Once we download the code, we can pop it open in our favorite ISE/text editor. 

## Arcane Calculator
We see that we have an arcane calculator that let's us do some "astral" calculations, the main menu looks like this:
```
Menu:
(a) Estimate Astral Projection Mana Burn
(b) [LOCKED] Estimate Astral Slingshot Approach Vector
(c) Enter License Key
(d) Exit Arcane Calculator

``` 
but we are runnning in trial mode. Hmm well looks deeper into the code and see what's going on

## Inside The Code
We see a bunch of different functions, either referring to the menus or astral projections. But what we also see is that the license key appears to be our flag:
```python
key_part_static1_trial = "picoCTF{1n_7h3_|<3y_of_"
key_part_dynamic1_trial = "xxxxxxxx"
key_part_static2_trial = "}"
key_full_template_trial = key_part_static1_trial + key_part_dynamic1_trial + key_part_static2_trial
```

So knowing that our flag is related to the license key, we can limit the script down to 2 essential functions: `enter_license()` and `check_key(key, username_trial)`

## Enter_License
```python
def enter_license():
    user_key = input("\nEnter your license key: ")
    user_key = user_key.strip()

    global bUsername_trial

    if check_key(user_key, bUsername_trial):
        decrypt_full_version(user_key)
    else:
        print("\nKey is NOT VALID. Check your data entry.\n\n")
```
So this function takes our input of the license key, strips down the whitespace, and then sends our input along with the variable `bUsername_trial` to the `check_key` function. The bUsername_trial is set to `b'GOUGH'` which is a bytes representation of the string `GOUGH`.

## Check_Key
```python
def check_key(key, username_trial):

    global key_full_template_trial

    if len(key) != len(key_full_template_trial):
        return False
    else:
        # Check static base key part --v
        i = 0
        for c in key_part_static1_trial:
            if key[i] != c:
                return False

            i += 1

        # TODO : test performance on toolbox container
        # Check dynamic part --v
        if key[i] != hashlib.sha256(username_trial).hexdigest()[4]:
            return False
        else:
            i += 1

        if key[i] != hashlib.sha256(username_trial).hexdigest()[5]:
            return False
        else:
            i += 1

        if key[i] != hashlib.sha256(username_trial).hexdigest()[3]:
            return False
        else:
            i += 1

        if key[i] != hashlib.sha256(username_trial).hexdigest()[6]:
            return False
        else:
            i += 1

        if key[i] != hashlib.sha256(username_trial).hexdigest()[2]:
            return False
        else:
            i += 1

        if key[i] != hashlib.sha256(username_trial).hexdigest()[7]:
            return False
        else:
            i += 1

        if key[i] != hashlib.sha256(username_trial).hexdigest()[1]:
            return False
        else:
            i += 1

        if key[i] != hashlib.sha256(username_trial).hexdigest()[8]:
            return False



        return True

```

This function takes our input and compares the first part to the variable `key_part_static1_trial` which we defined above. After that it is 8 IF/ELSE statements in order which must be `true` for the function to continue.

The IF statements are taking the current value of `i` and making sure our input at that location is equal to the `sha256` hash turned to hexadecimal format at a specific array.

## Decoding
For example, the first IF/ELSE statement looks like this:
```python
if key[i] != hashlib.sha256(username_trial).hexdigest()[4]:
            return False
        else:
            i += 1
```

Since we know `username_trial` that was passed to this function is `b'GOUGH'` we can run the following:
```python
print(hashlib.sha256(b'GOUGH').hexdigest()[4])
f
```

Let's just run down the line of IF/ELSE and do that for each one.

## Putting Flag Together
We know the first part of our flag: `picoCTF{1n_7h3_|<3y_of_`</br>
After doing the decoding above, we find that the IF/ELSE staements spit out: `f911a486`</br>

Put together: `picoCTF{1n_7h3_|<3y_of_f911a486}`


Just to verify we try in our `Arcane Calculator` and we no longer get an error:
```console
Menu:
(a) Estimate Astral Projection Mana Burn
(b) [LOCKED] Estimate Astral Slingshot Approach Vector
(c) Enter License Key
(d) Exit Arcane Calculator
What would you like to do, GOUGH (a/b/c/d)? c

Enter your license key: picoCTF{1n_7h3_|<3y_of_f911a486}

Full version written to 'keygenme.py'.

Exiting trial version...

```