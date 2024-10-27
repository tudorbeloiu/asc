.data
x: .long 11
y: .long 10
z: .long 20
.text

.global main

main:
movl x,%eax
movl y,%ebx
mul %ebx

movl %eax,%ecx
movl z,%eax
movl z,%ebx
mul %ebx
movl %eax,%edx

movl %ecx,%eax
movl %edx,%ecx
movl $0,%edx
divl %ecx




etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
