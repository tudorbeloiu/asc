.data
varsta: .space 4
quest: .asciz "Cati ani ai?\n"
formatString: .asciz "%ld"
resp: .asciz "In 5 ani vei avea %ld de ani!\n"

.text

.global main

adunare:
movl 4(%esp),%eax
addl $5,%eax

ret

main:

pushl $quest
call printf
popl %ebx

pushl $varsta
pushl $formatString
call scanf
popl %ebx
popl %ebx


pushl varsta
call adunare

movl %eax,varsta
popl %ebx

pushl varsta
pushl $resp

call printf

popl %ebx
popl %ebx

pushl $0
call fflush
popl %ebx 


etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
 
