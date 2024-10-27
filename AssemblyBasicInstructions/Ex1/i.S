.data 
x: .long 70
y: .long 31
.text

.global main

main:
movl x,%eax
movl y,%ebx

movl %eax,%ecx
xorl %ebx,%ecx

subl %ebx,%eax
andl %eax,%ecx
movl x,%eax
xorl %eax,%ecx

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits

