; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_write.s                                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: greed <greed@student.codam.nl>               +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/11 01:04:14 by greed         #+#    #+#                  ;
;    Updated: 2020/06/11 01:04:15 by greed         ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; size_t write(int fd, const void *buf, size_t count);

section.text:
    global _ft_write

error:
    mov rax, -1 	; setting rax reg(fd) to -1 for error handling
    ret	        	; return

_ft_write:
    mov rax, 0x2000004	; load syscal code for write into rax
    syscall		; systemcall(write)
    jc error		; if rax is signed jump to error
    ret			; return
