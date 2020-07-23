; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_read.s                                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: greed <greed@student.codam.nl>               +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/11 03:19:52 by greed         #+#    #+#                  ;
;    Updated: 2020/07/23 13:14:40 by greed         ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; size_t	read(int fildes, void *buf, size_t nbyte);

section.text:
  global	_ft_read
  extern	___error

_ft_read:
      mov rax, 0x2000003 ; load system call into RAX
      syscall		 ; system call (read)
      jc error		 ; if signed value is returned error
      ret		 ; return

error:
	push rax		; preserve state of rax
	call ___error	; get errno code
	mov rdi, rax 	; restore rax
	pop rax			; clear rax
	mov	[rdi], rax  ;
	mov rax, -1	    ;
    ret	        	; return
