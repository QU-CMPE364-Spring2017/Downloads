ldr r4, =thetop
ldr r5, =thebottom
bl divarr
swi 0x11


thetop:
	.word 80
	.word 100
	.word 120
	.word 150
	.word 0

thebottom:
	.word 8
	.word 16
	.word 4
	.word 2
	.word 0


; r0 contains the dividend
; r1 contains the divisor
; return will be in r0
; r1 will always be a power of 2
divp2:
	divp2_start:
		tst r1, #1
		bne divp2_end

		mov r0, r0, lsr #1
		mov r1, r1, lsr #1
		b divp2_start
	divp2_end:
		bx lr


; r4 contains the address of the dividends
; r5 contains the addresses of the divisors
divarr:
	stmfd sp!, {lr}
	mov r2, #0
	divarr_start:
		; Load values from memory
		ldr r0, [r4, r2]
		ldr r1, [r5, r2]

		cmp r1, #0
		beq divarr_end

		bl divp2

		str r0, [r4, r2]
		add r2, r2, #4

		b divarr_start

	divarr_end:
		ldmfd sp!, {lr}
		bx lr

