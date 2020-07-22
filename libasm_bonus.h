/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   libasm_bonus.h                                     :+:    :+:            */
/*                                                     +:+                    */
/*   By: greed <greed@student.codam.nl>               +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/07/22 20:13:37 by greed         #+#    #+#                 */
/*   Updated: 2020/07/22 20:19:37 by greed         ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_BONUS_H
# define LIBASM_BONUS_H

# include <stdio.h>
# include <stdlib.h>

typedef struct	s_list
{
	void			*data;
	struct s_list	*next;
}				t_list;

extern int		ft_strcmp(char *s1, char *s2);
extern void		ft_list_print(t_list *head);
extern void 	ft_list_remove_if(t_list **begin, void *data_ref, int (*cmp)());
extern void		ft_list_push_front(t_list **head, void *data);
extern size_t	ft_list_size(t_list *begin);

#endif
