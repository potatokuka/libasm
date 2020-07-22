# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_strlen.s                                        :+:    :+:             #
#                                                      +:+                     #
#    By: greed <greed@student.codam.nl>               +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/09 22:41:39 by greed         #+#    #+#                  #
#    Updated: 2020/06/09 22:41:40 by greed         ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

;inc == increment
;mov == assign
;xor == set 0
;cmp == compare two values
;je == move to targeted bit if equal
;jmp == force jump

section.text:
  global	_ft_strlen


_ft_strlen:
  mov rax, 0 ; i = 0

.len:
  mov sil, [rdi + rax]  ; str[i]
  cmp sil, 0 		; str[i] == 0 ;
  je .ret 		; return if equal
  inc rax 		; i++, RAX is what is being returned
  jmp .len 		; jumps back to start of loop

.ret:
  ret
