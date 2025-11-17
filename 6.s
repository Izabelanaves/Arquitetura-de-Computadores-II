main:
    li   a7, 5          # Ler segredo
    mv   s0, a0         # s0 = segredo

loop:
    li   a7, 5          # Ler numero
    mv   t0, a0         # t0 = numero

    beq  t0, zero, fim  # Se 0, sai

    xor  a0, t0, s0     # Codificar
    li   a7, 1          # Imprimir
    li   a7, 11         # Imprimir espaco
    li   a0, 32
    j    loop

fim:
    li   a7, 10         # Sair
    ecall