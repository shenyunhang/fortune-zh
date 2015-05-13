DESTDIR=
FORTUNES=/usr/share/games/fortunes
GAMES=/usr/games

DATA=tang300.dat song100.dat chinese.dat
all: $(DATA)

stat:
	make chinese.dat
	bash util/statistic.sh
	make clean 1>/dev/null

tang300.dat:tang300
	strfile $< tang300.dat
song100.dat:song100
	strfile $< song100.dat
shijing.dat:shijing
	strfile $< shijing.dat
chinese.dat:
	touch chinese
	cat chinese.d/mingyan.d/* >> chinese
	cat chinese.d/lunyu.d/* >> chinese
	cat chinese.d/daxue.d/* >> chinese
	cat chinese.d/*.txt >> chinese
#	find chinese.d -type f -exec cat '{}' \; | tee -a /dev/null
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
	
	install -m0644  tang300 $(DESTDIR)$(FORTUNES)
	cp -d  tang300.u8 $(DESTDIR)$(FORTUNES)
	install -m0644  tang300.dat $(DESTDIR)$(FORTUNES)
	
	install -m0644  song100 $(DESTDIR)$(FORTUNES)
	cp -d  song100.u8 $(DESTDIR)$(FORTUNES)
	install -m0644  song100.dat $(DESTDIR)$(FORTUNES)
	
#	install -m0644 shijing $(DESTDIR)$(FORTUNES)
#	cp -d shijing.u8 $(DESTDIR)$(FORTUNES)
#	install -m0644 shijing.dat $(DESTDIR)$(FORTUNES)
	
	install -m0644 chinese $(DESTDIR)$(FORTUNES)
	cp -d chinese.u8 $(DESTDIR)$(FORTUNES)
	install -m0644 chinese.dat $(DESTDIR)$(FORTUNES)
