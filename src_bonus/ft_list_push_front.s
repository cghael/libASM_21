                global _ft_list_push_front
                section .text

extern          _malloc
;rdi = t_list **begin_list, rsi = void *data
_ft_list_push_front:
                push    rdi             ;**begin_list
                push    rsi             ;*data
                mov     rdi, 16         ;sizeof(st_list) = 16
                call    _malloc         ;rax = *new_list
                pop     rsi             ;*data
                pop     rdi             ;**begin_list
                cmp     rax, 0
                jz      return

                mov     [rax], rsi      ;new_list->data = &(*data)
                mov     rcx, [rdi]      ;*begin_list
                mov     [rax + 8], rcx  ;new_list->next = &(*begin_list)
                mov     [rdi], rax      ;*begin_list = new_list

return:         ret