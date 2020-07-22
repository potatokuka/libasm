# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: greed <greed@student.codam.nl>               +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/10 17:35:02 by greed         #+#    #+#                  #
#    Updated: 2020/07/22 20:25:57 by greed         ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME =		libasm.a

SRC		=		ft_strlen.s\
				ft_strcpy.s\
				ft_write.s\
				ft_strcmp.s\
				ft_read.s\
				ft_strdup.s
BONUS_SRC	=	ft_list_size_bonus.s\
				ft_list_push_front_bonus.s\
				ft_list_remove_if_bonus.s
OBJ		= $(SRC:%.s=src/%.o)
BONUS_OBJ	=	$(BONUS_SRC:%.s=bonus/%.o)
SFLAGS		=	-fmacho64

# COLORS
WHITE   = \x1b[37;01m
CYAN    = \x1b[36;01m
PINK    = \x1b[35;01m
BLUE    = \x1b[34;01m
YELLOW  = \x1b[33;01m
GREEN   = \x1b[32;01m
RED     = \x1b[31;01m
BLACK   = \x1b[30;01m
RESET   = \x1b[0m

all: $(NAME)

%.o: %.s
	nasm $(SFLAGS) $< -o $@

$(NAME): $(OBJ)
	ar -rcs $(NAME) $^

clean: clean_b
	rm -rf $(OBJ)

fclean: clean_b
	rm -rf $(NAME)

clean_b:
	@rm -f $(BONUS_OBJ)
	@rm -f $(OBJ)

re: fclean all

bonus: $(OBJ) $(BONUS_OBJ) $(NAME) 
	rm -f $(NAME)
	@echo "$(WHITE)/---			Compiling Bonus			---\\ $(RESET)"
	@ar -rcs $(NAME) $(OBJ) $(BONUS_OBJ)
	@echo "$(GREEN)COMPLETE"

.PHONY: all clean fclean re bonus
