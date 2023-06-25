.data    
    n1: .asciiz "Digite o primeiro numero: "
    n2: .asciiz "Digite o segundo numero: "
    resultado: .asciiz "O resultado da multiplicacao e: "

.text

main:
    #Armazenar o 1° numero
    li $v0, 4
    la $a0, n1
    syscall

    #Ler o 1° numero digitado pelo usuário
    li $v0, 5
    syscall
    move $t0, $v0

    #Armazenar o 2° numero
    li $v0, 4
    la $a0, n2
    syscall

    #Ler o 2° numero digitado pelo usuário
    li $v0, 5
    syscall
    move $t1, $v0

    #Multiplicar os dois numeros
    mult $t0, $t1
    mflo $t2

    #Imprimir a frase: "O resultado da multiplicacao e: "
    li $v0, 4
    la $a0, resultado
    syscall

    #Imprimir o resultado da multiplicação
    li $v0, 1
    move $a0, $t2
    syscall

    #Sair do programa
    li $v0, 10
    syscall
