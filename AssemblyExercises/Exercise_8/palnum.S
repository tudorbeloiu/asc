.data
x: .long  585
msjpal: .asciz "Palindrom\n"
msjnonpal: .asciz "Nu este palindrom\n"

.text

.global main

main:
movl x,%eax
movl $0,%edx     #In edx retinem inversul
movl $0,%ecx

etinvert:
cmp %ecx,%edx
je etpal

shll $1, %edx       #Facem loc pt un nou bit in edx
testl $1, %eax      #seteaza eflags pe baza rezultatului operatiei
setc %bl
orl %ebx,%edx       #Adaugam bitul in edx
shrl $1,%eax        #Shift la dreapta
jmp etinvert

etpal:
movl x,%eax
cmp %eax,%edx
je etadevarat

etfals:
movl $4,%eax
movl $1,%ebx
movl $msjnonpal,%ecx
movl $19,%edx
int $0x80
jmp etexit

etadevarat:
movl $4,%eax
movl $1,%ebx
movl $msjpal,%ecx
movl $11,%edx
int $0x80

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
