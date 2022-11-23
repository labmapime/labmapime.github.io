CP_R    = cp -r
MKDIR_P = mkdir -p

#SASSC = /home/specmap/labmap/.bin/sassc --style compressed
SASSC = /usr/bin/sassc --style compressed
DESTDIR = ../static

SHEETS	= css/style.css

.DEFAULT: all
.PHONY: all directories clean deploy

css/%.css: src/%.scss
	$(SASSC) $< > build/$@

all: directories $(SHEETS)

directories:
	$(MKDIR_P) build/css

clean:
	$(RM) -rf build

deploy: all
	$(MKDIR_P) $(DESTDIR)
	$(CP_R) build/* $(DESTDIR)
