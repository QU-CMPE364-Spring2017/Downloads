; Simple program to double all the elements of an array.

; Load up how many entries there are
ldr r0, =howmany
ldr r0, [r0]

; Load the address of the data
ldr r1, =thedata

; Counter for the loop
mov r2, #0

dloop:
	cmp r2, r0
	bge end
	ldr r4, [r1]
	mov r4, r4, LSL #1
	str r4, [r1], #+4
	add r2, r2, #1
	b dloop
end:

howmany:
	.word	0x6
thedata:
	.word	0x23
	.word 	0x48
	.word	0x53
	.word	0x98
	.word	0x12
	.word	0x37

