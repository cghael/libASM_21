                global _ft_strlen
                section .text

_ft_strlen:     xor     rax, rax

compare:        cmp		byte [rdi + rax], 0
                jz      done
                inc     rax
                jmp     compare
                
done:           ret
