DESTDIR=
FORTUNES=/usr/share/games/fortunes
GAMES=/usr/games

DATA=tang300.dat song100.dat chinese.dat
all: $(DATA)

stat:
	bash util/statistic.sh

tang300.dat:tang300
	strfile $< tang300.dat
song100.dat:song100
	strfile $< song100.dat
shijing.dat:shijing
	strfile $< shijing.dat
chinese.dat:ch.d/mingyan.d/*
	cat ch.d/mingyan.d/* > chinese
	cat ch.d/*.txt >> chinese
	strfile chinese

distclean:
	-rm -f *dat
clean:
	-rm -f *dat
	-rm chinese

install: all
	mkdir -p $(DESTDIR)$(FORTUNES)
	mkdir -p $(DESTDIR)$(GAMES)
	install -m0755  fortune-zh $(DESTDIR)$(GAMES)
	install -m0755  fortune-zh.old $(DESTDIR)$(GAMES)
	
	install -m0644  tang300 $(DESTDIR)$(FORTUNES)
	cp -d  tang300.u8 $(DESTDIR)$(FORTUNES)
	install -m0644  tang300.dat $(DESTDIR)$(FORTUNES)
	
	install -m0644  song100 $(DESTDIR)$(FORTUNES)
	cp -d  song100.u8 $(DESTDIR)$(FORTUNES)
	install -m0644  song100.dat $(DESTDIR)$(FORTUNES)
	
#	install -m0644 shijing $(DESTDIR)$(FORTUNES)
#	cp -d shijing.u8 $(DESTDIR)$(FORTUNES)
#	install -m0644 shijing.dat $(DESTDIR)$(FORTUNES)
	
	install -m0644 mingyan $(DESTDIR)$(FORTUNES)
	cp -d mingyan.u8 $(DESTDIR)$(FORTUNES)
	install -m0644 mingyan.dat $(DESTDIR)$(FORTUNES)
	
	install -m0644 yanyu $(DESTDIR)$(FORTUNES)
	cp -d yanyu.u8 $(DESTDIR)$(FORTUNES)
	install -m0644 yanyu.dat $(DESTDIR)$(FORTUNES)
