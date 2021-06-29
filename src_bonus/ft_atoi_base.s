                global _ft_atoi_base
                section .text
                extern _ft_strlen

                ; rdi = *str, rsi = *base
_ft_atoi_base:  push    rdi
                push    rsi

                cmp     rdi, 0          ;if str == NULL
                jz      return

                cmp     rsi, 0          ;if base == NULL
                jz      return

check_base:     
                mov     rdi, rsi
                call    _ft_strlen      ;rax = strlen(base)

                cmp     rax, 2          ;if strlen(base) < 2
                jl      return

                mov     r11, rax        ;r11 == strlen(base)
                xor     r9, r9          ;i = 0
                mov     r10, r9         ;j = 1
                inc     r10
                pop     rsi
                ;push    rsi
                jmp     while_base

next_char:      inc     r9              ;i++
                cmp     r9, rax         ;if base[i] == '\0'
                jge     skip_whtspcs
                mov     r10, r9         ;j = i + 1
                inc     r10

while_base:     cmp     byte [rsi + r9], 32     ;' '
                je      return
                cmp     byte [rsi + r9], 43     ;'+'
                je      return
                cmp     byte [rsi + r9], 45     ;'-'
                je      return
                cmp     byte [rsi + r9], 9      ;'\t'
                je      return
                cmp     byte [rsi + r9], 10     ;'\n'
                je      return
                cmp     byte [rsi + r9], 11     ;'\v'
                je      return
                cmp     byte [rsi + r9], 12     ;'\f'
                je      return
                cmp     byte [rsi + r9], 13     ;'\r'
                je      return

while_j:        cmp     r10, rax        ;if j >= strlen()
                jge     next_char
                mov     r8b, [rsi + r10]
                cmp     [rsi + r9], r8b
                je      return
                inc     r10             ;j++
                jmp     while_j

skip_whtspcs:   xor     r9, r9
                pop     rdi
                push    rdi
                push    rsi
                jmp     while_str

inc_i1:          inc     r9

while_str:      cmp     byte [rdi + r9], 0
                je      get_int
                
                cmp     byte [rdi + r9], 32     ;' '
                je      inc_i1
                cmp     byte [rdi + r9], 9      ;'\t'
                je      inc_i1
                cmp     byte [rdi + r9], 10     ;'\n'
                je      inc_i1
                cmp     byte [rdi + r9], 11     ;'\v'
                je      inc_i1
                cmp     byte [rdi + r9], 12     ;'\f'
                je      inc_i1
                cmp     byte [rdi + r9], 13     ;'\r'
                je      inc_i1
                xor     r12, r12
                jmp     check_sign

inc_i2:         inc     r9

check_sign:     cmp     byte [rdi + r9], 43     ;'+'
                je      inc_i2

                cmp     byte [rdi + r9], 45     ;'-'
                je      is_negative
                jmp     get_int

is_negative:    xor     r12, 0x1 
                jmp     inc_i2

get_int:        xor     rax, rax
                jmp     str_loop

next_str:       inc     r9

str_loop:       cmp     byte [rdi + r9], 0      ;if str[i] == '\0'
                je      end_atoi
                xor     r10, r10                ;j == 0
                jmp     base_loop

next_base:      inc     r10

base_loop:      cmp     byte [rsi + r10], 0     ;if base[j] == '\0'
                je      return
                mov     r8b, [rsi + r10]
                cmp     r8b, [rdi + r9]         ;if str[i] == base[j]
                jne     next_base

                mul     r11
                add     rax, r10
                jmp     next_str

end_atoi:       cmp     r12, 0
                je      return
                neg     rax

return:         pop     rsi
                pop     rdi
                ret