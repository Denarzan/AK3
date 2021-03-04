.global lab1
.syntax unified
#define P0_DATA #4
#define P1_DATA #2
#define P2_DATA #3
lab1:
    push {lr}
    // calculate 
    mov r0, P0_DATA
    mov r1, P1_DATA
    mov r2, P2_DATA
    bl calc
    pop {pc}
calc:
    push { r4, r5, lr }
    add r5, r0, r1
    mov r4, #2
    sdiv r5, r4
    mov r0, r2
    bl factorial
    add r0, r5
    pop { r4, r5, pc }

factorial:
    //param: 1 number
    push { r4 }
    mov r4, 1
    .fact_calc:
        mul r4, r0
        subs r0, #1
        bne .fact_calc
    mov r0, r4
    pop { r4 }
    bx lr
