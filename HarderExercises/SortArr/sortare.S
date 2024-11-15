.data
v: .space 40
n: .space 4
x: .space 4
nr: .space 4
msj1: .asciz "Cate elemente are vectorul?\n"
msji: .asciz "%ld"
msjo: .asciz "Element al vectorului: %ld\n"
.text

.global main

main:
pushl $msj1
call printf
popl %eax

pushl $n
pushl $msji
call scanf
popl %eax
popl %eax

lea v,%edi

movl n,%ecx

etloopcitire:
cmp $0,%ecx
je etafis

pushl $x
pushl $msji
call scanf
popl %eax
popl %eax

movl x,%edx
movl %edx,(%edi,%ecx,4)
subl $1,%ecx
jmp etloopcitire


etafis:
movl n,%ecx

etloopafisare:
cmp $0,%ecx
je etexit

movl (%edi,%ecx,4),%edx
movl %edx,nr

pushl nr
pushl $msjo
call printf
popl %eax
popl %eax

subl $1,%ecx
jmp etloopafisare

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
