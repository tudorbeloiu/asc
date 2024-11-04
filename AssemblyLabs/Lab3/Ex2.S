.data
s: .asciz "Tudor Beloiu\n"
t: .space 13
nl: .asciz "\n"
.text

.global main

main:
movl $13,%ecx
lea s,%edi
addl $12,%edi
lea t,%esi

etloop:
movb (%edi),%bl
movb %bl,(%esi)
decl %edi
incl %esi

loop etloop
movb $0,(%esi)

etafisare:
movl $4,%eax
movl $1,%ebx
mov $t,%ecx
movl $13,%edx
int $0x80

etnewline:
movl $4,%eax
movl $1,%ebx
lea nl,%ecx
movl $1,%edx
int $0x80

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
