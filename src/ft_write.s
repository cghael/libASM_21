                global _ft_write
                section .text

extern          ___error
                                        ;rdi = fd, rsi = buffer, rdx = size
_ft_write:      mov     rax, 0x2000004  ;syscall code = 0x200000N
                syscall                 ;if error rax = errno number
                jc      error_handle    ;if syscall error, CF = 1
                ret

error_handle:   mov     r10, rax        ;save errno number
                call    ___error        ;return errno address
                mov     [rax], r10      ;put errno nubmer in errno address
                mov     rax, -1         ;return -1 as original write()
                ret    