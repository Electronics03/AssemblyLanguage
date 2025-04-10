    .data
A:  .word 9, 3, 5, 6, 8, 2, 1, 0, 4, 7   # int A[10]

    .text
    .globl main
main:
    la x10, A          # a0 = 주소 A
    li x11, 10         # a1 = 배열 길이 10
    jal ra, sort       # sort(A, 10)
    li a7, 10          # 종료 syscall
    ecall

swap: 
    slli x6, x11, 2
    add x6, x10, x6
    lw x5, 0(x6)
    lw x7, 4(x6)
    sw x7, 0(x6)
    sw x5, 4(x6)
    jalr x0, 0(ra)

sort:
        addi sp, sp, -4
        sw ra, 0(sp)
        addi x21, x10, 0    # &v -> 21
        addi x22, x11, 0    # n -> x22
        addi x19, x0, 0     # i -> x19 = 0
    for1tst:
        bge x19, x22, exit1 # if x19(i) >= x22(n) then exit1
        addi x20, x19, -1   # j -> x20(j) = x19(i) - 1
    for2tst:
        blt x20, x0, exit2  # if x20(j) < x0(0) then exit2
        slli x5, x20, 2     # x5 <- x20(j) * 4
        add x5, x21, x5     # x5 <- x21(&v) + x20([j]) -> v[j]
        lw x6, 0(x5)        # x6 <- v[j]
        lw x7, 4(x5)        # x6 <- v[j+1]
        ble x6, x7, exit2   # if x6 <= x7 then exit2
        addi x10, x21, 0    # &v -> 21
        addi x11, x20, 0    # n -> x22
        jal ra, swap        # jump to swap
        addi x20, x20, -1   # j--
        jal x0, for2tst     # jump to for2tst
    exit2:
        addi x19, x19, 1    # i++
        jal x0, for1tst     # jump to for1tst
    exit1:
        lw ra, 0(sp)
        addi sp, sp, 4
        jalr x0, 0(ra)