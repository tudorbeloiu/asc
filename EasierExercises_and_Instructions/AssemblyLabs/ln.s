.data
number: .float 2.718281828
logResult: .space 4
.text

.global main
main:
flds number /*incarcam valoarea pe stiva FPU*/
subl $4,%esp /*facem loc pe stiva ca sa punem number*/
fstps 0(%esp) /*efectuam push pt a respecta conventia de apel*/

call logf

fstps logResult /*am primit rezultatul in st(0), il descarcam si il salvam in logResult*/
addl $4,%esp /*pop pe stiva*/

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
