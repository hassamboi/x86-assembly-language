# Architecture and x86 Assembly Language

## RISK-V Architecture instruction pipelining

### Single processor

One instruction is handled at a time

### 5 Stage processor

five-stage pipeline in a RISC machine (IF, ID, EX, MEM, WB)

## ASM files

- add_mul_div - calls multiplication subroutine from within add which in turn calls div)
- shifting - shifting bits to be used in multiplication
- extendedshift - generalised way of shifting to be used in bit multiplication (scalable)
- find_max - finds the max within an array
- is_palindrone - checks to see if given binary sequence is a palindrome or not
