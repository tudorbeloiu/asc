.data 
x: .long 70
y: .long 31
.text

.global main

main:
movl x,%edx
movl y,%ecx

notl %ecx
notl %edx

movl x,%eax
movl y,%ebx

andl %ecx,%eax
andl %edx,%ebx

orl %ebx,%eax


etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
