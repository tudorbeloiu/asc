.data
v: .long 40,11,15,4,12,9,10,11
n: .long 8
mn1: .long 4294967295
mn2: .long 4294967295
.text

.global main
main:
movl $0,%ecx
lea v,%edi

etloop:
cmp n,%ecx
je etexit

movl (%edi,%ecx,4),%ebx
cmp mn1,%ebx
jb etchangemn1
cmp mn2,%ebx
jb etchangemn2

incl %ecx
jmp etloop

etchangemn1:
movl mn1,%edx
movl %edx,mn2
movl %ebx,mn1
incl %ecx
jmp etloop

etchangemn2:
movl %ebx,mn2
incl %ecx
jmp etloop

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
