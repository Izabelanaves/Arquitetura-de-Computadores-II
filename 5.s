main:
    # Ler o segredo
    li a7, 5
    ecall
    mv s0, a0         # Salva o segredo em s0

    # Ler o número a codificar
    li a7, 5
    ecall
    mv s1, a0         # Salva o número em s1

    # Codificar/Decodificar usando XOR
    xor a0, s0, s1    # resultado = segredo XOR numero

    # Imprimir o número codificado
    li a7, 1
    ecall

    # Terminar o programa
    li a7, 10
    ecall