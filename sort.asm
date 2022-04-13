[org 0x0100]

jmp start

data: dw 6, 2, 4, 5
flag: db 0

start:
    
    outerloop:
        mov byte [flag], 0
        mov bx, 0 

        innerloop:
            mov ax, [data + bx]
            cmp ax, [data + bx + 2]

            jbe noswap

                ; swapping
                mov dx, [data + bx + 2]
                mov [data + bx], dx
                mov [data + bx + 2], ax
                mov byte [flag], 1
            
            noswap:
            ; innerloop termination check
                add bx, 2
                cmp bx, 6
                jne innerloop

        ; outerloop termination check
        cmp byte [flag], 0
        jne outerloop


    mov ax, 0x4c00
    int 0x21