main:
    # Ler o número a ser convertido
    li a7, 5
    mv s0, a0         # Salva o número em s0

    # Inicializar o contador de laço
    li s1, 32         # Vamos iterar 32 vezes para 32 bits

binary_loop:
    # Verificar se o laço terminou
    beq s1, zero, loop_end

    # Testar o MSB (bit 31) do número em s0
    # Se s0 < 0, seu MSB é 1.
    bltz s0, print_one

print_zero:
    li a0, 48         # Código ASCII para '0'
    j print_char

print_one:
    li a0, 49         # Código ASCII para '1'
    
print_char:
    li a7, 11         # Serviço para imprimir caractere
    # Preparar para o próximo bit
    slli s0, s0, 1    # Desloca o próximo bit para a posição MSB

    # Decrementar o contador
    addi s1, s1, -1
    j binary_loop

loop_end:
    # Terminar o programa
    li a7, 10
    ecall