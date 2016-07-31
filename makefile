#!/usr/bin/make

.PHONY: init clean clobber libraries tests
.DEFAULT_GOAL := all

BLDDIR=.

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

init:
	@-mkdir -p $(BINDIR)
	@-mkdir -p $(LIBDIR)
	@-mkdir -p $(TESTDIR)
	@-mkdir -p $(FMODDIR)

## *EOF*
