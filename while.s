main:
    li x5, 0          # i = 0
    li x6, 10         # 상수 10 저장

loop:
    bge x5, x6, end   # if (i >= 10) break;
    addi x5, x5, 1    # i++
    beq x0, x0, loop      # jump to loop

end:
    li x10, 0         # return 0
    ret               # return to caller (jalr x0, 0(x1))

# int main(void)
# {
#   int i = 0;
#   while (i<10)
#   {
#     i++;
#   }
#   return 0;
# } 같은거거