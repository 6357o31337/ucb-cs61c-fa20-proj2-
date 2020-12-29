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
    addi sp, sp, -8
    sw s0, 0(sp)
    sw ra, 4(sp)
    
    
    
    mv t0 zero
    mv t1, a1
    mv a1, a3
    # mv t3, a4
    mv t6, a6
    # mv t7, a3


    # li a3 4
    li a3 1 #

    # mul a4, a3, a5 # a4 := 4 * (# of col of m1)
    mv a4, a5

    # mul t4, a3, a2 # t4 := 4 * (# of col of m0)
    li s0, 4
    mul t4, s0, a2

    mul t3, s0, a4

outer_loop_start:
    # we are done once t0 >= t1
    bge t0, t1, outer_loop_end

    mv t5, zero


    # mv a1, t7

inner_loop_start:
    # inner_loop end once t5 >= a2
    bge t5, a5, inner_loop_end


    jal ra dot
    sw a0, 0(t6)

    add t6, t6, s0 # 4
    add a1, a1, s0



    addi t5, t5, 1
    j inner_loop_start




inner_loop_end:

    sub a1, a1, t3 # a1 := a1 - 4*(# of col of m1)

    add a0, a0, t4 # t3 := t3 + 4*(# of col of m0)

    addi t0, t0, 1
    j outer_loop_start

outer_loop_end:


    # Epilogue
    lw s0, 0(sp)
    lw ra, 4(sp)
    addi sp, sp, 8
    
    ret
