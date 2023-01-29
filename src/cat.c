/*
 * Cat program implementation for the Mimik Core Utils
 * 
 * Memory usage is restricted to about 272 Bytes with default
 * configuration
 *
 * Copyright (c) 2023 Noah Otto Robert Arcouette All Rights Reserved
 * Mimik License 2023
 * SoftWare is provided "AS IS"
 * See MAS=0002 : Mimik License 2023 For More Information
*/

#include "lang.h"
#include "cat.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>

static void 
catFile (fd)
    int fd;
{
    char buff[CAT_BUFF_SIZE];
    int  readAmount;
    while ((readAmount = read(fd, buff, CAT_BUFF_SIZE)))
    {
        write(1, buff, readAmount);
    }
}

int 
main (argc, argv)
    const int argc;
    const char **argv;
{
    const char *progName = argv[0];

    if (argc < 2)
    {
        catFile(0);
        exit(0);
    }

    for (int i = 1; i<argc; i++)
    {
        if (!strcmp(argv[i], "-u"))
        {
            // ignore -u option
            continue;
        }
        else if (!strcmp(argv[i], "-"))
        {
            catFile(0);
            continue;
        }

        int fd = open(argv[i], O_RDONLY);

        if (fd < 0)
        {
            fprintf(stderr, "%s: `%s' " CAT_ERROR_0 "\n",
                progName,
                argv[i]);
            exit(1);
        }

        catFile(fd);

        close(fd);
    }

    exit(0);
}
