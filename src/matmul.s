# .import dot.s

.globl matmul

.text
# =======================================================
# FUNCTION: Matrix Multiplication of 2 integer matrices
# 	d = matmul(m0, m1)
# Arguments:
# 	a0 (int*)  is the pointer to the start of m0 
#	a1 (int)   is the # of rows (height) of m0
#	a2 (int)   is the # of columns (width) of m0
#	a3 (int*)  is the pointer to the start of m1
# 	a4 (int)   is the # of rows (height) of m1
#	a5 (int)   is the # of columns (width) of m1
#	a6 (int*)  is the pointer to the the start of d
# Returns:
#	None (void), sets d = matmul(m0, m1)
# Exceptions:
#   Make sure to check in top to bottom order!
#   - If the dimensions of m0 do not make sense,
#     this function terminates the program with exit code 72.
#   - If the dimensions of m1 do not make sense,
#     this function terminates the program with exit code 73.
#   - If the dimensions of m0 and m1 don't match,
#     this function terminates the program with exit code 74.
# =======================================================
matmul:
    ebreak
    # Error checks


    # Prologue
    addi sp, sp, -32
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw s3, 12(sp)
    sw s4, 16(sp)
    sw s5, 20(sp)
    sw s6, 24(sp)
    # sw s7, 28(sp)
    sw ra, 28(sp)
    
    
    
    mv s0 zero
    mv s1, a1
    mv s2, a0
    mv a1, a3
    # mv t3, a4
    mv s6, a6
    # mv t7, a3


    # li a3 4
    li a3 1 #

    # mul a4, a3, a5 # a4 := 4 * (# of col of m1)
    mv a4, a5

    # mul t4, a3, a2 # t4 := 4 * (# of col of m0)
    li a5, 4
    mul s4, a5, a2

    mul s3, a5, a4

outer_loop_start:
    # we are done once t0 >= t1
    bge s0, s1, outer_loop_end

    mv s5, zero


    # mv a1, t7

inner_loop_start:
    # inner_loop end once t5 >= a2
    bge s5, a4, inner_loop_end


    mv a0, s2
    jal ra dot
    sw a0, 0(s6)

    add s6, s6, a5 # 4
    add a1, a1, a5



    addi s5, s5, 1
    j inner_loop_start




inner_loop_end:

    sub a1, a1, s3 # a1 := a1 - 4*(# of col of m1)

    add s2, s2, s4 # t3 := t3 + 4*(# of col of m0)

    addi s0, s0, 1
    j outer_loop_start

outer_loop_end:


    # Epilogue
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw s3, 12(sp)
    lw s4, 16(sp)
    lw s5, 20(sp)
    lw s6, 24(sp)
    # lw s7, 28(sp)
    lw ra, 28(sp)
    addi sp, sp, 32
    
    ret
