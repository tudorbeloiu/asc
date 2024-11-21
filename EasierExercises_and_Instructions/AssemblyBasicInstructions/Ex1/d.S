.data
x: .long 71
.text
.global main
main:

movl x,%eax
movl x,%ebx
decl %ebx
andl %ebx,%eax

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits


