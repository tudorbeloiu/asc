.data
x: .long 71
y: .long 39
.text
.global main
main:

movl x,%eax
movl y,%ebx
xorl %ebx,%eax
xorl %ebx,%eax

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits


