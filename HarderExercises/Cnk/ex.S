.data
n: .space 4
k: .space 4
inp: .asciz "%ld"
otp: .asciz "Rezultatul este: %ld"
newLine: .asciz "\n"

.text

comb:
pushl %ebp
movl %esp,%ebp

movl 8(%ebp),%eax  //eax = n
movl 12(%ebp),%ecx //ecx = k

cmpl %ecx,%eax
je return_one
cmpl $0,%ecx
je return_one

//calculam c(n-1,k)
pushl %ecx
decl %eax
pushl %eax
call comb
popl %edx
popl %edx
pushl %eax //salvam rez pe stiva 

//calculam c(n-1,k-1)
movl 12(%ebp),%ecx // adica k de pe stiva
decl %ecx
pushl %ecx
movl 8(%ebp),%eax //adidca n de pe stiva
decl %eax
pushl %eax
call comb
popl %edx
popl %edx

popl %ecx
addl %ecx,%eax
jmp end_comb

return_one:
movl $1,%eax

end_comb:
popl %ebp
ret

.global main

main:
pushl $n
pushl $inp
call scanf
popl %eax
popl %eax

pushl $k
pushl $inp
call scanf
popl %eax
popl %eax

pushl k
pushl n
call comb
popl %edx
popl %edx

pushl %eax
pushl $otp
call printf
popl %edx
popl %edx

pushl $newLine
call printf
popl %edx

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
