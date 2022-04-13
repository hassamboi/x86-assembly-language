[org 0x0100]

jmp start

data: dw 0x126D, 0x12CA, 0xC1C, 0x268E, 0x17

findmax:
    push bp
    mov bp, sp
    sub sp, 4   ;1 local variable stores sum, other stores the number
    push si
    push cx

    xor cx, cx
    mov [bp - 2], word 0
    mov bx, 10
    mov si, 4

    outerloop:
        mov ax, [bp + si]   ;select a number in the array

            innerloop:
                div bx      ;divide it by 10
                add cx, dx  ;add the remainder to cx
                xor dx, dx  
                cmp ax, bx  ;keep doing it until ax becomes 0 (essentially)
                ja innerloop

        add cx, ax
        cmp cx, [bp - 2]    ;compare the current sum generated with the greatest sum
        jb skip
            mov [bp - 2], cx    ;if current > greatest, current becomes the greatest sum
            mov ax, [bp + si]
            mov [bp - 4], ax    ;and update the number to the current number as well
        skip:
        xor cx, cx
        xor dx, dx
        add si, 2
        cmp si, 0xE     ;run the outerloop length times (change the length in case of different array)
        jne outerloop

    mov ax, [bp - 4]
    mov bx, [bp - 2]    ;store number in ax & sum result in bx and return
    pop cx
    pop si
    add sp, 4
    pop bp
    ret 10
    

start:
    push word[data]
    push word[data + 2]
    push word[data + 4]
    push word[data + 6]
    push word[data + 8] ;passing the array as argument to the subroutine

    call findmax    ;returned value in ax & bx

mov ax, 0x4c00
int 0x21
