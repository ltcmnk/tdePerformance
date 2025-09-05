.data
    ano1: .word 2002
    ano2: .word 2004
    ano3: .word 2005
    resultado_msg: .asciiz "Soma dos anos: "
    newline: .asciiz "\n"

.text
.globl main

main:
    lw $t0, ano1
    lw $t1, ano2
    lw $t2, ano3
    
    add $t4, $t0, $t1
    add $t4, $t4, $t2
    
    la $a0, resultado_msg
    li $v0, 4
    syscall
    
    move $a0, $t4
    li $v0, 1
    syscall
    
    la $a0, newline
    li $v0, 4
    syscall
    
    li $v0, 10
    syscall
