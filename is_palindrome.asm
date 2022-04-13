[org 0x0100]
jmp start

num: db 0b11100111

isPalindrome:
    push bp
    mov bp, sp
    push bx
    push cx
    push dx     ;saving the state of the registers

    xor bx, bx
    xor cx, cx
    xor dx, dx
    
    mov bh, byte[bp + 4]
    mov cl, bh

    palindromeloop:
        xor dx, dx
        cmp bh, 0 
        jne bhisntzero
            cmp cl, 0
            je equal     ;if both bh and cl become zero, they are palindrome, break loop
        
        bhisntzero:     
        shl bh, 1       ;in case bh isnt zero, shl it by 1
        jnc skipbh
            mov dh, 1   ;and store the CF value in dh
        skipbh:
        shr cl, 1       ;in case cl isnt zero, shr it by 1
        jnc skipcl
            mov dl, 1   ;and store the CF value in dl
        skipcl:
        cmp dh, dl      ;compare the values of CF values of both shifts, if they are same continue the loop
        je palindromeloop
        

    notpalindrome:  ;in case of not palindrome, store 0 in ax and end
    xor ax, ax
    jmp end

    equal:
    mov ax, 1   ;store 1 in ax if palindrome
    
    end:
    pop dx
    pop cx
    pop bx
    pop bp
    ret 2

start:
    push word[num]
    call isPalindrome   ;passing the binary as argument to the subroutine

mov ax, 0x4c00
int 0x21