#!/usr/bin/make

.PHONY: clean clobber init
.DEFAULT_GOAL := all

include ./rules.mk

all: build

build: $(LIBS)

FSRC = \
  $(MODDIR)/dispmodule.f90 \
  $(MODDIR)/dispmodule_absoft.f90 \
  $(MODDIR)/dispmodule_util.f90 \
  $(MODDIR)/disp_i1mod.f90 \
  $(MODDIR)/disp_i1mod_absoft.f90 \
  $(MODDIR)/disp_i2mod.f90 \
  $(MODDIR)/disp_i4mod.f90 \
  $(MODDIR)/disp_i8mod.f90 \
  $(MODDIR)/disp_l1mod.f90 \
  $(MODDIR)/disp_r16mod.f90 
FOBJ = $(FSRC:.f90=.oF90)

$(LIBDIR)/lib$(TARGET).a: $(FOBJ)
	ar rvs $@ $^

clean:
	-rm -f $(FOBJ)

clobber: clean
	-rm -f $(LIBS)

## *EOF*
