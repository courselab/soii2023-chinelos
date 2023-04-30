OUTPUT_FORMAT(binary)	
SECTIONS
{
        . = 0x7c00;			/* Endereco da secao de .text */
        .text :
	{
	  *(.text)  			/* Copia das secoes para o output */
	  *(.rodata)	
	}	
        . = 0x7c00 + 510;	/* Pula os bytes */
        .signature : 
	{
	    BYTE(0x55)			/* Identificador do boot */
            BYTE(0xAA)
        }
	__END_STACK__ = 0x8200;	
}
STARTUP(hw-c_rt0.o);
INPUT(hw-c_utils.o)