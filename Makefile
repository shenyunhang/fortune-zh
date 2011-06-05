DESTDIR=
DATA=tang300.dat song100.dat
all: $(DATA)
tang300.dat:tang300
	strfile $< tang300.dat
song100.dat:song100
	strfile $< song100.dat
distclean:
	rm *dat
clean:
	rm *dat

install: all
	mkdir -p $(DESTDIR)/usr/share/games/fortunes
	mkdir -p $(DESTDIR)/usr/bin
	install -m0644  tang300 $(DESTDIR)/usr/share/games/fortunes
	cp -d  tang300.u8 $(DESTDIR)/usr/share/games/fortunes
	install -m0644  tang300.dat $(DESTDIR)/usr/share/games/fortunes
	install -m0644  song100 $(DESTDIR)/usr/share/games/fortunes
	cp -d  song100.u8 $(DESTDIR)/usr/share/games/fortunes
	install -m0644  song100.dat $(DESTDIR)/usr/share/games/fortunes
	install -m0755  fortune-zh $(DESTDIR)/usr/bin
