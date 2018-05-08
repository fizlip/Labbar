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

#define SYSCFG_BASE				((volatile unsigned int *) 0x40013800)
#define SYSCFG_EXTICR1			((volatile unsigned int *) 0x40013808)
#define EXTI_IMR				((volatile unsigned int *) 0x40013C00)
#define EXTI_FTSR				((volatile unsigned int *) 0x40013C0C)
#define EXTI_RTSR				((volatile unsigned int *) 0x40013C08)
#define EXTI_PR					((volatile unsigned int *) 0x40013C14)
#define EXTI3_IRQVEC			((void (**) (void) ) 0x2001C064)
#define EXTI2_IRQVEC			((void (**) (void) ) 0x2001C060)
#define EXTI1_IRQVEC			((void (**) (void) ) 0x2001C05C)
#define EXTI0_IRQVEC			((void (**) (void) ) 0x2001C058)
#define NVIC_ISER0				((volatile unsigned int *) 0xE000E100)
#define NVIC_EXTI3_IRQ_BPOS		(1<<9)
#define NVIC_EXTI2_IRQ_BPOS		(1<<8)
#define NVIC_EXTI1_IRQ_BPOS		(1<<7)
#define NVIC_EXTI0_IRQ_BPOS		(1<<6)
#define EXTI3_IRQ_BPOS			(1<<3)
#define EXTI2_IRQ_BPOS			(1<<2)
#define EXTI1_IRQ_BPOS			(1<<1)
#define EXTI0_IRQ_BPOS			(1<<0)

static volatile int count = 0;

void irq0_handler( void ){
	if((*EXTI_PR & EXTI0_IRQ_BPOS) != 0){
		*portEOdrHigh |= 1;
		count += 1;
	}
}

void irq1_handler( void ){
	if((*EXTI_PR & EXTI1_IRQ_BPOS) != 0){
		*portEOdrHigh |= 2;
		count = 0;
	}
}

void irq2_handler( void ){
	if((*EXTI_PR & EXTI2_IRQ_BPOS) != 0){
		*portEOdrHigh |= 4;
			
		if(*portOdrHigh == 0xFF){
			*portOdrHigh = 0;
		}
		else{
			*portOdrHigh = 0xFF;
		}
	}
}

void app_init( void ){
	*portModer = 0x55555555;
	/* Nollställ fält */
	*((unsigned int *) SYSCFG_EXTICR1) &= ~0x0FFF;
	/* PA0 -> EXTI0, PA1->EXTI1, PA2 -> EXTI2 */
	*((unsigned int *) SYSCFG_EXTICR1) |= 0x0444;
	
	/* Aktivera genom att ettställa motsvarande bit i EXTI_IMR */
	*EXTI_IMR |= EXTI0_IRQ_BPOS;
	*EXTI_IMR |= EXTI1_IRQ_BPOS;
	*EXTI_IMR |= EXTI2_IRQ_BPOS;
	/* Aktivera triggvillkor "negativ flank" */
	*EXTI_FTSR |= EXTI0_IRQ_BPOS;
	*EXTI_FTSR |= EXTI1_IRQ_BPOS;
	*EXTI_FTSR |= EXTI2_IRQ_BPOS;
	/* Maskera triggvillkor positiv flank */
	*EXTI_RTSR &= ~EXTI0_IRQ_BPOS;
	*EXTI_RTSR &= ~EXTI1_IRQ_BPOS;
	*EXTI_RTSR &= ~EXTI2_IRQ_BPOS;
	/* Konfigurera NVIC */
	*NVIC_ISER0 |= NVIC_EXTI0_IRQ_BPOS;
	*NVIC_ISER0 |= NVIC_EXTI1_IRQ_BPOS;
	*NVIC_ISER0 |= NVIC_EXTI2_IRQ_BPOS;
	/* Sätt upp avbrottsvektor */
	*EXTI0_IRQVEC = irq0_handler;
	*EXTI1_IRQVEC = irq1_handler;
	*EXTI2_IRQVEC = irq2_handler;

}

void main(void)
{
	app_init();
	while(1){
		*portOdrLow = count;
	}
}

