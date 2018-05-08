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
  25              		.file 1 "C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq/startup.c"
   1:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** /*
   2:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c ****  * 	startup.c
   3:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c ****  *
   4:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c ****  */
   5:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 
   7:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** void startup ( void )
   8:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** {
  26              		.loc 1 8 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** __asm volatile(
  31              		.loc 1 9 0
  32              		.syntax divided
  33              	@ 9 "C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  10:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	" MOV SP,R0\n"
  12:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	" BL main\n"				/* call main */
  13:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	"_exit: B .\n"				/* never return */
  14:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	) ;
  15:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** }
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
  16:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 
  17:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** #define PORT_BASE 	 0x40020C00
  18:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** #define portModer 	((volatile unsigned long *) 	(PORT_BASE))
  19:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** #define portOtyper	((volatile unsigned short *) 	(PORT_BASE+0x4))
  20:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** #define portOspeedr	((volatile unsigned long *) 	(PORT_BASE+0x8))
  21:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** #define portPupdr 	((volatile unsigned long *)		(PORT_BASE+0xC))
  22:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** #define portIdrLow 	((volatile unsigned char *) 	(PORT_BASE+0x10))
  23:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** #define portIdrHigh ((volatile unsigned char *) 	(PORT_BASE+0x11))
  24:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** #define portOdrLow 	((volatile unsigned char *) 	(PORT_BASE+0x14))
  25:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** #define portOdrHigh ((volatile unsigned char *) 	(PORT_BASE+0x15))
  26:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** #define EXTI_PR		((volatile unsigned char *) 	(0x40013C14))
  27:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** #define SYSCFG_EXTICR1 0x40013808
  28:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 
  29:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** static volatile int count = 0;
  30:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 
  31:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** void irq_handler( void ){
  62              		.loc 1 31 0
  63              		.cfi_startproc
  64              		@ args = 0, pretend = 0, frame = 0
  65              		@ frame_needed = 1, uses_anonymous_args = 0
  66 0000 80B5     		push	{r7, lr}
  67              		.cfi_def_cfa_offset 8
  68              		.cfi_offset 7, -8
  69              		.cfi_offset 14, -4
  70 0002 00AF     		add	r7, sp, #0
  71              		.cfi_def_cfa_register 7
  32:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	if((* ((unsigned int *) 0x40013C14) & 8) != 0){
  72              		.loc 1 32 0
  73 0004 094B     		ldr	r3, .L5
  74 0006 1B68     		ldr	r3, [r3]
  75 0008 0822     		movs	r2, #8
  76 000a 1340     		ands	r3, r2
  77 000c 0AD0     		beq	.L4
  33:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 		count += 1;
  78              		.loc 1 33 0
  79 000e 084B     		ldr	r3, .L5+4
  80 0010 1B68     		ldr	r3, [r3]
  81 0012 5A1C     		adds	r2, r3, #1
  82 0014 064B     		ldr	r3, .L5+4
  83 0016 1A60     		str	r2, [r3]
  34:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 		* ((unsigned int *) 0x40013C14) |= 8;
  84              		.loc 1 34 0
  85 0018 044B     		ldr	r3, .L5
  86 001a 1A68     		ldr	r2, [r3]
  87 001c 034B     		ldr	r3, .L5
  88 001e 0821     		movs	r1, #8
  89 0020 0A43     		orrs	r2, r1
  90 0022 1A60     		str	r2, [r3]
  91              	.L4:
  35:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	}
  36:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** }
  92              		.loc 1 36 0
  93 0024 C046     		nop
  94 0026 BD46     		mov	sp, r7
  95              		@ sp needed
  96 0028 80BD     		pop	{r7, pc}
  97              	.L6:
  98 002a C046     		.align	2
  99              	.L5:
 100 002c 143C0140 		.word	1073822740
 101 0030 00000000 		.word	count
 102              		.cfi_endproc
 103              	.LFE1:
 105              		.align	1
 106              		.global	app_init
 107              		.syntax unified
 108              		.code	16
 109              		.thumb_func
 110              		.fpu softvfp
 112              	app_init:
 113              	.LFB2:
  37:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 
  38:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** void app_init( void ){
 114              		.loc 1 38 0
 115              		.cfi_startproc
 116              		@ args = 0, pretend = 0, frame = 0
 117              		@ frame_needed = 1, uses_anonymous_args = 0
 118 0034 80B5     		push	{r7, lr}
 119              		.cfi_def_cfa_offset 8
 120              		.cfi_offset 7, -8
 121              		.cfi_offset 14, -4
 122 0036 00AF     		add	r7, sp, #0
 123              		.cfi_def_cfa_register 7
  39:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	*portModer = 0x00005555;
 124              		.loc 1 39 0
 125 0038 174B     		ldr	r3, .L8
 126 003a 184A     		ldr	r2, .L8+4
 127 003c 1A60     		str	r2, [r3]
  40:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	/* Nollställ fält */
  41:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	*((unsigned int *) SYSCFG_EXTICR1) &= ~0xF000;
 128              		.loc 1 41 0
 129 003e 184B     		ldr	r3, .L8+8
 130 0040 1A68     		ldr	r2, [r3]
 131 0042 174B     		ldr	r3, .L8+8
 132 0044 1749     		ldr	r1, .L8+12
 133 0046 0A40     		ands	r2, r1
 134 0048 1A60     		str	r2, [r3]
  42:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	/* PE3 -> EXTI3 */
  43:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	*((unsigned int *) SYSCFG_EXTICR1) |= 0x4000;
 135              		.loc 1 43 0
 136 004a 154B     		ldr	r3, .L8+8
 137 004c 1A68     		ldr	r2, [r3]
 138 004e 144B     		ldr	r3, .L8+8
 139 0050 8021     		movs	r1, #128
 140 0052 C901     		lsls	r1, r1, #7
 141 0054 0A43     		orrs	r2, r1
 142 0056 1A60     		str	r2, [r3]
  44:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	
  45:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	/* Aktivera genom att ettställa motsvarande bit i EXTI_IMR */
  46:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	* ((unsigned int *) 0x40013C00) |= 8;
 143              		.loc 1 46 0
 144 0058 134B     		ldr	r3, .L8+16
 145 005a 1A68     		ldr	r2, [r3]
 146 005c 124B     		ldr	r3, .L8+16
 147 005e 0821     		movs	r1, #8
 148 0060 0A43     		orrs	r2, r1
 149 0062 1A60     		str	r2, [r3]
  47:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	/* Aktivera triggvillkor "negativ flank" */
  48:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	* ((unsigned int *) 0x40013C0C) |= 8;
 150              		.loc 1 48 0
 151 0064 114B     		ldr	r3, .L8+20
 152 0066 1A68     		ldr	r2, [r3]
 153 0068 104B     		ldr	r3, .L8+20
 154 006a 0821     		movs	r1, #8
 155 006c 0A43     		orrs	r2, r1
 156 006e 1A60     		str	r2, [r3]
  49:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	/* Maskera triggvillkor positiv flank */
  50:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	* ((unsigned int *) 0x40013C08) &= ~8;
 157              		.loc 1 50 0
 158 0070 0F4B     		ldr	r3, .L8+24
 159 0072 1A68     		ldr	r2, [r3]
 160 0074 0E4B     		ldr	r3, .L8+24
 161 0076 0821     		movs	r1, #8
 162 0078 8A43     		bics	r2, r1
 163 007a 1A60     		str	r2, [r3]
  51:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	/* Konfigurera NVIC */
  52:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	* ((unsigned int *) 0xE000E100) |= (1<<9);
 164              		.loc 1 52 0
 165 007c 0D4B     		ldr	r3, .L8+28
 166 007e 1A68     		ldr	r2, [r3]
 167 0080 0C4B     		ldr	r3, .L8+28
 168 0082 8021     		movs	r1, #128
 169 0084 8900     		lsls	r1, r1, #2
 170 0086 0A43     		orrs	r2, r1
 171 0088 1A60     		str	r2, [r3]
  53:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	/* Sätt upp avbrottsvektor */
  54:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	*((void (**) (void) ) 0x2001C064 ) = irq_handler;
 172              		.loc 1 54 0
 173 008a 0B4B     		ldr	r3, .L8+32
 174 008c 0B4A     		ldr	r2, .L8+36
 175 008e 1A60     		str	r2, [r3]
  55:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 
  56:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** }
 176              		.loc 1 56 0
 177 0090 C046     		nop
 178 0092 BD46     		mov	sp, r7
 179              		@ sp needed
 180 0094 80BD     		pop	{r7, pc}
 181              	.L9:
 182 0096 C046     		.align	2
 183              	.L8:
 184 0098 000C0240 		.word	1073875968
 185 009c 55550000 		.word	21845
 186 00a0 08380140 		.word	1073821704
 187 00a4 FF0FFFFF 		.word	-61441
 188 00a8 003C0140 		.word	1073822720
 189 00ac 0C3C0140 		.word	1073822732
 190 00b0 083C0140 		.word	1073822728
 191 00b4 00E100E0 		.word	-536813312
 192 00b8 64C00120 		.word	536985700
 193 00bc 00000000 		.word	irq_handler
 194              		.cfi_endproc
 195              	.LFE2:
 197              		.align	1
 198              		.global	main
 199              		.syntax unified
 200              		.code	16
 201              		.thumb_func
 202              		.fpu softvfp
 204              	main:
 205              	.LFB3:
  57:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 
  58:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** void main(void)
  59:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** {
 206              		.loc 1 59 0
 207              		.cfi_startproc
 208              		@ args = 0, pretend = 0, frame = 0
 209              		@ frame_needed = 1, uses_anonymous_args = 0
 210 00c0 80B5     		push	{r7, lr}
 211              		.cfi_def_cfa_offset 8
 212              		.cfi_offset 7, -8
 213              		.cfi_offset 14, -4
 214 00c2 00AF     		add	r7, sp, #0
 215              		.cfi_def_cfa_register 7
  60:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	app_init();
 216              		.loc 1 60 0
 217 00c4 FFF7FEFF 		bl	app_init
 218              	.L11:
  61:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 	while(1){
  62:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/flipflop_irq\startup.c **** 		*portOdrLow = count;
 219              		.loc 1 62 0 discriminator 1
 220 00c8 024B     		ldr	r3, .L12
 221 00ca 1A68     		ldr	r2, [r3]
 222 00cc 024B     		ldr	r3, .L12+4
 223 00ce D2B2     		uxtb	r2, r2
 224 00d0 1A70     		strb	r2, [r3]
 225 00d2 F9E7     		b	.L11
 226              	.L13:
 227              		.align	2
 228              	.L12:
 229 00d4 00000000 		.word	count
 230 00d8 140C0240 		.word	1073875988
 231              		.cfi_endproc
 232              	.LFE3:
 234              	.Letext0:
