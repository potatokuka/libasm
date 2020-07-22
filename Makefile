# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: greed <greed@student.codam.nl>               +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/10 17:35:02 by greed         #+#    #+#                  #
#    Updated: 2020/07/22 19:17:11 by greed         ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME =		libasm.a

SRC		=	ft_strlen.s\
			ft_strcpy.s\
			ft_write.s\
			ft_strcmp.s\
			ft_read.s\
			ft_strdup.s\
			ft_list_size_bonus.s\
			ft_list_push_front_bonus.s\
			ft_list_remove_if_bonus.s

OBJ		= $(SRC:%.s=src/%.o)
SFLAGS		=	-fmacho64

all: $(NAME)

%.o: %.s
	nasm $(SFLAGS) $< -o $@

$(NAME): $(OBJ)
	ar -rcs $(NAME) $^

clean:
	rm -rf $(OBJ)

fclean: clean
	rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re
