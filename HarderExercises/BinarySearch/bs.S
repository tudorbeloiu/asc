.data
v: .space 400
n: .space 4
x: .space 4
msjN: .asciz "Cate elemente are vectorul?\n"
msjInput: .asciz "%ld\n"
msjOutput: .asciz "%ld\n"
.text

.global main

main:
pushl $msjN
call printf
popl %eax

pushl $n
pushl $msjInput
call scanf
popl %eax
popl %eax

// punem adresa de inceput a lui v in %edi
lea v,%edi
movl $0,%ebx
movl n,%ecx

citirevector:
cmp %ebx,%ecx
je afisarevector

pushl $x
pushl $msjInput
call scanf
popl %edx
popl %edx

movl x,%eax
movl %eax,(%edi,%ebx,4)

incl %ebx
jmp citirevector


afisarevector:
movl $0,%ebx

afisareelemente:
cmp %ebx,%ecx
je etexit

movl (%edi,%ebx,4),%eax
pushl %eax
pushl $msjOutput
call printf
popl %eax
popl %eax

incl %ebx
jmp afisareelemente

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
