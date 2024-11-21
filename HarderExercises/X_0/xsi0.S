.data
castigator: .space 4
car: .ascii "-"
car1: .ascii "X"
car2: .ascii "0"
charout: .asciz "%c "
newLine: .asciz "\n"
joc: .space 21
.text

.global main

main:
//formam patratul jocului
lea joc,%edi
movl $0,%ebx

formarecadru:
cmpl $9,%ebx
je afisarecadru

movb $'-',%al
movb %al,(%edi,%ebx,1)

incl %ebx
jmp formarecadru

afisarecadru:
lea joc,%edi
movl $0,%ebx
movl $0,%ecx

afisarecadruebx:
cmpl $3,%ebx
je etexit
afisarecadruecx:
cmpl $3,%ecx
je increbx

movl $3,%eax
mull %ebx
addl %ecx,%eax
movb (%edi,%eax,1),%dl

pushl %ebx
pushl %ecx
push %edx
pushl $charout
call printf
popl %eax
popl %eax
popl %ecx
popl %ebx

incl %ecx
jmp afisarecadruecx

increbx:
pushl $newLine
call printf
popl %eax

incl %ebx
movl $0,%ecx
jmp afisarecadruebx


etexit:
pushl $0
call fflush
popl %ebx

movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
