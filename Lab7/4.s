.text
main:
    addi t0, zero, 2    # linhas
    addi t1, zero, 3    # colunas
    add t2, zero, zero  # i

print_loop_i:
    add t3, zero, zero  # j
print_loop_j:
    # Calcula e imprime i+j diretamente
    add a0, t2, t3
    addi a7, zero, 1
    ecall
    
    # Espaço
    addi a0, zero, 32
    addi a7, zero, 11
    ecall
    
    addi t3, t3, 1
    blt t3, t1, print_loop_j
    
    # Nova linha
    addi a0, zero, 10
    addi a7, zero, 11
    ecall
    
    addi t2, t2, 1
    blt t2, t0, print_loop_i

    ret