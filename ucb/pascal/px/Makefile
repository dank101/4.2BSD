SCCSID = "@(#)Makefile 1.17 2/3/83"

DESTDIR =
BINDIR = /usr/ucb
LIBDIR = /usr/lib
SRCDIR = ../src
LIBPCDIR = /usr/src/usr.lib/libpc
CC = cc
CFLAGS = -O -I${SRCDIR} -I${LIBPCDIR}
OPT = /lib/c2
AS = as
RM = rm -f

PSHDR =	opc.c pic.c

PXHDR =	vars.h machdep.h

PXSRC =	int.c interp.c utilities.c

PXOBJ =	int.o interp.o utilities.o

PXUTL =	interp.sed clean.sed version.c

.c.o:
	${CC} ${CFLAGS} -c $*.c

px: Version.c ${PXOBJ}
	${CC} ${CFLAGS} -o px Version.c ${PXOBJ} -lpc -lm
Version.c: version.c
	${CC} ${CFLAGS} -o version version.c
	./version >Version.c
	${RM}  version
interp.o interp.s: interp.c interp.sed
	${CC} -S -I${SRCDIR} -I${LIBPCDIR} interp.c
	sed -f interp.sed <interp.s >tmp
	${OPT} tmp interp.s
	/usr/lib/pc2 <interp.s >tmp
	mv tmp interp.s
	as -o interp.o interp.s
h02opcs.h: ${SRCDIR}/OPnames.h opc.c
	${CC} ${CFLAGS} opc.c -o opc
	./opc >h02opcs.h
	${RM} opc

install: px
	install px ${DESTDIR}/usr/ucb/px

sources: ${PXHDR} ${PXSRC} ${PXUTL}
${PSHDR}:
	ln -s ${SRCDIR}/$@ $@

clean:
	${RM} *.o *.s px version opc* pic*
	${RM} h02opcs.h errs lpr core tmp

prt: interp.s
	sed -f clean.sed <interp.s

grind: sources
	${BINDIR}/ctags -v *.h *.c *.s | sort -f >index
	${BINDIR}/vgrind -t -x index >lpr
	${CC} ${CFLAGS} -o pic pic.c
	${BINDIR}/vgrind -t -n READ_ME Makefile lst >>lpr
	${BINDIR}/vgrind -t ${PXSRC} >>lpr
	./pic >lst
	${BINDIR}/vpr lst
	${BINDIR}/vpr -t lpr
	${RM} index pic lst

depend:	sources
	ls *.c | sed 's;^\(.*\)\.c;\1.o: \1.c;' >makedep
	/bin/grep '^#[ 	]*include' *.c | sed \
		-e '/<.*>/d' \
		-e 's;:[^"]*"\([^"]*\)".*;: \1;' \
		-e 's/\.c/\.o/' \
		-e 's;: libpc.h;: ${LIBPCDIR}/libpc.h;' \
		-e 's;: objfmt.h;: ${SRCDIR}/objfmt.h;' \
		-e 's;: OPnames.h;: ${SRCDIR}/OPnames.h;' >>makedep
	echo '/^# DO NOT DELETE THIS LINE/+2,$$d' >eddep
	echo '$$r makedep' >>eddep
	echo 'w' >>eddep
	cp Makefile Makefile.bak
	ed - Makefile < eddep
	rm eddep makedep
	echo '# DEPENDENCIES MUST END AT END OF FILE' >> Makefile
	echo '# IF YOU PUT STUFF HERE IT WILL GO AWAY' >> Makefile
	echo '# see make depend above' >> Makefile

# DO NOT DELETE THIS LINE -- make depend uses it
# DEPENDENCIES MUST END AT END OF FILE
Version.o: Version.c
int.o: int.c
interp.o: interp.c
opc.o: opc.c
utilities.o: utilities.c
version.o: version.c
int.o: whoami.h
int.o: vars.h
int.o: /usr/src/usr.lib/libpc/libpc.h
int.o: ../src/objfmt.h
interp.o: whoami.h
interp.o: vars.h
interp.o: ../src/objfmt.h
interp.o: h02opcs.h
interp.o: machdep.h
interp.o: /usr/src/usr.lib/libpc/libpc.h
opc.o: ../src/OPnames.h
utilities.o: whoami.h
utilities.o: vars.h
utilities.o: ../src/objfmt.h
# DEPENDENCIES MUST END AT END OF FILE
# IF YOU PUT STUFF HERE IT WILL GO AWAY
# see make depend above
