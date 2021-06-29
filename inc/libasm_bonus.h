#ifndef LIBFT_B_H
# define LIBFT_B_H

# include <string.h>
# include <unistd.h>
# include <stdlib.h>
#include "libasm.h"

typedef struct      s_list
{
    void            *data;
    struct s_list   *next;
}                   t_list;

void                ft_list_push_front(t_list **begin_list, void *data);
int	                ft_list_size(t_list *begin_list);
void	            ft_list_sort(t_list **begin_list,int (*cmp)());
void		        ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());
int		            ft_atoi_base(char const *str, char const *base);

#endif