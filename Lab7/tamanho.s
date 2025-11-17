.data
string: .space 20
msg: .asciz "Tamanho: "

.text
main:
    # Lê string
    lui a0, %hi(string)
    addi a0, a0, %lo(string)
    addi a1, zero, 20
    addi a7, zero, 8
    ecall

    # Conta caracteres
    add t0, zero, zero
    add t1, a0, zero

loop:
    lb t2, 0(t1)
    addi t3, zero, 10   # newline
    beq t2, t3, fim
    beq t2, zero, fim
    addi t0, t0, 1
    addi t1, t1, 1
    j loop

fim:
    # Imprime mensagem "Tamanho: "
    lui a0, %hi(msg)
    addi a0, a0, %lo(msg)
    addi a7, zero, 4
    ecall

    # Imprime número
    add a0, zero, t0
    addi a7, zero, 1
    ecall

    ret