[org 0x0100]

jmp start

num: dw 14

stepstozero:
    push bp
    mov bp, sp
    push cx
    push dx

    mov dx, [bp + 4]
    xor cx, cx

    loopUntilZero:
        inc cx
        TEST dx, 1  ;test the number, if it's odd do the subtraction
        jnz odd
            ;even       ;else do the division
            shr dx, 1
            cmp dx, 0
            jnz loopUntilZero
            je end
        odd:
        XOR dx, 1       ;subtraction here
        cmp dx, 0
        jnz loopUntilZero
    
    end:
    mov ax, cx
    pop dx
    pop cx
    pop bp
    ret 2

start:
    push word[num]
    call stepstozero    ;value returned in ax


mov ax, 0x4c00
int 0x21
