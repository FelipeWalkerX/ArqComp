.data

    n1: .asciiz "Digite o primeiro numero: "
    n2: .asciiz "Digite o segundo numero: "
    resultadoSoma: .asciiz "O resultado da soma e: "
    novaLinha: .asciiz "\n"
    resultadoSubtracao: .asciiz "O resultado da subtracao e: "

.text

main:
    #Pergunta o 1° numero
    li $v0, 4
    la $a0, n1
    syscall

    #Ler o 1° numero digitado pelo usuário
    li $v0, 5
    syscall
    move $t0, $v0

    #Pergunta o 2° numero
    li $v0, 4
    la $a0, n2
    syscall

    #Ler o 2° numero digitado pelo usuário
    li $v0, 5
    syscall
    move $t1, $v0

    #Somar os numeros digitados
    add $t2, $t0, $t1

    #Subtrair os numeros digitados
    sub $t3, $t0, $t1

    #Imprimir a frase: "O resultado da soma é: "
    li $v0, 4
    la $a0, resultadoSoma
    syscall

    #Imprimir o resultado da soma
    move $a0, $t2
    li $v0, 1
    syscall

    #Imprimir a quebra de linha
    li $v0, 4
    la $a0, novaLinha
    syscall

    #Imprimir a frase: "O resultado da subtracao é: "
    li $v0, 4
    la $a0, resultadoSubtracao
    syscall

    #Imprimir o resultado da soma
    move $a0, $t3
    li $v0, 1
    syscall

    #Sair do programa
    li $v0, 10
    syscall
