.SILENT:
.SUFFIXES: .sau .mp3 .flac
FMT      = mp3
SRATE_TMP=192000 # higher than SRATE for oversampling, e.g. 4x for high quality
SRATE    = 48000 # for CD quality use 44100 but 48000 best fits most soundcards

.sau.mp3:
	@echo $@; \
	saugns -r$(SRATE_TMP) $< -o- | sox - -r$(SRATE) -C -3.01 $@
.sau.flac:
	@echo $@; \
	saugns -r$(SRATE_TMP) $< -o- | sox - -r$(SRATE) $@

all: 
	@for d in *; do \
		if [ -d $$d ] && [ -n "`ls $$d`" ]; then \
			for f in $$d/*.sau; do \
				make -s "$${f%.sau}.$(FMT)"; \
			done; \
		fi; \
	done

check:
	@for d in *; do \
		if [ -d $$d ] && [ -n "`ls $$d`" ]; then \
			saugns -c $$d/*.sau; \
		fi; \
	done
