.data
vetor:
    .word 18
    .word 20
    .word 38

.text
main:
    lui s9, %hi(vetor)
    addi s9, s9, %lo(vetor)

    # Incrementa e armazena
    lw t0, 0(s9)
    addi t0, t0, 1
    sw t0, 0(s9)

    lw t0, 4(s9)
    addi t0, t0, 1
    sw t0, 4(s9)

    lw t0, 8(s9)
    addi t0, t0, 1
    sw t0, 8(s9)

    # Imprime os novos valores
    lw a0, 0(s9)
    addi a7, zero, 1
    ecall

    lw a0, 4(s9)
    ecall

    lw a0, 8(s9)
    ecall

    ret