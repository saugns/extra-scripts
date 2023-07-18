.SILENT:
.SUFFIXES: .sau .mp3
.sau.mp3:
	@echo $@; \
	saugns -r192000 $< -o- | sox - -r48000 -C -3.01 $@

all: 
	@for f in *.sau; do \
		make -s "$${f%.sau}.mp3"; \
	done

check:
	saugns -c *.sau
