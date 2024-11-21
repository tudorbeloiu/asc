.data

x: .long 14
y: .long 12
z: .long 11
rez: .space 4

.text 

.global main

main:
movl x,%eax
movl y,%ebx

cmp %ebx,%eax
jle etxly

movl z,%ecx
cmp %ebx,%ecx
jg etrezy
jmp etrezz

etxly:
movl z,%ebx
cmp %ebx,%eax
jle etrezx
jmp etrezz


etrezx:
mov x,%eax
mov %eax,rez
jmp etexit

etrezy:
mov y,%eax
mov %eax,rez
jmp etexit

etrezz:
mov z,%eax
mov %eax,rez
jmp etexit


etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
