    .data
A:  .word 9, 3, 5, 6, 8, 2, 1, 0, 4, 7
    .text
    .globl main

main:
    la x10, A
    li x11, 10
    jal x1, clear1
    li a7, 10
    ecall

clear1:
    addi x5, x0, 0
loop:
    bgt x5, x11 exit
    slli x6, x5, 2
    add x7, x10, x6
    sw x0, 0(x7)
    addi x5, x5, 1
    jal x0, loop

exit:
    jalr x0, 0(x1)
