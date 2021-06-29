                global _ft_list_remove_if
                section .text
                extern _free

                ;rdi = **begin_list, rsi = *ref_data, rdx = (*cmp)()
_ft_list_remove_if:
                push    rdi             ;save begin_list
                cmp     rdi, 0          ;if begin_list == NULL
                jz      return

                mov     r10, [rdi]
                cmp     rsi, 0          ;if ref_data == NULL
                jz      return

                cmp     rdx, 0          ;if (*cmp)() == NULL
                jz      return

first_node:     cmp     r10, 0
                jz      return

                push    rsi
                push    rdx
                mov     rdi, [r10]
                call    rdx
                pop     rdx
                pop     rsi

                cmp     rax, 0
                jnz     next_node

delete_first:   mov     r11, [r10 + 8]

                pop     rdi
                mov     [rdi], r11
                push    rdi

                push    rsi
                push    rdx
                mov     rdi, r10
                call    _free
                pop     rdx
                pop     rsi

                pop rdi
                mov r10, [rdi]
                push rdi

                jmp     first_node


next_node:      mov     r11, [r10 + 8]
                cmp     r11, 0
                jz      return

                push    rsi
                push    rdx
                mov     rdi, [r11]
                call    rdx
                pop     rdx
                pop     rsi

                cmp     rax, 0
                jz      delete_node

                mov     r10, r11
                jmp     next_node

delete_node:    push    rsi
                push    rdx
                mov     rdi, r11
                mov     r11, [r11 + 8]
                mov     [r10 + 8], r11
                push    r10
                push    r11
                call    _free
                pop r11
                pop r10
                pop     rdx
                pop     rsi

                jmp     next_node

return:         pop     rdi
                ret