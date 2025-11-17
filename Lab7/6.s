.data
pontos:
    # Vetor de 5 pontos (x, y)
    .word 1, 2    # ponto 0: (1, 2)
    .word 5, 3    # ponto 1: (5, 3)
    .word 5, 5    # ponto 2: (5, 5)
    .word 3, 4    # ponto 3: (3, 4)
    .word 2, 1    # ponto 4: (2, 1)

.text
main:
    # Carrega endereço do vetor de pontos
    lui s1, %hi(pontos)
    addi s1, s1, %lo(pontos)

    # Inicializa variáveis
    addi s2, zero, 5           # quantidade de pontos
    add s3, zero, zero         # índice atual
    lw s4, 0(s1)               # melhor X (inicial: primeiro ponto)
    lw s5, 4(s1)               # melhor Y (inicial: primeiro ponto)
    add s6, zero, zero         # índice do melhor ponto

loop:
    # Calcula endereço do ponto atual (cada ponto tem 8 bytes)
    slli a0, s3, 3             # índice * 8 bytes por ponto
    add a1, s1, a0             # endereço do ponto atual
    
    # Carrega coordenadas do ponto atual
    lw a2, 0(a1)               # x atual
    lw a3, 4(a1)               # y atual

    # Compara com o melhor ponto atual
    blt a2, s4, proximo        # se x atual < melhor x, mantém
    
    bgt a2, s4, novo_melhor    # se x atual > melhor x, é novo melhor
    
    # X igual - desempate pelo Y (mais acima = maior Y)
    blt a3, s5, proximo        # se y atual < melhor y, mantém
    # y atual >= melhor y - é novo melhor

novo_melhor:
    add s4, zero, a2           # atualiza melhor X
    add s5, zero, a3           # atualiza melhor Y
    add s6, zero, s3           # atualiza índice do melhor

proximo:
    addi s3, s3, 1             # próximo índice
    blt s3, s2, loop           # repete se não terminou

fim:
    # Imprime coordenada X do melhor ponto
    add a0, zero, s4
    addi a7, zero, 1
    ecall
    
    # Imprime espaço
    addi a0, zero, 32
    addi a7, zero, 11
    ecall
    
    # Imprime coordenada Y do melhor ponto
    add a0, zero, s5
    addi a7, zero, 1
    ecall

    ret