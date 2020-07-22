; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcpy.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: greed <greed@student.codam.nl>               +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/10 23:27:08 by greed         #+#    #+#                  ;
;    Updated: 2020/06/10 23:27:09 by greed         ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

section.text:
  global	_ft_strcpy

_ret:
    mov	rax, rdi; moving rax, 
    ret

_loop:
    mov dl, [rsi + rax]; move lowest 8 bytes 	from rsi to rax
    mov [rdi + rax], dl;
    mov dl, [rsi + rax]
    cmp dl, 0
    je	_ret; jump if finished
    inc rax; move through whats stored in reg
    jmp _loop; run _loop again if not finished

_ft_strcpy:
    sub rax, rax; set rax to empty to write again
    jmp _loop; now rax is empty go to loop
