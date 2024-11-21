.data 
x: .long 70
y: .long 31
.text

.global main

main:
movl x,%edx
movl y,%ecx

notl %edx
notl %ecx

movl x,%eax
movl y,%ebx

andl %edx,%eax
andl %ecx,%ebx

orl %ebx,%eax

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits


