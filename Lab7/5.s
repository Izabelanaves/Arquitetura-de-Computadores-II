.data
string: .space 20

.text
main:
    # Lê string
    lui a0, %hi(string)
    addi a0, a0, %lo(string)
    addi a1, zero, 20
    addi a7, zero, 8
    ecall

    # Conta caracteres COM LIMITE MÁXIMO
    add t0, zero, zero  # contador = 0
    add t1, a0, zero    # ponteiro
    addi t4, zero, 19   # limite máximo (evita loop infinito)

loop:
    # Verifica se atingiu o limite máximo
    bge t0, t4, fim
    
    lb t2, 0(t1)        # carrega caractere
    
    # Verifica condições de parada
    beq t2, zero, fim   # se for null, para
    addi t3, zero, 10   # newline
    beq t2, t3, fim     # se for newline, para
    
    addi t0, t0, 1      # incrementa contador
    addi t1, t1, 1      # avança ponteiro
    j loop

fim:
    # Imprime o tamanho
    add a0, zero, t0
    addi a7, zero, 1
    ecall

    ret