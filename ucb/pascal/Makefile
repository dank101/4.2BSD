#	@(#)Makefile	1.3	(Berkeley)	4/17/83
#
DESTDIR=
CFLAGS=	-O

# Programs that live in subdirectories, and have makefiles of their own.
#
SUBDIR=	pi pc0 px pxp pdx utilities

all:	${SUBDIR}

${SUBDIR}: /tmp
	cd $@; make ${MFLAGS}

install:
	for i in ${SUBDIR}; do \
		(echo $$i; cd $$i; make ${MFLAGS} DESTDIR=${DESTDIR} install); \
	done

clean:
	rm -f a.out core *.s *.o
	for i in ${SUBDIR}; do \
		(echo $$i; cd $$i; make ${MFLAGS} clean); \
	done
