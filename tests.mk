#!/usr/bin/make

.PHONY: clean clobber init
.DEFAULT_GOAL := all

include ./rules.mk

all: build

TESTFSRC = \
  $(TESTSDIR)/test_dispmodule.f90
FTESTS = $(patsubst $(TESTSDIR)/%,$(TESTDIR)/%, $(TESTFSRC:.f90=))

build: $(FTESTS)

$(TESTDIR)/test_dispmodule: $(TESTSDIR)/test_dispmodule.f90
	$(FC) -I$(FMODDIR) $(FFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	-rm -f $(CTESTS)
	-rm -f $(FTESTS)

clobber: clean
	-rm -f $(CTESTS)
	-rm -f $(FTESTS)

## *EOF*
