build: ./bin/cat ./bin/true ./bin/false

strip: build
	strip -s ./bin/cat
	strip -s ./bin/true
	strip -s ./bin/false

install: build
	install -m 0755 ./bin/cat ${bindir}/cat
	install -m 0775 ./bin/true ${bindir}/true
	install -m 0775 ./bin/false ${bindir}/false

strip-install: build strip install

uninstall:
	rm ${bindir}/cat
	rm ${bindir}/true
	rm ${bindir}/false

build-tests: build
	# there are no tests to build

run-tests: build-tests build
	echo "SH    | ./tst/cat.sh"
	sh ./tst/cat.sh
	echo "SH    | ./tst/true.sh"
	sh ./tst/true.sh
	echo "SH    | ./tst/false.sh"
	sh ./tst/false.sh

test: build-tests run-tests

clean:
	echo "RM    | makefile"
	rm -f makefile
	echo "RM    | ./bin/*"
	rm -f ./bin/*
	echo "RM    | ./obj/*"
	rm -f ./obj/*
	echo "RM    | ./inc/lang.h"
	rm -f ./inc/lang.h
	echo "RM    | ./*.nokeep"
	rm  -f ./*.nokeep

./bin/cat: ./obj/cat.o
	echo "CC LD | ./bin/cat"
	${ccld} ${ccldflags} -o ./bin/cat ./obj/cat.o

./obj/cat.o: ./src/cat.c
	echo "CC    | ./obj/cat.o"
	${cc} ${cflags} -o ./obj/cat.o ./src/cat.c

./bin/true: ./obj/true.o
	echo "CC LD | ./bin/true"
	${ccld} ${ccldflags} -o ./bin/true ./obj/true.o

./obj/true.o: ./src/true.c
	echo "CC    | ./obj/true.o"
	${cc} ${cflags} -o ./obj/true.o ./src/true.c

./bin/false: ./obj/false.o
	echo "CC LD | ./bin/false"
	${ccld} ${ccldflags} -o ./bin/false ./obj/false.o

./obj/false.o: ./src/false.c
	echo "CC    | ./obj/false.o"
	${cc} ${cflags} -o ./obj/false.o ./src/false.c

#
 # Make File For The Mimik Core Utils
 #
 # Copyright (c) 2023 Noah Otto Robert Arcouette All Rights Reserved
 # Mimik License 2023
 # SoftWare is provided "AS IS"
 # See MAS=0002 : Mimik License 2023 For More Information
#
