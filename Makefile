.SILENT:
.SUFFIXES: .sau .wav .au .flac .mp3
FMT      = mp3
SRATE_TMP=192000 # higher than SRATE for oversampling, e.g. 4x for high quality
SRATE    = 48000 # for CD quality use 44100 but 48000 best fits most soundcards

.sau.mp3:
	@echo $@; \
	saugns -r$(SRATE_TMP) $< -o- | sox - -r$(SRATE) -C -3.01 $@
.sau.wav .sau.au .sau.flac:
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

clean:
	@if [ $(FMT) != "sau" ] && [ -n "`ls */*.$(FMT)`" ]; then \
		echo "Remove all .$(FMT) files?"; \
		read CONFIRM; \
		if [ "$$CONFIRM" = "y" ] || [ "$$CONFIRM" = "Y" ]; then \
			rm -f */*.$(FMT); \
		fi; \
	fi
