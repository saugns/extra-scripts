Extra scripts and SAU audio rendering Makefile
==============================================

The Makefile in this directory tests subdirectories for any `.sau` files,
and if found, makes an `.mp3` for each using `saugns` and `sox`.

To render SAU scripts, put them in a new or old subdirectory and run `make`.

LAME MP3 VBR quality level 3 is used. This can be changed in the Makefile.
