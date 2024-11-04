.data

v: .long 55, 34, 9, 55, 17, 10, 55
n: .long 7
mx: .long 0
nrap: .long 1
.text

.global main

main:
movl $0,%ecx
movl $1,%edx

lea v,%edi

etloop:
movl n,%eax
cmp %ecx,%eax

je etexit

movl (%edi,%ecx,4),%ebx
cmp mx,%ebx

je etincreasemx
ja etchangemx

incl %ecx
jmp etloop

etincreasemx:
incl %edx
movl %edx,nrap
incl %ecx
jmp etloop

etchangemx:
movl %ebx,mx
movl $1,%edx
incl %ecx
jmp etloop

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
