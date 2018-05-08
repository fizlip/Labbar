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
  25              		.file 1 "C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack/startup.c"
   1:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** /*
   2:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c ****  * 	startup.c
   3:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c ****  *
   4:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c ****  */
   5:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 
   7:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** void startup ( void )
   8:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** {
  26              		.loc 1 8 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** __asm volatile(
  31              		.loc 1 9 0
  32              		.syntax divided
  33              	@ 9 "C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  10:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	" MOV SP,R0\n"
  12:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	" BL main\n"				/* call main */
  13:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	"_exit: B .\n"				/* never return */
  14:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	) ;
  15:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** }
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
  54              		.global	irq_handler
  55              		.syntax unified
  56              		.code	16
  57              		.thumb_func
  58              		.fpu softvfp
  60              	irq_handler:
  61              	.LFB1:
  16:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 
  17:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define PORT_BASE 	 0x40020C00
  18:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define portModer 	((volatile unsigned long *) 	(PORT_BASE))
  19:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define portOtyper	((volatile unsigned short *) 	(PORT_BASE+0x4))
  20:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define portOspeedr	((volatile unsigned long *) 	(PORT_BASE+0x8))
  21:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define portPupdr 	((volatile unsigned long *)		(PORT_BASE+0xC))
  22:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define portIdrLow 	((volatile unsigned char *) 	(PORT_BASE+0x10))
  23:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define portIdrHigh ((volatile unsigned char *) 	(PORT_BASE+0x11))
  24:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define portOdrLow 	((volatile unsigned char *) 	(PORT_BASE+0x14))
  25:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define portOdrHigh ((volatile unsigned char *) 	(PORT_BASE+0x15))
  26:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define EXTI_PR		((volatile unsigned char *) 	(0x40013C14))
  27:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 
  28:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define PORTE_BASE	0x40021000
  29:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define portEModer 	((volatile unsigned long *) 	(PORTE_BASE))
  30:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define portEOtyper	((volatile unsigned short *) 	(PORTE_BASE+0x4))
  31:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define portEOspeedr ((volatile unsigned long *) 	(PORTE_BASE+0x8))
  32:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define portEPupdr 	((volatile unsigned long *)		(PORTE_BASE+0xC))
  33:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define portEIdrLow ((volatile unsigned char *) 	(PORTE_BASE+0x10))
  34:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define portEIdrHigh ((volatile unsigned char *) 	(PORTE_BASE+0x11))
  35:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define portEOdrLow  ((volatile unsigned char *) 	(PORTE_BASE+0x14))
  36:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define portEOdrHigh ((volatile unsigned char *) 	(PORTE_BASE+0x15))
  37:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** #define SYSCFG_EXTICR1 0x40013808
  38:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 
  39:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** static volatile int count = 0;
  40:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 
  41:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** void irq_handler( void ){
  62              		.loc 1 41 0
  63              		.cfi_startproc
  64              		@ args = 0, pretend = 0, frame = 0
  65              		@ frame_needed = 1, uses_anonymous_args = 0
  66 0000 80B5     		push	{r7, lr}
  67              		.cfi_def_cfa_offset 8
  68              		.cfi_offset 7, -8
  69              		.cfi_offset 14, -4
  70 0002 00AF     		add	r7, sp, #0
  71              		.cfi_def_cfa_register 7
  42:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	if((* ((unsigned int *) 0x40013C14) & 8) != 0){
  72              		.loc 1 42 0
  73 0004 274B     		ldr	r3, .L9
  74 0006 1B68     		ldr	r3, [r3]
  75 0008 0822     		movs	r2, #8
  76 000a 1340     		ands	r3, r2
  77 000c 46D0     		beq	.L8
  43:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 		if((*portEIdrLow & 1) != 0){
  78              		.loc 1 43 0
  79 000e 264B     		ldr	r3, .L9+4
  80 0010 1B78     		ldrb	r3, [r3]
  81 0012 DBB2     		uxtb	r3, r3
  82 0014 1A00     		movs	r2, r3
  83 0016 0123     		movs	r3, #1
  84 0018 1340     		ands	r3, r2
  85 001a 0CD0     		beq	.L4
  44:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 			*portEOdrHigh |= 1;
  86              		.loc 1 44 0
  87 001c 234B     		ldr	r3, .L9+8
  88 001e 1B78     		ldrb	r3, [r3]
  89 0020 DBB2     		uxtb	r3, r3
  90 0022 224A     		ldr	r2, .L9+8
  91 0024 0121     		movs	r1, #1
  92 0026 0B43     		orrs	r3, r1
  93 0028 DBB2     		uxtb	r3, r3
  94 002a 1370     		strb	r3, [r2]
  45:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 			count += 1;
  95              		.loc 1 45 0
  96 002c 204B     		ldr	r3, .L9+12
  97 002e 1B68     		ldr	r3, [r3]
  98 0030 5A1C     		adds	r2, r3, #1
  99 0032 1F4B     		ldr	r3, .L9+12
 100 0034 1A60     		str	r2, [r3]
 101              	.L4:
  46:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 		}
  47:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 		if((*portEIdrLow & 2) != 0){
 102              		.loc 1 47 0
 103 0036 1C4B     		ldr	r3, .L9+4
 104 0038 1B78     		ldrb	r3, [r3]
 105 003a DBB2     		uxtb	r3, r3
 106 003c 1A00     		movs	r2, r3
 107 003e 0223     		movs	r3, #2
 108 0040 1340     		ands	r3, r2
 109 0042 0AD0     		beq	.L5
  48:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 			*portEOdrHigh |= 2;
 110              		.loc 1 48 0
 111 0044 194B     		ldr	r3, .L9+8
 112 0046 1B78     		ldrb	r3, [r3]
 113 0048 DBB2     		uxtb	r3, r3
 114 004a 184A     		ldr	r2, .L9+8
 115 004c 0221     		movs	r1, #2
 116 004e 0B43     		orrs	r3, r1
 117 0050 DBB2     		uxtb	r3, r3
 118 0052 1370     		strb	r3, [r2]
  49:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 			count = 0;
 119              		.loc 1 49 0
 120 0054 164B     		ldr	r3, .L9+12
 121 0056 0022     		movs	r2, #0
 122 0058 1A60     		str	r2, [r3]
 123              	.L5:
  50:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 		}
  51:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 		if((*portEIdrLow & 4) != 0){
 124              		.loc 1 51 0
 125 005a 134B     		ldr	r3, .L9+4
 126 005c 1B78     		ldrb	r3, [r3]
 127 005e DBB2     		uxtb	r3, r3
 128 0060 1A00     		movs	r2, r3
 129 0062 0423     		movs	r3, #4
 130 0064 1340     		ands	r3, r2
 131 0066 13D0     		beq	.L6
  52:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 			*portEOdrHigh |= 4;
 132              		.loc 1 52 0
 133 0068 104B     		ldr	r3, .L9+8
 134 006a 1B78     		ldrb	r3, [r3]
 135 006c DBB2     		uxtb	r3, r3
 136 006e 0F4A     		ldr	r2, .L9+8
 137 0070 0421     		movs	r1, #4
 138 0072 0B43     		orrs	r3, r1
 139 0074 DBB2     		uxtb	r3, r3
 140 0076 1370     		strb	r3, [r2]
  53:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 			
  54:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 			if(*portOdrHigh == 0xFF){
 141              		.loc 1 54 0
 142 0078 0E4B     		ldr	r3, .L9+16
 143 007a 1B78     		ldrb	r3, [r3]
 144 007c DBB2     		uxtb	r3, r3
 145 007e FF2B     		cmp	r3, #255
 146 0080 03D1     		bne	.L7
  55:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 				*portOdrHigh = 0;
 147              		.loc 1 55 0
 148 0082 0C4B     		ldr	r3, .L9+16
 149 0084 0022     		movs	r2, #0
 150 0086 1A70     		strb	r2, [r3]
 151 0088 02E0     		b	.L6
 152              	.L7:
  56:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 			}
  57:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 			else{
  58:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 				*portOdrHigh = 0xFF;
 153              		.loc 1 58 0
 154 008a 0A4B     		ldr	r3, .L9+16
 155 008c FF22     		movs	r2, #255
 156 008e 1A70     		strb	r2, [r3]
 157              	.L6:
  59:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 			}
  60:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 			
  61:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 		}
  62:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 		* ((unsigned int *) 0x40013C14) |= 8;
 158              		.loc 1 62 0
 159 0090 044B     		ldr	r3, .L9
 160 0092 1A68     		ldr	r2, [r3]
 161 0094 034B     		ldr	r3, .L9
 162 0096 0821     		movs	r1, #8
 163 0098 0A43     		orrs	r2, r1
 164 009a 1A60     		str	r2, [r3]
 165              	.L8:
  63:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	}
  64:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** }
 166              		.loc 1 64 0
 167 009c C046     		nop
 168 009e BD46     		mov	sp, r7
 169              		@ sp needed
 170 00a0 80BD     		pop	{r7, pc}
 171              	.L10:
 172 00a2 C046     		.align	2
 173              	.L9:
 174 00a4 143C0140 		.word	1073822740
 175 00a8 10100240 		.word	1073877008
 176 00ac 15100240 		.word	1073877013
 177 00b0 00000000 		.word	count
 178 00b4 150C0240 		.word	1073875989
 179              		.cfi_endproc
 180              	.LFE1:
 182              		.align	1
 183              		.global	app_init
 184              		.syntax unified
 185              		.code	16
 186              		.thumb_func
 187              		.fpu softvfp
 189              	app_init:
 190              	.LFB2:
  65:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 
  66:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** void app_init( void ){
 191              		.loc 1 66 0
 192              		.cfi_startproc
 193              		@ args = 0, pretend = 0, frame = 0
 194              		@ frame_needed = 1, uses_anonymous_args = 0
 195 00b8 80B5     		push	{r7, lr}
 196              		.cfi_def_cfa_offset 8
 197              		.cfi_offset 7, -8
 198              		.cfi_offset 14, -4
 199 00ba 00AF     		add	r7, sp, #0
 200              		.cfi_def_cfa_register 7
  67:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	*portModer = 0x55555555;
 201              		.loc 1 67 0
 202 00bc 174B     		ldr	r3, .L12
 203 00be 184A     		ldr	r2, .L12+4
 204 00c0 1A60     		str	r2, [r3]
  68:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	/* Nollställ fält */
  69:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	*((unsigned int *) SYSCFG_EXTICR1) &= ~0xF000;
 205              		.loc 1 69 0
 206 00c2 184B     		ldr	r3, .L12+8
 207 00c4 1A68     		ldr	r2, [r3]
 208 00c6 174B     		ldr	r3, .L12+8
 209 00c8 1749     		ldr	r1, .L12+12
 210 00ca 0A40     		ands	r2, r1
 211 00cc 1A60     		str	r2, [r3]
  70:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	/* PE3 -> EXTI3 */
  71:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	*((unsigned int *) SYSCFG_EXTICR1) |= 0x4000;
 212              		.loc 1 71 0
 213 00ce 154B     		ldr	r3, .L12+8
 214 00d0 1A68     		ldr	r2, [r3]
 215 00d2 144B     		ldr	r3, .L12+8
 216 00d4 8021     		movs	r1, #128
 217 00d6 C901     		lsls	r1, r1, #7
 218 00d8 0A43     		orrs	r2, r1
 219 00da 1A60     		str	r2, [r3]
  72:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	
  73:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	/* Aktivera genom att ettställa motsvarande bit i EXTI_IMR */
  74:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	* ((unsigned int *) 0x40013C00) |= 8;
 220              		.loc 1 74 0
 221 00dc 134B     		ldr	r3, .L12+16
 222 00de 1A68     		ldr	r2, [r3]
 223 00e0 124B     		ldr	r3, .L12+16
 224 00e2 0821     		movs	r1, #8
 225 00e4 0A43     		orrs	r2, r1
 226 00e6 1A60     		str	r2, [r3]
  75:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	/* Aktivera triggvillkor "negativ flank" */
  76:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	* ((unsigned int *) 0x40013C0C) |= 8;
 227              		.loc 1 76 0
 228 00e8 114B     		ldr	r3, .L12+20
 229 00ea 1A68     		ldr	r2, [r3]
 230 00ec 104B     		ldr	r3, .L12+20
 231 00ee 0821     		movs	r1, #8
 232 00f0 0A43     		orrs	r2, r1
 233 00f2 1A60     		str	r2, [r3]
  77:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	/* Maskera triggvillkor positiv flank */
  78:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	* ((unsigned int *) 0x40013C08) &= ~8;
 234              		.loc 1 78 0
 235 00f4 0F4B     		ldr	r3, .L12+24
 236 00f6 1A68     		ldr	r2, [r3]
 237 00f8 0E4B     		ldr	r3, .L12+24
 238 00fa 0821     		movs	r1, #8
 239 00fc 8A43     		bics	r2, r1
 240 00fe 1A60     		str	r2, [r3]
  79:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	/* Konfigurera NVIC */
  80:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	* ((unsigned int *) 0xE000E100) |= (1<<9);
 241              		.loc 1 80 0
 242 0100 0D4B     		ldr	r3, .L12+28
 243 0102 1A68     		ldr	r2, [r3]
 244 0104 0C4B     		ldr	r3, .L12+28
 245 0106 8021     		movs	r1, #128
 246 0108 8900     		lsls	r1, r1, #2
 247 010a 0A43     		orrs	r2, r1
 248 010c 1A60     		str	r2, [r3]
  81:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	/* Sätt upp avbrottsvektor */
  82:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	*((void (**) (void) ) 0x2001C064 ) = irq_handler;
 249              		.loc 1 82 0
 250 010e 0B4B     		ldr	r3, .L12+32
 251 0110 0B4A     		ldr	r2, .L12+36
 252 0112 1A60     		str	r2, [r3]
  83:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 
  84:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** }
 253              		.loc 1 84 0
 254 0114 C046     		nop
 255 0116 BD46     		mov	sp, r7
 256              		@ sp needed
 257 0118 80BD     		pop	{r7, pc}
 258              	.L13:
 259 011a C046     		.align	2
 260              	.L12:
 261 011c 000C0240 		.word	1073875968
 262 0120 55555555 		.word	1431655765
 263 0124 08380140 		.word	1073821704
 264 0128 FF0FFFFF 		.word	-61441
 265 012c 003C0140 		.word	1073822720
 266 0130 0C3C0140 		.word	1073822732
 267 0134 083C0140 		.word	1073822728
 268 0138 00E100E0 		.word	-536813312
 269 013c 64C00120 		.word	536985700
 270 0140 00000000 		.word	irq_handler
 271              		.cfi_endproc
 272              	.LFE2:
 274              		.align	1
 275              		.global	main
 276              		.syntax unified
 277              		.code	16
 278              		.thumb_func
 279              		.fpu softvfp
 281              	main:
 282              	.LFB3:
  85:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 
  86:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** void main(void)
  87:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** {
 283              		.loc 1 87 0
 284              		.cfi_startproc
 285              		@ args = 0, pretend = 0, frame = 0
 286              		@ frame_needed = 1, uses_anonymous_args = 0
 287 0144 80B5     		push	{r7, lr}
 288              		.cfi_def_cfa_offset 8
 289              		.cfi_offset 7, -8
 290              		.cfi_offset 14, -4
 291 0146 00AF     		add	r7, sp, #0
 292              		.cfi_def_cfa_register 7
  88:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	app_init();
 293              		.loc 1 88 0
 294 0148 FFF7FEFF 		bl	app_init
 295              	.L15:
  89:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 	while(1){
  90:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq_ack\startup.c **** 		*portOdrLow = count;
 296              		.loc 1 90 0 discriminator 1
 297 014c 024B     		ldr	r3, .L16
 298 014e 1A68     		ldr	r2, [r3]
 299 0150 024B     		ldr	r3, .L16+4
 300 0152 D2B2     		uxtb	r2, r2
 301 0154 1A70     		strb	r2, [r3]
 302 0156 F9E7     		b	.L15
 303              	.L17:
 304              		.align	2
 305              	.L16:
 306 0158 00000000 		.word	count
 307 015c 140C0240 		.word	1073875988
 308              		.cfi_endproc
 309              	.LFE3:
 311              	.Letext0:
