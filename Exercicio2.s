.data

    #vetor 1
    v0: .word 10, 20, 30, 40, 50, 60            #declarando v0

    #vetor 2
    v1: .word 0, 10, -15, 16, 20, 30            #declarando v1

    #imprimir frase
    str0: .asciiz "A soma dos vetores v0 e v1 é: \n\n"               #Printando string

    #imprimir virgula
    str1: .asciiz ", "


.text

main:


    
    la $t0, v0              #salvando v0 em t0
    la $t1, v1              #salvando v1 em t2

    #contador

    addi $s0, $zero, 0              #addi serve como contador tambem
    addi $s1, $zero, 6                  

    #printar string
    li $v0, 4                       #Printar char (caracter), codigo: 4
    la $a0, str0                     #Salvar a frase em a0 para printar
    syscall

    while:

        
        lw $t2, 0($t0)               #carregar o endereço

        lw $t3, 0($t1)               #carregar o endereço

        add $t4, $t2, $t3

        #contador de bits

        addi $t0, $t0, 4
        addi $t1, $t1, 4

        #conjunto de li e move é feito para printar o resultado
    
        li		$v0, 1 		# $v0 = Chamar alguma coisa, que nesse caso é o print de inteiro (por isso o codigo 1)
        move 	$a0, $t4		# a0: feito para imprimir o inteiro, que no caso é o que esta no t4
        syscall
        
        addi $s0, $s0, 1

        beq	$s0, $s1, sair	#feito para sair do loop (quando um valor for igual ao valor comparado), nesse caso, quando o s0 for igual ao s1, eu pulo fora do loop

        #printando a virgula

        li $v0, 4           
        la $a0, str1
        syscall

        j while                     #voltar para o while

        sair:

            li $v0, 10
            syscall
 


    

    
