# Information
Author: dch0017

## Description
Files can always be changed in a secret way. Can you find the flag?

## Getting Started
We get a cute picture of this lil one:</br>
![cat](./cat.jpg)
</br>


## Dig Deeper
On the surface, just a cute cat picture. But let's run a few commands to see if we can find anything.
We are going to try ```strings```, ```binwalk```, and ```hexedit```.

```strings``` will find any text strings embedded in files. </br>
```binwalk``` searches an image file for embedded files or executable code. </br>
```hexedit``` is a file editor that shows you hex along with ASCII equivalent.</br>

```console
┌──(dch0017㉿linux)-[~/Forensics/Information]
└─$ strings cat.jpg | grep "pico*"

┌──(dch0017㉿linux-[~/Forensics/Information]
└─$ binwalk cat.jpg

DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0             0x0             JPEG image data, JFIF standard 1.02
```

Our first two, give us nothing but when we jump into hexedit we see some intersting things.

## Encoded Strings
Near the top of our hexeditor we have this blurb, and the part that sticks out is the ```id``` field and the ```license``` field. They both look to be encoded, possibly base64.

```
00000020   70 20 33 2E  30 00 38 42  49 4D 04 04  00 00 00 00  00 13 1C 02  74 00 07 50  69 63 6F 43  54 46 1C 02  p 3.0.8BIM..........t..PicoCTF..
00000040   00 00 02 00  04 00 FF E1  0B F9 68 74  74 70 3A 2F  2F 6E 73 2E  61 64 6F 62  65 2E 63 6F  6D 2F 78 61  ..........http://ns.adobe.com/xa
00000060   70 2F 31 2E  30 2F 00 3C  3F 78 70 61  63 6B 65 74  20 62 65 67  69 6E 3D 27  EF BB BF 27  20 69 64 3D  p/1.0/.<?xpacket begin='...' id=
00000080   27 57 35 4D  30 4D 70 43  65 68 69 48  7A 72 65 53  7A 4E 54 63  7A 6B 63 39  64 27 3F 3E  0A 3C 78 3A  'W5M0MpCehiHzreSzNTczkc9d'?>.<x:
000000A0   78 6D 70 6D  65 74 61 20  78 6D 6C 6E  73 3A 78 3D  27 61 64 6F  62 65 3A 6E  73 3A 6D 65  74 61 2F 27  xmpmeta xmlns:x='adobe:ns:meta/'
000000C0   20 78 3A 78  6D 70 74 6B  3D 27 49 6D  61 67 65 3A  3A 45 78 69  66 54 6F 6F  6C 20 31 30  2E 38 30 27   x:xmptk='Image::ExifTool 10.80'
000000E0   3E 0A 3C 72  64 66 3A 52  44 46 20 78  6D 6C 6E 73  3A 72 64 66  3D 27 68 74  74 70 3A 2F  2F 77 77 77  >.<rdf:RDF xmlns:rdf='http://www
00000100   2E 77 33 2E  6F 72 67 2F  31 39 39 39  2F 30 32 2F  32 32 2D 72  64 66 2D 73  79 6E 74 61  78 2D 6E 73  .w3.org/1999/02/22-rdf-syntax-ns
00000120   23 27 3E 0A  0A 20 3C 72  64 66 3A 44  65 73 63 72  69 70 74 69  6F 6E 20 72  64 66 3A 61  62 6F 75 74  #'>.. <rdf:Description rdf:about
00000140   3D 27 27 0A  20 20 78 6D  6C 6E 73 3A  63 63 3D 27  68 74 74 70  3A 2F 2F 63  72 65 61 74  69 76 65 63  =''.  xmlns:cc='http://creativec
00000160   6F 6D 6D 6F  6E 73 2E 6F  72 67 2F 6E  73 23 27 3E  0A 20 20 3C  63 63 3A 6C  69 63 65 6E  73 65 20 72  ommons.org/ns#'>.  <cc:license r
00000180   64 66 3A 72  65 73 6F 75  72 63 65 3D  27 63 47 6C  6A 62 30 4E  55 52 6E 74  30 61 47 56  66 62 54 4E  df:resource='cGljb0NURnt0aGVfbTN
000001A0   30 59 57 52  68 64 47 46  66 4D 58 4E  66 62 57 39  6B 61 57 5A  70 5A 57 52  39 27 2F 3E  0A 20 3C 2F  0YWRhdGFfMXNfbW9kaWZpZWR9'/>. </
000001C0   72 64 66 3A  44 65 73 63  72 69 70 74  69 6F 6E 3E  0A 0A 20 3C  72 64 66 3A  44 65 73 63  72 69 70 74  rdf:Description>.. <rdf:Descript
000001E0   69 6F 6E 20  72 64 66 3A  61 62 6F 75  74 3D 27 27  0A 20 20 78  6D 6C 6E 73  3A 64 63 3D  27 68 74 74  ion rdf:about=''.  xmlns:dc='htt
00000200   70 3A 2F 2F  70 75 72 6C  2E 6F 72 67  2F 64 63 2F  65 6C 65 6D  65 6E 74 73  2F 31 2E 31  2F 27 3E 0A  p://purl.org/dc/elements/1.1/'>.
00000220   20 20 3C 64  63 3A 72 69  67 68 74 73  3E 0A 20 20  20 3C 72 64  66 3A 41 6C  74 3E 0A 20  20 20 20 3C    <dc:rights>.   <rdf:Alt>.    <
00000240   72 64 66 3A  6C 69 20 78  6D 6C 3A 6C  61 6E 67 3D  27 78 2D 64  65 66 61 75  6C 74 27 3E  50 69 63 6F  rdf:li xml:lang='x-default'>Pico
00000260   43 54 46 3C  2F 72 64 66  3A 6C 69 3E  0A 20 20 20  3C 2F 72 64  66 3A 41 6C  74 3E 0A 20  20 3C 2F 64  CTF</rdf:li>.   </rdf:Alt>.  </d
00000280   63 3A 72 69  67 68 74 73  3E 0A 20 3C  2F 72 64 66  3A 44 65 73  63 72 69 70  74 69 6F 6E  3E 0A 3C 2F  c:rights>. </rdf:Description>.</
000002A0   72 64 66 3A  52 44 46 3E  0A 3C 2F 78  3A 78 6D 70  6D 65 74 61  3E 0A 20 20  20 20 20 20  20 20 20 20  rdf:RDF>.</x:xmpmeta>.

```

The ```license``` field seems longer, so I tried to decode that one and it gave me the flag!

## Linux
```console
┌──(dch0017㉿linux)-[~/Forensics/Information]
└─$ echo "cGljb0NURnt0aGVfbTN0YWRhdGFfMXNfbW9kaWZpZWR9" | base64 -d
picoCTF{the_m3tadata_1s_modified}
```
