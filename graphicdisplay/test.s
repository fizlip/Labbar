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
  25              		.file 1 "C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay/startup.c"
   1:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** /*
   2:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c ****  * 	startup.c
   3:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c ****  *
   4:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c ****  */
   5:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
   7:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** void startup ( void )
   8:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** {
  26              		.loc 1 8 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** __asm volatile(
  31              		.loc 1 9 0
  32              		.syntax divided
  33              	@ 9 "C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  10:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	" MOV SP,R0\n"
  12:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	" BL main\n"				/* call main */
  13:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	"_exit: B .\n"				/* never return */
  14:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	) ;
  15:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
  40              		.loc 1 15 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	delay_250ns
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	delay_250ns:
  56              	.LFB1:
  16:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
  17:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** /* Defenitioner för de olika portarna */
  18:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define PORT_BASE 	 0x40021000
  19:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define portModer 	((volatile unsigned long *) 	(PORT_BASE))
  20:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define portOtyper	((volatile unsigned short *) 	(PORT_BASE+0x4))
  21:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define portOspeedr	((volatile unsigned long *) 	(PORT_BASE+0x8))
  22:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define portPupdr 	((volatile unsigned long *)		(PORT_BASE+0xC))
  23:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define portIdrLow 	((volatile unsigned char *) 	(PORT_BASE+0x10))
  24:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define portIdrHigh ((volatile unsigned char *) 	(PORT_BASE+0x11))
  25:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define portOdrLow 	((volatile unsigned char *) 	(PORT_BASE+0x14))
  26:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define portOdrHigh ((volatile unsigned char *) 	(PORT_BASE+0x15))
  27:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** /* Bitar i styrregistret för användning av LC-Display modulen */
  28:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define LCD_ON			0x3F
  29:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define LCD_OFF			0x3E
  30:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define LCD_SET_ADD		0x40
  31:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define LCD_SET_PAGE	0xB8
  32:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define LCD_DISP_START	0xC0
  33:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define LCD_BUSY		0x80
  34:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define B_E 			0x40
  35:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define B_RST			0x20
  36:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define B_CS2			0x10
  37:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define B_CS1			0x8
  38:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define B_SELECT 		0x4
  39:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define B_RW 			0x2
  40:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #define B_RS 			0x1
  41:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
  42:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** void delay_250ns( void ){
  57              		.loc 1 42 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  43:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	* ( (unsigned long *) 0xE000E010) = 0x0;
  67              		.loc 1 43 0
  68 0004 094B     		ldr	r3, .L3
  69 0006 0022     		movs	r2, #0
  70 0008 1A60     		str	r2, [r3]
  44:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	* ( (unsigned long *) 0xE000E014) = ( (168/4) -1 );
  71              		.loc 1 44 0
  72 000a 094B     		ldr	r3, .L3+4
  73 000c 2922     		movs	r2, #41
  74 000e 1A60     		str	r2, [r3]
  45:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	* ( (unsigned long *) 0xE000E018) = 0x0;
  75              		.loc 1 45 0
  76 0010 084B     		ldr	r3, .L3+8
  77 0012 0022     		movs	r2, #0
  78 0014 1A60     		str	r2, [r3]
  46:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	* ( (unsigned char *) 0xE000E010) = 0x5;
  79              		.loc 1 46 0
  80 0016 054B     		ldr	r3, .L3
  81 0018 0522     		movs	r2, #5
  82 001a 1A70     		strb	r2, [r3]
  47:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	while(* ( (unsigned char *) 0xE000E010) & 0x10000 == 0){}
  83              		.loc 1 47 0
  84 001c C046     		nop
  48:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	* ( (unsigned long *) 0xE000E010) = 0x0;
  85              		.loc 1 48 0
  86 001e 034B     		ldr	r3, .L3
  87 0020 0022     		movs	r2, #0
  88 0022 1A60     		str	r2, [r3]
  49:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
  89              		.loc 1 49 0
  90 0024 C046     		nop
  91 0026 BD46     		mov	sp, r7
  92              		@ sp needed
  93 0028 80BD     		pop	{r7, pc}
  94              	.L4:
  95 002a C046     		.align	2
  96              	.L3:
  97 002c 10E000E0 		.word	-536813552
  98 0030 14E000E0 		.word	-536813548
  99 0034 18E000E0 		.word	-536813544
 100              		.cfi_endproc
 101              	.LFE1:
 103              		.align	1
 104              		.global	delay_500ns
 105              		.syntax unified
 106              		.code	16
 107              		.thumb_func
 108              		.fpu softvfp
 110              	delay_500ns:
 111              	.LFB2:
  50:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
  51:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** void delay_500ns( void ){
 112              		.loc 1 51 0
 113              		.cfi_startproc
 114              		@ args = 0, pretend = 0, frame = 0
 115              		@ frame_needed = 1, uses_anonymous_args = 0
 116 0038 80B5     		push	{r7, lr}
 117              		.cfi_def_cfa_offset 8
 118              		.cfi_offset 7, -8
 119              		.cfi_offset 14, -4
 120 003a 00AF     		add	r7, sp, #0
 121              		.cfi_def_cfa_register 7
  52:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	* ( (unsigned long *) 0xE000E010) = 0x0;
 122              		.loc 1 52 0
 123 003c 094B     		ldr	r3, .L6
 124 003e 0022     		movs	r2, #0
 125 0040 1A60     		str	r2, [r3]
  53:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	* ( (unsigned long *) 0xE000E014) = ( (168/2) -1 );
 126              		.loc 1 53 0
 127 0042 094B     		ldr	r3, .L6+4
 128 0044 5322     		movs	r2, #83
 129 0046 1A60     		str	r2, [r3]
  54:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	* ( (unsigned long *) 0xE000E018) = 0x0;
 130              		.loc 1 54 0
 131 0048 084B     		ldr	r3, .L6+8
 132 004a 0022     		movs	r2, #0
 133 004c 1A60     		str	r2, [r3]
  55:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	* ( (unsigned char *) 0xE000E010) = 0x5;
 134              		.loc 1 55 0
 135 004e 054B     		ldr	r3, .L6
 136 0050 0522     		movs	r2, #5
 137 0052 1A70     		strb	r2, [r3]
  56:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	while(* ( (unsigned char *) 0xE000E010) & 0x10000 == 0){}
 138              		.loc 1 56 0
 139 0054 C046     		nop
  57:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	* ( (unsigned long *) 0xE000E010) = 0x0;
 140              		.loc 1 57 0
 141 0056 034B     		ldr	r3, .L6
 142 0058 0022     		movs	r2, #0
 143 005a 1A60     		str	r2, [r3]
  58:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
 144              		.loc 1 58 0
 145 005c C046     		nop
 146 005e BD46     		mov	sp, r7
 147              		@ sp needed
 148 0060 80BD     		pop	{r7, pc}
 149              	.L7:
 150 0062 C046     		.align	2
 151              	.L6:
 152 0064 10E000E0 		.word	-536813552
 153 0068 14E000E0 		.word	-536813548
 154 006c 18E000E0 		.word	-536813544
 155              		.cfi_endproc
 156              	.LFE2:
 158              		.align	1
 159              		.global	delay_mikro
 160              		.syntax unified
 161              		.code	16
 162              		.thumb_func
 163              		.fpu softvfp
 165              	delay_mikro:
 166              	.LFB3:
  59:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
  60:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** // Fördröj en mikro sekund
  61:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** void delay_mikro(unsigned int us){
 167              		.loc 1 61 0
 168              		.cfi_startproc
 169              		@ args = 0, pretend = 0, frame = 16
 170              		@ frame_needed = 1, uses_anonymous_args = 0
 171 0070 80B5     		push	{r7, lr}
 172              		.cfi_def_cfa_offset 8
 173              		.cfi_offset 7, -8
 174              		.cfi_offset 14, -4
 175 0072 84B0     		sub	sp, sp, #16
 176              		.cfi_def_cfa_offset 24
 177 0074 00AF     		add	r7, sp, #0
 178              		.cfi_def_cfa_register 7
 179 0076 7860     		str	r0, [r7, #4]
 180              	.LBB2:
  62:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	for(int i = 0; i < us; i++){
 181              		.loc 1 62 0
 182 0078 0023     		movs	r3, #0
 183 007a FB60     		str	r3, [r7, #12]
 184 007c 0DE0     		b	.L9
 185              	.L12:
 186              	.LBB3:
  63:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		for(int j = 0; j < 4; j++){
 187              		.loc 1 63 0
 188 007e 0023     		movs	r3, #0
 189 0080 BB60     		str	r3, [r7, #8]
 190 0082 04E0     		b	.L10
 191              	.L11:
  64:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			delay_250ns();
 192              		.loc 1 64 0 discriminator 3
 193 0084 FFF7FEFF 		bl	delay_250ns
  63:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		for(int j = 0; j < 4; j++){
 194              		.loc 1 63 0 discriminator 3
 195 0088 BB68     		ldr	r3, [r7, #8]
 196 008a 0133     		adds	r3, r3, #1
 197 008c BB60     		str	r3, [r7, #8]
 198              	.L10:
  63:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		for(int j = 0; j < 4; j++){
 199              		.loc 1 63 0 is_stmt 0 discriminator 1
 200 008e BB68     		ldr	r3, [r7, #8]
 201 0090 032B     		cmp	r3, #3
 202 0092 F7DD     		ble	.L11
 203              	.LBE3:
  62:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	for(int i = 0; i < us; i++){
 204              		.loc 1 62 0 is_stmt 1 discriminator 2
 205 0094 FB68     		ldr	r3, [r7, #12]
 206 0096 0133     		adds	r3, r3, #1
 207 0098 FB60     		str	r3, [r7, #12]
 208              	.L9:
  62:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	for(int i = 0; i < us; i++){
 209              		.loc 1 62 0 is_stmt 0 discriminator 1
 210 009a FB68     		ldr	r3, [r7, #12]
 211 009c 7A68     		ldr	r2, [r7, #4]
 212 009e 9A42     		cmp	r2, r3
 213 00a0 EDD8     		bhi	.L12
 214              	.LBE2:
  65:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		}
  66:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
  67:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
 215              		.loc 1 67 0 is_stmt 1
 216 00a2 C046     		nop
 217 00a4 BD46     		mov	sp, r7
 218 00a6 04B0     		add	sp, sp, #16
 219              		@ sp needed
 220 00a8 80BD     		pop	{r7, pc}
 221              		.cfi_endproc
 222              	.LFE3:
 224              		.align	1
 225              		.global	delay_milli
 226              		.syntax unified
 227              		.code	16
 228              		.thumb_func
 229              		.fpu softvfp
 231              	delay_milli:
 232              	.LFB4:
  68:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
  69:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** // Fördröj en milli sekund
  70:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** void delay_milli(unsigned int ms){
 233              		.loc 1 70 0
 234              		.cfi_startproc
 235              		@ args = 0, pretend = 0, frame = 16
 236              		@ frame_needed = 1, uses_anonymous_args = 0
 237 00aa 80B5     		push	{r7, lr}
 238              		.cfi_def_cfa_offset 8
 239              		.cfi_offset 7, -8
 240              		.cfi_offset 14, -4
 241 00ac 84B0     		sub	sp, sp, #16
 242              		.cfi_def_cfa_offset 24
 243 00ae 00AF     		add	r7, sp, #0
 244              		.cfi_def_cfa_register 7
 245 00b0 7860     		str	r0, [r7, #4]
  71:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	int i;
  72:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	while( ms-- ){
 246              		.loc 1 72 0
 247 00b2 11E0     		b	.L14
 248              	.L17:
  73:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		for( i = 0; i < 1000; i++){
 249              		.loc 1 73 0
 250 00b4 0023     		movs	r3, #0
 251 00b6 FB60     		str	r3, [r7, #12]
 252 00b8 0AE0     		b	.L15
 253              	.L16:
  74:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			delay_250ns();
 254              		.loc 1 74 0 discriminator 3
 255 00ba FFF7FEFF 		bl	delay_250ns
  75:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			delay_250ns();
 256              		.loc 1 75 0 discriminator 3
 257 00be FFF7FEFF 		bl	delay_250ns
  76:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			delay_250ns();
 258              		.loc 1 76 0 discriminator 3
 259 00c2 FFF7FEFF 		bl	delay_250ns
  77:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			delay_250ns();
 260              		.loc 1 77 0 discriminator 3
 261 00c6 FFF7FEFF 		bl	delay_250ns
  73:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			delay_250ns();
 262              		.loc 1 73 0 discriminator 3
 263 00ca FB68     		ldr	r3, [r7, #12]
 264 00cc 0133     		adds	r3, r3, #1
 265 00ce FB60     		str	r3, [r7, #12]
 266              	.L15:
  73:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			delay_250ns();
 267              		.loc 1 73 0 is_stmt 0 discriminator 1
 268 00d0 FB68     		ldr	r3, [r7, #12]
 269 00d2 064A     		ldr	r2, .L18
 270 00d4 9342     		cmp	r3, r2
 271 00d6 F0DD     		ble	.L16
 272              	.L14:
  72:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		for( i = 0; i < 1000; i++){
 273              		.loc 1 72 0 is_stmt 1
 274 00d8 7B68     		ldr	r3, [r7, #4]
 275 00da 5A1E     		subs	r2, r3, #1
 276 00dc 7A60     		str	r2, [r7, #4]
 277 00de 002B     		cmp	r3, #0
 278 00e0 E8D1     		bne	.L17
  78:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		}
  79:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
  80:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
 279              		.loc 1 80 0
 280 00e2 C046     		nop
 281 00e4 BD46     		mov	sp, r7
 282 00e6 04B0     		add	sp, sp, #16
 283              		@ sp needed
 284 00e8 80BD     		pop	{r7, pc}
 285              	.L19:
 286 00ea C046     		.align	2
 287              	.L18:
 288 00ec E7030000 		.word	999
 289              		.cfi_endproc
 290              	.LFE4:
 292              		.align	1
 293              		.global	graphic_ctrl_bit_set
 294              		.syntax unified
 295              		.code	16
 296              		.thumb_func
 297              		.fpu softvfp
 299              	graphic_ctrl_bit_set:
 300              	.LFB5:
  81:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
  82:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** typedef unsigned char uint8_t;
  83:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** /* Välj grafik-display och ettställ de bitar som är 1 i x */
  84:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** void graphic_ctrl_bit_set( uint8_t x ){
 301              		.loc 1 84 0
 302              		.cfi_startproc
 303              		@ args = 0, pretend = 0, frame = 16
 304              		@ frame_needed = 1, uses_anonymous_args = 0
 305 00f0 80B5     		push	{r7, lr}
 306              		.cfi_def_cfa_offset 8
 307              		.cfi_offset 7, -8
 308              		.cfi_offset 14, -4
 309 00f2 84B0     		sub	sp, sp, #16
 310              		.cfi_def_cfa_offset 24
 311 00f4 00AF     		add	r7, sp, #0
 312              		.cfi_def_cfa_register 7
 313 00f6 0200     		movs	r2, r0
 314 00f8 FB1D     		adds	r3, r7, #7
 315 00fa 1A70     		strb	r2, [r3]
  85:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	uint8_t c;
  86:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	c = *portOdrLow;
 316              		.loc 1 86 0
 317 00fc 0F4A     		ldr	r2, .L21
 318 00fe 0F20     		movs	r0, #15
 319 0100 3B18     		adds	r3, r7, r0
 320 0102 1278     		ldrb	r2, [r2]
 321 0104 1A70     		strb	r2, [r3]
  87:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	c &= ~B_SELECT;
 322              		.loc 1 87 0
 323 0106 3B18     		adds	r3, r7, r0
 324 0108 3A18     		adds	r2, r7, r0
 325 010a 1278     		ldrb	r2, [r2]
 326 010c 0421     		movs	r1, #4
 327 010e 8A43     		bics	r2, r1
 328 0110 1A70     		strb	r2, [r3]
  88:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	c |= ( ~B_SELECT & x);
 329              		.loc 1 88 0
 330 0112 FB1D     		adds	r3, r7, #7
 331 0114 1B78     		ldrb	r3, [r3]
 332 0116 5BB2     		sxtb	r3, r3
 333 0118 0422     		movs	r2, #4
 334 011a 9343     		bics	r3, r2
 335 011c 5AB2     		sxtb	r2, r3
 336 011e 3B18     		adds	r3, r7, r0
 337 0120 1B78     		ldrb	r3, [r3]
 338 0122 5BB2     		sxtb	r3, r3
 339 0124 1343     		orrs	r3, r2
 340 0126 5AB2     		sxtb	r2, r3
 341 0128 3B18     		adds	r3, r7, r0
 342 012a 1A70     		strb	r2, [r3]
  89:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	*portOdrLow = c;
 343              		.loc 1 89 0
 344 012c 034A     		ldr	r2, .L21
 345 012e 3B18     		adds	r3, r7, r0
 346 0130 1B78     		ldrb	r3, [r3]
 347 0132 1370     		strb	r3, [r2]
  90:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
 348              		.loc 1 90 0
 349 0134 C046     		nop
 350 0136 BD46     		mov	sp, r7
 351 0138 04B0     		add	sp, sp, #16
 352              		@ sp needed
 353 013a 80BD     		pop	{r7, pc}
 354              	.L22:
 355              		.align	2
 356              	.L21:
 357 013c 14100240 		.word	1073877012
 358              		.cfi_endproc
 359              	.LFE5:
 361              		.align	1
 362              		.global	graphic_ctrl_bit_clear
 363              		.syntax unified
 364              		.code	16
 365              		.thumb_func
 366              		.fpu softvfp
 368              	graphic_ctrl_bit_clear:
 369              	.LFB6:
  91:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
  92:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** /* Välj grafisk-diaplay och nollställ de bitar som är 1 i x */
  93:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** void graphic_ctrl_bit_clear( uint8_t x ){
 370              		.loc 1 93 0
 371              		.cfi_startproc
 372              		@ args = 0, pretend = 0, frame = 16
 373              		@ frame_needed = 1, uses_anonymous_args = 0
 374 0140 80B5     		push	{r7, lr}
 375              		.cfi_def_cfa_offset 8
 376              		.cfi_offset 7, -8
 377              		.cfi_offset 14, -4
 378 0142 84B0     		sub	sp, sp, #16
 379              		.cfi_def_cfa_offset 24
 380 0144 00AF     		add	r7, sp, #0
 381              		.cfi_def_cfa_register 7
 382 0146 0200     		movs	r2, r0
 383 0148 FB1D     		adds	r3, r7, #7
 384 014a 1A70     		strb	r2, [r3]
  94:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	uint8_t c;
  95:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	c = *portOdrLow;
 385              		.loc 1 95 0
 386 014c 0F4A     		ldr	r2, .L24
 387 014e 0F20     		movs	r0, #15
 388 0150 3B18     		adds	r3, r7, r0
 389 0152 1278     		ldrb	r2, [r2]
 390 0154 1A70     		strb	r2, [r3]
  96:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	c &= ~B_SELECT;
 391              		.loc 1 96 0
 392 0156 3B18     		adds	r3, r7, r0
 393 0158 3A18     		adds	r2, r7, r0
 394 015a 1278     		ldrb	r2, [r2]
 395 015c 0421     		movs	r1, #4
 396 015e 8A43     		bics	r2, r1
 397 0160 1A70     		strb	r2, [r3]
  97:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	c &= ~x;
 398              		.loc 1 97 0
 399 0162 FB1D     		adds	r3, r7, #7
 400 0164 1B78     		ldrb	r3, [r3]
 401 0166 5BB2     		sxtb	r3, r3
 402 0168 DB43     		mvns	r3, r3
 403 016a 5BB2     		sxtb	r3, r3
 404 016c 3A18     		adds	r2, r7, r0
 405 016e 1278     		ldrb	r2, [r2]
 406 0170 52B2     		sxtb	r2, r2
 407 0172 1340     		ands	r3, r2
 408 0174 5AB2     		sxtb	r2, r3
 409 0176 3B18     		adds	r3, r7, r0
 410 0178 1A70     		strb	r2, [r3]
  98:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	*portOdrLow = c;
 411              		.loc 1 98 0
 412 017a 044A     		ldr	r2, .L24
 413 017c 3B18     		adds	r3, r7, r0
 414 017e 1B78     		ldrb	r3, [r3]
 415 0180 1370     		strb	r3, [r2]
  99:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
 416              		.loc 1 99 0
 417 0182 C046     		nop
 418 0184 BD46     		mov	sp, r7
 419 0186 04B0     		add	sp, sp, #16
 420              		@ sp needed
 421 0188 80BD     		pop	{r7, pc}
 422              	.L25:
 423 018a C046     		.align	2
 424              	.L24:
 425 018c 14100240 		.word	1073877012
 426              		.cfi_endproc
 427              	.LFE6:
 429              		.align	1
 430              		.global	select_controller
 431              		.syntax unified
 432              		.code	16
 433              		.thumb_func
 434              		.fpu softvfp
 436              	select_controller:
 437              	.LFB7:
 100:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
 101:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** /* konfigurera CS-signalerna */
 102:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** void select_controller( uint8_t controller){
 438              		.loc 1 102 0
 439              		.cfi_startproc
 440              		@ args = 0, pretend = 0, frame = 8
 441              		@ frame_needed = 1, uses_anonymous_args = 0
 442 0190 80B5     		push	{r7, lr}
 443              		.cfi_def_cfa_offset 8
 444              		.cfi_offset 7, -8
 445              		.cfi_offset 14, -4
 446 0192 82B0     		sub	sp, sp, #8
 447              		.cfi_def_cfa_offset 16
 448 0194 00AF     		add	r7, sp, #0
 449              		.cfi_def_cfa_register 7
 450 0196 0200     		movs	r2, r0
 451 0198 FB1D     		adds	r3, r7, #7
 452 019a 1A70     		strb	r2, [r3]
 103:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	switch(controller){
 453              		.loc 1 103 0
 454 019c FB1D     		adds	r3, r7, #7
 455 019e 1B78     		ldrb	r3, [r3]
 456 01a0 082B     		cmp	r3, #8
 457 01a2 0CD0     		beq	.L28
 458 01a4 02DC     		bgt	.L29
 459 01a6 002B     		cmp	r3, #0
 460 01a8 05D0     		beq	.L30
 104:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		case 0: 
 105:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			graphic_ctrl_bit_clear(B_CS1|B_CS2);
 106:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			break;
 107:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		case B_CS1:
 108:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			graphic_ctrl_bit_set(B_CS1);
 109:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			graphic_ctrl_bit_clear(B_CS2);
 110:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			break;
 111:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		case B_CS2:
 112:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			graphic_ctrl_bit_clear(B_CS1);
 113:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			graphic_ctrl_bit_set(B_CS2);
 114:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			break;
 115:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		case B_CS1|B_CS2:
 116:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			graphic_ctrl_bit_set(B_CS1);
 117:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			graphic_ctrl_bit_set(B_CS2);
 118:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			break;
 119:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}	
 120:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
 461              		.loc 1 120 0
 462 01aa 1DE0     		b	.L33
 463              	.L29:
 103:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	switch(controller){
 464              		.loc 1 103 0
 465 01ac 102B     		cmp	r3, #16
 466 01ae 0DD0     		beq	.L31
 467 01b0 182B     		cmp	r3, #24
 468 01b2 12D0     		beq	.L32
 469              		.loc 1 120 0
 470 01b4 18E0     		b	.L33
 471              	.L30:
 105:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			break;
 472              		.loc 1 105 0
 473 01b6 1820     		movs	r0, #24
 474 01b8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 106:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		case B_CS1:
 475              		.loc 1 106 0
 476 01bc 14E0     		b	.L27
 477              	.L28:
 108:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			graphic_ctrl_bit_clear(B_CS2);
 478              		.loc 1 108 0
 479 01be 0820     		movs	r0, #8
 480 01c0 FFF7FEFF 		bl	graphic_ctrl_bit_set
 109:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			break;
 481              		.loc 1 109 0
 482 01c4 1020     		movs	r0, #16
 483 01c6 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 110:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		case B_CS2:
 484              		.loc 1 110 0
 485 01ca 0DE0     		b	.L27
 486              	.L31:
 112:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			graphic_ctrl_bit_set(B_CS2);
 487              		.loc 1 112 0
 488 01cc 0820     		movs	r0, #8
 489 01ce FFF7FEFF 		bl	graphic_ctrl_bit_clear
 113:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			break;
 490              		.loc 1 113 0
 491 01d2 1020     		movs	r0, #16
 492 01d4 FFF7FEFF 		bl	graphic_ctrl_bit_set
 114:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		case B_CS1|B_CS2:
 493              		.loc 1 114 0
 494 01d8 06E0     		b	.L27
 495              	.L32:
 116:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			graphic_ctrl_bit_set(B_CS2);
 496              		.loc 1 116 0
 497 01da 0820     		movs	r0, #8
 498 01dc FFF7FEFF 		bl	graphic_ctrl_bit_set
 117:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			break;
 499              		.loc 1 117 0
 500 01e0 1020     		movs	r0, #16
 501 01e2 FFF7FEFF 		bl	graphic_ctrl_bit_set
 118:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}	
 502              		.loc 1 118 0
 503 01e6 C046     		nop
 504              	.L27:
 505              	.L33:
 506              		.loc 1 120 0
 507 01e8 C046     		nop
 508 01ea BD46     		mov	sp, r7
 509 01ec 02B0     		add	sp, sp, #8
 510              		@ sp needed
 511 01ee 80BD     		pop	{r7, pc}
 512              		.cfi_endproc
 513              	.LFE7:
 515              		.align	1
 516              		.global	graphic_wait_ready
 517              		.syntax unified
 518              		.code	16
 519              		.thumb_func
 520              		.fpu softvfp
 522              	graphic_wait_ready:
 523              	.LFB8:
 121:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
 122:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** void graphic_wait_ready(void){
 524              		.loc 1 122 0
 525              		.cfi_startproc
 526              		@ args = 0, pretend = 0, frame = 8
 527              		@ frame_needed = 1, uses_anonymous_args = 0
 528 01f0 80B5     		push	{r7, lr}
 529              		.cfi_def_cfa_offset 8
 530              		.cfi_offset 7, -8
 531              		.cfi_offset 14, -4
 532 01f2 82B0     		sub	sp, sp, #8
 533              		.cfi_def_cfa_offset 16
 534 01f4 00AF     		add	r7, sp, #0
 535              		.cfi_def_cfa_register 7
 123:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	uint8_t c;
 124:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 536              		.loc 1 124 0
 537 01f6 4020     		movs	r0, #64
 538 01f8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 125:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	*portModer = 0x00005555;
 539              		.loc 1 125 0
 540 01fc 154B     		ldr	r3, .L40
 541 01fe 164A     		ldr	r2, .L40+4
 542 0200 1A60     		str	r2, [r3]
 126:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RS); graphic_ctrl_bit_set(B_RW);
 543              		.loc 1 126 0
 544 0202 0120     		movs	r0, #1
 545 0204 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 546 0208 0220     		movs	r0, #2
 547 020a FFF7FEFF 		bl	graphic_ctrl_bit_set
 127:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	delay_500ns();
 548              		.loc 1 127 0
 549 020e FFF7FEFF 		bl	delay_500ns
 550              	.L37:
 128:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	while(1){
 129:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_E);
 551              		.loc 1 129 0
 552 0212 4020     		movs	r0, #64
 553 0214 FFF7FEFF 		bl	graphic_ctrl_bit_set
 130:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		delay_500ns();
 554              		.loc 1 130 0
 555 0218 FFF7FEFF 		bl	delay_500ns
 131:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		c = *portIdrHigh & LCD_BUSY;
 556              		.loc 1 131 0
 557 021c 0F4B     		ldr	r3, .L40+8
 558 021e 1B78     		ldrb	r3, [r3]
 559 0220 DAB2     		uxtb	r2, r3
 560 0222 FB1D     		adds	r3, r7, #7
 561 0224 7F21     		movs	r1, #127
 562 0226 8A43     		bics	r2, r1
 563 0228 1A70     		strb	r2, [r3]
 132:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		graphic_ctrl_bit_clear(B_E);
 564              		.loc 1 132 0
 565 022a 4020     		movs	r0, #64
 566 022c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 133:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		delay_500ns();
 567              		.loc 1 133 0
 568 0230 FFF7FEFF 		bl	delay_500ns
 134:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		if(c == 0){break;} 
 569              		.loc 1 134 0
 570 0234 FB1D     		adds	r3, r7, #7
 571 0236 1B78     		ldrb	r3, [r3]
 572 0238 002B     		cmp	r3, #0
 573 023a 00D0     		beq	.L39
 129:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		delay_500ns();
 574              		.loc 1 129 0
 575 023c E9E7     		b	.L37
 576              	.L39:
 577              		.loc 1 134 0
 578 023e C046     		nop
 135:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
 136:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 579              		.loc 1 136 0
 580 0240 4020     		movs	r0, #64
 581 0242 FFF7FEFF 		bl	graphic_ctrl_bit_set
 137:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	*portModer = 0x55555555;
 582              		.loc 1 137 0
 583 0246 034B     		ldr	r3, .L40
 584 0248 054A     		ldr	r2, .L40+12
 585 024a 1A60     		str	r2, [r3]
 138:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
 586              		.loc 1 138 0
 587 024c C046     		nop
 588 024e BD46     		mov	sp, r7
 589 0250 02B0     		add	sp, sp, #8
 590              		@ sp needed
 591 0252 80BD     		pop	{r7, pc}
 592              	.L41:
 593              		.align	2
 594              	.L40:
 595 0254 00100240 		.word	1073876992
 596 0258 55550000 		.word	21845
 597 025c 11100240 		.word	1073877009
 598 0260 55555555 		.word	1431655765
 599              		.cfi_endproc
 600              	.LFE8:
 602              		.align	1
 603              		.global	graphic_read
 604              		.syntax unified
 605              		.code	16
 606              		.thumb_func
 607              		.fpu softvfp
 609              	graphic_read:
 610              	.LFB9:
 139:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
 140:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** uint8_t graphic_read(uint8_t controller){
 611              		.loc 1 140 0
 612              		.cfi_startproc
 613              		@ args = 0, pretend = 0, frame = 16
 614              		@ frame_needed = 1, uses_anonymous_args = 0
 615 0264 80B5     		push	{r7, lr}
 616              		.cfi_def_cfa_offset 8
 617              		.cfi_offset 7, -8
 618              		.cfi_offset 14, -4
 619 0266 84B0     		sub	sp, sp, #16
 620              		.cfi_def_cfa_offset 24
 621 0268 00AF     		add	r7, sp, #0
 622              		.cfi_def_cfa_register 7
 623 026a 0200     		movs	r2, r0
 624 026c FB1D     		adds	r3, r7, #7
 625 026e 1A70     		strb	r2, [r3]
 141:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	uint8_t c;
 142:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 626              		.loc 1 142 0
 627 0270 4020     		movs	r0, #64
 628 0272 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 143:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	*portModer = 0x00005555;
 629              		.loc 1 143 0
 630 0276 1C4B     		ldr	r3, .L46
 631 0278 1C4A     		ldr	r2, .L46+4
 632 027a 1A60     		str	r2, [r3]
 144:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RS|B_RW);
 633              		.loc 1 144 0
 634 027c 0320     		movs	r0, #3
 635 027e FFF7FEFF 		bl	graphic_ctrl_bit_set
 145:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	select_controller(controller);
 636              		.loc 1 145 0
 637 0282 FB1D     		adds	r3, r7, #7
 638 0284 1B78     		ldrb	r3, [r3]
 639 0286 1800     		movs	r0, r3
 640 0288 FFF7FEFF 		bl	select_controller
 146:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	delay_500ns();
 641              		.loc 1 146 0
 642 028c FFF7FEFF 		bl	delay_500ns
 147:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 643              		.loc 1 147 0
 644 0290 4020     		movs	r0, #64
 645 0292 FFF7FEFF 		bl	graphic_ctrl_bit_set
 148:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	delay_500ns();
 646              		.loc 1 148 0
 647 0296 FFF7FEFF 		bl	delay_500ns
 149:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	c = *portIdrHigh;
 648              		.loc 1 149 0
 649 029a 154A     		ldr	r2, .L46+8
 650 029c 0F23     		movs	r3, #15
 651 029e FB18     		adds	r3, r7, r3
 652 02a0 1278     		ldrb	r2, [r2]
 653 02a2 1A70     		strb	r2, [r3]
 150:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 654              		.loc 1 150 0
 655 02a4 4020     		movs	r0, #64
 656 02a6 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 151:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	*portModer = 0x55555555;
 657              		.loc 1 151 0
 658 02aa 0F4B     		ldr	r3, .L46
 659 02ac 114A     		ldr	r2, .L46+12
 660 02ae 1A60     		str	r2, [r3]
 152:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	if(controller & B_CS1){
 661              		.loc 1 152 0
 662 02b0 FB1D     		adds	r3, r7, #7
 663 02b2 1B78     		ldrb	r3, [r3]
 664 02b4 0822     		movs	r2, #8
 665 02b6 1340     		ands	r3, r2
 666 02b8 04D0     		beq	.L43
 153:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		select_controller(B_CS1);
 667              		.loc 1 153 0
 668 02ba 0820     		movs	r0, #8
 669 02bc FFF7FEFF 		bl	select_controller
 154:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		graphic_wait_ready();
 670              		.loc 1 154 0
 671 02c0 FFF7FEFF 		bl	graphic_wait_ready
 672              	.L43:
 155:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
 156:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	// Får man samma resultat med "==" ist för &?
 157:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	if(controller & B_CS2){
 673              		.loc 1 157 0
 674 02c4 FB1D     		adds	r3, r7, #7
 675 02c6 1B78     		ldrb	r3, [r3]
 676 02c8 1022     		movs	r2, #16
 677 02ca 1340     		ands	r3, r2
 678 02cc 04D0     		beq	.L44
 158:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		select_controller(B_CS2);
 679              		.loc 1 158 0
 680 02ce 1020     		movs	r0, #16
 681 02d0 FFF7FEFF 		bl	select_controller
 159:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		graphic_wait_ready();
 682              		.loc 1 159 0
 683 02d4 FFF7FEFF 		bl	graphic_wait_ready
 684              	.L44:
 160:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
 161:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	return c;
 685              		.loc 1 161 0
 686 02d8 0F23     		movs	r3, #15
 687 02da FB18     		adds	r3, r7, r3
 688 02dc 1B78     		ldrb	r3, [r3]
 162:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
 689              		.loc 1 162 0
 690 02de 1800     		movs	r0, r3
 691 02e0 BD46     		mov	sp, r7
 692 02e2 04B0     		add	sp, sp, #16
 693              		@ sp needed
 694 02e4 80BD     		pop	{r7, pc}
 695              	.L47:
 696 02e6 C046     		.align	2
 697              	.L46:
 698 02e8 00100240 		.word	1073876992
 699 02ec 55550000 		.word	21845
 700 02f0 11100240 		.word	1073877009
 701 02f4 55555555 		.word	1431655765
 702              		.cfi_endproc
 703              	.LFE9:
 705              		.align	1
 706              		.global	graphic_write
 707              		.syntax unified
 708              		.code	16
 709              		.thumb_func
 710              		.fpu softvfp
 712              	graphic_write:
 713              	.LFB10:
 163:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
 164:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** void graphic_write(uint8_t value, uint8_t controller){
 714              		.loc 1 164 0
 715              		.cfi_startproc
 716              		@ args = 0, pretend = 0, frame = 8
 717              		@ frame_needed = 1, uses_anonymous_args = 0
 718 02f8 80B5     		push	{r7, lr}
 719              		.cfi_def_cfa_offset 8
 720              		.cfi_offset 7, -8
 721              		.cfi_offset 14, -4
 722 02fa 82B0     		sub	sp, sp, #8
 723              		.cfi_def_cfa_offset 16
 724 02fc 00AF     		add	r7, sp, #0
 725              		.cfi_def_cfa_register 7
 726 02fe 0200     		movs	r2, r0
 727 0300 FB1D     		adds	r3, r7, #7
 728 0302 1A70     		strb	r2, [r3]
 729 0304 BB1D     		adds	r3, r7, #6
 730 0306 0A1C     		adds	r2, r1, #0
 731 0308 1A70     		strb	r2, [r3]
 165:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	*portOdrHigh = value;
 732              		.loc 1 165 0
 733 030a 194A     		ldr	r2, .L51
 734 030c FB1D     		adds	r3, r7, #7
 735 030e 1B78     		ldrb	r3, [r3]
 736 0310 1370     		strb	r3, [r2]
 166:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	select_controller(controller);
 737              		.loc 1 166 0
 738 0312 BB1D     		adds	r3, r7, #6
 739 0314 1B78     		ldrb	r3, [r3]
 740 0316 1800     		movs	r0, r3
 741 0318 FFF7FEFF 		bl	select_controller
 167:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	delay_500ns();
 742              		.loc 1 167 0
 743 031c FFF7FEFF 		bl	delay_500ns
 168:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 744              		.loc 1 168 0
 745 0320 4020     		movs	r0, #64
 746 0322 FFF7FEFF 		bl	graphic_ctrl_bit_set
 169:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	delay_500ns();
 747              		.loc 1 169 0
 748 0326 FFF7FEFF 		bl	delay_500ns
 170:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 749              		.loc 1 170 0
 750 032a 4020     		movs	r0, #64
 751 032c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 171:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	
 172:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	if(controller && B_CS1){
 752              		.loc 1 172 0
 753 0330 BB1D     		adds	r3, r7, #6
 754 0332 1B78     		ldrb	r3, [r3]
 755 0334 002B     		cmp	r3, #0
 756 0336 04D0     		beq	.L49
 173:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		select_controller(B_CS1);
 757              		.loc 1 173 0
 758 0338 0820     		movs	r0, #8
 759 033a FFF7FEFF 		bl	select_controller
 174:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		graphic_wait_ready();
 760              		.loc 1 174 0
 761 033e FFF7FEFF 		bl	graphic_wait_ready
 762              	.L49:
 175:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
 176:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	if(controller && B_CS2){
 763              		.loc 1 176 0
 764 0342 BB1D     		adds	r3, r7, #6
 765 0344 1B78     		ldrb	r3, [r3]
 766 0346 002B     		cmp	r3, #0
 767 0348 04D0     		beq	.L50
 177:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		select_controller(B_CS2);
 768              		.loc 1 177 0
 769 034a 1020     		movs	r0, #16
 770 034c FFF7FEFF 		bl	select_controller
 178:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		graphic_wait_ready();
 771              		.loc 1 178 0
 772 0350 FFF7FEFF 		bl	graphic_wait_ready
 773              	.L50:
 179:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
 180:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	*portOdrHigh = 0;
 774              		.loc 1 180 0
 775 0354 064B     		ldr	r3, .L51
 776 0356 0022     		movs	r2, #0
 777 0358 1A70     		strb	r2, [r3]
 181:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 778              		.loc 1 181 0
 779 035a 4020     		movs	r0, #64
 780 035c FFF7FEFF 		bl	graphic_ctrl_bit_set
 182:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	select_controller(0);
 781              		.loc 1 182 0
 782 0360 0020     		movs	r0, #0
 783 0362 FFF7FEFF 		bl	select_controller
 183:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	
 184:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
 784              		.loc 1 184 0
 785 0366 C046     		nop
 786 0368 BD46     		mov	sp, r7
 787 036a 02B0     		add	sp, sp, #8
 788              		@ sp needed
 789 036c 80BD     		pop	{r7, pc}
 790              	.L52:
 791 036e C046     		.align	2
 792              	.L51:
 793 0370 15100240 		.word	1073877013
 794              		.cfi_endproc
 795              	.LFE10:
 797              		.align	1
 798              		.global	graphic_write_command
 799              		.syntax unified
 800              		.code	16
 801              		.thumb_func
 802              		.fpu softvfp
 804              	graphic_write_command:
 805              	.LFB11:
 185:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
 186:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** void graphic_write_command(uint8_t command, uint8_t controller){
 806              		.loc 1 186 0
 807              		.cfi_startproc
 808              		@ args = 0, pretend = 0, frame = 8
 809              		@ frame_needed = 1, uses_anonymous_args = 0
 810 0374 80B5     		push	{r7, lr}
 811              		.cfi_def_cfa_offset 8
 812              		.cfi_offset 7, -8
 813              		.cfi_offset 14, -4
 814 0376 82B0     		sub	sp, sp, #8
 815              		.cfi_def_cfa_offset 16
 816 0378 00AF     		add	r7, sp, #0
 817              		.cfi_def_cfa_register 7
 818 037a 0200     		movs	r2, r0
 819 037c FB1D     		adds	r3, r7, #7
 820 037e 1A70     		strb	r2, [r3]
 821 0380 BB1D     		adds	r3, r7, #6
 822 0382 0A1C     		adds	r2, r1, #0
 823 0384 1A70     		strb	r2, [r3]
 187:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 824              		.loc 1 187 0
 825 0386 4020     		movs	r0, #64
 826 0388 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 188:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	select_controller(controller);
 827              		.loc 1 188 0
 828 038c BB1D     		adds	r3, r7, #6
 829 038e 1B78     		ldrb	r3, [r3]
 830 0390 1800     		movs	r0, r3
 831 0392 FFF7FEFF 		bl	select_controller
 189:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 832              		.loc 1 189 0
 833 0396 0120     		movs	r0, #1
 834 0398 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 190:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 835              		.loc 1 190 0
 836 039c 0220     		movs	r0, #2
 837 039e FFF7FEFF 		bl	graphic_ctrl_bit_clear
 191:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write(command, controller);
 838              		.loc 1 191 0
 839 03a2 BB1D     		adds	r3, r7, #6
 840 03a4 1A78     		ldrb	r2, [r3]
 841 03a6 FB1D     		adds	r3, r7, #7
 842 03a8 1B78     		ldrb	r3, [r3]
 843 03aa 1100     		movs	r1, r2
 844 03ac 1800     		movs	r0, r3
 845 03ae FFF7FEFF 		bl	graphic_write
 192:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
 846              		.loc 1 192 0
 847 03b2 C046     		nop
 848 03b4 BD46     		mov	sp, r7
 849 03b6 02B0     		add	sp, sp, #8
 850              		@ sp needed
 851 03b8 80BD     		pop	{r7, pc}
 852              		.cfi_endproc
 853              	.LFE11:
 855              		.align	1
 856              		.global	graphic_write_data
 857              		.syntax unified
 858              		.code	16
 859              		.thumb_func
 860              		.fpu softvfp
 862              	graphic_write_data:
 863              	.LFB12:
 193:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
 194:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** void graphic_write_data(uint8_t data, uint8_t controller){
 864              		.loc 1 194 0
 865              		.cfi_startproc
 866              		@ args = 0, pretend = 0, frame = 8
 867              		@ frame_needed = 1, uses_anonymous_args = 0
 868 03ba 80B5     		push	{r7, lr}
 869              		.cfi_def_cfa_offset 8
 870              		.cfi_offset 7, -8
 871              		.cfi_offset 14, -4
 872 03bc 82B0     		sub	sp, sp, #8
 873              		.cfi_def_cfa_offset 16
 874 03be 00AF     		add	r7, sp, #0
 875              		.cfi_def_cfa_register 7
 876 03c0 0200     		movs	r2, r0
 877 03c2 FB1D     		adds	r3, r7, #7
 878 03c4 1A70     		strb	r2, [r3]
 879 03c6 BB1D     		adds	r3, r7, #6
 880 03c8 0A1C     		adds	r2, r1, #0
 881 03ca 1A70     		strb	r2, [r3]
 195:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 882              		.loc 1 195 0
 883 03cc 4020     		movs	r0, #64
 884 03ce FFF7FEFF 		bl	graphic_ctrl_bit_clear
 196:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	select_controller(controller);
 885              		.loc 1 196 0
 886 03d2 BB1D     		adds	r3, r7, #6
 887 03d4 1B78     		ldrb	r3, [r3]
 888 03d6 1800     		movs	r0, r3
 889 03d8 FFF7FEFF 		bl	select_controller
 197:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RS);
 890              		.loc 1 197 0
 891 03dc 0120     		movs	r0, #1
 892 03de FFF7FEFF 		bl	graphic_ctrl_bit_set
 198:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 893              		.loc 1 198 0
 894 03e2 0220     		movs	r0, #2
 895 03e4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 199:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write(data, controller);
 896              		.loc 1 199 0
 897 03e8 BB1D     		adds	r3, r7, #6
 898 03ea 1A78     		ldrb	r2, [r3]
 899 03ec FB1D     		adds	r3, r7, #7
 900 03ee 1B78     		ldrb	r3, [r3]
 901 03f0 1100     		movs	r1, r2
 902 03f2 1800     		movs	r0, r3
 903 03f4 FFF7FEFF 		bl	graphic_write
 200:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
 904              		.loc 1 200 0
 905 03f8 C046     		nop
 906 03fa BD46     		mov	sp, r7
 907 03fc 02B0     		add	sp, sp, #8
 908              		@ sp needed
 909 03fe 80BD     		pop	{r7, pc}
 910              		.cfi_endproc
 911              	.LFE12:
 913              		.align	1
 914              		.global	graphic_read_data
 915              		.syntax unified
 916              		.code	16
 917              		.thumb_func
 918              		.fpu softvfp
 920              	graphic_read_data:
 921              	.LFB13:
 201:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
 202:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** uint8_t graphic_read_data(uint8_t controller){
 922              		.loc 1 202 0
 923              		.cfi_startproc
 924              		@ args = 0, pretend = 0, frame = 8
 925              		@ frame_needed = 1, uses_anonymous_args = 0
 926 0400 80B5     		push	{r7, lr}
 927              		.cfi_def_cfa_offset 8
 928              		.cfi_offset 7, -8
 929              		.cfi_offset 14, -4
 930 0402 82B0     		sub	sp, sp, #8
 931              		.cfi_def_cfa_offset 16
 932 0404 00AF     		add	r7, sp, #0
 933              		.cfi_def_cfa_register 7
 934 0406 0200     		movs	r2, r0
 935 0408 FB1D     		adds	r3, r7, #7
 936 040a 1A70     		strb	r2, [r3]
 203:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	(void) graphic_read(controller);
 937              		.loc 1 203 0
 938 040c FB1D     		adds	r3, r7, #7
 939 040e 1B78     		ldrb	r3, [r3]
 940 0410 1800     		movs	r0, r3
 941 0412 FFF7FEFF 		bl	graphic_read
 204:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	return graphic_read(controller);
 942              		.loc 1 204 0
 943 0416 FB1D     		adds	r3, r7, #7
 944 0418 1B78     		ldrb	r3, [r3]
 945 041a 1800     		movs	r0, r3
 946 041c FFF7FEFF 		bl	graphic_read
 947 0420 0300     		movs	r3, r0
 205:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
 948              		.loc 1 205 0
 949 0422 1800     		movs	r0, r3
 950 0424 BD46     		mov	sp, r7
 951 0426 02B0     		add	sp, sp, #8
 952              		@ sp needed
 953 0428 80BD     		pop	{r7, pc}
 954              		.cfi_endproc
 955              	.LFE13:
 957              		.align	1
 958              		.global	init_app
 959              		.syntax unified
 960              		.code	16
 961              		.thumb_func
 962              		.fpu softvfp
 964              	init_app:
 965              	.LFB14:
 206:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
 207:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** void init_app(){
 966              		.loc 1 207 0
 967              		.cfi_startproc
 968              		@ args = 0, pretend = 0, frame = 0
 969              		@ frame_needed = 1, uses_anonymous_args = 0
 970 042a 80B5     		push	{r7, lr}
 971              		.cfi_def_cfa_offset 8
 972              		.cfi_offset 7, -8
 973              		.cfi_offset 14, -4
 974 042c 00AF     		add	r7, sp, #0
 975              		.cfi_def_cfa_register 7
 208:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	*portModer = 0x55555555;
 976              		.loc 1 208 0
 977 042e 034B     		ldr	r3, .L58
 978 0430 034A     		ldr	r2, .L58+4
 979 0432 1A60     		str	r2, [r3]
 209:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
 980              		.loc 1 209 0
 981 0434 C046     		nop
 982 0436 BD46     		mov	sp, r7
 983              		@ sp needed
 984 0438 80BD     		pop	{r7, pc}
 985              	.L59:
 986 043a C046     		.align	2
 987              	.L58:
 988 043c 00100240 		.word	1073876992
 989 0440 55555555 		.word	1431655765
 990              		.cfi_endproc
 991              	.LFE14:
 993              		.align	1
 994              		.global	graphic_initialize
 995              		.syntax unified
 996              		.code	16
 997              		.thumb_func
 998              		.fpu softvfp
 1000              	graphic_initialize:
 1001              	.LFB15:
 210:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
 211:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** void graphic_initialize(void){
 1002              		.loc 1 211 0
 1003              		.cfi_startproc
 1004              		@ args = 0, pretend = 0, frame = 0
 1005              		@ frame_needed = 1, uses_anonymous_args = 0
 1006 0444 80B5     		push	{r7, lr}
 1007              		.cfi_def_cfa_offset 8
 1008              		.cfi_offset 7, -8
 1009              		.cfi_offset 14, -4
 1010 0446 00AF     		add	r7, sp, #0
 1011              		.cfi_def_cfa_register 7
 212:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 1012              		.loc 1 212 0
 1013 0448 4020     		movs	r0, #64
 1014 044a FFF7FEFF 		bl	graphic_ctrl_bit_set
 213:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	delay_mikro(10);
 1015              		.loc 1 213 0
 1016 044e 0A20     		movs	r0, #10
 1017 0450 FFF7FEFF 		bl	delay_mikro
 214:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_CS1);
 1018              		.loc 1 214 0
 1019 0454 0820     		movs	r0, #8
 1020 0456 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 215:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_CS2);
 1021              		.loc 1 215 0
 1022 045a 1020     		movs	r0, #16
 1023 045c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 216:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RST);
 1024              		.loc 1 216 0
 1025 0460 2020     		movs	r0, #32
 1026 0462 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 217:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 1027              		.loc 1 217 0
 1028 0466 4020     		movs	r0, #64
 1029 0468 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 218:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	delay_milli(30);
 1030              		.loc 1 218 0
 1031 046c 1E20     		movs	r0, #30
 1032 046e FFF7FEFF 		bl	delay_milli
 219:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RST);
 1033              		.loc 1 219 0
 1034 0472 2020     		movs	r0, #32
 1035 0474 FFF7FEFF 		bl	graphic_ctrl_bit_set
 220:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	delay_milli(100);
 1036              		.loc 1 220 0
 1037 0478 6420     		movs	r0, #100
 1038 047a FFF7FEFF 		bl	delay_milli
 221:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 1039              		.loc 1 221 0
 1040 047e 1821     		movs	r1, #24
 1041 0480 3E20     		movs	r0, #62
 1042 0482 FFF7FEFF 		bl	graphic_write_command
 222:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_command(LCD_ON, B_CS1|B_CS2);
 1043              		.loc 1 222 0
 1044 0486 1821     		movs	r1, #24
 1045 0488 3F20     		movs	r0, #63
 1046 048a FFF7FEFF 		bl	graphic_write_command
 223:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 1047              		.loc 1 223 0
 1048 048e 1821     		movs	r1, #24
 1049 0490 C020     		movs	r0, #192
 1050 0492 FFF7FEFF 		bl	graphic_write_command
 224:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 1051              		.loc 1 224 0
 1052 0496 1821     		movs	r1, #24
 1053 0498 4020     		movs	r0, #64
 1054 049a FFF7FEFF 		bl	graphic_write_command
 225:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 1055              		.loc 1 225 0
 1056 049e 1821     		movs	r1, #24
 1057 04a0 B820     		movs	r0, #184
 1058 04a2 FFF7FEFF 		bl	graphic_write_command
 226:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	select_controller(0);
 1059              		.loc 1 226 0
 1060 04a6 0020     		movs	r0, #0
 1061 04a8 FFF7FEFF 		bl	select_controller
 227:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
 1062              		.loc 1 227 0
 1063 04ac C046     		nop
 1064 04ae BD46     		mov	sp, r7
 1065              		@ sp needed
 1066 04b0 80BD     		pop	{r7, pc}
 1067              		.cfi_endproc
 1068              	.LFE15:
 1070              		.align	1
 1071              		.global	graphic_clear_screen
 1072              		.syntax unified
 1073              		.code	16
 1074              		.thumb_func
 1075              		.fpu softvfp
 1077              	graphic_clear_screen:
 1078              	.LFB16:
 228:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
 229:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** void graphic_clear_screen( void ){
 1079              		.loc 1 229 0
 1080              		.cfi_startproc
 1081              		@ args = 0, pretend = 0, frame = 8
 1082              		@ frame_needed = 1, uses_anonymous_args = 0
 1083 04b2 80B5     		push	{r7, lr}
 1084              		.cfi_def_cfa_offset 8
 1085              		.cfi_offset 7, -8
 1086              		.cfi_offset 14, -4
 1087 04b4 82B0     		sub	sp, sp, #8
 1088              		.cfi_def_cfa_offset 16
 1089 04b6 00AF     		add	r7, sp, #0
 1090              		.cfi_def_cfa_register 7
 1091              	.LBB4:
 230:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	for(int page = 0; page < 8; page++){
 1092              		.loc 1 230 0
 1093 04b8 0023     		movs	r3, #0
 1094 04ba 7B60     		str	r3, [r7, #4]
 1095 04bc 1EE0     		b	.L62
 1096              	.L65:
 231:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		graphic_write(LCD_SET_PAGE | page, B_CS1|B_CS2);
 1097              		.loc 1 231 0
 1098 04be 7B68     		ldr	r3, [r7, #4]
 1099 04c0 5BB2     		sxtb	r3, r3
 1100 04c2 4822     		movs	r2, #72
 1101 04c4 5242     		rsbs	r2, r2, #0
 1102 04c6 1343     		orrs	r3, r2
 1103 04c8 5BB2     		sxtb	r3, r3
 1104 04ca DBB2     		uxtb	r3, r3
 1105 04cc 1821     		movs	r1, #24
 1106 04ce 1800     		movs	r0, r3
 1107 04d0 FFF7FEFF 		bl	graphic_write
 232:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		graphic_write(LCD_SET_ADD | 0, B_CS1|B_CS2);
 1108              		.loc 1 232 0
 1109 04d4 1821     		movs	r1, #24
 1110 04d6 4020     		movs	r0, #64
 1111 04d8 FFF7FEFF 		bl	graphic_write
 1112              	.LBB5:
 233:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		for(int add = 0; add < 64; add++){
 1113              		.loc 1 233 0
 1114 04dc 0023     		movs	r3, #0
 1115 04de 3B60     		str	r3, [r7]
 1116 04e0 06E0     		b	.L63
 1117              	.L64:
 234:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 			graphic_write_data(0, B_CS1|B_CS2);
 1118              		.loc 1 234 0 discriminator 3
 1119 04e2 1821     		movs	r1, #24
 1120 04e4 0020     		movs	r0, #0
 1121 04e6 FFF7FEFF 		bl	graphic_write_data
 233:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		for(int add = 0; add < 64; add++){
 1122              		.loc 1 233 0 discriminator 3
 1123 04ea 3B68     		ldr	r3, [r7]
 1124 04ec 0133     		adds	r3, r3, #1
 1125 04ee 3B60     		str	r3, [r7]
 1126              	.L63:
 233:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		for(int add = 0; add < 64; add++){
 1127              		.loc 1 233 0 is_stmt 0 discriminator 1
 1128 04f0 3B68     		ldr	r3, [r7]
 1129 04f2 3F2B     		cmp	r3, #63
 1130 04f4 F5DD     		ble	.L64
 1131              	.LBE5:
 230:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		graphic_write(LCD_SET_PAGE | page, B_CS1|B_CS2);
 1132              		.loc 1 230 0 is_stmt 1 discriminator 2
 1133 04f6 7B68     		ldr	r3, [r7, #4]
 1134 04f8 0133     		adds	r3, r3, #1
 1135 04fa 7B60     		str	r3, [r7, #4]
 1136              	.L62:
 230:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		graphic_write(LCD_SET_PAGE | page, B_CS1|B_CS2);
 1137              		.loc 1 230 0 is_stmt 0 discriminator 1
 1138 04fc 7B68     		ldr	r3, [r7, #4]
 1139 04fe 072B     		cmp	r3, #7
 1140 0500 DDDD     		ble	.L65
 1141              	.LBE4:
 235:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		}
 236:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
 237:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
 1142              		.loc 1 237 0 is_stmt 1
 1143 0502 C046     		nop
 1144 0504 BD46     		mov	sp, r7
 1145 0506 02B0     		add	sp, sp, #8
 1146              		@ sp needed
 1147 0508 80BD     		pop	{r7, pc}
 1148              		.cfi_endproc
 1149              	.LFE16:
 1151              		.align	1
 1152              		.global	pixel
 1153              		.syntax unified
 1154              		.code	16
 1155              		.thumb_func
 1156              		.fpu softvfp
 1158              	pixel:
 1159              	.LFB17:
 238:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
 239:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** void pixel(int x, int y, int set){
 1160              		.loc 1 239 0
 1161              		.cfi_startproc
 1162              		@ args = 0, pretend = 0, frame = 32
 1163              		@ frame_needed = 1, uses_anonymous_args = 0
 1164 050a B0B5     		push	{r4, r5, r7, lr}
 1165              		.cfi_def_cfa_offset 16
 1166              		.cfi_offset 4, -16
 1167              		.cfi_offset 5, -12
 1168              		.cfi_offset 7, -8
 1169              		.cfi_offset 14, -4
 1170 050c 88B0     		sub	sp, sp, #32
 1171              		.cfi_def_cfa_offset 48
 1172 050e 00AF     		add	r7, sp, #0
 1173              		.cfi_def_cfa_register 7
 1174 0510 F860     		str	r0, [r7, #12]
 1175 0512 B960     		str	r1, [r7, #8]
 1176 0514 7A60     		str	r2, [r7, #4]
 240:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	uint8_t mask, c, controller;
 241:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	int index;
 242:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	
 243:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	if( (x < 1) || (x > 128) || (y < 1) || (y > 64)){
 1177              		.loc 1 243 0
 1178 0516 FB68     		ldr	r3, [r7, #12]
 1179 0518 002B     		cmp	r3, #0
 1180 051a 00DC     		bgt	.LCB940
 1181 051c B6E0     		b	.L87	@long jump
 1182              	.LCB940:
 1183              		.loc 1 243 0 is_stmt 0 discriminator 1
 1184 051e FB68     		ldr	r3, [r7, #12]
 1185 0520 802B     		cmp	r3, #128
 1186 0522 00DD     		ble	.LCB943
 1187 0524 B2E0     		b	.L87	@long jump
 1188              	.LCB943:
 1189              		.loc 1 243 0 discriminator 2
 1190 0526 BB68     		ldr	r3, [r7, #8]
 1191 0528 002B     		cmp	r3, #0
 1192 052a 00DC     		bgt	.LCB946
 1193 052c AEE0     		b	.L87	@long jump
 1194              	.LCB946:
 1195              		.loc 1 243 0 discriminator 3
 1196 052e BB68     		ldr	r3, [r7, #8]
 1197 0530 402B     		cmp	r3, #64
 1198 0532 00DD     		ble	.LCB949
 1199 0534 AAE0     		b	.L87	@long jump
 1200              	.LCB949:
 244:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		return;
 245:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
 246:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	index = (y-1) / 8;
 1201              		.loc 1 246 0 is_stmt 1
 1202 0536 BB68     		ldr	r3, [r7, #8]
 1203 0538 013B     		subs	r3, r3, #1
 1204 053a 002B     		cmp	r3, #0
 1205 053c 00DA     		bge	.L70
 1206 053e 0733     		adds	r3, r3, #7
 1207              	.L70:
 1208 0540 DB10     		asrs	r3, r3, #3
 1209 0542 BB61     		str	r3, [r7, #24]
 247:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	
 248:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	switch((y-1)%8){
 1210              		.loc 1 248 0
 1211 0544 BB68     		ldr	r3, [r7, #8]
 1212 0546 013B     		subs	r3, r3, #1
 1213 0548 524A     		ldr	r2, .L88
 1214 054a 1340     		ands	r3, r2
 1215 054c 04D5     		bpl	.L71
 1216 054e 013B     		subs	r3, r3, #1
 1217 0550 0822     		movs	r2, #8
 1218 0552 5242     		rsbs	r2, r2, #0
 1219 0554 1343     		orrs	r3, r2
 1220 0556 0133     		adds	r3, r3, #1
 1221              	.L71:
 1222 0558 072B     		cmp	r3, #7
 1223 055a 2CD8     		bhi	.L72
 1224 055c 9A00     		lsls	r2, r3, #2
 1225 055e 4E4B     		ldr	r3, .L88+4
 1226 0560 D318     		adds	r3, r2, r3
 1227 0562 1B68     		ldr	r3, [r3]
 1228 0564 9F46     		mov	pc, r3
 1229              		.section	.rodata
 1230              		.align	2
 1231              	.L74:
 1232 0000 66050000 		.word	.L73
 1233 0004 70050000 		.word	.L75
 1234 0008 7A050000 		.word	.L76
 1235 000c 84050000 		.word	.L77
 1236 0010 8E050000 		.word	.L78
 1237 0014 98050000 		.word	.L79
 1238 0018 A2050000 		.word	.L80
 1239 001c AC050000 		.word	.L81
 1240              		.text
 1241              	.L73:
 249:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		case 0: mask = 1; break;
 1242              		.loc 1 249 0
 1243 0566 1F23     		movs	r3, #31
 1244 0568 FB18     		adds	r3, r7, r3
 1245 056a 0122     		movs	r2, #1
 1246 056c 1A70     		strb	r2, [r3]
 1247 056e 22E0     		b	.L72
 1248              	.L75:
 250:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		case 1: mask = 2; break; 
 1249              		.loc 1 250 0
 1250 0570 1F23     		movs	r3, #31
 1251 0572 FB18     		adds	r3, r7, r3
 1252 0574 0222     		movs	r2, #2
 1253 0576 1A70     		strb	r2, [r3]
 1254 0578 1DE0     		b	.L72
 1255              	.L76:
 251:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		case 2: mask = 4; break; 
 1256              		.loc 1 251 0
 1257 057a 1F23     		movs	r3, #31
 1258 057c FB18     		adds	r3, r7, r3
 1259 057e 0422     		movs	r2, #4
 1260 0580 1A70     		strb	r2, [r3]
 1261 0582 18E0     		b	.L72
 1262              	.L77:
 252:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		case 3: mask = 8; break; 
 1263              		.loc 1 252 0
 1264 0584 1F23     		movs	r3, #31
 1265 0586 FB18     		adds	r3, r7, r3
 1266 0588 0822     		movs	r2, #8
 1267 058a 1A70     		strb	r2, [r3]
 1268 058c 13E0     		b	.L72
 1269              	.L78:
 253:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		case 4: mask = 0x10; break; 
 1270              		.loc 1 253 0
 1271 058e 1F23     		movs	r3, #31
 1272 0590 FB18     		adds	r3, r7, r3
 1273 0592 1022     		movs	r2, #16
 1274 0594 1A70     		strb	r2, [r3]
 1275 0596 0EE0     		b	.L72
 1276              	.L79:
 254:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		case 5: mask = 0x20; break; 
 1277              		.loc 1 254 0
 1278 0598 1F23     		movs	r3, #31
 1279 059a FB18     		adds	r3, r7, r3
 1280 059c 2022     		movs	r2, #32
 1281 059e 1A70     		strb	r2, [r3]
 1282 05a0 09E0     		b	.L72
 1283              	.L80:
 255:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		case 6: mask = 0x40; break; 
 1284              		.loc 1 255 0
 1285 05a2 1F23     		movs	r3, #31
 1286 05a4 FB18     		adds	r3, r7, r3
 1287 05a6 4022     		movs	r2, #64
 1288 05a8 1A70     		strb	r2, [r3]
 1289 05aa 04E0     		b	.L72
 1290              	.L81:
 256:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		case 7: mask = 0x80; break; 
 1291              		.loc 1 256 0
 1292 05ac 1F23     		movs	r3, #31
 1293 05ae FB18     		adds	r3, r7, r3
 1294 05b0 8022     		movs	r2, #128
 1295 05b2 1A70     		strb	r2, [r3]
 1296 05b4 C046     		nop
 1297              	.L72:
 257:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
 258:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	if(set == 0){
 1298              		.loc 1 258 0
 1299 05b6 7B68     		ldr	r3, [r7, #4]
 1300 05b8 002B     		cmp	r3, #0
 1301 05ba 05D1     		bne	.L82
 259:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		mask = ~mask;
 1302              		.loc 1 259 0
 1303 05bc 1F22     		movs	r2, #31
 1304 05be BB18     		adds	r3, r7, r2
 1305 05c0 BA18     		adds	r2, r7, r2
 1306 05c2 1278     		ldrb	r2, [r2]
 1307 05c4 D243     		mvns	r2, r2
 1308 05c6 1A70     		strb	r2, [r3]
 1309              	.L82:
 260:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
 261:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	if(x > 64){
 1310              		.loc 1 261 0
 1311 05c8 FB68     		ldr	r3, [r7, #12]
 1312 05ca 402B     		cmp	r3, #64
 1313 05cc 07DD     		ble	.L83
 262:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		controller = B_CS2;
 1314              		.loc 1 262 0
 1315 05ce 1E23     		movs	r3, #30
 1316 05d0 FB18     		adds	r3, r7, r3
 1317 05d2 1022     		movs	r2, #16
 1318 05d4 1A70     		strb	r2, [r3]
 263:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		x = x - 65;
 1319              		.loc 1 263 0
 1320 05d6 FB68     		ldr	r3, [r7, #12]
 1321 05d8 413B     		subs	r3, r3, #65
 1322 05da FB60     		str	r3, [r7, #12]
 1323 05dc 06E0     		b	.L84
 1324              	.L83:
 264:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
 265:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	else{
 266:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		controller = B_CS1;
 1325              		.loc 1 266 0
 1326 05de 1E23     		movs	r3, #30
 1327 05e0 FB18     		adds	r3, r7, r3
 1328 05e2 0822     		movs	r2, #8
 1329 05e4 1A70     		strb	r2, [r3]
 267:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		x = x - 1;
 1330              		.loc 1 267 0
 1331 05e6 FB68     		ldr	r3, [r7, #12]
 1332 05e8 013B     		subs	r3, r3, #1
 1333 05ea FB60     		str	r3, [r7, #12]
 1334              	.L84:
 268:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
 269:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_ADD | x, controller);
 1335              		.loc 1 269 0
 1336 05ec FB68     		ldr	r3, [r7, #12]
 1337 05ee 5BB2     		sxtb	r3, r3
 1338 05f0 4022     		movs	r2, #64
 1339 05f2 1343     		orrs	r3, r2
 1340 05f4 5BB2     		sxtb	r3, r3
 1341 05f6 DAB2     		uxtb	r2, r3
 1342 05f8 1E25     		movs	r5, #30
 1343 05fa 7B19     		adds	r3, r7, r5
 1344 05fc 1B78     		ldrb	r3, [r3]
 1345 05fe 1900     		movs	r1, r3
 1346 0600 1000     		movs	r0, r2
 1347 0602 FFF7FEFF 		bl	graphic_write_command
 270:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_PAGE | index, controller);
 1348              		.loc 1 270 0
 1349 0606 BB69     		ldr	r3, [r7, #24]
 1350 0608 5BB2     		sxtb	r3, r3
 1351 060a 4822     		movs	r2, #72
 1352 060c 5242     		rsbs	r2, r2, #0
 1353 060e 1343     		orrs	r3, r2
 1354 0610 5BB2     		sxtb	r3, r3
 1355 0612 DAB2     		uxtb	r2, r3
 1356 0614 7B19     		adds	r3, r7, r5
 1357 0616 1B78     		ldrb	r3, [r3]
 1358 0618 1900     		movs	r1, r3
 1359 061a 1000     		movs	r0, r2
 1360 061c FFF7FEFF 		bl	graphic_write_command
 271:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	c = graphic_read_data(controller);
 1361              		.loc 1 271 0
 1362 0620 1723     		movs	r3, #23
 1363 0622 FC18     		adds	r4, r7, r3
 1364 0624 7B19     		adds	r3, r7, r5
 1365 0626 1B78     		ldrb	r3, [r3]
 1366 0628 1800     		movs	r0, r3
 1367 062a FFF7FEFF 		bl	graphic_read_data
 1368 062e 0300     		movs	r3, r0
 1369 0630 2370     		strb	r3, [r4]
 272:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_ADD | x, controller);
 1370              		.loc 1 272 0
 1371 0632 FB68     		ldr	r3, [r7, #12]
 1372 0634 5BB2     		sxtb	r3, r3
 1373 0636 4022     		movs	r2, #64
 1374 0638 1343     		orrs	r3, r2
 1375 063a 5BB2     		sxtb	r3, r3
 1376 063c DAB2     		uxtb	r2, r3
 1377 063e 7B19     		adds	r3, r7, r5
 1378 0640 1B78     		ldrb	r3, [r3]
 1379 0642 1900     		movs	r1, r3
 1380 0644 1000     		movs	r0, r2
 1381 0646 FFF7FEFF 		bl	graphic_write_command
 273:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	if(set){
 1382              		.loc 1 273 0
 1383 064a 7B68     		ldr	r3, [r7, #4]
 1384 064c 002B     		cmp	r3, #0
 1385 064e 09D0     		beq	.L85
 274:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		mask = mask | c;
 1386              		.loc 1 274 0
 1387 0650 1F22     		movs	r2, #31
 1388 0652 BB18     		adds	r3, r7, r2
 1389 0654 B918     		adds	r1, r7, r2
 1390 0656 1722     		movs	r2, #23
 1391 0658 BA18     		adds	r2, r7, r2
 1392 065a 0978     		ldrb	r1, [r1]
 1393 065c 1278     		ldrb	r2, [r2]
 1394 065e 0A43     		orrs	r2, r1
 1395 0660 1A70     		strb	r2, [r3]
 1396 0662 08E0     		b	.L86
 1397              	.L85:
 275:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
 276:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	else{
 277:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		mask = mask & c;
 1398              		.loc 1 277 0
 1399 0664 1F22     		movs	r2, #31
 1400 0666 BB18     		adds	r3, r7, r2
 1401 0668 BA18     		adds	r2, r7, r2
 1402 066a 1721     		movs	r1, #23
 1403 066c 7918     		adds	r1, r7, r1
 1404 066e 1278     		ldrb	r2, [r2]
 1405 0670 0978     		ldrb	r1, [r1]
 1406 0672 0A40     		ands	r2, r1
 1407 0674 1A70     		strb	r2, [r3]
 1408              	.L86:
 278:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
 279:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_data(mask, controller);
 1409              		.loc 1 279 0
 1410 0676 1E23     		movs	r3, #30
 1411 0678 FB18     		adds	r3, r7, r3
 1412 067a 1A78     		ldrb	r2, [r3]
 1413 067c 1F23     		movs	r3, #31
 1414 067e FB18     		adds	r3, r7, r3
 1415 0680 1B78     		ldrb	r3, [r3]
 1416 0682 1100     		movs	r1, r2
 1417 0684 1800     		movs	r0, r3
 1418 0686 FFF7FEFF 		bl	graphic_write_data
 1419 068a 00E0     		b	.L66
 1420              	.L87:
 244:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
 1421              		.loc 1 244 0
 1422 068c C046     		nop
 1423              	.L66:
 280:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
 1424              		.loc 1 280 0
 1425 068e BD46     		mov	sp, r7
 1426 0690 08B0     		add	sp, sp, #32
 1427              		@ sp needed
 1428 0692 B0BD     		pop	{r4, r5, r7, pc}
 1429              	.L89:
 1430              		.align	2
 1431              	.L88:
 1432 0694 07000080 		.word	-2147483641
 1433 0698 00000000 		.word	.L74
 1434              		.cfi_endproc
 1435              	.LFE17:
 1437              		.align	1
 1438              		.global	main
 1439              		.syntax unified
 1440              		.code	16
 1441              		.thumb_func
 1442              		.fpu softvfp
 1444              	main:
 1445              	.LFB18:
 281:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
 282:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** void main(void)
 283:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** {
 1446              		.loc 1 283 0
 1447              		.cfi_startproc
 1448              		@ args = 0, pretend = 0, frame = 8
 1449              		@ frame_needed = 1, uses_anonymous_args = 0
 1450 069c 80B5     		push	{r7, lr}
 1451              		.cfi_def_cfa_offset 8
 1452              		.cfi_offset 7, -8
 1453              		.cfi_offset 14, -4
 1454 069e 82B0     		sub	sp, sp, #8
 1455              		.cfi_def_cfa_offset 16
 1456 06a0 00AF     		add	r7, sp, #0
 1457              		.cfi_def_cfa_register 7
 284:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	unsigned i;
 285:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	init_app();
 1458              		.loc 1 285 0
 1459 06a2 FFF7FEFF 		bl	init_app
 286:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	//graphic_initialize();
 287:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #ifdef SIMULATOR
 288:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	graphic_clear_screen();
 289:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** #endif
 290:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	for( i = 0; i < 128; i++){
 1460              		.loc 1 290 0
 1461 06a6 0023     		movs	r3, #0
 1462 06a8 7B60     		str	r3, [r7, #4]
 1463 06aa 08E0     		b	.L91
 1464              	.L92:
 291:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		pixel(i, 10, 1);
 1465              		.loc 1 291 0 discriminator 3
 1466 06ac 7B68     		ldr	r3, [r7, #4]
 1467 06ae 0122     		movs	r2, #1
 1468 06b0 0A21     		movs	r1, #10
 1469 06b2 1800     		movs	r0, r3
 1470 06b4 FFF7FEFF 		bl	pixel
 290:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		pixel(i, 10, 1);
 1471              		.loc 1 290 0 discriminator 3
 1472 06b8 7B68     		ldr	r3, [r7, #4]
 1473 06ba 0133     		adds	r3, r3, #1
 1474 06bc 7B60     		str	r3, [r7, #4]
 1475              	.L91:
 290:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		pixel(i, 10, 1);
 1476              		.loc 1 290 0 is_stmt 0 discriminator 1
 1477 06be 7B68     		ldr	r3, [r7, #4]
 1478 06c0 7F2B     		cmp	r3, #127
 1479 06c2 F3D9     		bls	.L92
 292:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
 293:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	for( i = 0; i < 64; i++){
 1480              		.loc 1 293 0 is_stmt 1
 1481 06c4 0023     		movs	r3, #0
 1482 06c6 7B60     		str	r3, [r7, #4]
 1483 06c8 08E0     		b	.L93
 1484              	.L94:
 294:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		pixel(10, i, 1);
 1485              		.loc 1 294 0 discriminator 3
 1486 06ca 7B68     		ldr	r3, [r7, #4]
 1487 06cc 0122     		movs	r2, #1
 1488 06ce 1900     		movs	r1, r3
 1489 06d0 0A20     		movs	r0, #10
 1490 06d2 FFF7FEFF 		bl	pixel
 293:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		pixel(10, i, 1);
 1491              		.loc 1 293 0 discriminator 3
 1492 06d6 7B68     		ldr	r3, [r7, #4]
 1493 06d8 0133     		adds	r3, r3, #1
 1494 06da 7B60     		str	r3, [r7, #4]
 1495              	.L93:
 293:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		pixel(10, i, 1);
 1496              		.loc 1 293 0 is_stmt 0 discriminator 1
 1497 06dc 7B68     		ldr	r3, [r7, #4]
 1498 06de 3F2B     		cmp	r3, #63
 1499 06e0 F3D9     		bls	.L94
 295:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
 296:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	delay_milli( 5 );
 1500              		.loc 1 296 0 is_stmt 1
 1501 06e2 0520     		movs	r0, #5
 1502 06e4 FFF7FEFF 		bl	delay_milli
 297:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	for( i = 0; i < 128; i++){
 1503              		.loc 1 297 0
 1504 06e8 0023     		movs	r3, #0
 1505 06ea 7B60     		str	r3, [r7, #4]
 1506 06ec 08E0     		b	.L95
 1507              	.L96:
 298:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		pixel(i, 10, 0);
 1508              		.loc 1 298 0 discriminator 3
 1509 06ee 7B68     		ldr	r3, [r7, #4]
 1510 06f0 0022     		movs	r2, #0
 1511 06f2 0A21     		movs	r1, #10
 1512 06f4 1800     		movs	r0, r3
 1513 06f6 FFF7FEFF 		bl	pixel
 297:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	for( i = 0; i < 128; i++){
 1514              		.loc 1 297 0 discriminator 3
 1515 06fa 7B68     		ldr	r3, [r7, #4]
 1516 06fc 0133     		adds	r3, r3, #1
 1517 06fe 7B60     		str	r3, [r7, #4]
 1518              	.L95:
 297:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	for( i = 0; i < 128; i++){
 1519              		.loc 1 297 0 is_stmt 0 discriminator 1
 1520 0700 7B68     		ldr	r3, [r7, #4]
 1521 0702 7F2B     		cmp	r3, #127
 1522 0704 F3D9     		bls	.L96
 299:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
 300:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	for( i = 0; i < 64; i++){
 1523              		.loc 1 300 0 is_stmt 1
 1524 0706 0023     		movs	r3, #0
 1525 0708 7B60     		str	r3, [r7, #4]
 1526 070a 08E0     		b	.L97
 1527              	.L98:
 301:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		pixel(10, i, 0);
 1528              		.loc 1 301 0 discriminator 3
 1529 070c 7B68     		ldr	r3, [r7, #4]
 1530 070e 0022     		movs	r2, #0
 1531 0710 1900     		movs	r1, r3
 1532 0712 0A20     		movs	r0, #10
 1533 0714 FFF7FEFF 		bl	pixel
 300:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		pixel(10, i, 0);
 1534              		.loc 1 300 0 discriminator 3
 1535 0718 7B68     		ldr	r3, [r7, #4]
 1536 071a 0133     		adds	r3, r3, #1
 1537 071c 7B60     		str	r3, [r7, #4]
 1538              	.L97:
 300:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 		pixel(10, i, 0);
 1539              		.loc 1 300 0 is_stmt 0 discriminator 1
 1540 071e 7B68     		ldr	r3, [r7, #4]
 1541 0720 3F2B     		cmp	r3, #63
 1542 0722 F3D9     		bls	.L98
 302:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 	}
 303:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** 
 304:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/graphicdisplay\startup.c **** }
 1543              		.loc 1 304 0 is_stmt 1
 1544 0724 C046     		nop
 1545 0726 BD46     		mov	sp, r7
 1546 0728 02B0     		add	sp, sp, #8
 1547              		@ sp needed
 1548 072a 80BD     		pop	{r7, pc}
 1549              		.cfi_endproc
 1550              	.LFE18:
 1552              	.Letext0:
