.data
v: .long 5,10,11,6,23,8
n: .long 6
rez: .long 0
ma: .long 0
rma: .long 0
.text

.global main
main:
lea v,%edi
mov $0,%ecx
xorl %edx,%edx

etloop:
cmp n,%ecx
je etrez

movl (%edi,%ecx,4),%ebx
addl %ebx,%edx
incl %ecx

jmp etloop

etrez:
movl %edx,rez
movl %edx,%eax
xorl %edx,%edx
movl n,%ecx
divl %ecx
movl %eax,ma
movl %edx,rma

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
