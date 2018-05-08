/*
 * 	startup.c
 *
 */
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

#define PORT_BASE 	 0x40020C00
#define portModer 	((volatile unsigned long *) 	(PORT_BASE))
#define portOtyper	((volatile unsigned short *) 	(PORT_BASE+0x4))
#define portOspeedr	((volatile unsigned long *) 	(PORT_BASE+0x8))
#define portPupdr 	((volatile unsigned long *)		(PORT_BASE+0xC))
#define portIdrLow 	((volatile unsigned char *) 	(PORT_BASE+0x10))
#define portIdrHigh ((volatile unsigned char *) 	(PORT_BASE+0x11))
#define portOdrLow 	((volatile unsigned char *) 	(PORT_BASE+0x14))
#define portOdrHigh ((volatile unsigned char *) 	(PORT_BASE+0x15))
#define EXTI_PR		((volatile unsigned char *) 	(0x40013C14))

#define PORTE_BASE	0x40021000
#define portEModer 	((volatile unsigned long *) 	(PORTE_BASE))
#define portEOtyper	((volatile unsigned short *) 	(PORTE_BASE+0x4))
#define portEOspeedr ((volatile unsigned long *) 	(PORTE_BASE+0x8))
#define portEPupdr 	((volatile unsigned long *)		(PORTE_BASE+0xC))
#define portEIdrLow ((volatile unsigned char *) 	(PORTE_BASE+0x10))
#define portEIdrHigh ((volatile unsigned char *) 	(PORTE_BASE+0x11))
#define portEOdrLow  ((volatile unsigned char *) 	(PORTE_BASE+0x14))
#define portEOdrHigh ((volatile unsigned char *) 	(PORTE_BASE+0x15))
#define SYSCFG_EXTICR1 0x40013808

static volatile int count = 0;

void irq_handler( void ){
	if((* ((unsigned int *) 0x40013C14) & 8) != 0){
		if((*portEIdrLow & 1) != 0){
			*portEOdrHigh |= 1;
			count += 1;
		}
		if((*portEIdrLow & 2) != 0){
			*portEOdrHigh |= 2;
			count = 0;
		}
		if((*portEIdrLow & 4) != 0){
			*portEOdrHigh |= 4;
			
			if(*portOdrHigh == 0xFF){
				*portOdrHigh = 0;
			}
			else{
				*portOdrHigh = 0xFF;
			}
			
		}
		* ((unsigned int *) 0x40013C14) |= 8;
	}
}

void app_init( void ){
	*portModer = 0x55555555;
	/* Nollställ fält */
	*((unsigned int *) SYSCFG_EXTICR1) &= ~0xF000;
	/* PE3 -> EXTI3 */
	*((unsigned int *) SYSCFG_EXTICR1) |= 0x4000;
	
	/* Aktivera genom att ettställa motsvarande bit i EXTI_IMR */
	* ((unsigned int *) 0x40013C00) |= 8;
	/* Aktivera triggvillkor "negativ flank" */
	* ((unsigned int *) 0x40013C0C) |= 8;
	/* Maskera triggvillkor positiv flank */
	* ((unsigned int *) 0x40013C08) &= ~8;
	/* Konfigurera NVIC */
	* ((unsigned int *) 0xE000E100) |= (1<<9);
	/* Sätt upp avbrottsvektor */
	*((void (**) (void) ) 0x2001C064 ) = irq_handler;

}

void main(void)
{
	app_init();
	while(1){
		*portOdrLow = count;
	}
	
}

