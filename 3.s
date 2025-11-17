
main:
    # Ler o número do teclado
    li a7, 5          # Código do serviço para ler inteiro
    ecall             # a0 contém o número lido

    # Testar os dois últimos bits
    andi t0, a0, 3    # Isola os dois últimos bits.

    # Se t0 for zero, o número é múltiplo de 4.
    beq t0, zero, is_multiple

not_multiple:
    # Não é múltiplo, carregar 'N'
    li a0, 78         # Código ASCII para 'N'
    j print_char

is_multiple:
    # É múltiplo, carregar 'S'
    li a0, 83         # Código ASCII para 'S'

print_char:
    # Imprimir o caractere em a0
    li a7, 11         
    ecall

    
    li a7, 10
    ecall