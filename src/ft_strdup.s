; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    strdup.s                                           :+:    :+:             ;
;                                                      +:+                     ;
;    By: greed <greed@student.codam.nl>               +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/11 03:28:53 by greed         #+#    #+#                  ;
;    Updated: 2020/06/11 03:28:54 by greed         ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; char	*strdup(const char *s1);

extern _ft_strlen
extern _ft_strcpy
extern _malloc

section.text:
	global	_ft_strdup

_ft_strdup:
	cmp rdi, 0 ; check to make sure a string is sent
	jz  error ; jump to ERROR if equal, nothing was passed
	call _ft_strlen ; get len of RDI, input, for use with malloc
	push rdi 	; push RDI to stack to preserve it
	inc  rax	; i++ counter to account for NULL terminator
	mov  rdi, rax	; move contents of rax into rdi
	call _malloc	; calls to external MALLOC
	cmp  rax, 0	; (rax - 0)
	jz   error	; jump if (RAX - 0) == 0
	mov  rdi, rax	; move content from RAX -> RDI
	pop  rsi	; pops input string off stack into second paramater
	call _ft_strcpy ; calls external ASM strcpy
	ret		; return

error:
	mov  rax, 0	; set rax(counter) to 0
	ret		; return
