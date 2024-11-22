.data
castigator: .space 4
car: .ascii "-"
car1: .ascii "X"
car2: .ascii "0"
semn: .space 1
charout: .asciz "%c "
newLine: .asciz "\n"
joc: .space 21
winner: .space 4 //winner e 0 la inceput, winner=1 => castiga 1 jucator, winner=2 => castiga al doilea jucator
turn: .space 4 //aici retinem al cui este randul, turn=1 => randul jucatorului 1,turn = 2 => randul jucatorului 2
whoStarts: .asciz "Care jucator incepe ?\n"
whoStartsInp: .asciz "%ld"
msjCerere: .asciz "Jucatorul %ld introduce pozitia: \n"
inpPozX: .space 4
inpPozY: .space 4
msjPoz: .asciz "%ld %ld"
winnerIs: .asciz "Castigatorul este "
won: .asciz "%ld\n"
msjAltaPozitie: .asciz "Spatiul este deja luat, introdu alta pozitie!\n"
//conventie juc1 = X, juc2 = 0

.text

afisarecadru:
pushl %ebp
movl %esp,%ebp
pushl %ebx

lea joc,%edi
movl $0,%ebx
movl $0,%ecx

afisarecadruebx:
cmpl $3,%ebx
je etret
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

etret:
popl %ebx
popl %ebp
ret

.global main

main:
//formam patratul jocului
lea joc,%edi
movl $0,%ebx

formarecadru:
cmpl $9,%ebx
je rezpb

movb $'-',%al
movb %al,(%edi,%ebx,1)

incl %ebx
jmp formarecadru


rezpb:
//aici verificam ce jucator incepe
pushl $whoStarts
call printf
popl %eax

pushl $turn
pushl $whoStartsInp
call scanf //turn = 1 sau 2
popl %eax
popl %eax

//

movl $0,%eax
movl %eax,winner //winner e 0 la inceput

/*
pushl %eax
pushl %ecx
pushl %edx
call afisarecadru
popl %edx
popl %ecx
popl %eax
*/

lea joc,%edi

findwinner:
cmpl $0,winner
jne foundwinner //daca winner!=0, inseamna ca cineva a castigat jocul

pushl turn
pushl $msjCerere
call printf
popl %eax
popl %eax

pushl %ecx
pushl %edx
pushl $inpPozY
pushl $inpPozX
pushl $msjPoz
call scanf
popl %eax
popl %eax
popl %eax
popl %edx
popl %ecx
// verificam daca pozitia este valida
movl $3,%eax
movl $0,%edx
movl inpPozX,%ebx
movl inpPozY,%ecx
mull %ebx
addl %ecx,%eax
movl $0,%ecx

movb (%edi,%eax,1),%cl
cmpb $'-',%cl
jne alegealtapozitie
//
movl $3,%eax
movl inpPozX,%ebx
movl inpPozY,%ecx
mull %ebx
addl %ecx,%eax //eax retine pe ce pozitie sa pun caracterul

//acum verificam ce caracter sa punem
movl turn,%edx
cmpl $2,%edx
je turn2
movb $'X',%cl
movb %cl,(%edi,%eax,1)

afisarestare:
pushl %eax
pushl %ecx
pushl %edx
call afisarecadru
popl %edx
popl %ecx
popl %eax

// acum trebuie sa verificam daca exista vreun castigator
// practic pentru o pozitie introdusa, trebuie sa verificam linia care trece prin pct(x,y), coloana si diagonala/lele
movl $0,%ecx
movl turn,%ebx
cmpl $1,%ebx
je chresteX
movb $'0',%cl
movb %cl,semn //semn este 0
jmp verif

chresteX:
movb $'X',%cl
movb %cl,semn //semn este X 

verif:
movl inpPozX,%ebx //linia
movl inpPozY,%ecx //coloana

//prima data verificam pe linie si pe coloana
movl $0,%edx
movl $3,%eax
mull %ebx
movl $0,%ebx
movl $0,%ecx
veriflinie:
cmpl $3,%ebx
je castigatorFound

movb (%edi,%eax,1),%cl
cmpb semn,%cl
jne nuexistacastigatorpelinie
 
incl %ebx
addl $1,%eax
jmp veriflinie

nuexistacastigatorpelinie: //verificam castigator pe coloana
movl $0,%edx
movl $0,%ebx
movl $0,%ecx
verifcoloana:
cmpl $3,%ecx
je castigatorFound

mov $3,%eax
mull %ecx
addl inpPozY,%eax//
movb (%edi,%eax,1),%bl
cmpb semn,%bl
jne nuexistacastigatorpecoloana

incl %ecx
jmp verifcoloana

nuexistacastigatorpecoloana:
//acum verificam fiecare diagonala secundara si diagonala principala
movl $0,%ebx
movl $0,%edx
movl $0,%ecx
verifdiagprinc:
cmpl $3,%ecx
je castigatorFound

movl $3,%eax
mull %ecx
addl %ecx,%eax

movb (%edi,%eax,1),%bl
cmpb semn,%bl
jne nuexistacastigatorpediagprinc
incl %ecx
jmp verifdiagprinc
//daca linia este 0 sau 2, verificam si coloanele

nuexistacastigatorpediagprinc:
movl $0,%ebx
movl $0,%edx
movl $0,%ecx
verifdiagsec:
cmpl $3,%ecx
je castigatorFound

movl $3,%eax
movl $0,%edx
mull %ecx
movl $2,%edx
subl %ecx,%edx
addl %edx,%eax

movb (%edi,%eax,1),%bl
cmpb semn,%bl
jne nuexistacastigator
incl %ecx
jmp verifdiagsec


nuexistacastigator:
movl $1,%eax
cmpl turn,%eax
je urmeazarandullui2
movl $1,%eax
movl %eax,turn
jmp findwinner

urmeazarandullui2:
movl $2,%eax
movl %eax,turn
jmp findwinner

castigatorFound:
movl turn,%eax
movl %eax,winner
jmp findwinner

turn2:
movb $'0', %cl
movb %cl,(%edi,%eax,1)
jmp afisarestare

alegealtapozitie:
pushl $msjAltaPozitie
call printf
popl %eax
jmp findwinner

foundwinner:
pushl $winnerIs
call printf
popl %eax


pushl winner
pushl $won
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
