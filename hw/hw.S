	.code16                 # Modo 16 bits
	.global _start	        # Entry point do programa
	
_start:		               
	mov  $0xe, %ah	        # Escrever caractere no modo TTY
	mov  $0x0, %si	        

loop:			      
	mov  msg(%si), %al     # Offset dos caracteres na mensagem
	cmp   $0x0, %al	        
	je    halt              # Vai para o ponto de parada quando ler o caractere de fim de string
	int   $0x10	            # Interrupcao BIOS
	add   $0x1, %si	        # Proximo caractere
	jmp   loop	            
	
halt:
	hlt		                # Parada
	jmp   halt	            # Evitar que a execucao saia do ponto de parada

msg:			       
	.string    "Hello World from chinelOS"
	
	.fill 510 - (. - _start), 1, 0          # Padding com o caractere 0 para atingir o tamanho minimo de boot
	.word 0xaa55			                # Identificador de boot
    