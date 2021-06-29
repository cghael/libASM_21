                global _ft_list_sort
                section .text
                                        ;rdi = t_list **begin, rsi = int (*cmp)(d1, d2)
_ft_list_sort:  cmp     rdi, 0          ;if begin_list == NULL
                jz      error
                cmp     qword [rdi], 0  ;if (*begin_list) == NULL
                jz      error
                cmp     rsi, 0
                jz      error

                mov     r8, [rdi]       ;current_list = *begin_list
                push    rdi             ;save **begin_list
                xor     rax, rax        ;rax = 0
                push    rax
                mov     r9, [r8 + 8]    ;r9 = current_list->next
                cmp     r9, 0           ;if list_size = 1
                jz      return
                jmp     compare

end_list:       pop     rax
                cmp     rax, 0
                jz      return

begin:          pop     rdi
                mov     r8, [rdi]
                push    rdi
                xor     rax, rax
                push    rax
                mov     r9, [r8 + 8]          

compare:        mov     rcx, rsi
                push    rsi
                mov     rdi, [r8]
                mov     rsi, [r9]
                push    r8
                call    rcx
                pop     r8
                pop     rsi
                cmp     rax, 0
                jg      swap_data

next:           mov     r8, r9          ;current = current->next
                mov     r9, [r8 + 8]
                cmp     r9, 0
                jz      end_list
                jmp     compare

swap_data:      mov     rdx, [r8]
                mov     rdi, [r9]
                mov     [r9], rdx
                mov     [r8], rdi
                jmp     set_flag

set_flag:       pop     rax
                inc     rax
                push    rax
                jmp     next

error:          ret

return:         pop     rdi
                ret