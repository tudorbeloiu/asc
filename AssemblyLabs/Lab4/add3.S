.data
x: .long 5
y: .long 3
z: .long 4
rez: .long 0

.text

# add(x,y,&s)
add:
movl 4(%esp),%eax
subl 8(%esp),%eax
mull 12(%esp)
movl 16(%esp),%ebx
movl %eax,(%ebx)

ret

.global main

main:
pushl $rez
pushl z
pushl y
pushl x

call add

et:
popl %ebx
popl %ebx
popl %ebx
popl %ebx

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
