.data
x: .long -10
zero: .asciz "Numarul este zero\n"
poz: .asciz "Numarul este pozitiv\n"
neg: .asciz "Numarul este negativ\n"

.text
.global main
main:

movl x,%eax
movl $0,%ebx

cmp %eax,%ebx
je etzero
jl etpoz
jmp etneg

etzero:
movl $4,%eax
movl $1,%ebx
mov $zero,%ecx
movl $19,%edx
int $0x80
jmp etexit

etpoz:
movl $4,%eax
movl $1,%ebx
mov $poz,%ecx
movl $22,%edx
int $0x80
jmp etexit

etneg:
movl $4,%eax
movl $1,%ebx
mov $neg,%ecx
movl $22,%edx
int $0x80
jmp etexit

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80


.section .note.GNU-stack,"",@progbits
