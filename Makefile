DESTDIR=
FORTUNES=/usr/share/games/fortunes
GAMES=/usr/games

DATA=tang300.dat song100.dat
all: $(DATA)

tang300.dat:tang300
	strfile $< tang300.dat
song100.dat:song100
	strfile $< song100.dat

distclean:
	rm -f *dat
clean:
	rm -f *dat

install: all
	mkdir -p $(DESTDIR)$(FORTUNES)
	mkdir -p $(DESTDIR)$(GAMES)
	install -m0644  tang300 $(DESTDIR)$(FORTUNES)
	cp -d  tang300.u8 $(DESTDIR)$(FORTUNES)
	install -m0644  tang300.dat $(DESTDIR)$(FORTUNES)
	install -m0644  song100 $(DESTDIR)$(FORTUNES)
	cp -d  song100.u8 $(DESTDIR)$(FORTUNES)
	install -m0644  song100.dat $(DESTDIR)$(FORTUNES)
	install -m0755  fortune-zh $(DESTDIR)$(GAMES)
