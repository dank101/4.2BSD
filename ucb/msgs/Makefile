#
#	@(#)Makefile	4.1 5/19/82
#
CFLAGS=-O
SRCS = msgs.c msgs.h Makefile
msgs: msgs.c msgs.h
	cc $(CFLAGS) -o msgs msgs.c -ltermlib
install:
	install -s msgs ${DESTDIR}/usr/ucb
clean:
	-rm -f msgs
sources: $(SRCS)
$(SRCS):
	sccs get $@
