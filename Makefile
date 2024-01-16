#
# A simple Makefile
#
######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

# SOURCES_SATS += brainfuck_main.sats

######

SOURCES_DATS += brainfuck_main.dats

######

MYTARGET=brainfuck

######

include $(PATSHOME)/share/atsmake-post.mk

###### end of [Makefile] ######
