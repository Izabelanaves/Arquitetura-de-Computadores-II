.data
vetor1:
    .word 1, 2, 3, 4, 5
vetor2:
    .word 5, 4, 3, 2, 1
vetor3:
    .word 0, 0, 0, 0, 0

.text
main:
    # Endereços
    lui s1, %hi(vetor1)
    addi s1, s1, %lo(vetor1)
    lui s2, %hi(vetor2)
    addi s2, s2, %lo(vetor2)
    lui s3, %hi(vetor3)
    addi s3, s3, %lo(vetor3)

    # Soma vetores
    add t4, zero, zero  # soma total
    addi t5, zero, 5    # contador
    add t6, zero, zero  # índice

loop:
    lw t0, 0(s1)
    lw t1, 0(s2)
    add t2, t0, t1
    sw t2, 0(s3)
    add t4, t4, t2

    addi s1, s1, 4
    addi s2, s2, 4
    addi s3, s3, 4
    addi t6, t6, 1
    blt t6, t5, loop

    # Imprime soma total
    add a0, zero, t4
    addi a7, zero, 1
    ecall

    ret