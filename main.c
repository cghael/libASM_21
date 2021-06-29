#include <stdio.h>
#include "libasm.h"

#define STRLEN(str)             printf("strlen(\"%s\")    = %lu\nft_strlen(\"%s\") = %lu\n\n", str, strlen(str), str,  ft_strlen(str));
#define STRCPY(buff, str)       printf("strcpy(\"%s\")    = %s\nft_strcpy(\"%s\") = %s\n\n", str, strcpy(buff, str), str, ft_strcpy(buff, str));

int     main(void)
{
    char buff[20];
    char *dst;

    printf("\n********** **********\nstrlen() check:\n----------\n");
    STRLEN("")
    STRLEN("Pipa i pupa")
    STRLEN("0123456789abcdefgh")
    STRLEN("+-0#$&()")

    printf("\n********** **********\nstrcpy() check:\n----------\n");
    STRCPY(buff, "")
    STRCPY(buff, "Pipa i pupa")
    STRCPY(buff, "0123456789abcdefgh")
    STRCPY(buff, "+-0#$&()")

    printf("\n********** **********\nwrite() check:\n----------\n");
    write(0, "Pipa i pupa\n", 12);
    ft_write(0, "Pipa i pupa\n", 12);

    printf("\n********** **********\nstrcmp() check:\n----------\n");
    printf("%d, %d\n", strcmp("pipa", "pupa"), ft_strcmp("pipa", "pupa"));
    printf("%d, %d\n", strcmp("pupa", "pipa"), ft_strcmp("pupa", "pipa"));
    printf("%d, %d\n", strcmp("pipa", "pipa"), ft_strcmp("pipa", "pipa"));

    printf("\n********** **********\nstrdub() check:\n----------\n");
    dst = ft_strdub("Pipa pupa penis");
    printf("%s\n", dst);
    free(dst);
    dst = NULL;
    printf("%s\n", dst);

    //printf("----------\n");
}