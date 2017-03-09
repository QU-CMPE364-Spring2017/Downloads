; The value I will write to memory
ldr r0, =0x12345678

; The location I will write it
ldr r1, =thevar

; Perform the write
str r0, [r1]

; Read it in as half words
ldrh r2, [r1]
ldrh r3, [r1,#2]

; Read it in as bytes
ldrb r4, [r1]
ldrb r5, [r1, #1]
ldrb r6, [r1, #2]
ldrb r7, [r1, #3]

swi 0x11

thevar:
	.word 0x00

