.data
x: .long 0x000DB000
y: .long 327

nrpal: .asciz "Palindrom\n" #11
nrnotpal: .asciz "Nu este palindrom\n" #19

.text

.global main

main:
movl x,%eax
movl $0,%ebx
movl $32,%ecx   #32 biti intr un integer, modificam bit by bit


etloop:
movl %eax,%edx
andl $1,%edx   #edx are lsb ul lui eax (cel mai din dreapta)
shrl $1,%eax   #shift la dreapta(trecem la urmatorul bit)

shll $1,%ebx  #facem loc ca sa mai adaugam un bit
addl %edx,%ebx   #adaugam bit ul in registrul ebx
loop etloop

cmp x,%ebx
jne etnotpal

movl $4,%eax
movl $1,%ebx
movl $nrpal,%ecx
movl $11,%edx
int $0x80

jmp etexit

etnotpal:
movl $4,%eax
movl $1,%ebx
movl $nrnotpal,%ecx
movl $19,%edx
int $0x80

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
