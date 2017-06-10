#!/usr/bin/make

.PHONY: init clean clobber libraries tests
.DEFAULT_GOAL := all

BLDDIR=.

INSTALLDIR=/opt/local

include ./rules.mk

all: init libraries tests

libraries:
	$(MAKE) -f $(BLDDIR)/$@.mk

tests:
	$(MAKE) -f $(BLDDIR)/$@.mk

clean:
	$(MAKE) -f $(BLDDIR)/libraries.mk    $@

clobber:
	$(MAKE) -f $(BLDDIR)/libraries.mk    $@

install:
	sudo mkdir -p $(INSTALLDIR)/lib && cp -f lib/* $(INSTALLDIR)/lib
	sudo mkdir -p $(INSTALLDIR)/mod && cp -f mod/* $(INSTALLDIR)/mod

init:
	@-mkdir -p $(BINDIR)
	@-mkdir -p $(LIBDIR)
	@-mkdir -p $(TESTDIR)
	@-mkdir -p $(FMODDIR)

## *EOF*
