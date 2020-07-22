; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_size_bonus.s                               :+:    :+:             ;
;                                                      +:+                     ;
;    By: greed <greed@student.codam.nl>               +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/11 15:27:11 by greed         #+#    #+#                  ;
;    Updated: 2020/07/22 20:23:33 by greed         ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; size_t ft_list_size(t_list *begin);

section.text:
    global	 _ft_list_size

section.data: ; defines RDI(1st ARG passed) as list for readability
    %define LIST rdi

section.text:

_ft_list_size:
    mov	    rax, 0  ; starts rax at 0
    cmp	    LIST, 0 ; check to see if something was passed
    jz	    error   ; if last check is zero, error

ticUP:
    inc    rax

.loop:
    mov	    rcx, [LIST + 8] ; loading next node into list
    mov	    LIST, rcx ; loading next node to continue
    cmp	    LIST, 0  ; check to see if LIST(RDI) is on final node, or empty
    jnz	    ticUP     ; i++ if last evaluated not zero
    ret		      ; return value in RAX

error:
    mov	    rax, -1   ; returns -1(error)
    ret		      ; return
