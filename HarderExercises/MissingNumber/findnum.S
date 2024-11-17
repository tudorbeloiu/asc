.data
n: .space 4
v: .space 4000
x: .space 4
v2: .space 4000
rez: .space 4
mybool: .space 4
mx: .long 0
msji: .asciz "%ld"
msjo: .asciz "%ld "
newLine: .asciz "\n"

.text

findMyNum:
pushl %ebp
movl %esp,%ebp
pushl %ebx

lea v,%edi
movl 12(%ebp),%ecx
movl $0,%ebx

lea v2,%esi

etformarev2:
cmpl %ebx,%ecx
je nextstep

movl (%edi,%ebx,4),%eax
movl %eax,(%esi,%eax,4)

incl %ebx
jmp etformarev2

nextstep:
popl %ebx
popl %ebp
ret

.global main

main:
pushl $n
pushl $msji
call scanf
popl %eax
popl %ebx


lea v,%edi
movl $0,%ebx
movl n,%ecx

etcitirev:
cmpl %ebx,%ecx
je etrez

pushl %ebx
pushl %ecx
pushl $x
pushl $msji
call scanf

popl %eax
popl %eax
popl %ecx
popl %ebx

movl x,%eax
movl %eax,(%edi,%ebx,4)
movl mx,%edx
cmpl $0,%eax
je avemzero
rev:
cmpl %edx,%eax
ja etchangemx

incl %ebx
jmp etcitirev

avemzero:
movl $1,mybool
jmp rev

etchangemx:
movl %eax,mx
incl %ebx
jmp etcitirev

etrez:
lea v2,%edi
movl $0,%ebx
movl mx,%ecx

etloop:
cmpl %ebx,%ecx
je etcont

movl $0,%eax
movl %eax,(%edi,%ebx,4)

incl %ebx
jmp etloop

etcont:
lea v,%edi
movl $0,%ebx
movl n,%ecx

pushl %ecx
pushl %edx
pushl n
pushl v
call findMyNum

pop %eax
popl %eax
popl %edx
popl %ecx

movl $1,%ecx
movl mybool,%ebx
cmpl %ebx,%ecx
jne raspunsulzero

lea v2,%edi
movl $0,%ebx
movl mx,%ecx

etafisarev:
cmpl %ebx,%ecx
je etfind

movl (%edi,%ebx,4),%eax
cmpl %ebx,%eax
jne finalresult

incl %ebx
jmp etafisarev

etfind:
incl %ebx
movl %ebx,rez
jmp etprintnr

finalresult:
movl %ebx,rez
jmp etprintnr

raspunsulzero:
movl $0,%ebx
movl %ebx,rez

etprintnr:
pushl rez
pushl $msjo
call printf

popl %eax
popl %eax
jmp etnewline

etnewline:
pushl $newLine
call printf
popl %eax


etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
