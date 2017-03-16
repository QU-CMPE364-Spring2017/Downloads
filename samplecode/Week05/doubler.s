mov r0, #4
ldr r4, =thedata
bl doubler
swi 0x11


thedata:
	.word 0x2
	.word 0x4
	.word 0x8
	.word 0xa

; r0 contains the argument to double
; r0 will contain the doubled result
; Note that this also stomps on r1-r3, just because the AAPCS says it can.
double:
	mov r1, #0xff
	mov r2, #0xfe
	mov r3, #0xe6
	mov r0, r0, lsl #1
	bx lr

; r0 contains the number of elements in the array
; r4 contains the address of the array
; Does not return a value
doubler:
	stmfd	sp!, {lr}
	stmfd	sp!, {r8}

	; Counter for the loop
	mov r8, #0

	; Lets use r3 to store the number of elements in the array
	mov r3, r0

	dloop:
	        cmp r8, r3
        	bge end
	        ldr r0, [r4]
			stmfd	sp!,{r2-r3}
			bl double
			ldmfd	sp!,{r2-r3}
	        str r0, [r4], #+4
	        add r8, r8, #1
	        b dloop
	end:
		ldmfd	sp!, {r8}
		ldmfd 	sp!, {lr}
		bx lr
