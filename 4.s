
main:
    li s0, 0          # s0 = soma_impares
    li s1, 0          # s1 = soma_pares

loop_start:
    # Ler o próximo número
    li a7, 5
    ecall
    
    # Verificar a condição de parada (sentinela = 0)
    beq a0, zero, loop_end

    # Testar a paridade do número em a0
    andi t0, a0, 1    # Isola o LSB

    # Se t0 for zero, o número é par.
    beq t0, zero, add_to_even

add_to_odd:
    # O número é ímpar
    add s0, s0, a0    # soma_impares += numero
    j loop_start      # Volta para o início do laço

add_to_even:
    # O número é par
    add s1, s1, a0    # soma_pares += numero
    j loop_start      # Volta para o início do laço

loop_end:
    sub a0, s0, s1    # resultado = soma_impares - soma_pares
    li a7, 1
    ecall
    li a7, 10
    ecall