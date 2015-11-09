DESTDIR=
FORTUNES=/usr/share/fortune
GAMES=/usr/games

TEXTS = tang300 song100 shijing chinese
DATA=tang300.dat song100.dat shijing.dat chinese.dat
all: $(DATA)

stat:
	make chinese.dat
	bash util/statistic.sh
	make clean 1>/dev/null

%.dat: %
	strfile $< $<.dat
chinese.dat: 
	touch chinese
	find chinese.d -type f -exec cat '{}' \; >> chinese
	strfile chinese

distclean: clean
clean:
	-rm -f *dat
	-rm chinese

install: all
	mkdir -p $(DESTDIR)$(FORTUNES)
# 	mkdir -p $(DESTDIR)$(GAMES)
# 	install -m0755  fortune-zh        $(DESTDIR)$(GAMES)
	install -m0644  $(TEXTS) $(DATA)  $(DESTDIR)$(FORTUNES)
#	install -m0644 shijing $(DESTDIR)$(FORTUNES)
#	cp -d shijing.u8 $(DESTDIR)$(FORTUNES)
#	install -m0644 shijing.dat $(DESTDIR)$(FORTUNES)
.PHONY: install clean distclean stat all
