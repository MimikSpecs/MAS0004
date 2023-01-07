build:
	# there is nothing to build

strip: build
	# there is nothing to optimize

install: build
	# there is nothing to build

strip-install: build strip install

uninstall:
	# there is nothing to uninstall

build-tests: build
	# there are no tests to build

run-tests: build-tests build
	# there are no tests to run

test: build-tests run-tests

clean:
	echo "RM    | makefile"
	rm -f makefile
	echo "RM    | ./bin/*"
	rm -f ./bin/*
	echo "RM    | ./obj/*"
	rm -f ./obj/*

#
 # MAke File For The Mimik Core Utils
 #
 # Copyright (c) 2023 Noah Otto Robert Arcouette All Right Reserved
 # Mimik License 2023
 # SoftWare is provided "AS IS"
 # See MAS=0002 : Mimik License 2023 For More Information
#
