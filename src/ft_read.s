; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_read.s                                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: greed <greed@student.codam.nl>               +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/11 03:19:52 by greed         #+#    #+#                  ;
;    Updated: 2020/07/22 14:11:43 by greed         ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; size_t	read(int fildes, void *buf, size_t nbyte);

section.text:
  global	_ft_read

_ft_read:
      mov rax, 0x2000003 ; load system call into RAX
      syscall		 ; system call (read)
      jc error		 ; if signed value is returned error
      ret		 ; return

error:
      mov rax, -1	 ; set RAX to -1 for error
      ret		 ; return
