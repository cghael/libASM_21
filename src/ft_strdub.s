                global _ft_strdub
                section .text

extern          _ft_strlen
extern          _ft_strcpy
extern          _malloc

_ft_strdub:     cmp     rdi, 0
                jz      error_handle

get_len:        call    _ft_strlen
                inc     rax

new_string:     push    rdi             ;save src
                mov     rdi, rax
                call    _malloc
                pop     rsi
                cmp     rax, 0
                jz      error_handle

copy_string:    mov     rdi, rax
                call    _ft_strcpy
                ret

error_handle:   mov     rax, 0
                ret
