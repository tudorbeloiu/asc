.data
v: .float 1.0,2.0,3.0,4.0
n: .long 4
result: .space 4
mem: .space 4
.text

.global main

main:
lea v,%edi
xorl %ecx,%ecx
movl $0,mem /*utilizam memorie intermediara*/
movss mem, %xmm0 /*initializam suma cu 0 */

et_loop:
cmpl n,%ecx
je avg

movss (%edi,%ecx,4),%xmm1
addss %xmm1,%xmm0

incl %ecx
jmp et_loop

avg:
cvtsi2ss %ecx, %xmm1 /* convertim un long in float si punem rezultatul in xmm1 */
divss %xmm1, %xmm0 /* impartim si salvam in xmm0 rezultatul*/

movss %xmm0,result


et_exit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
