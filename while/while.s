main:
    li x5, 0
    li x6, 10
loop:
    bge x5, x6, end
    addi x5, x5, 1
    beq x0, x0, loop
end:
    li x10, 0
    ret