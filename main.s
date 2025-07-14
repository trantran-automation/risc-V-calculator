.data:
    num1: .word 100
    num2: .word 50
    exp:  .word 2
    
    
    # result memory
    _add: .word 0
    _sub: .word 0
    _mul: .word 0
    _div: .word 0
    _exp_result: .word 0,0 # max 64 bit
    
    .align 4
    
.text:
.global _start
_start:
    # load 2 num first
    lw t0, num1
    lw t1, num2
    
    # add
    lui a0, %hi(_add)
    addi a0, a0, %lo(_add)
    
    add s0, t0, t1
    sw s0, 0(a0)
    
    # subtract
    lui a0, %hi(_sub)
    addi a0, a0, %lo(_sub)
    
    sub s0, t0, t1
    sw s0, 0(a0)
    
    # multiple
    lui a0, %hi(_mul)
    addi a0, a0, %lo(_mul)
    
    mul s0, t0, t1
    sw s0, 0(a0)
    
    # division
    lui a0, %hi(_div)
    addi a0, a0, %lo(_div)
    
    div s0, t0, t1
    sw s0, 0(a0)
    
    # exponentiation (num 1)
    lui a0, %hi(_exp_result)
    addi a0, a0, %lo(_exp_result)
    
    add s0, zero, t0
    lw t2,exp
    addi t3, zero, 0
    loop:
        mul s0,s0,s0
        addi t3,t3,1
        ble t3, t2, loop
    
    # split it too big
    andi s1, s0,  0xFFFFFFFF # lower bit
    srli s0, s0, 32 #higher bit
    sw s1, 0(a0)
    sw s0, 4(a0)
    
    
    