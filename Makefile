.SILENT:
.SUFFIXES: .sau .mp3
.sau.mp3:
	@echo $@; \
	saugns -r192000 $< -o- | sox - -r48000 -C -3.01 $@

all: 
	@for d in *; do \
		if [ -d $$d ] && [ -n "`ls $$d`" ]; then \
			for f in $$d/*.sau; do \
				make -s "$${f%.sau}.mp3"; \
			done; \
		fi; \
	done

check:
	@for d in *; do \
		if [ -d $$d ] && [ -n "`ls $$d`" ]; then \
			saugns -c $$d/*.sau; \
		fi; \
	done
