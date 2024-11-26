.data
n: .space 4
m: .space 4
msjnsim: .asciz "%ld %ld"
msjx: .asciz "%ld"
x: .space 4
v: .space 1000
mx: .space 4
mn: .space 4
msjafis: .asciz "%ld\n"
.text

solvemx:
pushl %ebp
movl %esp,%ebp
pushl %ebx

movl 12(%ebp), %eax //eax = m
movl 16(%ebp),%edi

movl $0,%ecx //pornim de la prima coloana
loopsrch:
movl 12(%ebp),%eax
cmpl %eax,%ecx
je enddd

movl $0,%ebx //pornim de la prima linie
loopsrchbyline:
cmpl 8(%ebp),%ebx //adica daca suntem pe ultima linie
je changecol

movl 12(%ebp),%eax
movl $0,%edx
mull %ebx
addl %ecx,%eax //eax are indicele elementul curent
movl (%edi,%eax,4), %edx
cmpl $0,%ebx
je firstmin

movl 20(%ebp),%esi
movl (%esi),%esi
cmpl %esi,%edx// vedem daca avem un nou minim
jl firstmin

incl %ebx
jmp loopsrchbyline

firstmin:
movl %eax,%esi
movl 20(%ebp),%eax
movl %edx,(%eax)

incl %ebx
jmp loopsrchbyline

changecol:
//trb sa verificam daca  min este max
/*
movl mn,%eax
*/
movl 20(%ebp),%eax
movl (%eax),%eax
cmpl $0,%ecx
je firstmx
movl 24(%ebp),%edx
movl (%edx),%edx
cmpl %edx,%eax
jg firstmx

movl 20(%ebp),%eax
movl $0,(%eax)
incl %ecx
jmp loopsrch

firstmx:
movl 24(%ebp),%edx
movl %eax,(%edx)

incl %ecx
movl 20(%ebp),%eax
movl $0,(%eax)
jmp loopsrch

enddd:
popl %ebx
popl %ebp
ret


.global main

main:
pushl $m
pushl $n
pushl $msjnsim
call scanf
popl %eax
popl %eax
popl %eax

lea v,%edi
movl n,%eax
movl m,%ebx
movl $0,%edx
mull %ebx //eax are n*m

movl $0,%ecx
loopmatrix:
cmpl %ecx,%eax
je findmx

pushl %eax
pushl %ebx
pushl %ecx
pushl %edx
pushl $x
pushl $msjx
call scanf
popl %ebx
popl %ebx
popl %edx
popl %ecx
popl %ebx
popl %eax

movl x,%ebx
movl %ebx,(%edi,%ecx,4)
incl %ecx
jmp loopmatrix

findmx:
lea v,%edi

pushl $mx
pushl $mn
pushl %edi
pushl m
pushl n
call solvemx
popl %ebx
popl %ebx
popl %edi
popl %ebx
popl %ebx

afisaremx:
pushl mx
pushl $msjafis
call printf
popl %eax
popl %eax

etexit:
pushl $0
call fflush
popl %ebx

movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
