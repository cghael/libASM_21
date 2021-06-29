                global _ft_strcmp
                section .text

_ft_strcmp:     xor     rdx, rdx

compare:        mov     al, [rdi + rdx]
                mov     bl, [rsi + rdx]
                cmp     al, bl
                jne     done
                cmp     al, 0
                jz      done
                inc     rdx
                jmp     compare

done:           cmp     al, bl
                jg      more
                jl      less
                mov     rax, 0
                jmp     return

more:           mov     rax, 1
                jmp     return

less:           mov     rax, -1
                jmp     return

return:         ret