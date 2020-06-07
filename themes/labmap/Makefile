.DEFAULT: all
.PHONY: all clean \
	scss clean-scss

scss:
	$(MAKE) -C $@ deploy

clean-scss:
	$(MAKE) -C scss clean

clean: clean-scss
	$(RM) -r static/css

all: scss
