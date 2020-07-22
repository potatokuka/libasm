; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcmp.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: greed <greed@student.codam.nl>               +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/11 02:40:10 by greed         #+#    #+#                  ;
;    Updated: 2020/06/11 02:40:11 by greed         ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; int	strcmp(const char *s1, const char *s2)
section.text:
  global	_ft_strcmp

_ft_strcmp:
    mov rax, 0		; return reg set to 0

loop:
    mov r8b, [rdi + rax] ; move byte on index RAX from s1 to 8-bit reg on r8
    mov r9b, [rsi + rax] ; move byte on index RAX from s2 to 8-bit reg on r9
    inc rax ; increment RAX (i++)
    cmp r8b, r9b ; set condition code (r8b[s1] - r9b[s2])
    jne ret ; if not equal return
    cmp r8b, 0 ; check to see if on active char, and not '\0'
    je ret ; if string is finished return
    jmp loop ; continue to loop

ret:
    sub r8b, r9b ; r8b = (s1[i] - s2[i])
    movsx rax, r8b ; move byte to word with sign-extention
    ret ; return
