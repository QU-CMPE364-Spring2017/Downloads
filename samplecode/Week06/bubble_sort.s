ldr r4, =thearray
mov r0, #10
bl bubblesort
swi 0x11

thearray:
	.word 432,4235,436,457,37,568,53,54,32624,76

; r0 is the # of items in the array
; r4 is the address of the array
bubblesort:
	stmfd sp!, {r5, r6}
	sub r0, r0, #1

	o_start:
		; r1 is my counter
		mov r1, #0
		; r5 is my flag
		mov r5, #0
		; r6 is the address of the array
		mov r6, r4

		i_start:
			cmp r1, r0
			beq i_done

			ldr r2, [r6]
			ldr r3, [r6, #4]
			cmp r2, r3
			ble noswap
			; I should swap
			str r3, [r6]
			str r2, [r6, #4]
			mov r5, #1
		noswap:
			add r1, r1, #1
			add r6, r6, #4
			b i_start
		i_done:
			cmp r5, #1
			beq o_start
	ldmfd sp!, {r5,r6}
	bx lr

	
