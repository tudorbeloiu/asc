.data 
x: .long 151
y: .long 237
.text

.global main

main:

movl x,%eax
movl y,%ebx
andl $0xFFFF0000,%eax
andl $0x0000FFFF,%ebx
addl %ebx,%eax
movl %eax,%ecx

etexit:
movl $1,%eax
movl $0,%ebx

.section .note.GNU-stack,"",@progbits

