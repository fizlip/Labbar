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
  25              		.file 1 "C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq/startup.c"
   1:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** /*
   2:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c ****  * 	startup.c
   3:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c ****  *
   4:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c ****  */
   5:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 
   7:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** void startup ( void )
   8:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** {
  26              		.loc 1 8 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** __asm volatile(
  31              		.loc 1 9 0
  32              		.syntax divided
  33              	@ 9 "C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  10:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	" MOV SP,R0\n"
  12:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	" BL main\n"				/* call main */
  13:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	"_exit: B .\n"				/* never return */
  14:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	) ;
  15:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** }
  40              		.loc 1 15 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.bss
  48              		.align	2
  49              	systick_flag:
  50 0000 00000000 		.space	4
  52              		.align	2
  53              	delay_count:
  54 0004 00000000 		.space	4
  56              		.text
  57              		.align	1
  58              		.global	systick_irq_handler
  59              		.syntax unified
  60              		.code	16
  61              		.thumb_func
  62              		.fpu softvfp
  64              	systick_irq_handler:
  65              	.LFB1:
  16:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 
  17:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #ifdef SIMULATOR
  18:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #define DELAY_COUNT 100
  19:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #else
  20:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #define DELAY_COUNT 1000
  21:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #endif
  22:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #define PORT_BASE 	 0x40020C00
  23:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #define portModer 	((volatile unsigned long *) 	(PORT_BASE))
  24:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #define portOtyper	((volatile unsigned short *) 	(PORT_BASE+0x4))
  25:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #define portOspeedr	((volatile unsigned long *) 	(PORT_BASE+0x8))
  26:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #define portPupdr 	((volatile unsigned long *)		(PORT_BASE+0xC))
  27:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #define portIdrLow 	((volatile unsigned char *) 	(PORT_BASE+0x10))
  28:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #define portIdrHigh ((volatile unsigned char *) 	(PORT_BASE+0x11))
  29:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #define portOdrLow 	((volatile unsigned char *) 	(PORT_BASE+0x14))
  30:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #define portOdrHigh ((volatile unsigned char *) 	(PORT_BASE+0x15))
  31:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #define STK_ADR		0xE000E010
  32:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #define STK_CTRL	((volatile unsigned char *)		0xE000E010)
  33:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #define STK_LOAD	((volatile unsigned char *)		STK_ADR+0x4)
  34:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #define STK_VAL		((volatile unsigned char *)		STK_ADR+0x8)
  35:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** #define STK_CALIB	((volatile unsigned char *)		STK_ADR+0xC)
  36:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 
  37:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** static volatile int systick_flag;
  38:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** static volatile int delay_count;
  39:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 
  40:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** void systick_irq_handler( void ){
  66              		.loc 1 40 0
  67              		.cfi_startproc
  68              		@ args = 0, pretend = 0, frame = 0
  69              		@ frame_needed = 1, uses_anonymous_args = 0
  70 0000 80B5     		push	{r7, lr}
  71              		.cfi_def_cfa_offset 8
  72              		.cfi_offset 7, -8
  73              		.cfi_offset 14, -4
  74 0002 00AF     		add	r7, sp, #0
  75              		.cfi_def_cfa_register 7
  41:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	*STK_CTRL = 0x00;
  76              		.loc 1 41 0
  77 0004 0A4B     		ldr	r3, .L6
  78 0006 0022     		movs	r2, #0
  79 0008 1A70     		strb	r2, [r3]
  42:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	delay_count = delay_count - 1;
  80              		.loc 1 42 0
  81 000a 0A4B     		ldr	r3, .L6+4
  82 000c 1B68     		ldr	r3, [r3]
  83 000e 5A1E     		subs	r2, r3, #1
  84 0010 084B     		ldr	r3, .L6+4
  85 0012 1A60     		str	r2, [r3]
  43:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	if(delay_count > 0){
  86              		.loc 1 43 0
  87 0014 074B     		ldr	r3, .L6+4
  88 0016 1B68     		ldr	r3, [r3]
  89 0018 002B     		cmp	r3, #0
  90 001a 02DD     		ble	.L3
  91              	.LBB2:
  44:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 		delay_1mikro();
  92              		.loc 1 44 0
  93 001c FFF7FEFF 		bl	delay_1mikro
  94              	.LBE2:
  45:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	}
  46:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	else{
  47:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 		systick_flag = 1;
  48:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	}
  49:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** }
  95              		.loc 1 49 0
  96 0020 02E0     		b	.L5
  97              	.L3:
  47:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	}
  98              		.loc 1 47 0
  99 0022 054B     		ldr	r3, .L6+8
 100 0024 0122     		movs	r2, #1
 101 0026 1A60     		str	r2, [r3]
 102              	.L5:
 103              		.loc 1 49 0
 104 0028 C046     		nop
 105 002a BD46     		mov	sp, r7
 106              		@ sp needed
 107 002c 80BD     		pop	{r7, pc}
 108              	.L7:
 109 002e C046     		.align	2
 110              	.L6:
 111 0030 10E000E0 		.word	-536813552
 112 0034 04000000 		.word	delay_count
 113 0038 00000000 		.word	systick_flag
 114              		.cfi_endproc
 115              	.LFE1:
 117              		.align	1
 118              		.global	init_app
 119              		.syntax unified
 120              		.code	16
 121              		.thumb_func
 122              		.fpu softvfp
 124              	init_app:
 125              	.LFB2:
  50:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 
  51:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** void init_app( void ){
 126              		.loc 1 51 0
 127              		.cfi_startproc
 128              		@ args = 0, pretend = 0, frame = 0
 129              		@ frame_needed = 1, uses_anonymous_args = 0
 130 003c 80B5     		push	{r7, lr}
 131              		.cfi_def_cfa_offset 8
 132              		.cfi_offset 7, -8
 133              		.cfi_offset 14, -4
 134 003e 00AF     		add	r7, sp, #0
 135              		.cfi_def_cfa_register 7
  52:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	*portModer = 0x55555555;
 136              		.loc 1 52 0
 137 0040 044B     		ldr	r3, .L9
 138 0042 054A     		ldr	r2, .L9+4
 139 0044 1A60     		str	r2, [r3]
  53:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	/* Initiera undantagsvektor */
  54:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	*(( void (**) (void) ) 0x2001C03C ) = systick_irq_handler;
 140              		.loc 1 54 0
 141 0046 054B     		ldr	r3, .L9+8
 142 0048 054A     		ldr	r2, .L9+12
 143 004a 1A60     		str	r2, [r3]
  55:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** }
 144              		.loc 1 55 0
 145 004c C046     		nop
 146 004e BD46     		mov	sp, r7
 147              		@ sp needed
 148 0050 80BD     		pop	{r7, pc}
 149              	.L10:
 150 0052 C046     		.align	2
 151              	.L9:
 152 0054 000C0240 		.word	1073875968
 153 0058 55555555 		.word	1431655765
 154 005c 3CC00120 		.word	536985660
 155 0060 00000000 		.word	systick_irq_handler
 156              		.cfi_endproc
 157              	.LFE2:
 159              		.align	1
 160              		.global	delay_1mikro
 161              		.syntax unified
 162              		.code	16
 163              		.thumb_func
 164              		.fpu softvfp
 166              	delay_1mikro:
 167              	.LFB3:
  56:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 
  57:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** void delay_1mikro( void ){
 168              		.loc 1 57 0
 169              		.cfi_startproc
 170              		@ args = 0, pretend = 0, frame = 0
 171              		@ frame_needed = 1, uses_anonymous_args = 0
 172 0064 80B5     		push	{r7, lr}
 173              		.cfi_def_cfa_offset 8
 174              		.cfi_offset 7, -8
 175              		.cfi_offset 14, -4
 176 0066 00AF     		add	r7, sp, #0
 177              		.cfi_def_cfa_register 7
  58:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	*STK_CTRL = 0x00;
 178              		.loc 1 58 0
 179 0068 074B     		ldr	r3, .L12
 180 006a 0022     		movs	r2, #0
 181 006c 1A70     		strb	r2, [r3]
  59:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	*STK_LOAD = ( 168 - 1);
 182              		.loc 1 59 0
 183 006e 074B     		ldr	r3, .L12+4
 184 0070 A722     		movs	r2, #167
 185 0072 1A70     		strb	r2, [r3]
  60:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	*STK_VAL = 0;
 186              		.loc 1 60 0
 187 0074 064B     		ldr	r3, .L12+8
 188 0076 0022     		movs	r2, #0
 189 0078 1A70     		strb	r2, [r3]
  61:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	*STK_CTRL = 7;
 190              		.loc 1 61 0
 191 007a 034B     		ldr	r3, .L12
 192 007c 0722     		movs	r2, #7
 193 007e 1A70     		strb	r2, [r3]
  62:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	
  63:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** }
 194              		.loc 1 63 0
 195 0080 C046     		nop
 196 0082 BD46     		mov	sp, r7
 197              		@ sp needed
 198 0084 80BD     		pop	{r7, pc}
 199              	.L13:
 200 0086 C046     		.align	2
 201              	.L12:
 202 0088 10E000E0 		.word	-536813552
 203 008c 14E000E0 		.word	-536813548
 204 0090 18E000E0 		.word	-536813544
 205              		.cfi_endproc
 206              	.LFE3:
 208              		.align	1
 209              		.global	delay
 210              		.syntax unified
 211              		.code	16
 212              		.thumb_func
 213              		.fpu softvfp
 215              	delay:
 216              	.LFB4:
  64:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 
  65:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** void delay( unsigned int count ){
 217              		.loc 1 65 0
 218              		.cfi_startproc
 219              		@ args = 0, pretend = 0, frame = 8
 220              		@ frame_needed = 1, uses_anonymous_args = 0
 221 0094 80B5     		push	{r7, lr}
 222              		.cfi_def_cfa_offset 8
 223              		.cfi_offset 7, -8
 224              		.cfi_offset 14, -4
 225 0096 82B0     		sub	sp, sp, #8
 226              		.cfi_def_cfa_offset 16
 227 0098 00AF     		add	r7, sp, #0
 228              		.cfi_def_cfa_register 7
 229 009a 7860     		str	r0, [r7, #4]
  66:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	if(count == 0){
 230              		.loc 1 66 0
 231 009c 7B68     		ldr	r3, [r7, #4]
 232 009e 002B     		cmp	r3, #0
 233 00a0 08D0     		beq	.L17
  67:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 		return;
  68:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	}
  69:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	delay_count = count;
 234              		.loc 1 69 0
 235 00a2 7A68     		ldr	r2, [r7, #4]
 236 00a4 054B     		ldr	r3, .L18
 237 00a6 1A60     		str	r2, [r3]
  70:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	systick_flag = 0;
 238              		.loc 1 70 0
 239 00a8 054B     		ldr	r3, .L18+4
 240 00aa 0022     		movs	r2, #0
 241 00ac 1A60     		str	r2, [r3]
  71:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	delay_1mikro();
 242              		.loc 1 71 0
 243 00ae FFF7FEFF 		bl	delay_1mikro
 244 00b2 00E0     		b	.L14
 245              	.L17:
  67:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 		return;
 246              		.loc 1 67 0
 247 00b4 C046     		nop
 248              	.L14:
  72:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** }
 249              		.loc 1 72 0
 250 00b6 BD46     		mov	sp, r7
 251 00b8 02B0     		add	sp, sp, #8
 252              		@ sp needed
 253 00ba 80BD     		pop	{r7, pc}
 254              	.L19:
 255              		.align	2
 256              	.L18:
 257 00bc 04000000 		.word	delay_count
 258 00c0 00000000 		.word	systick_flag
 259              		.cfi_endproc
 260              	.LFE4:
 262              		.align	1
 263              		.global	main
 264              		.syntax unified
 265              		.code	16
 266              		.thumb_func
 267              		.fpu softvfp
 269              	main:
 270              	.LFB5:
  73:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 
  74:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** void main(void)
  75:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** {
 271              		.loc 1 75 0
 272              		.cfi_startproc
 273              		@ args = 0, pretend = 0, frame = 0
 274              		@ frame_needed = 1, uses_anonymous_args = 0
 275 00c4 80B5     		push	{r7, lr}
 276              		.cfi_def_cfa_offset 8
 277              		.cfi_offset 7, -8
 278              		.cfi_offset 14, -4
 279 00c6 00AF     		add	r7, sp, #0
 280              		.cfi_def_cfa_register 7
  76:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	init_app();
 281              		.loc 1 76 0
 282 00c8 FFF7FEFF 		bl	init_app
  77:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	*portOdrLow = 0x00;
 283              		.loc 1 77 0
 284 00cc 094B     		ldr	r3, .L26
 285 00ce 0022     		movs	r2, #0
 286 00d0 1A70     		strb	r2, [r3]
  78:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	delay( DELAY_COUNT );
 287              		.loc 1 78 0
 288 00d2 FA23     		movs	r3, #250
 289 00d4 9B00     		lsls	r3, r3, #2
 290 00d6 1800     		movs	r0, r3
 291 00d8 FFF7FEFF 		bl	delay
 292              	.L23:
  79:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	while(1){
  80:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 		if( systick_flag )
 293              		.loc 1 80 0
 294 00dc 064B     		ldr	r3, .L26+4
 295 00de 1B68     		ldr	r3, [r3]
 296 00e0 002B     		cmp	r3, #0
 297 00e2 00D1     		bne	.L25
 298 00e4 FAE7     		b	.L23
 299              	.L25:
  81:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 			break;
 300              		.loc 1 81 0
 301 00e6 C046     		nop
  82:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	}
  83:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** 	*portOdrLow = 0xFF;
 302              		.loc 1 83 0
 303 00e8 024B     		ldr	r3, .L26
 304 00ea FF22     		movs	r2, #255
 305 00ec 1A70     		strb	r2, [r3]
  84:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/systick_irq\startup.c **** }
 306              		.loc 1 84 0
 307 00ee C046     		nop
 308 00f0 BD46     		mov	sp, r7
 309              		@ sp needed
 310 00f2 80BD     		pop	{r7, pc}
 311              	.L27:
 312              		.align	2
 313              	.L26:
 314 00f4 140C0240 		.word	1073875988
 315 00f8 00000000 		.word	systick_flag
 316              		.cfi_endproc
 317              	.LFE5:
 319              	.Letext0:
