#ifndef LIBFT_H
# define LIBFT_H

# include <string.h>
# include <unistd.h>
# include <stdlib.h>

size_t				ft_strlen(const char *s);
char                *ft_strcpy(char *dst, const char *src);
ssize_t             ft_write(int fd, void *buff, size_t size);
ssize_t             ft_read(int fd, void *buff, size_t size);
int                 ft_strcmp(char const *s1, char const *s2);
char                *ft_strdub(const char *str);

#endif