.data
v: .long 13,65,3, 9,4,20,18,17,19,28,50,44,5,4
n: .long 14
aux1: .space 4
aux2: .space 4
aux3: .space 4
x: .space 4
msjafis: .asciz "%ld\n"
.text

sortare:
push %ebp
movl %esp,%ebp

movl 8(%ebp),%eax
lea v,%edi

movl %eax,%edx
decl %edx
movl $0,%ecx

etloop1:
cmp %ecx,%edx
je etstop

movl %ecx,%ebx
etloop2:
incl %ebx
cmp %ebx,%eax
je etinclecx

movl %eax,aux1
movl %edx,aux2

movl (%edi,%ecx,4),%eax
movl (%edi,%ebx,4),%edx
cmp %eax,%edx
movl aux1,%eax
movl aux2,%edx

jb etswap
jmp etloop2

etswap:
movl %eax,aux1
movl %edx,aux2

movl (%edi,%ebx,4),%edx
movl (%edi,%ecx,4),%eax
movl %eax,aux3
movl %edx,%eax
movl aux3,%edx

movl %eax,(%edi,%ecx,4)
movl %edx,(%edi,%ebx,4)

movl aux1,%eax
movl aux2,%edx

jmp etloop2

etinclecx:
incl %ecx
jmp etloop1

etstop:
popl %ebp
ret

.global main

main:
pushl v
pushl n
call sortare
popl %eax
popl %eax


movl $0,%ecx
movl $0,%ebx
lea v,%edi
movl n,%edx
etafiselem:
cmp %edx,%ecx
je etexit

movl (%edi,%ecx,4),%ebx
pushl %edx
pushl %ecx
pushl %ebx
pushl $msjafis
call printf
popl %eax
popl %eax
popl %ecx
popl %edx

incl %ecx
jmp etafiselem

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
