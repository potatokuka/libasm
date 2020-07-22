/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   libasm.h                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: greed <greed@student.codam.nl>               +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/10 22:20:29 by greed         #+#    #+#                 */
/*   Updated: 2020/07/22 14:10:46 by greed         ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <string.h>
# include <stdio.h>
# include <fcntl.h>
# include <unistd.h>
# include <stdlib.h>
# include <sys/stat.h>
# include <sys/types.h>

typedef struct	s_list
{
	void			*data;
	struct s_list	*next;
}				t_list;

int		ft_item_cmp(void *item1, void *item2);
extern void	ft_list_sort(t_list **begin, int (*cmp)());
extern void	ft_list_print(t_list *head);
extern void ft_list_remove_if(t_list **begin, void *data_ref, int (*cmp)());
extern size_t	ft_write(int fd, void *buf, size_t size);
extern size_t	ft_read(int fd, void *buf, size_t size);
extern size_t	ft_strlen(char *str);
extern char		*ft_strcpy(char *dest, char *src);
extern int		ft_strcmp(char *s1, char *s2);
extern char		*ft_strdup(char *str);
extern char		*ft_strchr(char *str, char c);
extern void		ft_list_push_front(t_list **head, void *data);
extern size_t	ft_list_size(t_list *begin);

#endif
