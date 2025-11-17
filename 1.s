main:
    li   a7, 5          # Servico para ler inteiro
    mv   t0, a0         # Salva x em t0

    li   a7, 5          # Servico para ler inteiro
    mv   t1, a0         # Salva y em t1

    slli t2, t0, 3      # t2 = x * 8
    slli t3, t0, 2      # t3 = x * 4
    add  t2, t2, t3     # t2 = 12 * x

    slli t3, t1, 6      # t3 = y * 64
    slli t4, t1, 1      # t4 = y * 2
    add  t3, t3, t4     # t3 = 66 * y

    add  t5, t2, t3     # t5 = (12*x) + (66*y)

    mv   a0, t5         # a0 = resultado final z

    li   a7, 1          # Servico para imprimir inteiro
    ecall

    li   a7, 10         # Servico para sair
    ecall
    