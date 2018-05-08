   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"startup.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.section	.start_section,"ax",%progbits
  16              		.align	1
  17              		.global	startup
  18              		.syntax unified
  19              		.code	16
  20              		.thumb_func
  21              		.fpu softvfp
  23              	startup:
  24              	.LFB0:
  25              		.file 1 "C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored/startup.c"
   1:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** /*
   2:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c ****  * 	startup.c
   3:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c ****  *
   4:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c ****  */
   5:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 
   7:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** void startup ( void )
   8:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** {
  26              		.loc 1 8 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** __asm volatile(
  31              		.loc 1 9 0
  32              		.syntax divided
  33              	@ 9 "C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  10:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	" MOV SP,R0\n"
  12:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	" BL main\n"				/* call main */
  13:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	"_exit: B .\n"				/* never return */
  14:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	) ;
  15:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** }
  40              		.loc 1 15 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.bss
  48              		.align	2
  49              	count:
  50 0000 00000000 		.space	4
  52              		.text
  53              		.align	1
  54              		.global	irq0_handler
  55              		.syntax unified
  56              		.code	16
  57              		.thumb_func
  58              		.fpu softvfp
  60              	irq0_handler:
  61              	.LFB1:
  16:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 
  17:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 
  18:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define PORT_BASE 	 0x40020C00
  19:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define portModer 	((volatile unsigned long *) 	(PORT_BASE))
  20:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define portOtyper	((volatile unsigned short *) 	(PORT_BASE+0x4))
  21:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define portOspeedr	((volatile unsigned long *) 	(PORT_BASE+0x8))
  22:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define portPupdr 	((volatile unsigned long *)		(PORT_BASE+0xC))
  23:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define portIdrLow 	((volatile unsigned char *) 	(PORT_BASE+0x10))
  24:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define portIdrHigh ((volatile unsigned char *) 	(PORT_BASE+0x11))
  25:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define portOdrLow 	((volatile unsigned char *) 	(PORT_BASE+0x14))
  26:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define portOdrHigh ((volatile unsigned char *) 	(PORT_BASE+0x15))
  27:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define EXTI_PR		((volatile unsigned char *) 	(0x40013C14))
  28:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 
  29:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define PORTE_BASE	0x40021000
  30:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define portEModer 	((volatile unsigned long *) 	(PORTE_BASE))
  31:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define portEOtyper	((volatile unsigned short *) 	(PORTE_BASE+0x4))
  32:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define portEOspeedr ((volatile unsigned long *) 	(PORTE_BASE+0x8))
  33:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define portEPupdr 	((volatile unsigned long *)		(PORTE_BASE+0xC))
  34:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define portEIdrLow ((volatile unsigned char *) 	(PORTE_BASE+0x10))
  35:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define portEIdrHigh ((volatile unsigned char *) 	(PORTE_BASE+0x11))
  36:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define portEOdrLow  ((volatile unsigned char *) 	(PORTE_BASE+0x14))
  37:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define portEOdrHigh ((volatile unsigned char *) 	(PORTE_BASE+0x15))
  38:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 
  39:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define SYSCFG_BASE				((volatile unsigned int *) 0x40013800)
  40:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define SYSCFG_EXTICR1			((volatile unsigned int *) 0x40013808)
  41:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define EXTI_IMR				((volatile unsigned int *) 0x40013C00)
  42:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define EXTI_FTSR				((volatile unsigned int *) 0x40013C0C)
  43:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define EXTI_RTSR				((volatile unsigned int *) 0x40013C08)
  44:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define EXTI_PR					((volatile unsigned int *) 0x40013C14)
  45:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define EXTI3_IRQVEC			((void (**) (void) ) 0x2001C064)
  46:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define EXTI2_IRQVEC			((void (**) (void) ) 0x2001C060)
  47:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define EXTI1_IRQVEC			((void (**) (void) ) 0x2001C05C)
  48:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define EXTI0_IRQVEC			((void (**) (void) ) 0x2001C058)
  49:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define NVIC_ISER0				((volatile unsigned int *) 0xE000E100)
  50:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define NVIC_EXTI3_IRQ_BPOS		(1<<9)
  51:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define NVIC_EXTI2_IRQ_BPOS		(1<<8)
  52:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define NVIC_EXTI1_IRQ_BPOS		(1<<7)
  53:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define NVIC_EXTI0_IRQ_BPOS		(1<<6)
  54:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define EXTI3_IRQ_BPOS			(1<<3)
  55:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define EXTI2_IRQ_BPOS			(1<<2)
  56:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define EXTI1_IRQ_BPOS			(1<<1)
  57:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** #define EXTI0_IRQ_BPOS			(1<<0)
  58:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 
  59:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** static volatile int count = 0;
  60:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 
  61:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** void irq0_handler( void ){
  62              		.loc 1 61 0
  63              		.cfi_startproc
  64              		@ args = 0, pretend = 0, frame = 0
  65              		@ frame_needed = 1, uses_anonymous_args = 0
  66 0000 80B5     		push	{r7, lr}
  67              		.cfi_def_cfa_offset 8
  68              		.cfi_offset 7, -8
  69              		.cfi_offset 14, -4
  70 0002 00AF     		add	r7, sp, #0
  71              		.cfi_def_cfa_register 7
  62:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	if((*EXTI_PR & EXTI0_IRQ_BPOS) != 0){
  72              		.loc 1 62 0
  73 0004 0A4B     		ldr	r3, .L5
  74 0006 1B68     		ldr	r3, [r3]
  75 0008 0122     		movs	r2, #1
  76 000a 1340     		ands	r3, r2
  77 000c 0CD0     		beq	.L4
  63:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 		*portEOdrHigh |= 1;
  78              		.loc 1 63 0
  79 000e 094B     		ldr	r3, .L5+4
  80 0010 1B78     		ldrb	r3, [r3]
  81 0012 DBB2     		uxtb	r3, r3
  82 0014 074A     		ldr	r2, .L5+4
  83 0016 0121     		movs	r1, #1
  84 0018 0B43     		orrs	r3, r1
  85 001a DBB2     		uxtb	r3, r3
  86 001c 1370     		strb	r3, [r2]
  64:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 		count += 1;
  87              		.loc 1 64 0
  88 001e 064B     		ldr	r3, .L5+8
  89 0020 1B68     		ldr	r3, [r3]
  90 0022 5A1C     		adds	r2, r3, #1
  91 0024 044B     		ldr	r3, .L5+8
  92 0026 1A60     		str	r2, [r3]
  93              	.L4:
  65:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	}
  66:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** }
  94              		.loc 1 66 0
  95 0028 C046     		nop
  96 002a BD46     		mov	sp, r7
  97              		@ sp needed
  98 002c 80BD     		pop	{r7, pc}
  99              	.L6:
 100 002e C046     		.align	2
 101              	.L5:
 102 0030 143C0140 		.word	1073822740
 103 0034 15100240 		.word	1073877013
 104 0038 00000000 		.word	count
 105              		.cfi_endproc
 106              	.LFE1:
 108              		.align	1
 109              		.global	irq1_handler
 110              		.syntax unified
 111              		.code	16
 112              		.thumb_func
 113              		.fpu softvfp
 115              	irq1_handler:
 116              	.LFB2:
  67:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 
  68:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** void irq1_handler( void ){
 117              		.loc 1 68 0
 118              		.cfi_startproc
 119              		@ args = 0, pretend = 0, frame = 0
 120              		@ frame_needed = 1, uses_anonymous_args = 0
 121 003c 80B5     		push	{r7, lr}
 122              		.cfi_def_cfa_offset 8
 123              		.cfi_offset 7, -8
 124              		.cfi_offset 14, -4
 125 003e 00AF     		add	r7, sp, #0
 126              		.cfi_def_cfa_register 7
  69:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	if((*EXTI_PR & EXTI1_IRQ_BPOS) != 0){
 127              		.loc 1 69 0
 128 0040 094B     		ldr	r3, .L10
 129 0042 1B68     		ldr	r3, [r3]
 130 0044 0222     		movs	r2, #2
 131 0046 1340     		ands	r3, r2
 132 0048 0AD0     		beq	.L9
  70:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 		*portEOdrHigh |= 2;
 133              		.loc 1 70 0
 134 004a 084B     		ldr	r3, .L10+4
 135 004c 1B78     		ldrb	r3, [r3]
 136 004e DBB2     		uxtb	r3, r3
 137 0050 064A     		ldr	r2, .L10+4
 138 0052 0221     		movs	r1, #2
 139 0054 0B43     		orrs	r3, r1
 140 0056 DBB2     		uxtb	r3, r3
 141 0058 1370     		strb	r3, [r2]
  71:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 		count = 0;
 142              		.loc 1 71 0
 143 005a 054B     		ldr	r3, .L10+8
 144 005c 0022     		movs	r2, #0
 145 005e 1A60     		str	r2, [r3]
 146              	.L9:
  72:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	}
  73:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** }
 147              		.loc 1 73 0
 148 0060 C046     		nop
 149 0062 BD46     		mov	sp, r7
 150              		@ sp needed
 151 0064 80BD     		pop	{r7, pc}
 152              	.L11:
 153 0066 C046     		.align	2
 154              	.L10:
 155 0068 143C0140 		.word	1073822740
 156 006c 15100240 		.word	1073877013
 157 0070 00000000 		.word	count
 158              		.cfi_endproc
 159              	.LFE2:
 161              		.align	1
 162              		.global	irq2_handler
 163              		.syntax unified
 164              		.code	16
 165              		.thumb_func
 166              		.fpu softvfp
 168              	irq2_handler:
 169              	.LFB3:
  74:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 
  75:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** void irq2_handler( void ){
 170              		.loc 1 75 0
 171              		.cfi_startproc
 172              		@ args = 0, pretend = 0, frame = 0
 173              		@ frame_needed = 1, uses_anonymous_args = 0
 174 0074 80B5     		push	{r7, lr}
 175              		.cfi_def_cfa_offset 8
 176              		.cfi_offset 7, -8
 177              		.cfi_offset 14, -4
 178 0076 00AF     		add	r7, sp, #0
 179              		.cfi_def_cfa_register 7
  76:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	if((*EXTI_PR & EXTI2_IRQ_BPOS) != 0){
 180              		.loc 1 76 0
 181 0078 0D4B     		ldr	r3, .L16
 182 007a 1B68     		ldr	r3, [r3]
 183 007c 0422     		movs	r2, #4
 184 007e 1340     		ands	r3, r2
 185 0080 13D0     		beq	.L15
  77:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 		*portEOdrHigh |= 4;
 186              		.loc 1 77 0
 187 0082 0C4B     		ldr	r3, .L16+4
 188 0084 1B78     		ldrb	r3, [r3]
 189 0086 DBB2     		uxtb	r3, r3
 190 0088 0A4A     		ldr	r2, .L16+4
 191 008a 0421     		movs	r1, #4
 192 008c 0B43     		orrs	r3, r1
 193 008e DBB2     		uxtb	r3, r3
 194 0090 1370     		strb	r3, [r2]
  78:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 			
  79:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 		if(*portOdrHigh == 0xFF){
 195              		.loc 1 79 0
 196 0092 094B     		ldr	r3, .L16+8
 197 0094 1B78     		ldrb	r3, [r3]
 198 0096 DBB2     		uxtb	r3, r3
 199 0098 FF2B     		cmp	r3, #255
 200 009a 03D1     		bne	.L14
  80:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 			*portOdrHigh = 0;
 201              		.loc 1 80 0
 202 009c 064B     		ldr	r3, .L16+8
 203 009e 0022     		movs	r2, #0
 204 00a0 1A70     		strb	r2, [r3]
  81:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 		}
  82:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 		else{
  83:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 			*portOdrHigh = 0xFF;
  84:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 		}
  85:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	}
  86:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** }
 205              		.loc 1 86 0
 206 00a2 02E0     		b	.L15
 207              	.L14:
  83:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 		}
 208              		.loc 1 83 0
 209 00a4 044B     		ldr	r3, .L16+8
 210 00a6 FF22     		movs	r2, #255
 211 00a8 1A70     		strb	r2, [r3]
 212              	.L15:
 213              		.loc 1 86 0
 214 00aa C046     		nop
 215 00ac BD46     		mov	sp, r7
 216              		@ sp needed
 217 00ae 80BD     		pop	{r7, pc}
 218              	.L17:
 219              		.align	2
 220              	.L16:
 221 00b0 143C0140 		.word	1073822740
 222 00b4 15100240 		.word	1073877013
 223 00b8 150C0240 		.word	1073875989
 224              		.cfi_endproc
 225              	.LFE3:
 227              		.align	1
 228              		.global	app_init
 229              		.syntax unified
 230              		.code	16
 231              		.thumb_func
 232              		.fpu softvfp
 234              	app_init:
 235              	.LFB4:
  87:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 
  88:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** void app_init( void ){
 236              		.loc 1 88 0
 237              		.cfi_startproc
 238              		@ args = 0, pretend = 0, frame = 0
 239              		@ frame_needed = 1, uses_anonymous_args = 0
 240 00bc 80B5     		push	{r7, lr}
 241              		.cfi_def_cfa_offset 8
 242              		.cfi_offset 7, -8
 243              		.cfi_offset 14, -4
 244 00be 00AF     		add	r7, sp, #0
 245              		.cfi_def_cfa_register 7
  89:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	*portModer = 0x55555555;
 246              		.loc 1 89 0
 247 00c0 314B     		ldr	r3, .L19
 248 00c2 324A     		ldr	r2, .L19+4
 249 00c4 1A60     		str	r2, [r3]
  90:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	/* Nollställ fält */
  91:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	*((unsigned int *) SYSCFG_EXTICR1) &= ~0x0FFF;
 250              		.loc 1 91 0
 251 00c6 324B     		ldr	r3, .L19+8
 252 00c8 1A68     		ldr	r2, [r3]
 253 00ca 314B     		ldr	r3, .L19+8
 254 00cc 120B     		lsrs	r2, r2, #12
 255 00ce 1203     		lsls	r2, r2, #12
 256 00d0 1A60     		str	r2, [r3]
  92:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	/* PA0 -> EXTI0, PA1->EXTI1, PA2 -> EXTI2 */
  93:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	*((unsigned int *) SYSCFG_EXTICR1) |= 0x0444;
 257              		.loc 1 93 0
 258 00d2 2F4B     		ldr	r3, .L19+8
 259 00d4 1A68     		ldr	r2, [r3]
 260 00d6 2E4B     		ldr	r3, .L19+8
 261 00d8 2E49     		ldr	r1, .L19+12
 262 00da 0A43     		orrs	r2, r1
 263 00dc 1A60     		str	r2, [r3]
  94:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	
  95:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	/* Aktivera genom att ettställa motsvarande bit i EXTI_IMR */
  96:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	*EXTI_IMR |= EXTI0_IRQ_BPOS;
 264              		.loc 1 96 0
 265 00de 2E4B     		ldr	r3, .L19+16
 266 00e0 1A68     		ldr	r2, [r3]
 267 00e2 2D4B     		ldr	r3, .L19+16
 268 00e4 0121     		movs	r1, #1
 269 00e6 0A43     		orrs	r2, r1
 270 00e8 1A60     		str	r2, [r3]
  97:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	*EXTI_IMR |= EXTI1_IRQ_BPOS;
 271              		.loc 1 97 0
 272 00ea 2B4B     		ldr	r3, .L19+16
 273 00ec 1A68     		ldr	r2, [r3]
 274 00ee 2A4B     		ldr	r3, .L19+16
 275 00f0 0221     		movs	r1, #2
 276 00f2 0A43     		orrs	r2, r1
 277 00f4 1A60     		str	r2, [r3]
  98:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	*EXTI_IMR |= EXTI2_IRQ_BPOS;
 278              		.loc 1 98 0
 279 00f6 284B     		ldr	r3, .L19+16
 280 00f8 1A68     		ldr	r2, [r3]
 281 00fa 274B     		ldr	r3, .L19+16
 282 00fc 0421     		movs	r1, #4
 283 00fe 0A43     		orrs	r2, r1
 284 0100 1A60     		str	r2, [r3]
  99:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	/* Aktivera triggvillkor "negativ flank" */
 100:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	*EXTI_FTSR |= EXTI0_IRQ_BPOS;
 285              		.loc 1 100 0
 286 0102 264B     		ldr	r3, .L19+20
 287 0104 1A68     		ldr	r2, [r3]
 288 0106 254B     		ldr	r3, .L19+20
 289 0108 0121     		movs	r1, #1
 290 010a 0A43     		orrs	r2, r1
 291 010c 1A60     		str	r2, [r3]
 101:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	*EXTI_FTSR |= EXTI1_IRQ_BPOS;
 292              		.loc 1 101 0
 293 010e 234B     		ldr	r3, .L19+20
 294 0110 1A68     		ldr	r2, [r3]
 295 0112 224B     		ldr	r3, .L19+20
 296 0114 0221     		movs	r1, #2
 297 0116 0A43     		orrs	r2, r1
 298 0118 1A60     		str	r2, [r3]
 102:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	*EXTI_FTSR |= EXTI2_IRQ_BPOS;
 299              		.loc 1 102 0
 300 011a 204B     		ldr	r3, .L19+20
 301 011c 1A68     		ldr	r2, [r3]
 302 011e 1F4B     		ldr	r3, .L19+20
 303 0120 0421     		movs	r1, #4
 304 0122 0A43     		orrs	r2, r1
 305 0124 1A60     		str	r2, [r3]
 103:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	/* Maskera triggvillkor positiv flank */
 104:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	*EXTI_RTSR &= ~EXTI0_IRQ_BPOS;
 306              		.loc 1 104 0
 307 0126 1E4B     		ldr	r3, .L19+24
 308 0128 1A68     		ldr	r2, [r3]
 309 012a 1D4B     		ldr	r3, .L19+24
 310 012c 0121     		movs	r1, #1
 311 012e 8A43     		bics	r2, r1
 312 0130 1A60     		str	r2, [r3]
 105:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	*EXTI_RTSR &= ~EXTI1_IRQ_BPOS;
 313              		.loc 1 105 0
 314 0132 1B4B     		ldr	r3, .L19+24
 315 0134 1A68     		ldr	r2, [r3]
 316 0136 1A4B     		ldr	r3, .L19+24
 317 0138 0221     		movs	r1, #2
 318 013a 8A43     		bics	r2, r1
 319 013c 1A60     		str	r2, [r3]
 106:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	*EXTI_RTSR &= ~EXTI2_IRQ_BPOS;
 320              		.loc 1 106 0
 321 013e 184B     		ldr	r3, .L19+24
 322 0140 1A68     		ldr	r2, [r3]
 323 0142 174B     		ldr	r3, .L19+24
 324 0144 0421     		movs	r1, #4
 325 0146 8A43     		bics	r2, r1
 326 0148 1A60     		str	r2, [r3]
 107:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	/* Konfigurera NVIC */
 108:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	*NVIC_ISER0 |= NVIC_EXTI0_IRQ_BPOS;
 327              		.loc 1 108 0
 328 014a 164B     		ldr	r3, .L19+28
 329 014c 1A68     		ldr	r2, [r3]
 330 014e 154B     		ldr	r3, .L19+28
 331 0150 4021     		movs	r1, #64
 332 0152 0A43     		orrs	r2, r1
 333 0154 1A60     		str	r2, [r3]
 109:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	*NVIC_ISER0 |= NVIC_EXTI1_IRQ_BPOS;
 334              		.loc 1 109 0
 335 0156 134B     		ldr	r3, .L19+28
 336 0158 1A68     		ldr	r2, [r3]
 337 015a 124B     		ldr	r3, .L19+28
 338 015c 8021     		movs	r1, #128
 339 015e 0A43     		orrs	r2, r1
 340 0160 1A60     		str	r2, [r3]
 110:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	*NVIC_ISER0 |= NVIC_EXTI2_IRQ_BPOS;
 341              		.loc 1 110 0
 342 0162 104B     		ldr	r3, .L19+28
 343 0164 1A68     		ldr	r2, [r3]
 344 0166 0F4B     		ldr	r3, .L19+28
 345 0168 8021     		movs	r1, #128
 346 016a 4900     		lsls	r1, r1, #1
 347 016c 0A43     		orrs	r2, r1
 348 016e 1A60     		str	r2, [r3]
 111:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	/* Sätt upp avbrottsvektor */
 112:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	*EXTI0_IRQVEC = irq0_handler;
 349              		.loc 1 112 0
 350 0170 0D4B     		ldr	r3, .L19+32
 351 0172 0E4A     		ldr	r2, .L19+36
 352 0174 1A60     		str	r2, [r3]
 113:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	*EXTI1_IRQVEC = irq1_handler;
 353              		.loc 1 113 0
 354 0176 0E4B     		ldr	r3, .L19+40
 355 0178 0E4A     		ldr	r2, .L19+44
 356 017a 1A60     		str	r2, [r3]
 114:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	*EXTI2_IRQVEC = irq2_handler;
 357              		.loc 1 114 0
 358 017c 0E4B     		ldr	r3, .L19+48
 359 017e 0F4A     		ldr	r2, .L19+52
 360 0180 1A60     		str	r2, [r3]
 115:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 
 116:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** }
 361              		.loc 1 116 0
 362 0182 C046     		nop
 363 0184 BD46     		mov	sp, r7
 364              		@ sp needed
 365 0186 80BD     		pop	{r7, pc}
 366              	.L20:
 367              		.align	2
 368              	.L19:
 369 0188 000C0240 		.word	1073875968
 370 018c 55555555 		.word	1431655765
 371 0190 08380140 		.word	1073821704
 372 0194 44040000 		.word	1092
 373 0198 003C0140 		.word	1073822720
 374 019c 0C3C0140 		.word	1073822732
 375 01a0 083C0140 		.word	1073822728
 376 01a4 00E100E0 		.word	-536813312
 377 01a8 58C00120 		.word	536985688
 378 01ac 00000000 		.word	irq0_handler
 379 01b0 5CC00120 		.word	536985692
 380 01b4 00000000 		.word	irq1_handler
 381 01b8 60C00120 		.word	536985696
 382 01bc 00000000 		.word	irq2_handler
 383              		.cfi_endproc
 384              	.LFE4:
 386              		.align	1
 387              		.global	main
 388              		.syntax unified
 389              		.code	16
 390              		.thumb_func
 391              		.fpu softvfp
 393              	main:
 394              	.LFB5:
 117:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 
 118:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** void main(void)
 119:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** {
 395              		.loc 1 119 0
 396              		.cfi_startproc
 397              		@ args = 0, pretend = 0, frame = 0
 398              		@ frame_needed = 1, uses_anonymous_args = 0
 399 01c0 80B5     		push	{r7, lr}
 400              		.cfi_def_cfa_offset 8
 401              		.cfi_offset 7, -8
 402              		.cfi_offset 14, -4
 403 01c2 00AF     		add	r7, sp, #0
 404              		.cfi_def_cfa_register 7
 120:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	app_init();
 405              		.loc 1 120 0
 406 01c4 FFF7FEFF 		bl	app_init
 407              	.L22:
 121:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 	while(1){
 122:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_vectored\startup.c **** 		*portOdrLow = count;
 408              		.loc 1 122 0 discriminator 1
 409 01c8 024B     		ldr	r3, .L23
 410 01ca 1A68     		ldr	r2, [r3]
 411 01cc 024B     		ldr	r3, .L23+4
 412 01ce D2B2     		uxtb	r2, r2
 413 01d0 1A70     		strb	r2, [r3]
 414 01d2 F9E7     		b	.L22
 415              	.L24:
 416              		.align	2
 417              	.L23:
 418 01d4 00000000 		.word	count
 419 01d8 140C0240 		.word	1073875988
 420              		.cfi_endproc
 421              	.LFE5:
 423              	.Letext0:
