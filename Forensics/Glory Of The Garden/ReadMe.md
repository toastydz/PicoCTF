# Glory of the Garden
Author: dch0017

## Description
This garden contains more than it seems.

## Getting Started
We are greeted by a picture of a garden, okay the title already gives us that much.</br>
![garden](./garden.png)
</br>

Let's run the file command and see what ```file``` gives us.

```console                                                                                             
┌──(kali㉿kali)-[~/PicoCTF/Forensics/GloryOfTheGarden]
└─$ file garden.jpg
garden.jpg: JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 2999x2249, components 3
```

## Strings, Binwalk, Hexedit
We see that it is recognized as a JPEG, so this is when I would usually do my run-through of ```strings```, ```binwalk```, and ```hexedit```.
</br>
But ```strings``` knocked this out immediately.

```console
┌──(kali㉿kali)-[~/PicoCTF/Forensics/GloryOfTheGarden]
└─$ strings garden.jpg | grep -o "picoCTF{.*}" --color=none
picoCTF{more_than_m33ts_the_3y3657BaB2C}
```
