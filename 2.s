# Atividade 1: z = ((12*x) + (66*y)) * 4

.text
.globl main

main:
    # Ler o valor de x do teclado
    li a7, 5          # Código do serviço para ler inteiro
    ecall             # a0 contém o valor lido (x)
    mv s0, a0         # Salva x em s0

    # Ler o valor de y do teclado
    li a7, 5          # Código do serviço para ler inteiro
    ecall             # a0 contém o valor lido (y)
    mv s1, a0         # Salva y em s1

    # --- Início do Cálculo ---

    # Calcular 12*x = (8*x) + (4*x)
    slli t0, s0, 3    # t0 = x * 8 (x << 3)
    slli t1, s0, 2    # t1 = x * 4 (x << 2)
    add t0, t0, t1    # t0 = (x * 8) + (x * 4) = 12*x

    # Calcular 66*y = (64*y) + (2*y)
    slli t2, s1, 6    # t2 = y * 64 (y << 6)
    slli t3, s1, 1    # t3 = y * 2  (y << 1)
    add t2, t2, t3    # t2 = (y * 64) + (y * 2) = 66*y

    # Somar os termos e multiplicar por 4
    add s2, t0, t2    # s2 = (12*x) + (66*y)
    slli s2, s2, 2    # s2 = s2 * 4 (s2 << 2). Este é o resultado final z.

    # --- Fim do Cálculo ---

    # Imprimir o resultado final (z)
    mv a0, s2         # Move o resultado para o registrador de argumento a0
    li a7, 1          # Código do serviço para imprimir inteiro
    ecall

    # Terminar o programa
    li a7, 10         # Código do serviço para sair
    ecall