.data 
x: .long 11
y: .long 13
z: .long 14
.text

.global main

main:
movl x,%eax
movl $2,%ebx

mul %ebx
movl y,%ebx
addl %ebx,%eax

movl $2,%ebx
mul %ebx

movl z,%ecx
addl %ecx,%eax

movl $0,%edx
movl $2,%ebx

divl %ebx

etexit:
movl $1,%eax
movl $0,%ebx

.section .note.GNU-stack,"",@progbits
