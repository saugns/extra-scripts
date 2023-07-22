.SILENT:
.SUFFIXES: .sau .au .flac .wav .mp3 .ogg
DIRS     = *
FMT      = mp3
SRATE_TMP=192000 # higher than SRATE for oversampling, e.g. 4x for high quality
SRATE    = 48000

.sau.au .sau.flac .sau.wav:
	@echo $@; \
	saugns -r$(SRATE_TMP) $< -o- | sox - -r$(SRATE) $@
.sau.mp3:
	@echo $@; \
	saugns -r$(SRATE_TMP) $< -o- | sox - -r$(SRATE) -C -3.01 $@
.sau.ogg:
	@echo $@; \
	saugns -r$(SRATE_TMP) $< -o- | sox - -r$(SRATE) -C 5.8 $@

all: 
	@for d in $(DIRS); do \
		if [ -d $$d ] && [ -n "`ls $$d`" ]; then \
			for f in $$d/*.sau; do \
				make -s "$${f%.sau}.$(FMT)"; \
			done; \
		fi; \
	done

check:
	@for d in $(DIRS); do \
		if [ -d $$d ] && [ -n "`ls $$d`" ]; then \
			saugns -c $$d/*.sau; \
		fi; \
	done

clean:
	@if [ "$(FMT)" != "sau" ]; then \
		for d in $(DIRS); do \
			rm -f $$d/*.$(FMT); \
		done; \
	fi
