.data
n: .space 4
msjInput: .asciz "%ld"
msjNOTprim: .asciz "No"
msjprim: .asciz "Yes"
newLine: .asciz "\n"
.text

.global main

main:
pushl $n
pushl $msjInput
call scanf
popl %eax
popl %eax

movl n,%ecx
cmpl $0,%ecx
jle notprim
cmpl $1,%ecx
je notprim

movl $1,%ecx
cmp %ecx,n
je etprim

/*
pushl n
pushl $msjOutput
call printf
popl %eax
popl %eax
*/
movl $2,%ecx
etrez:
movl n,%eax

cmp %ecx,%eax
je etprim

xorl %edx,%edx
divl %ecx
movl $0,%eax

cmp %edx,%eax // daca edx este 0, inseamna ca nu este prim
je notprim
incl %ecx
jmp etrez


notprim:
pushl n
pushl $msjNOTprim
call printf
popl %eax
popl %eax
jmp etexit

etprim:
pushl n
pushl $msjprim
call printf
popl %eax
popl %eax
jmp etexit

etexit:
pushl $0
call fflush
popl %ebx

movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
