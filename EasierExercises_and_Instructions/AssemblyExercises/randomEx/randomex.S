.data
n: .space 4
val: .space 4

inp: .asciz "Cate numere sa aibe vectorul?\n"
inp2: .asciz "%ld"
msg: .asciz "Ati introdus : %ld \n"
msg2: .asciz "Elementul cu indicele %ld este: "
.text

.global main

main:

pushl $inp
call printf
popl %eax

pushl $n
pushl $inp2
call scanf

popl %eax
popl %eax

pushl n
pushl $msg
call printf
popl %eax
popl %eax
 

movl n,%ecx

etloop:

cmp $0,%ecx
je etexit

pushl %ecx
pushl $msg2
call printf
popl %ebx
popl %ebx

pushl $val
pushl $inp2
call scanf
popl %ebx
popl %ebx

subl $1,%ecx
jmp etloop

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
