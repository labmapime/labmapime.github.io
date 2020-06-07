CP_RU = cp -ru

HOMEDIR = /home/specmap/labmap
DESTDIR = $(HOMEDIR)/www.hugo
THEMES = $(wildcard themes/*)
THEMESCLEAN = $(addsuffix clean,$(THEMES))
HUGO = $(HOMEDIR)/.bin/hugo

.DEFAULT: site
.PHONY: site deploy clean $(THEMES)

$(THEMES):
	$(MAKE) -C $@

%clean: %
	$(MAKE) -C $< clean

clean: $(THEMESCLEAN)
	$(RM) -r public

site: $(THEMES)
	$(HUGO) --minify

deploy: site
	$(CP_RU) public/* $(DESTDIR)
