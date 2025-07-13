# riscv-calculator
Add, subtract, multiply, divide two numbers in Risc-V assembly

# How it work
First you load 2 inputs in 2 temp registers
```asm
    lw t0, num1
    lw t1, num2
```

Then in each operation load the address of the result memory to a register first
```asm
    lui a0, %hi(_add)
    addi a0, a0, %lo(_add)
```

Do the math and save to the address of the result
```asm
    add s0, t0, t1
    sw s0, 0(a0)
```
