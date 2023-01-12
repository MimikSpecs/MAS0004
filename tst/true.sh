#!/bin/sh

#
 # True Test implementation for the Mimik Core Utils
 #
 # Copyright (c) 2023 Noah Otto Robert Arcouette All Rights Reserved
 # Mimik License 2023
 # SoftWare is provided "AS IS"
 # See MAS=0002 : Mimik License 2023 For More Information
#

if ./bin/true
then
	echo "Test: True Program Is working correctly!"
else
	echo "Test: True Program returned an error code!"
	exit 1
fi
