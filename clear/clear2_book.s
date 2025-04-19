    .data
A:  .word 9, 3, 5, 6, 8, 2, 1, 0, 4, 7
    .text
    .globl main

main:
    la x10, A
    li x11, 10
    jal x1, clear2
    li a7, 10
    ecall

clear2:
    addi x5, x10, 0
    slli x6, x11, 2
    add x7, x10, x6
loop:
    sw x0, 0(x5)
    addi x5, x5, 4
    bltu x5, x7, loop
    jalr x0, 0(x1)
