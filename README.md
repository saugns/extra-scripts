Extra scripts and SAU audio rendering Makefile
==============================================

The Makefile in this directory tests first-level subdirectories for
any `.sau` files, and if found, makes an `.mp3` for each using `saugns`
and `sox`. FLAC (`.flac` files) is also supported.

To render audio from SAU scripts, put them in a new or old subdirectory
and run `make`. Parsing and reporting errors can be done with `make check`.
To change format among those in the Makefile, e.g. add `FMT=flac`,
as in `make FMT=flac`, to "build" such files instead.

Alternatively, if you save a `filename.sau` in the *main* directory, then
`make filename.mp3` (or another Makefile-supported extension) will render
that particular script. Otherwise the main directory is ignored.

LAME MP3 VBR compression/quality level 3 is used (0 is highest quality).
saugns is ran with 192 kHz sample rate downsampled in sox to 48 kHz MP3.
In the Makefile, these things and also supported formats can be changed.
