# Magikarp Ground Mission
Author: dch0017

## Description
Do you know how to move between directories and read files in the shell? Start the container, `ssh` to it, and then `ls` once connected to begin. Login via `ssh` as `ctf-player` with the password, `abcba9f7`

## Beginning Steps
Let's SSH into the machine after we start the instance using the command given to us. It is a standard `ssh` command with the port defined.

```console
ssh ctf-player@venus.picoctf.net -p 59127
```

## Browsing Directory
Now that we are in, let's run `ls` and see what we got:
```console
ctf-player@pico-chall$ ls
1of3.flag.txt  instructions-to-2of3.txt
```

We see we got what looks like the first third of our flag, so let's `cat` it out:
```console
ctf-player@pico-chall$ cat 1of3.flag.txt
picoCTF{xxsh_
```

## Instructions
Let's read the `instructions-to-2of3.txt`. We see that it tells us to go to root (/) and from there we can `ls` to see what we have again. Here we see the 2nd flag and instructions, let's `cat` out part 2 of the flag.
```console
ctf-player@pico-chall$ cat instructions-to-2of3.txt
Next, go to the root of all things, more succinctly `/`
ctf-player@pico-chall$ cd /
ctf-player@pico-chall$ ls
2of3.flag.txt  boot  etc   instructions-to-3of3.txt  lib64  mnt  proc  run   srv  tmp  var
bin            dev   home  lib                       media  opt  root  sbin  sys  usr
ctf-player@pico-chall$ cat 2of3.flag.txt
0ut_0f_\/\/4t3r_

```

## Part 3
We will read the instructions for part 3 now. 
```console
ctf-player@pico-chall$ cat instructions-to-3of3.txt
Lastly, ctf-player, go home... more succinctly `~`
```

This tells us to go to home or `~` and from there, I imagine we will use `ls` to list the directory and `cat` out the flag if it is there as we have previously done.

```console
ctf-player@pico-chall$ cd ~
ctf-player@pico-chall$ ls ~
3of3.flag.txt  drop-in
ctf-player@pico-chall$ cat 3of3.flag.txt
21cac893}
```

## Flag
Now to put all our parts together for the flag we get:
```
picoCTF{xxsh_0ut_0f_\/\/4t3r_21cac893}
```