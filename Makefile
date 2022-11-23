CP_RU = cp -ru
HUGO = /usr/bin/hugo
DESTDIR = $(HOMEDIR)/www.hugo
THEMES = $(wildcard themes/*)
THEMESCLEAN = $(addsuffix clean,$(THEMES))

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
	$(CP_RU) themes/labmap/scss/build/css/style.css css/style.css
	$(CP_RU) data/img public/
# $(CP_RU) public/* $(DESTDIR)
