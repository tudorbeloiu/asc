.data 
x: .long 151
y: .long 237
z: .long 50
.text

.global main

main:

movl x,%eax
movl y,%ebx
addl %ebx,%eax

movl x,%edx
movl z,%ecx
addl %edx,%ecx

movl $0,%edx
divl %ecx

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
