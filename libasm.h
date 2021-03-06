/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   libasm.h                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: greed <greed@student.codam.nl>               +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/10 22:20:29 by greed         #+#    #+#                 */
/*   Updated: 2020/07/22 20:21:52 by greed         ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <stdio.h>
# include <string.h>
# include <fcntl.h>
# include <unistd.h>
# include <stdlib.h>

int				ft_item_cmp(void *item1, void *item2);
extern size_t	ft_write(int fd, void *buf, size_t size);
extern size_t	ft_read(int fd, void *buf, size_t size);
extern size_t	ft_strlen(char *str);
extern char		*ft_strcpy(char *dest, char *src);
extern int		ft_strcmp(char *s1, char *s2);
extern char		*ft_strdup(char *str);
extern char		*ft_strchr(char *str, char c);

#endif
