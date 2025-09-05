.data
    array: .word 4, 3, 9, 5, 2, 1
    size: .word 6
    newline: .asciiz "\n"
    space: .asciiz " "

.text
.globl main

main:
    la $t0, array
    lw $t1, size
    
    li $t2, 0
    
outer_loop:
    beq $t2, $t1, print_array
    
    li $t3, 0
    sub $t4, $t1, $t2
    subi $t4, $t4, 1
    
inner_loop:
    beq $t3, $t4, next_outer
    
    sll $t5, $t3, 2
    add $t6, $t0, $t5
    addi $t7, $t6, 4
    
    lw $t8, 0($t6)
    lw $t9, 0($t7)
    
    ble $t8, $t9, no_swap
    
    sw $t9, 0($t6)
    sw $t8, 0($t7)
    
no_swap:
    addi $t3, $t3, 1
    j inner_loop
    
next_outer:
    addi $t2, $t2, 1
    j outer_loop

print_array:
    li $t2, 0
    
print_loop:
    beq $t2, $t1, exit
    
    sll $t3, $t2, 2
    add $t4, $t0, $t3
    lw $a0, 0($t4)
    
    li $v0, 1
    syscall
    
    addi $t5, $t1, -1
    beq $t2, $t5, skip_space
    la $a0, space
    li $v0, 4
    syscall
    
skip_space:
    addi $t2, $t2, 1
    j print_loop

exit:
    la $a0, newline
    li $v0, 4
    syscall
    
    li $v0, 10
    syscall
