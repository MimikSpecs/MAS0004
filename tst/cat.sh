#!/bin/sh

echo "stdin" | ./bin/cat ./tst/text1 - ./tst/text2 > test0.nokeep

if cmp -s ./test0.nokeep ./tst/suc1
then
	echo "Cat Test 0: succeeded."
else
	echo "Cat Test 0: failed."
	exit 1
fi

rm ./test0.nokeep

if ! ./bin/cat noFileHere > /dev/null 2>&1
then
	echo "Cat Test 1: succeeded."
else
	echo "Cat Test 1: failed."
	exit 1
fi

echo "Test: Cat program is working fine!"
