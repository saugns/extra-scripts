Extra scripts and SAU audio rendering Makefile
==============================================

The Makefile in this directory tests subdirectories for any `.sau` files,
and if found, makes an `.mp3` for each using `saugns` and `sox`.

To render audio from SAU scripts, put them in a new or old subdirectory
and run `make`. Parsing and reporting errors can be done with `make check`.
Alternatively, if you save a `filename.sau` in the *main* directory, then
`make filename.mp3` will render that particular script.

LAME MP3 VBR quality level 3 is used. This can be changed in the Makefile.
