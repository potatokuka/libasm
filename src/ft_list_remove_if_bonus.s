; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_delete_if_bonus.s                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: greed <greed@student.codam.nl>               +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/12 12:20:29 by greed         #+#    #+#                  ;
;    Updated: 2020/06/12 12:20:30 by greed         ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

;void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());

extern _free

section.data:
  %define NODE r12
  %define LAST r13
  %define FUNC r14
  %define DATA r15
  %define HEAD rbx

section.proc:
  global _ft_list_remove_if

_ft_list_remove_if:
  push NODE	    ; save state of reg
  push LAST	    ; save state of reg
  push FUNC	    ; save state of reg
  push DATA	    ; save state of reg
  push HEAD	    ; save state of reg
  cmp  rdi, 0	    ; make sure something is passed
  jz   ret	    ; if nothing is passed exit
  cmp  rsi, 0	    ; make sure something is passed
  jz   ret	    ; if nothing is passed exit
  mov  HEAD, rdi    ; save 1st ARG
  mov  NODE, [HEAD] ; save 2nd pointer in 1st ARG
  mov  DATA, rsi    ; save 2nd ARG
  mov  FUNC, rdx    ; save 3rd ARG
  mov  LAST, 0      ; prep final REG with a 0

loop:
  cmp  NODE, 0	    ; check to see if list is finished
  jz   ret	    ; if list is finished exit
  mov  rdi, [NODE]  ; prep for comp func
  mov  rsi, DATA    ; prep for comp
  call FUNC
  cmp  rax, 0	    ; check to see if need to DELETE
  jz   delete       ; if ZERO delete
  mov  LAST, NODE   ; set last before current
  mov NODE, [LAST + 8] ; cycle through list
  jmp  loop 	    ; loop back

delete:
  cmp  LAST, 0	    ; check if first node is being DEL
  jz   first_del    ; if first node, go to firs_del
  mov  rdi, NODE    ; prep ARG for free
  mov  NODE, [rdi + 8] ; cycle to next
  mov  [LAST + 8], NODE ; safely move around DEL node
  call _free
  jmp  loop	    ; go back to loop

first_del:
  mov  rdi, NODE    ; set ARG to free
  mov  NODE, [rdi + 8] ; cycle to next node
  call _free
  mov  [HEAD], NODE ; update HEAD of list
  jmp  loop

; stack is FIRST IN LAST OFF
; reset stack in preperation of return
ret:
  pop  HEAD	; reset to previously saved reg
  pop  DATA	; reset to previously saved reg
  pop  FUNC	; reset to previously saved reg
  pop  LAST	; reset to previously saved reg
  pop  NODE	; reset to previously saved reg
  ret
