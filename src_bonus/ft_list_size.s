                global _ft_list_size
                section .text
                ;rdi = t_list *begin_list
_ft_list_size:  xor     rax, rax        ;size = 0
                mov     rsi, rdi        ;rsi = *begin_list
                xor     rdx, rdx

count_list:     cmp     rsi, 0          ;rsi == NULL?
                jz      return
                mov     rsi, [rsi + 8]  ;rsi = rsi->next
                inc     rax             ;size++
                jmp     count_list

return:         ret
                

