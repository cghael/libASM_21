                global _ft_strcpy
                section .text

_ft_strcpy:     mov     rax, rdi
                xor     rdx, rdx

cpy:            mov     bl, [rsi + rdx]
                mov     [rdi + rdx], bl
                cmp     byte [rdi + rdx], 0
                jz      done
                inc     rdx
                jmp     cpy

done:           ret
