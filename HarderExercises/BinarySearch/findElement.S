.data
v: .long 1,3,4,6,10,10,10,11,12,13,14,15
n: .long 12
x: .space 4
st: .space 4
dr: .space 4
imp: .space 4
rez: .space 4
msjInput: .asciz "%ld"
msjOutput: .asciz "Numarul este: %ld\n"
msj: .asciz "Ce numar cauti?\n"
msjpoz: .asciz "Pozitia cautata este: %ld\n"

.text

binsrc:
pushl %ebp
movl %esp,%ebp


movl 8(%ebp),%ebx // ebx e indicele din stanga
movl 12(%ebp),%ecx // ecx e indicele din dreapta

etloop:
cmpl %ecx,%ebx
jg etpoz

movl %ecx,%eax
addl %ebx,%eax
shrl $1,%eax //eax are mij=(st+dr)/2

movl (%edi,%eax,4),%edx
cmpl 20(%ebp),%edx // cmp v[mij] cu x
jl etchangest //if v[mij]<x
jg etchangedr //if v[mij]>x

movl 16(%ebp),%edx
movl %eax,(%edx)

movl %eax,%ebx
incl %ebx
jmp etloop

etchangest:

movl %eax,%ebx
incl %ebx
jmp etloop

etchangedr:
movl %eax,%ecx
decl %ecx
jmp etloop

etpoz:
popl %ebp
ret

.global main
main:
pushl $msj
call printf
popl %eax

pushl $x
pushl $msjInput
call scanf
popl %eax
popl %ebx

lea v,%edi

movl $0,%eax
movl %eax,st
movl n,%eax
movl %eax,dr
subl $1,dr

pushl x
pushl $rez
pushl dr
pushl st
call binsrc

popl %ebx
popl %ebx
popl %eax
popl %ebx

pushl rez
pushl $msjpoz
call printf
popl %ecx
popl %ecx

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80


.section .note.GNU-stack,"",@progbits
