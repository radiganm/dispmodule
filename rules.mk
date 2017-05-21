#!/usr/bin/make

.PHONY: clean clobber init
.DEFAULT_GOAL := all

VPATH = ./892/Fortran90/Src

CCC = g++
FC = gfortran

BINDIR    = ./bin
SRCDIR    = ./892/Fortran90/Src
LIBDIR    = ./lib
TESTDIR   = ./tests
SCRIPTDIR = ./scripts
FMODDIR   = ./mod
MODDIR    = ./$(SRCDIR)
APPDIR    = ./$(SRCDIR)
TESTSDIR  = ./892/Fortran90/Drivers
SUBDIR    = ./submodules

TARGET = dispmodule

LIBS = \
  $(LIBDIR)/lib$(TARGET).a

ARCH = -m64
ININC =
EXINC =
INC = -I./include
CFLAGS = -fPIC -O2 $(ARCH) -g3 $(INC) $(ININC) $(EXINC)
C11FLAGS = -fPIC -O2 $(ARCH) -g3 -std=c++11 $(INC) $(ININC) $(EXINC)
FFLAGS = -fPIC -O2 $(ARCH) -g3 $(INC) $(ININC) $(EXINC)
LIBPATH =
EXLIBS =
INLIBS =
LDFLAGS = -O2 $(ARCH) -g $(LIBPATH) $(EXLIBS) $(LIBS)

%.o: %.cpp
	$(CCC) $(C11FLAGS) -c -o $@ $^

%.o: %.f90
	$(FC) -J$(FMODDIR) $(FFLAGS) -c -o $@ $^

## *EOF*
