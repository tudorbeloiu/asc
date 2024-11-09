.data
x: .long 40
y: .long 6
formatString: .asciz "Numarul de afisat este: %ld\n"

.text

addy:
movl 4(%esp),%eax
movl 8(%esp),%ebx
xorl %edx,%edx
divl %ebx

ret

.global main
main:
pushl y
pushl x

call addy

popl %ecx
popl %ecx

pushl %eax
pushl $formatString

call printf
popl %ebx
popl %ecx

pushl $0
call fflush
popl %ebx

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80
.section .note.GNU-stack,"",@progbits
