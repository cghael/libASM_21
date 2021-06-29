#include <stdio.h>
#include "libasm_bonus.h"

static void     ft_print_list(t_list **begin_list)
{
    t_list *tmp;

    tmp = *begin_list;
    while(tmp != NULL)
    {
        printf("%s\n", (char*)tmp->data);
        tmp = tmp->next;
    }
}

static void     ft_free_list(t_list *begin_list)
{
    t_list *tmp;

    tmp = begin_list->next;
    while(tmp != NULL)
    {
        free(begin_list->data);
        free(begin_list);
        begin_list = tmp;
        tmp = tmp->next;
    }
    free(begin_list->data);
    free(begin_list);
}

int     main(void)
{
    char    **str;
    int     i;
    t_list  *begin_list;

    str = malloc(sizeof(char*) * 3);
    i = 1;
    while(i < 5)
    {
        str[i - 1] = malloc(sizeof(char) * 2);
        str[i - 1][1] = '\0';
        i++;
    }
    str[0][0] = '1';
    str[1][0] = '2';
    str[2][0] = '3';
    str[3][0] = '4';
    i = 0;
    while(i < 3)
    {
        ft_list_push_front(&begin_list, str[i]);
        i++;
    }
    printf("\nlist size = %d\n", ft_list_size(begin_list));
    ft_print_list(&begin_list);
    ft_list_sort(&begin_list, strcmp);
    ft_print_list(&begin_list);
    ft_list_remove_if(&begin_list, str[2], strcmp);
    ft_print_list(&begin_list);
    ft_free_list(begin_list);

    printf("%s = %d\n", "1", ft_atoi_base("af", "0123456789abcdef"));
    return (0);
}