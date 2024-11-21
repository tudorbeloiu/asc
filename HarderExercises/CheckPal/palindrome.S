.data
sir: .space 250
n: .space 4
x: .space 1
rez: .space 4
estePal: .asciz "Yes"
nuestePal: .asciz "No"
msjCitire: .asciz "%s"
msjOut: .asciz "Sirul nostru este: %s\n"
msj: .asciz "Sirul are %ld caractere\n"
msjOUTPUT: .asciz "%s"

.text

palindrom:
pushl %ebp
movl %esp,%ebp

lea sir,%edi

movl $0,%ebx
movl n,%ecx
subl $1,%ecx

etloop:
cmp %ebx,%ecx
jbe etYESpal

movb (%edi,%ebx,1),%al
movb (%edi,%ecx,1),%dl

cmp %al,%dl
jne etNOTpal

incl %ebx
decl %ecx
jmp etloop

etYESpal:
pushl $estePal
pushl $msjOUTPUT
call printf
popl %edx
popl %edx
jmp etfin

etNOTpal:
pushl $nuestePal
pushl $msjOUTPUT
call printf
popl %edx
popl %edx
jmp etfin

etfin:
popl %ebp
ret


.global main
main:
push $sir
push $msjCitire
call scanf
pop %eax
pop %eax

//aici afisam sirul de caractere
/*
push $sir
push $msjOut
call printf
pop %eax
pop %eax
*/
///////////////////////////

lea sir,%edi
movl $0,%ecx


etlength:
movb (%edi,%ecx,1),%al
cmpb $0,%al

je etprintlength
incl %ecx
jmp etlength

etprintlength:

movl %ecx,n
/*
pushl %ecx
pushl n
pushl $msj
call printf

popl %eax
popl %eax
popl %ecx
*/
pushl $sir
call palindrom
popl %eax

etexit:
pushl $0
call fflush
popl %eax

movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
