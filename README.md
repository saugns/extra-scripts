Extra scripts and SAU audio rendering Makefile
==============================================

The Makefile in this directory tests first-level subdirectories for
any `.sau` files, and on `make` makes an `.mp3` for each new or updated
file using `saugns` and `sox`. Other output formats can also be used.

See <https://sau.frama.io/> for saugns and the SAU language,
and <https://sox.sourceforge.net/> for SoX.

Usage
-----

To render audio from SAU scripts, put them in a new or old subdirectory
and run `make`. Parsing and reporting errors can be done with `make check`.

To change format for the resulting output files, among those supported in
the Makefile, e.g. add `FMT=flac`, as in `make FMT=flac`, to "build" such
files instead. The default format selection is `mp3`. Supported formats:
 * Au, `.au`.
 * FLAC, `.flac`.
 * MP3, `.mp3`. Uses LAME VBR compression level 3 (0 is highest quality).
 * Ogg Vorbis, `.ogg`. Uses quality level 5.8.
 * WAV, `.wav`.

Alternatively, if you have a `filename.sau` in the *main* directory, then
`make filename.mp3` (or another Makefile-supported extension) will render
that particular script. Otherwise the main directory is ignored.

By default all scripts render at a 192000 Hz sample rate, then downsample
to a final 48000 Hz (4x oversampling). The Makefile has options for this.
To just change the final sample rate add e.g. `SRATE=44100` for 44100 Hz.

To remove all files for a format in subdirectories, run `make clean`,
or e.g. `make clean FMT=flac`. Removal is per-format just like adding.
