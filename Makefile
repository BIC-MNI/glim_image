# --------------------------------------------------------------------
#
# Makefile for building glim_image
#

# Executable names
PROGS    = glim_image
EXTRA_OBJ = matrix.o glim.o smoothness.o#
UTIL_LIB = ../utils/libmincprog.a
CDEFINES = -DDEBUG#                        cpp defines
OPT      = -O
INCLUDES = -I. -I../utils -I/usr/local/include -I/usr/local/include/volume_io 
LDOPT    = -lvolume_io -lminc -lnetcdf -lm

# --------------------------------------------------------------------

CFLAGS    = $(CDEFINES) $(INCLUDES) $(OPT)# CFLAGS and LINTFLAGS should
LINTFLAGS = $(CDEFINES) $(INCLUDES) -DUSE_ANSI# be same, except for -g/-O

PROG_OBJ  = $(PROGS:=.o)#                 list of objects
LINT_LIST = $(PROG_OBJ:.o=.ln)
LINT_EXTRA= $(EXTRA_OBJS:.o=.ln)
LINT_LIST_EXE = $(LINT_LIST:.ln=.)#       list of executable names to lint

# --------------------------------------------------------------------

.SUFFIXES: .ln

default: $(PROGS)

all: $(PROGS) lint

#Dependency on Makefile
$(PROG_OBJ) $(EXTRA_OBJ) $(LINT_LIST) $(LINT_EXTRA) : Makefile

.c.o: #                                    defines the rule for creating .o
	$(CC) $(CFLAGS) -c $< -g $@

.c.ln:
	lint $(LINTFLAGS) -c $< -g $@

# How to make executables
$(PROGS) : $$@.o $(EXTRA_OBJ)
	$(CC) $@.o $(EXTRA_OBJ) $(UTIL_LIB) -o $@ $(LDOPT)

# How to lint
lint: $(LINT_LIST_EXE)

$(LINT_LIST_EXE): $$@ln $(LINT_EXTRA)
	lint -m -x -u $(LINTFLAGS) $@ln $(LINT_EXTRA)

clean:
	\rm -f $(PROG_OBJ) $(EXTRA_OBJ) $(LINT_LIST) $(LINT_EXTRA)




