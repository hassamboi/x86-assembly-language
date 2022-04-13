[org 0x0100]

jmp main

;div subroutine
div:
    push bp
    mov bp, sp
    
    mov ax, [bp + 6]
    mov bx, [bp + 4]
    
    div bx
    
    pop bp
    ret 4


;multiplication subroutine
multiplication:
    push bp
    mov bp, sp

    sub sp, 2

    mov ax, [bp + 4]   
    mov bx, [bp + 6]
    mul bx

    mov [bp - 2], ax

    push word[bp - 2]   ;calling the div function by passing in the mul and c
    push word[bp + 8]
    call div

    add sp, 2
    pop bp
    ret 6


;add subroutine
add:
    push bp
    mov bp, sp

    sub sp, 2   ;local variable sum

    mov ax, [bp + 4]
    add ax, [bp + 6]
    mov [bp - 2], ax    ;move the result of addition into sum

    push word [bp + 4]
    push word [bp + 6]
    push word [bp - 2]
    call multiplication ;pass a, b and sum as arguments to multiplication

    add sp, 2
    pop bp
    ret 4


;main function
main:
    push bp
    mov bp, sp
    sub sp, 2   ;local variable output

    push 12
    push 12
    call add    ;pass 12, 12 as argument to add, result returned in ax

    mov [bp - 2], ax   ;store the returned result in output variable

    add sp, 2
    pop bp

    mov ax, 0x4c00
    int 0x21