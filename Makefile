PREFIX = /usr/local
DATADIR = $(PREFIX)/share/anste
LIBDIR = $(PREFIX)/lib
SBINDIR = $(PREFIX)/sbin
BINDIR = $(PREFIX)/bin
LIBPERL = $(PREFIX)/share/perl5
VERSION = `cat VERSION`
EXPORT = anste-$(VERSION)

distclean:
	rm -rf $(EXPORT)
	rm -f anste-$(VERSION).tar.gz

export:
	svn export . $(EXPORT) 
	find $(EXPORT)/src/lib -name 't' -print | xargs rm -rf

dist: export
	mv $(EXPORT)/src/data/conf $(EXPORT)
	tar cvvzf anste-$(VERSION).tar.gz $(EXPORT)

install-anste:
	install -d $(DESTDIR)$(SBINDIR)
	install -m755 src/bin/anste $(DESTDIR)$(SBINDIR)
	install -d $(DESTDIR)$(DATADIR)
	install -d src/data/images $(DESTDIR)$(DATADIR)/images
	install -m644 src/data/images/* $(DESTDIR)$(DATADIR)/images
	install -d $(DESTDIR)$(DATADIR)/profiles
	install -m644 src/data/profiles/* $(DESTDIR)$(DATADIR)/profiles
	install -d $(DESTDIR)$(DATADIR)/scenarios
	install -m644 src/data/scenarios/* $(DESTDIR)$(DATADIR)/scenarios
	install -d $(DESTDIR)$(DATADIR)/scripts
	install -m755 src/data/scripts/* $(DESTDIR)$(DATADIR)/scripts
	install -d $(DESTDIR)$(DATADIR)/templates
	install -m755 src/data/templates/* $(DESTDIR)$(DATADIR)/templates
	install -d $(DESTDIR)$(DATADIR)/tests
	cp -a src/data/tests/ebox $(DESTDIR)$(DATADIR)/tests
	cp -a src/data/tests/sample $(DESTDIR)$(DATADIR)/tests
	install -d $(DESTDIR)$(LIBPERL)/ANSTE
	install -m644 src/lib/ANSTE/Config.pm $(DESTDIR)$(LIBPERL)/ANSTE
	install -m644 src/lib/ANSTE/Validate.pm $(DESTDIR)$(LIBPERL)/ANSTE
	cp -a src/lib/ANSTE/Comm $(DESTDIR)$(LIBPERL)/ANSTE
	cp -a src/lib/ANSTE/Deploy $(DESTDIR)$(LIBPERL)/ANSTE
	cp -a src/lib/ANSTE/Image $(DESTDIR)$(LIBPERL)/ANSTE
	cp -a src/lib/ANSTE/Report $(DESTDIR)$(LIBPERL)/ANSTE
	cp -a src/lib/ANSTE/Scenario $(DESTDIR)$(LIBPERL)/ANSTE
	cp -a src/lib/ANSTE/ScriptGen $(DESTDIR)$(LIBPERL)/ANSTE
	cp -a src/lib/ANSTE/Test $(DESTDIR)$(LIBPERL)/ANSTE
	cp -a src/lib/ANSTE/System $(DESTDIR)$(LIBPERL)/ANSTE
	cp -a src/lib/ANSTE/Virtualizer $(DESTDIR)$(LIBPERL)/ANSTE
	cp -a src/lib/ANSTE/Exceptions $(DESTDIR)$(LIBPERL)/ANSTE
	install -d $(DESTDIR)$(DATADIR)/deploy
	install -d $(DESTDIR)$(DATADIR)/deploy/modules
	ln -s $(DESTDIR)$(LIBPERL)/ANSTE \
		  $(DESTDIR)$(DATADIR)/deploy/modules/ANSTE
	install -d $(DESTDIR)$(DATADIR)/deploy/bin
	install -m755 src/data/deploy/bin/* $(DESTDIR)$(DATADIR)/deploy/bin
	install -d $(DESTDIR)$(DATADIR)/deploy/scripts
	install -m755 src/data/deploy/scripts/* $(DESTDIR)$(DATADIR)/deploy/scripts

uninstall-anste:
	rm -f $(DESTDIR)$(SBINDIR)/anste
	rm -rf $(DESTDIR)$(DATADIR)/images
	rm -rf $(DESTDIR)$(DATADIR)/profiles
	rm -rf $(DESTDIR)$(DATADIR)/scenarios
	rm -rf $(DESTDIR)$(DATADIR)/scripts
	rm -rf $(DESTDIR)$(DATADIR)/tests
	rm -rf $(DESTDIR)$(DATADIR)/templates
	rm -f $(DESTDIR)$(LIBPERL)/ANSTE/Config.pm
	rm -f $(DESTDIR)$(LIBPERL)/ANSTE/Validate.pm
	rm -rf $(DESTDIR)$(LIBPERL)/ANSTE/Comm
	rm -rf $(DESTDIR)$(LIBPERL)/ANSTE/Deploy
	rm -rf $(DESTDIR)$(LIBPERL)/ANSTE/Image
	rm -rf $(DESTDIR)$(LIBPERL)/ANSTE/Report
	rm -rf $(DESTDIR)$(LIBPERL)/ANSTE/Scenario
	rm -rf $(DESTDIR)$(LIBPERL)/ANSTE/ScriptGen
	rm -rf $(DESTDIR)$(LIBPERL)/ANSTE/Test
	rm -rf $(DESTDIR)$(LIBPERL)/ANSTE/System
	rm -rf $(DESTDIR)$(LIBPERL)/ANSTE/Virtualizer
	rm -rf $(DESTDIR)$(LIBPERL)/ANSTE/Exceptions
	rm -rf $(DESTDIR)$(DATADIR)/deploy

install-anste-manager:
	install -d $(DESTDIR)$(SBINDIR)
	install -m755 src/bin/anste-manager $(DESTDIR)$(SBINDIR)
	install -d $(DESTDIR)$(LIBPERL)/ANSTE
	install -d $(DESTDIR)$(LIBPERL)/ANSTE/Manager
	install -m644 src/lib/ANSTE/Manager/JobLauncher.pm \
				  $(DESTDIR)$(LIBPERL)/ANSTE/Manager
	install -m644 src/lib/ANSTE/Manager/Job.pm \
				  $(DESTDIR)$(LIBPERL)/ANSTE/Manager
	install -m644 src/lib/ANSTE/Manager/JobWaiter.pm \
				  $(DESTDIR)$(LIBPERL)/ANSTE/Manager
	install -m644 src/lib/ANSTE/Manager/MailNotifier.pm \
				  $(DESTDIR)$(LIBPERL)/ANSTE/Manager
	install -m644 src/lib/ANSTE/Manager/Server.pm \
				  $(DESTDIR)$(LIBPERL)/ANSTE/Manager
	install -m644 src/lib/ANSTE/Manager/Config.pm \
				  $(DESTDIR)$(LIBPERL)/ANSTE/Manager

uninstall-anste-manager:
	rm -f $(DESTDIR)$(SBINDIR)/anste-manager
	rm -f $(DESTDIR)$(LIBPERL)/ANSTE/Manager/JobLauncher.pm
	rm -f $(DESTDIR)$(LIBPERL)/ANSTE/Manager/Job.pm
	rm -f $(DESTDIR)$(LIBPERL)/ANSTE/Manager/JobWaiter.pm
	rm -f $(DESTDIR)$(LIBPERL)/ANSTE/Manager/MailNotifier.pm
	rm -f $(DESTDIR)$(LIBPERL)/ANSTE/Manager/Server.pm
	rm -f $(DESTDIR)$(LIBPERL)/ANSTE/Manager/Config.pm
	-rmdir $(DESTDIR)$(LIBPERL)/ANSTE/Manager
	-rmdir $(DESTDIR)$(LIBPERL)/ANSTE

install-anste-job: 
	install -d $(DESTDIR)$(BINDIR)
	install -m755 src/bin/anste-job $(DESTDIR)$(BINDIR)
	install -d $(DESTDIR)$(LIBPERL)/ANSTE
	install -d $(DESTDIR)$(LIBPERL)/ANSTE/Manager
	install -m644 src/lib/ANSTE/Manager/Client.pm \
			      $(DESTDIR)$(LIBPERL)/ANSTE/Manager

uninstall-anste-job: 
	rm -f $(DESTDIR)$(BINDIR)/anste-job
	rm -f $(DESTDIR)$(LIBPERL)/ANSTE/Manager/Client.pm
	-rmdir $(DESTDIR)$(LIBPERL)/ANSTE/Manager
	-rmdir $(DESTDIR)$(LIBPERL)/ANSTE

install: install-anste install-anste-manager install-anste-job

uninstall: uninstall-anste uninstall-anste-manager uninstall-anste-job
	
