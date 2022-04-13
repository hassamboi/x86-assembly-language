[org 0x0100]

mov cl, 8
mov bl, [multiplier]

outerloop:
    shr bl, 1
    jnc dontadd
        ;add
        mov al, [multiplicand]
        add byte [result], al

        mov al, [multiplicand + 1]
        adc byte [result + 1], al

    dontadd:
    shl byte [multiplicand], 1
    rcl byte [multiplicand + 1], 1

    dec cl
    jnz outerloop

mov ax, 0x4c00
int 0x21

multiplicand: dw 0xC8 ;200
multipler: db 0x32 ;50

result: dw 0