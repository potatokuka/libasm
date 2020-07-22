; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_push_front_bonus.s                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: greed <greed@student.codam.nl>               +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/12 12:20:34 by greed         #+#    #+#                  ;
;    Updated: 2020/06/12 12:20:35 by greed         ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; void	ft_list_push_front(t_list **begin_list, void *data);

extern _malloc

section.data:
  %define HEAD r12
  %define DATA r13
  %define NEW  rax ; new node being passed in

section.text:
  global _ft_list_push_front

_ft_list_push_front:
  push	r12 ; conserve state of current REG
  push	r13 ; conserve state of current REG
  cmp	rdi, 0 ; check to make sure something is passed
  jz	ret    ; if nothing passed ret
  cmp   rsi, 0 ; check to make sure something passed
  jz	ret    ; if nothing is passed ret
  mov 	HEAD, rdi ; move arg1 prep for malloc
  mov	DATA, rsi ; move arg2 prep for malloc
  mov	rdi,  16  ; prep value of 2 addr pointers 8*2
  call  _malloc
  cmp	NEW, 0    ; check to make sure something is in
  jz	ret       ; return if nothing is inside
  mov	[NEW], DATA ; move data into new node
  mov	rsi, [HEAD] ; move head to temp REG 
  mov	[NEW + 8], rsi ; put address point into new head
  mov [HEAD], NEW ; put new node to head

ret:
  pop r12 ; retrieve r12 from stack
  pop r13 ; retrieve r13 from stack
  ret
