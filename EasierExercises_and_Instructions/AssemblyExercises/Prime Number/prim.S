.data
n: .long 4
msjnonprim: .asciz "Nu este prim\n"
msjprim: .asciz "Este prim\n"
.text

.global main

main:
movl n,%eax
movl $2,%ecx
cmp $2,%eax
jl etnotprim

etprim:
movl n,%eax
cmp %ecx,%eax
je etisprim

movl $0,%edx
divl %ecx
cmp $0,%edx
je etnotprim

incl %ecx
jmp etprim


etnotprim:
movl $4,%eax
movl $1,%ebx
movl $msjnonprim,%ecx
movl $14,%edx
int $0x80
jmp etexit

etisprim:
movl $4,%eax
movl $1,%ebx
movl $msjprim,%ecx
movl $11,%edx
int $0x80

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80


.section .note.GNU-stack,"",@progbits
