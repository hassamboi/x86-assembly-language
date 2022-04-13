[org 0x0100]

mov cl, 4
mov bl, [multiplicand]
mov dl, [multiplier]

outerloop:
    shr dl, 1
    jnc dontadd

        ;add
        add [result], bl

    dontadd:
        shl bl, 1

    dec cl
    jnz outerloop

mov ax, 0x4c00
int 0x21

multiplicand: db 13
multiplier: db 5

result: db 0
