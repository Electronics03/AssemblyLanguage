    .data
A:  .word 9, 3, 5, 6, 8, 2, 1, 0, 4, 7
    .text
    .globl main

main:
    la x10, A # x11에 A의 주소를 저장한다 (매개변수)
    li x11, 10 # x11에 10을 저장한다 (매개변수)
    jal x1, clear1 # clear1 프로시저 호출 (복귀주소 x1)
    li a7, 10
    ecall

clear1:
    addi x5, x5, 0 # x5 <- 0 으로 초기화한다
loop:
    slli x6, x5, 2 # x5(i) 의 i <- i * 4 (word 주소이므로)
    add x7, x10, x6 # x7 <- 배열주소 + 인덱스*4
    sw x0, 0(x7) # x7(A[i]) 주소 <- 0으로 초기화
    addi x5, x5, 1 # i++
    ble x5, x11, loop # x5(i) < x11(10)이면 루프
    jalr x0, 0(x1)