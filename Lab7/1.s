.data
vetor:
    .word 18
    .word 20
    .word 38

.text
main:
    # Carrega endereço do vetor em s9
    lui s9, %hi(vetor)
    addi s9, s9, %lo(vetor)

    # Carrega os três valores
    lw t0, 0(s9)
    lw t1, 4(s9)
    lw t2, 8(s9)

    # Soma os valores
    add t0, t0, t1
    add t0, t0, t2

    # Imprime o resultado (em t0)
    add a0, zero, t0
    addi a7, zero, 1
    ecall

    ret