.data

n1: .asciiz "Digite um numero: "
resultado: .asciiz "O fatorial do numero e: "

.text

main:
    #Armazenar o numero
    li $v0, 4
    la $a0, n1
    syscall

    #Ler o numero digitado pelo usuário
    li $v0, 5
    syscall
    move $t0, $v0

    #Iniciar o fatorial com 1
    li $t1, 1

loop:

    #Verificar se o numero digitado é igual a 1
    #Se sim, ele sai do loop, se nao, continua o loop
    beq $t0, $zero, sairLoop

    #Fazer o fatorial
    mul $t1, $t1, $t0           #Multiplica t0 por t1 e salva em t1
    sub $t0, $t0, 1             #Diminui 1 do numero digitado
    j loop                      #Volta para o comeco do loop

sairLoop:

    #Imprimir a frase: "O fatorial do numero e: "
    li $v0, 4
    la $a0, resultado
    syscall

    #Imprimir o resultado do fatorial
    li $v0, 1
    move $a0, $t1 
    syscall

    #Sair do programa
    li $v0, 10
    syscall
