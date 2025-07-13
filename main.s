.data:
    num1: .word 100
    num2: .word 50
    
    # result memory
    _add: .word 0
    _sub: .word 0
    _mul: .word 0
    _div: .word 0

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
    lui a0, %hi(_sub)
    addi a0, a0, %lo(_sub)
    
    mul s0, t0, t1
    sw s0, 0(a0)
    
    # division
    lui a0, %hi(_sub)
    addi a0, a0, %lo(_sub)
    
    div s0, t0, t1
    sw s0, 0(a0)
    