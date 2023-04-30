extern void __END_STACK__;

// Inicio da execucao do programa, efetua-se a chamada da `main`.
// Assim que ela retornar, entra no ponto de parada.

void __attribute__((naked)) _start()
{
__asm__ 
(
"             mov  $__END_STACK__ , %sp  \n"
"             call main                  \n"
"halt:                                   \n"
"             hlt                        \n"
"             jmp halt                   \n"
);
}