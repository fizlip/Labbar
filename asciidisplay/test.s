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
  25              		.file 1 "C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay/startup.c"
   1:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** /*
   2:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c ****  * 	startup.c
   3:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c ****  *
   4:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c ****  */ 
   5:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
   7:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** void startup ( void )
   8:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** {
  26              		.loc 1 8 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** __asm volatile(
  31              		.loc 1 9 0
  32              		.syntax divided
  33              	@ 9 "C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  10:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	" MOV SP,R0\n"
  12:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	" BL main\n"				/* call main */
  13:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	"_exit: B .\n"				/* never return */
  14:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	) ;
  15:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** }
  40              		.loc 1 15 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	ascii_ctrl_bit_set
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	ascii_ctrl_bit_set:
  56              	.LFB1:
  16:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
  17:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
  18:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** #define PORT_BASE 	 0x40021000
  19:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** #define portModer 	((volatile unsigned long *) 	(PORT_BASE))
  20:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** #define portOtyper	((volatile unsigned short *) 	(PORT_BASE+0x4))
  21:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** #define portOspeedr	((volatile unsigned long *) 	(PORT_BASE+0x8))
  22:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** #define portPupdr 	((volatile unsigned long *)		(PORT_BASE+0xC))
  23:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** #define portIdrLow 	((volatile unsigned char *) 	(PORT_BASE+0x10))
  24:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** #define portIdrHigh ((volatile unsigned char *) 	(PORT_BASE+0x11))
  25:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** #define portOdrLow 	((volatile unsigned char *) 	(PORT_BASE+0x14))
  26:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** #define portOdrHigh ((volatile unsigned char *) 	(PORT_BASE+0x15))
  27:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** #define B_E 		0x40
  28:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** #define B_SELECT 	0x4
  29:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** #define B_RW 		0x2
  30:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** #define B_RS 		0x1
  31:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
  32:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** // addessera ASCII-display och ettställ de bitar som är 1 i x
  33:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** void ascii_ctrl_bit_set( unsigned char x ){
  57              		.loc 1 33 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 16
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 84B0     		sub	sp, sp, #16
  66              		.cfi_def_cfa_offset 24
  67 0004 00AF     		add	r7, sp, #0
  68              		.cfi_def_cfa_register 7
  69 0006 0200     		movs	r2, r0
  70 0008 FB1D     		adds	r3, r7, #7
  71 000a 1A70     		strb	r2, [r3]
  34:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	unsigned char c;
  35:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	c = *portOdrLow;
  72              		.loc 1 35 0
  73 000c 0C4A     		ldr	r2, .L3
  74 000e 0F21     		movs	r1, #15
  75 0010 7B18     		adds	r3, r7, r1
  76 0012 1278     		ldrb	r2, [r2]
  77 0014 1A70     		strb	r2, [r3]
  36:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	c |= ( B_SELECT | x);
  78              		.loc 1 36 0
  79 0016 FA1D     		adds	r2, r7, #7
  80 0018 7B18     		adds	r3, r7, r1
  81 001a 1278     		ldrb	r2, [r2]
  82 001c 1B78     		ldrb	r3, [r3]
  83 001e 1343     		orrs	r3, r2
  84 0020 DAB2     		uxtb	r2, r3
  85 0022 0800     		movs	r0, r1
  86 0024 7B18     		adds	r3, r7, r1
  87 0026 0421     		movs	r1, #4
  88 0028 0A43     		orrs	r2, r1
  89 002a 1A70     		strb	r2, [r3]
  37:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	*portOdrLow = c;
  90              		.loc 1 37 0
  91 002c 044A     		ldr	r2, .L3
  92 002e 0100     		movs	r1, r0
  93 0030 7B18     		adds	r3, r7, r1
  94 0032 1B78     		ldrb	r3, [r3]
  95 0034 1370     		strb	r3, [r2]
  38:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** }
  96              		.loc 1 38 0
  97 0036 C046     		nop
  98 0038 BD46     		mov	sp, r7
  99 003a 04B0     		add	sp, sp, #16
 100              		@ sp needed
 101 003c 80BD     		pop	{r7, pc}
 102              	.L4:
 103 003e C046     		.align	2
 104              	.L3:
 105 0040 14100240 		.word	1073877012
 106              		.cfi_endproc
 107              	.LFE1:
 109              		.align	1
 110              		.global	ascii_ctrl_bit_clear
 111              		.syntax unified
 112              		.code	16
 113              		.thumb_func
 114              		.fpu softvfp
 116              	ascii_ctrl_bit_clear:
 117              	.LFB2:
  39:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
  40:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** void ascii_ctrl_bit_clear( unsigned char x ){
 118              		.loc 1 40 0
 119              		.cfi_startproc
 120              		@ args = 0, pretend = 0, frame = 16
 121              		@ frame_needed = 1, uses_anonymous_args = 0
 122 0044 80B5     		push	{r7, lr}
 123              		.cfi_def_cfa_offset 8
 124              		.cfi_offset 7, -8
 125              		.cfi_offset 14, -4
 126 0046 84B0     		sub	sp, sp, #16
 127              		.cfi_def_cfa_offset 24
 128 0048 00AF     		add	r7, sp, #0
 129              		.cfi_def_cfa_register 7
 130 004a 0200     		movs	r2, r0
 131 004c FB1D     		adds	r3, r7, #7
 132 004e 1A70     		strb	r2, [r3]
  41:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	unsigned char c;
  42:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	c = *portOdrLow;
 133              		.loc 1 42 0
 134 0050 0D4A     		ldr	r2, .L6
 135 0052 0F21     		movs	r1, #15
 136 0054 7B18     		adds	r3, r7, r1
 137 0056 1278     		ldrb	r2, [r2]
 138 0058 1A70     		strb	r2, [r3]
  43:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	c = B_SELECT | ( c & ~x );
 139              		.loc 1 43 0
 140 005a FB1D     		adds	r3, r7, #7
 141 005c 1B78     		ldrb	r3, [r3]
 142 005e 5BB2     		sxtb	r3, r3
 143 0060 DB43     		mvns	r3, r3
 144 0062 5BB2     		sxtb	r3, r3
 145 0064 7A18     		adds	r2, r7, r1
 146 0066 1278     		ldrb	r2, [r2]
 147 0068 52B2     		sxtb	r2, r2
 148 006a 1340     		ands	r3, r2
 149 006c 5BB2     		sxtb	r3, r3
 150 006e 0422     		movs	r2, #4
 151 0070 1343     		orrs	r3, r2
 152 0072 5AB2     		sxtb	r2, r3
 153 0074 7B18     		adds	r3, r7, r1
 154 0076 1A70     		strb	r2, [r3]
  44:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	*portOdrLow = c;
 155              		.loc 1 44 0
 156 0078 034A     		ldr	r2, .L6
 157 007a 7B18     		adds	r3, r7, r1
 158 007c 1B78     		ldrb	r3, [r3]
 159 007e 1370     		strb	r3, [r2]
  45:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** }
 160              		.loc 1 45 0
 161 0080 C046     		nop
 162 0082 BD46     		mov	sp, r7
 163 0084 04B0     		add	sp, sp, #16
 164              		@ sp needed
 165 0086 80BD     		pop	{r7, pc}
 166              	.L7:
 167              		.align	2
 168              	.L6:
 169 0088 14100240 		.word	1073877012
 170              		.cfi_endproc
 171              	.LFE2:
 173              		.align	1
 174              		.global	ascii_write_controller
 175              		.syntax unified
 176              		.code	16
 177              		.thumb_func
 178              		.fpu softvfp
 180              	ascii_write_controller:
 181              	.LFB3:
  46:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
  47:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** void ascii_write_controller( unsigned char byte ){
 182              		.loc 1 47 0
 183              		.cfi_startproc
 184              		@ args = 0, pretend = 0, frame = 8
 185              		@ frame_needed = 1, uses_anonymous_args = 0
 186 008c 80B5     		push	{r7, lr}
 187              		.cfi_def_cfa_offset 8
 188              		.cfi_offset 7, -8
 189              		.cfi_offset 14, -4
 190 008e 82B0     		sub	sp, sp, #8
 191              		.cfi_def_cfa_offset 16
 192 0090 00AF     		add	r7, sp, #0
 193              		.cfi_def_cfa_register 7
 194 0092 0200     		movs	r2, r0
 195 0094 FB1D     		adds	r3, r7, #7
 196 0096 1A70     		strb	r2, [r3]
  48:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	//Delay 40 ns
  49:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_E);
 197              		.loc 1 49 0
 198 0098 4020     		movs	r0, #64
 199 009a FFF7FEFF 		bl	ascii_ctrl_bit_set
  50:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	*portOdrHigh = byte;
 200              		.loc 1 50 0
 201 009e 064A     		ldr	r2, .L9
 202 00a0 FB1D     		adds	r3, r7, #7
 203 00a2 1B78     		ldrb	r3, [r3]
 204 00a4 1370     		strb	r3, [r2]
  51:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	delay_250ns();
 205              		.loc 1 51 0
 206 00a6 FFF7FEFF 		bl	delay_250ns
  52:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_E);
 207              		.loc 1 52 0
 208 00aa 4020     		movs	r0, #64
 209 00ac FFF7FEFF 		bl	ascii_ctrl_bit_clear
  53:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	//Delay 10 ns
  54:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** }
 210              		.loc 1 54 0
 211 00b0 C046     		nop
 212 00b2 BD46     		mov	sp, r7
 213 00b4 02B0     		add	sp, sp, #8
 214              		@ sp needed
 215 00b6 80BD     		pop	{r7, pc}
 216              	.L10:
 217              		.align	2
 218              	.L9:
 219 00b8 15100240 		.word	1073877013
 220              		.cfi_endproc
 221              	.LFE3:
 223              		.align	1
 224              		.global	ascii_write_cmd
 225              		.syntax unified
 226              		.code	16
 227              		.thumb_func
 228              		.fpu softvfp
 230              	ascii_write_cmd:
 231              	.LFB4:
  55:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
  56:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** void ascii_write_cmd( unsigned char command ){
 232              		.loc 1 56 0
 233              		.cfi_startproc
 234              		@ args = 0, pretend = 0, frame = 8
 235              		@ frame_needed = 1, uses_anonymous_args = 0
 236 00bc 80B5     		push	{r7, lr}
 237              		.cfi_def_cfa_offset 8
 238              		.cfi_offset 7, -8
 239              		.cfi_offset 14, -4
 240 00be 82B0     		sub	sp, sp, #8
 241              		.cfi_def_cfa_offset 16
 242 00c0 00AF     		add	r7, sp, #0
 243              		.cfi_def_cfa_register 7
 244 00c2 0200     		movs	r2, r0
 245 00c4 FB1D     		adds	r3, r7, #7
 246 00c6 1A70     		strb	r2, [r3]
  57:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear( B_RS );
 247              		.loc 1 57 0
 248 00c8 0120     		movs	r0, #1
 249 00ca FFF7FEFF 		bl	ascii_ctrl_bit_clear
  58:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear( B_RW );
 250              		.loc 1 58 0
 251 00ce 0220     		movs	r0, #2
 252 00d0 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  59:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_write_controller( command );
 253              		.loc 1 59 0
 254 00d4 FB1D     		adds	r3, r7, #7
 255 00d6 1B78     		ldrb	r3, [r3]
 256 00d8 1800     		movs	r0, r3
 257 00da FFF7FEFF 		bl	ascii_write_controller
  60:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** }
 258              		.loc 1 60 0
 259 00de C046     		nop
 260 00e0 BD46     		mov	sp, r7
 261 00e2 02B0     		add	sp, sp, #8
 262              		@ sp needed
 263 00e4 80BD     		pop	{r7, pc}
 264              		.cfi_endproc
 265              	.LFE4:
 267              		.align	1
 268              		.global	ascii_write_data
 269              		.syntax unified
 270              		.code	16
 271              		.thumb_func
 272              		.fpu softvfp
 274              	ascii_write_data:
 275              	.LFB5:
  61:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
  62:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** void ascii_write_data( data ){
 276              		.loc 1 62 0
 277              		.cfi_startproc
 278              		@ args = 0, pretend = 0, frame = 8
 279              		@ frame_needed = 1, uses_anonymous_args = 0
 280 00e6 80B5     		push	{r7, lr}
 281              		.cfi_def_cfa_offset 8
 282              		.cfi_offset 7, -8
 283              		.cfi_offset 14, -4
 284 00e8 82B0     		sub	sp, sp, #8
 285              		.cfi_def_cfa_offset 16
 286 00ea 00AF     		add	r7, sp, #0
 287              		.cfi_def_cfa_register 7
 288 00ec 7860     		str	r0, [r7, #4]
  63:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_set( B_RS );
 289              		.loc 1 63 0
 290 00ee 0120     		movs	r0, #1
 291 00f0 FFF7FEFF 		bl	ascii_ctrl_bit_set
  64:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear( B_RW );
 292              		.loc 1 64 0
 293 00f4 0220     		movs	r0, #2
 294 00f6 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  65:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_write_controller( data );
 295              		.loc 1 65 0
 296 00fa 7B68     		ldr	r3, [r7, #4]
 297 00fc DBB2     		uxtb	r3, r3
 298 00fe 1800     		movs	r0, r3
 299 0100 FFF7FEFF 		bl	ascii_write_controller
  66:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** }
 300              		.loc 1 66 0
 301 0104 C046     		nop
 302 0106 BD46     		mov	sp, r7
 303 0108 02B0     		add	sp, sp, #8
 304              		@ sp needed
 305 010a 80BD     		pop	{r7, pc}
 306              		.cfi_endproc
 307              	.LFE5:
 309              		.align	1
 310              		.global	ascii_read_controller
 311              		.syntax unified
 312              		.code	16
 313              		.thumb_func
 314              		.fpu softvfp
 316              	ascii_read_controller:
 317              	.LFB6:
  67:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
  68:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** unsigned char ascii_read_controller( void ){
 318              		.loc 1 68 0
 319              		.cfi_startproc
 320              		@ args = 0, pretend = 0, frame = 8
 321              		@ frame_needed = 1, uses_anonymous_args = 0
 322 010c 80B5     		push	{r7, lr}
 323              		.cfi_def_cfa_offset 8
 324              		.cfi_offset 7, -8
 325              		.cfi_offset 14, -4
 326 010e 82B0     		sub	sp, sp, #8
 327              		.cfi_def_cfa_offset 16
 328 0110 00AF     		add	r7, sp, #0
 329              		.cfi_def_cfa_register 7
  69:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	unsigned char c;
  70:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_set( B_E );
 330              		.loc 1 70 0
 331 0112 4020     		movs	r0, #64
 332 0114 FFF7FEFF 		bl	ascii_ctrl_bit_set
  71:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	delay_250ns();
 333              		.loc 1 71 0
 334 0118 FFF7FEFF 		bl	delay_250ns
  72:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	delay_250ns();
 335              		.loc 1 72 0
 336 011c FFF7FEFF 		bl	delay_250ns
  73:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	c = *portIdrHigh;
 337              		.loc 1 73 0
 338 0120 064A     		ldr	r2, .L15
 339 0122 FB1D     		adds	r3, r7, #7
 340 0124 1278     		ldrb	r2, [r2]
 341 0126 1A70     		strb	r2, [r3]
  74:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear( B_E );
 342              		.loc 1 74 0
 343 0128 4020     		movs	r0, #64
 344 012a FFF7FEFF 		bl	ascii_ctrl_bit_clear
  75:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	return c;
 345              		.loc 1 75 0
 346 012e FB1D     		adds	r3, r7, #7
 347 0130 1B78     		ldrb	r3, [r3]
  76:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** }
 348              		.loc 1 76 0
 349 0132 1800     		movs	r0, r3
 350 0134 BD46     		mov	sp, r7
 351 0136 02B0     		add	sp, sp, #8
 352              		@ sp needed
 353 0138 80BD     		pop	{r7, pc}
 354              	.L16:
 355 013a C046     		.align	2
 356              	.L15:
 357 013c 11100240 		.word	1073877009
 358              		.cfi_endproc
 359              	.LFE6:
 361              		.align	1
 362              		.global	ascii_read_status
 363              		.syntax unified
 364              		.code	16
 365              		.thumb_func
 366              		.fpu softvfp
 368              	ascii_read_status:
 369              	.LFB7:
  77:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
  78:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** unsigned char ascii_read_status( void ){
 370              		.loc 1 78 0
 371              		.cfi_startproc
 372              		@ args = 0, pretend = 0, frame = 8
 373              		@ frame_needed = 1, uses_anonymous_args = 0
 374 0140 90B5     		push	{r4, r7, lr}
 375              		.cfi_def_cfa_offset 12
 376              		.cfi_offset 4, -12
 377              		.cfi_offset 7, -8
 378              		.cfi_offset 14, -4
 379 0142 83B0     		sub	sp, sp, #12
 380              		.cfi_def_cfa_offset 24
 381 0144 00AF     		add	r7, sp, #0
 382              		.cfi_def_cfa_register 7
  79:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	*portModer = 0x00005555;
 383              		.loc 1 79 0
 384 0146 0B4B     		ldr	r3, .L19
 385 0148 0B4A     		ldr	r2, .L19+4
 386 014a 1A60     		str	r2, [r3]
  80:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear( B_RS );
 387              		.loc 1 80 0
 388 014c 0120     		movs	r0, #1
 389 014e FFF7FEFF 		bl	ascii_ctrl_bit_clear
  81:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_set( B_RW );
 390              		.loc 1 81 0
 391 0152 0220     		movs	r0, #2
 392 0154 FFF7FEFF 		bl	ascii_ctrl_bit_set
  82:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	unsigned char rv = ascii_read_controller();
 393              		.loc 1 82 0
 394 0158 FC1D     		adds	r4, r7, #7
 395 015a FFF7FEFF 		bl	ascii_read_controller
 396 015e 0300     		movs	r3, r0
 397 0160 2370     		strb	r3, [r4]
  83:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	*portModer = 0x55555555;
 398              		.loc 1 83 0
 399 0162 044B     		ldr	r3, .L19
 400 0164 054A     		ldr	r2, .L19+8
 401 0166 1A60     		str	r2, [r3]
  84:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	return rv;
 402              		.loc 1 84 0
 403 0168 FB1D     		adds	r3, r7, #7
 404 016a 1B78     		ldrb	r3, [r3]
  85:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** }
 405              		.loc 1 85 0
 406 016c 1800     		movs	r0, r3
 407 016e BD46     		mov	sp, r7
 408 0170 03B0     		add	sp, sp, #12
 409              		@ sp needed
 410 0172 90BD     		pop	{r4, r7, pc}
 411              	.L20:
 412              		.align	2
 413              	.L19:
 414 0174 00100240 		.word	1073876992
 415 0178 55550000 		.word	21845
 416 017c 55555555 		.word	1431655765
 417              		.cfi_endproc
 418              	.LFE7:
 420              		.align	1
 421              		.global	ascii_read_data
 422              		.syntax unified
 423              		.code	16
 424              		.thumb_func
 425              		.fpu softvfp
 427              	ascii_read_data:
 428              	.LFB8:
  86:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
  87:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** unsigned char ascii_read_data( void ){
 429              		.loc 1 87 0
 430              		.cfi_startproc
 431              		@ args = 0, pretend = 0, frame = 8
 432              		@ frame_needed = 1, uses_anonymous_args = 0
 433 0180 90B5     		push	{r4, r7, lr}
 434              		.cfi_def_cfa_offset 12
 435              		.cfi_offset 4, -12
 436              		.cfi_offset 7, -8
 437              		.cfi_offset 14, -4
 438 0182 83B0     		sub	sp, sp, #12
 439              		.cfi_def_cfa_offset 24
 440 0184 00AF     		add	r7, sp, #0
 441              		.cfi_def_cfa_register 7
  88:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	*portModer = 0x00005555;
 442              		.loc 1 88 0
 443 0186 0B4B     		ldr	r3, .L23
 444 0188 0B4A     		ldr	r2, .L23+4
 445 018a 1A60     		str	r2, [r3]
  89:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_set( B_RS );
 446              		.loc 1 89 0
 447 018c 0120     		movs	r0, #1
 448 018e FFF7FEFF 		bl	ascii_ctrl_bit_set
  90:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_set( B_RW );
 449              		.loc 1 90 0
 450 0192 0220     		movs	r0, #2
 451 0194 FFF7FEFF 		bl	ascii_ctrl_bit_set
  91:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	unsigned char rv = ascii_read_controller();
 452              		.loc 1 91 0
 453 0198 FC1D     		adds	r4, r7, #7
 454 019a FFF7FEFF 		bl	ascii_read_controller
 455 019e 0300     		movs	r3, r0
 456 01a0 2370     		strb	r3, [r4]
  92:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	*portModer = 0x55555555;
 457              		.loc 1 92 0
 458 01a2 044B     		ldr	r3, .L23
 459 01a4 054A     		ldr	r2, .L23+8
 460 01a6 1A60     		str	r2, [r3]
  93:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	return rv;
 461              		.loc 1 93 0
 462 01a8 FB1D     		adds	r3, r7, #7
 463 01aa 1B78     		ldrb	r3, [r3]
  94:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** }
 464              		.loc 1 94 0
 465 01ac 1800     		movs	r0, r3
 466 01ae BD46     		mov	sp, r7
 467 01b0 03B0     		add	sp, sp, #12
 468              		@ sp needed
 469 01b2 90BD     		pop	{r4, r7, pc}
 470              	.L24:
 471              		.align	2
 472              	.L23:
 473 01b4 00100240 		.word	1073876992
 474 01b8 55550000 		.word	21845
 475 01bc 55555555 		.word	1431655765
 476              		.cfi_endproc
 477              	.LFE8:
 479              		.align	1
 480              		.global	delay_250ns
 481              		.syntax unified
 482              		.code	16
 483              		.thumb_func
 484              		.fpu softvfp
 486              	delay_250ns:
 487              	.LFB9:
  95:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
  96:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** void delay_250ns( void ){
 488              		.loc 1 96 0
 489              		.cfi_startproc
 490              		@ args = 0, pretend = 0, frame = 0
 491              		@ frame_needed = 1, uses_anonymous_args = 0
 492 01c0 80B5     		push	{r7, lr}
 493              		.cfi_def_cfa_offset 8
 494              		.cfi_offset 7, -8
 495              		.cfi_offset 14, -4
 496 01c2 00AF     		add	r7, sp, #0
 497              		.cfi_def_cfa_register 7
  97:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	* ( (unsigned long *) 0xE000E010) = 0x0;
 498              		.loc 1 97 0
 499 01c4 094B     		ldr	r3, .L26
 500 01c6 0022     		movs	r2, #0
 501 01c8 1A60     		str	r2, [r3]
  98:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	* ( (unsigned long *) 0xE000E014) = ( (168/4) -1 );
 502              		.loc 1 98 0
 503 01ca 094B     		ldr	r3, .L26+4
 504 01cc 2922     		movs	r2, #41
 505 01ce 1A60     		str	r2, [r3]
  99:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	* ( (unsigned long *) 0xE000E018) = 0x0;
 506              		.loc 1 99 0
 507 01d0 084B     		ldr	r3, .L26+8
 508 01d2 0022     		movs	r2, #0
 509 01d4 1A60     		str	r2, [r3]
 100:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	* ( (unsigned char *) 0xE000E010) = 0x5;
 510              		.loc 1 100 0
 511 01d6 054B     		ldr	r3, .L26
 512 01d8 0522     		movs	r2, #5
 513 01da 1A70     		strb	r2, [r3]
 101:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	while(* ( (unsigned char *) 0xE000E010) & 0x10000 == 0){}
 514              		.loc 1 101 0
 515 01dc C046     		nop
 102:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	* ( (unsigned long *) 0xE000E010) = 0x0;
 516              		.loc 1 102 0
 517 01de 034B     		ldr	r3, .L26
 518 01e0 0022     		movs	r2, #0
 519 01e2 1A60     		str	r2, [r3]
 103:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** }
 520              		.loc 1 103 0
 521 01e4 C046     		nop
 522 01e6 BD46     		mov	sp, r7
 523              		@ sp needed
 524 01e8 80BD     		pop	{r7, pc}
 525              	.L27:
 526 01ea C046     		.align	2
 527              	.L26:
 528 01ec 10E000E0 		.word	-536813552
 529 01f0 14E000E0 		.word	-536813548
 530 01f4 18E000E0 		.word	-536813544
 531              		.cfi_endproc
 532              	.LFE9:
 534              		.align	1
 535              		.global	delay_mikro
 536              		.syntax unified
 537              		.code	16
 538              		.thumb_func
 539              		.fpu softvfp
 541              	delay_mikro:
 542              	.LFB10:
 104:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
 105:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** void delay_mikro(unsigned int us){
 543              		.loc 1 105 0
 544              		.cfi_startproc
 545              		@ args = 0, pretend = 0, frame = 16
 546              		@ frame_needed = 1, uses_anonymous_args = 0
 547 01f8 80B5     		push	{r7, lr}
 548              		.cfi_def_cfa_offset 8
 549              		.cfi_offset 7, -8
 550              		.cfi_offset 14, -4
 551 01fa 84B0     		sub	sp, sp, #16
 552              		.cfi_def_cfa_offset 24
 553 01fc 00AF     		add	r7, sp, #0
 554              		.cfi_def_cfa_register 7
 555 01fe 7860     		str	r0, [r7, #4]
 556              	.LBB2:
 106:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	for(int i = 0; i < us; i++){
 557              		.loc 1 106 0
 558 0200 0023     		movs	r3, #0
 559 0202 FB60     		str	r3, [r7, #12]
 560 0204 0DE0     		b	.L29
 561              	.L32:
 562              	.LBB3:
 107:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 		for(int j = 0; j < 4; j++){
 563              		.loc 1 107 0
 564 0206 0023     		movs	r3, #0
 565 0208 BB60     		str	r3, [r7, #8]
 566 020a 04E0     		b	.L30
 567              	.L31:
 108:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 			delay_250ns();
 568              		.loc 1 108 0 discriminator 3
 569 020c FFF7FEFF 		bl	delay_250ns
 107:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 		for(int j = 0; j < 4; j++){
 570              		.loc 1 107 0 discriminator 3
 571 0210 BB68     		ldr	r3, [r7, #8]
 572 0212 0133     		adds	r3, r3, #1
 573 0214 BB60     		str	r3, [r7, #8]
 574              	.L30:
 107:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 		for(int j = 0; j < 4; j++){
 575              		.loc 1 107 0 is_stmt 0 discriminator 1
 576 0216 BB68     		ldr	r3, [r7, #8]
 577 0218 032B     		cmp	r3, #3
 578 021a F7DD     		ble	.L31
 579              	.LBE3:
 106:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	for(int i = 0; i < us; i++){
 580              		.loc 1 106 0 is_stmt 1 discriminator 2
 581 021c FB68     		ldr	r3, [r7, #12]
 582 021e 0133     		adds	r3, r3, #1
 583 0220 FB60     		str	r3, [r7, #12]
 584              	.L29:
 106:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	for(int i = 0; i < us; i++){
 585              		.loc 1 106 0 is_stmt 0 discriminator 1
 586 0222 FB68     		ldr	r3, [r7, #12]
 587 0224 7A68     		ldr	r2, [r7, #4]
 588 0226 9A42     		cmp	r2, r3
 589 0228 EDD8     		bhi	.L32
 590              	.LBE2:
 109:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 		}
 110:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	}
 111:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** }
 591              		.loc 1 111 0 is_stmt 1
 592 022a C046     		nop
 593 022c BD46     		mov	sp, r7
 594 022e 04B0     		add	sp, sp, #16
 595              		@ sp needed
 596 0230 80BD     		pop	{r7, pc}
 597              		.cfi_endproc
 598              	.LFE10:
 600              		.align	1
 601              		.global	delay_milli
 602              		.syntax unified
 603              		.code	16
 604              		.thumb_func
 605              		.fpu softvfp
 607              	delay_milli:
 608              	.LFB11:
 112:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
 113:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** void delay_milli(unsigned int ms){
 609              		.loc 1 113 0
 610              		.cfi_startproc
 611              		@ args = 0, pretend = 0, frame = 16
 612              		@ frame_needed = 1, uses_anonymous_args = 0
 613 0232 80B5     		push	{r7, lr}
 614              		.cfi_def_cfa_offset 8
 615              		.cfi_offset 7, -8
 616              		.cfi_offset 14, -4
 617 0234 84B0     		sub	sp, sp, #16
 618              		.cfi_def_cfa_offset 24
 619 0236 00AF     		add	r7, sp, #0
 620              		.cfi_def_cfa_register 7
 621 0238 7860     		str	r0, [r7, #4]
 114:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	int i;
 115:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	while( ms-- ){
 622              		.loc 1 115 0
 623 023a 11E0     		b	.L34
 624              	.L37:
 116:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 		for( i = 0; i < 1000; i++){
 625              		.loc 1 116 0
 626 023c 0023     		movs	r3, #0
 627 023e FB60     		str	r3, [r7, #12]
 628 0240 0AE0     		b	.L35
 629              	.L36:
 117:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 			delay_250ns();
 630              		.loc 1 117 0 discriminator 3
 631 0242 FFF7FEFF 		bl	delay_250ns
 118:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 			delay_250ns();
 632              		.loc 1 118 0 discriminator 3
 633 0246 FFF7FEFF 		bl	delay_250ns
 119:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 			delay_250ns();
 634              		.loc 1 119 0 discriminator 3
 635 024a FFF7FEFF 		bl	delay_250ns
 120:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 			delay_250ns();
 636              		.loc 1 120 0 discriminator 3
 637 024e FFF7FEFF 		bl	delay_250ns
 116:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 			delay_250ns();
 638              		.loc 1 116 0 discriminator 3
 639 0252 FB68     		ldr	r3, [r7, #12]
 640 0254 0133     		adds	r3, r3, #1
 641 0256 FB60     		str	r3, [r7, #12]
 642              	.L35:
 116:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 			delay_250ns();
 643              		.loc 1 116 0 is_stmt 0 discriminator 1
 644 0258 FB68     		ldr	r3, [r7, #12]
 645 025a 064A     		ldr	r2, .L38
 646 025c 9342     		cmp	r3, r2
 647 025e F0DD     		ble	.L36
 648              	.L34:
 115:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 		for( i = 0; i < 1000; i++){
 649              		.loc 1 115 0 is_stmt 1
 650 0260 7B68     		ldr	r3, [r7, #4]
 651 0262 5A1E     		subs	r2, r3, #1
 652 0264 7A60     		str	r2, [r7, #4]
 653 0266 002B     		cmp	r3, #0
 654 0268 E8D1     		bne	.L37
 121:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 		}
 122:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	}
 123:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** }
 655              		.loc 1 123 0
 656 026a C046     		nop
 657 026c BD46     		mov	sp, r7
 658 026e 04B0     		add	sp, sp, #16
 659              		@ sp needed
 660 0270 80BD     		pop	{r7, pc}
 661              	.L39:
 662 0272 C046     		.align	2
 663              	.L38:
 664 0274 E7030000 		.word	999
 665              		.cfi_endproc
 666              	.LFE11:
 668              		.align	1
 669              		.global	ascii_init
 670              		.syntax unified
 671              		.code	16
 672              		.thumb_func
 673              		.fpu softvfp
 675              	ascii_init:
 676              	.LFB12:
 124:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
 125:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** void ascii_init( void ){
 677              		.loc 1 125 0
 678              		.cfi_startproc
 679              		@ args = 0, pretend = 0, frame = 0
 680              		@ frame_needed = 1, uses_anonymous_args = 0
 681 0278 80B5     		push	{r7, lr}
 682              		.cfi_def_cfa_offset 8
 683              		.cfi_offset 7, -8
 684              		.cfi_offset 14, -4
 685 027a 00AF     		add	r7, sp, #0
 686              		.cfi_def_cfa_register 7
 126:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	//Function set
 127:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	while( (ascii_read_status() & 0x80) == 0x80){}
 687              		.loc 1 127 0
 688 027c C046     		nop
 689              	.L41:
 690              		.loc 1 127 0 is_stmt 0 discriminator 1
 691 027e FFF7FEFF 		bl	ascii_read_status
 692 0282 0300     		movs	r3, r0
 693 0284 1A00     		movs	r2, r3
 694 0286 8023     		movs	r3, #128
 695 0288 1340     		ands	r3, r2
 696 028a 802B     		cmp	r3, #128
 697 028c F7D0     		beq	.L41
 128:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	delay_mikro( 8 );
 698              		.loc 1 128 0 is_stmt 1
 699 028e 0820     		movs	r0, #8
 700 0290 FFF7FEFF 		bl	delay_mikro
 129:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_write_cmd( 0b111000 );
 701              		.loc 1 129 0
 702 0294 3820     		movs	r0, #56
 703 0296 FFF7FEFF 		bl	ascii_write_cmd
 130:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	delay_mikro( 39 );
 704              		.loc 1 130 0
 705 029a 2720     		movs	r0, #39
 706 029c FFF7FEFF 		bl	delay_mikro
 131:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	//Display control
 132:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	while( (ascii_read_status() & 0x80) == 0x80){}
 707              		.loc 1 132 0
 708 02a0 C046     		nop
 709              	.L42:
 710              		.loc 1 132 0 is_stmt 0 discriminator 1
 711 02a2 FFF7FEFF 		bl	ascii_read_status
 712 02a6 0300     		movs	r3, r0
 713 02a8 1A00     		movs	r2, r3
 714 02aa 8023     		movs	r3, #128
 715 02ac 1340     		ands	r3, r2
 716 02ae 802B     		cmp	r3, #128
 717 02b0 F7D0     		beq	.L42
 133:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	delay_mikro( 8 );
 718              		.loc 1 133 0 is_stmt 1
 719 02b2 0820     		movs	r0, #8
 720 02b4 FFF7FEFF 		bl	delay_mikro
 134:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_write_cmd( 0b1110 );
 721              		.loc 1 134 0
 722 02b8 0E20     		movs	r0, #14
 723 02ba FFF7FEFF 		bl	ascii_write_cmd
 135:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	delay_mikro( 39 );
 724              		.loc 1 135 0
 725 02be 2720     		movs	r0, #39
 726 02c0 FFF7FEFF 		bl	delay_mikro
 136:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	//Clear Display
 137:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	while( (ascii_read_status() & 0x80) == 0x80){}
 727              		.loc 1 137 0
 728 02c4 C046     		nop
 729              	.L43:
 730              		.loc 1 137 0 is_stmt 0 discriminator 1
 731 02c6 FFF7FEFF 		bl	ascii_read_status
 732 02ca 0300     		movs	r3, r0
 733 02cc 1A00     		movs	r2, r3
 734 02ce 8023     		movs	r3, #128
 735 02d0 1340     		ands	r3, r2
 736 02d2 802B     		cmp	r3, #128
 737 02d4 F7D0     		beq	.L43
 138:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	delay_mikro( 8 );
 738              		.loc 1 138 0 is_stmt 1
 739 02d6 0820     		movs	r0, #8
 740 02d8 FFF7FEFF 		bl	delay_mikro
 139:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_write_cmd( 0b1 );
 741              		.loc 1 139 0
 742 02dc 0120     		movs	r0, #1
 743 02de FFF7FEFF 		bl	ascii_write_cmd
 140:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	delay_milli( 2 );
 744              		.loc 1 140 0
 745 02e2 0220     		movs	r0, #2
 746 02e4 FFF7FEFF 		bl	delay_milli
 141:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	//Entry mode set
 142:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	while( (ascii_read_status() & 0x80) == 0x80){}
 747              		.loc 1 142 0
 748 02e8 C046     		nop
 749              	.L44:
 750              		.loc 1 142 0 is_stmt 0 discriminator 1
 751 02ea FFF7FEFF 		bl	ascii_read_status
 752 02ee 0300     		movs	r3, r0
 753 02f0 1A00     		movs	r2, r3
 754 02f2 8023     		movs	r3, #128
 755 02f4 1340     		ands	r3, r2
 756 02f6 802B     		cmp	r3, #128
 757 02f8 F7D0     		beq	.L44
 143:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	delay_mikro( 8 );
 758              		.loc 1 143 0 is_stmt 1
 759 02fa 0820     		movs	r0, #8
 760 02fc FFF7FEFF 		bl	delay_mikro
 144:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_write_cmd( 0b110 );
 761              		.loc 1 144 0
 762 0300 0620     		movs	r0, #6
 763 0302 FFF7FEFF 		bl	ascii_write_cmd
 145:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	delay_mikro( 39 );
 764              		.loc 1 145 0
 765 0306 2720     		movs	r0, #39
 766 0308 FFF7FEFF 		bl	delay_mikro
 146:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** }
 767              		.loc 1 146 0
 768 030c C046     		nop
 769 030e BD46     		mov	sp, r7
 770              		@ sp needed
 771 0310 80BD     		pop	{r7, pc}
 772              		.cfi_endproc
 773              	.LFE12:
 775              		.align	1
 776              		.global	ascii_gotoxy
 777              		.syntax unified
 778              		.code	16
 779              		.thumb_func
 780              		.fpu softvfp
 782              	ascii_gotoxy:
 783              	.LFB13:
 147:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
 148:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** void ascii_gotoxy( int x, int y ){
 784              		.loc 1 148 0
 785              		.cfi_startproc
 786              		@ args = 0, pretend = 0, frame = 16
 787              		@ frame_needed = 1, uses_anonymous_args = 0
 788 0312 80B5     		push	{r7, lr}
 789              		.cfi_def_cfa_offset 8
 790              		.cfi_offset 7, -8
 791              		.cfi_offset 14, -4
 792 0314 84B0     		sub	sp, sp, #16
 793              		.cfi_def_cfa_offset 24
 794 0316 00AF     		add	r7, sp, #0
 795              		.cfi_def_cfa_register 7
 796 0318 7860     		str	r0, [r7, #4]
 797 031a 3960     		str	r1, [r7]
 149:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	int address = x-1;
 798              		.loc 1 149 0
 799 031c 7B68     		ldr	r3, [r7, #4]
 800 031e 013B     		subs	r3, r3, #1
 801 0320 FB60     		str	r3, [r7, #12]
 150:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	if( y == 2 ){
 802              		.loc 1 150 0
 803 0322 3B68     		ldr	r3, [r7]
 804 0324 022B     		cmp	r3, #2
 805 0326 02D1     		bne	.L46
 151:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 		address = address + 0x40;
 806              		.loc 1 151 0
 807 0328 FB68     		ldr	r3, [r7, #12]
 808 032a 4033     		adds	r3, r3, #64
 809 032c FB60     		str	r3, [r7, #12]
 810              	.L46:
 152:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	}
 153:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_write_cmd( 0x80 | address );
 811              		.loc 1 153 0
 812 032e FB68     		ldr	r3, [r7, #12]
 813 0330 5BB2     		sxtb	r3, r3
 814 0332 8022     		movs	r2, #128
 815 0334 5242     		rsbs	r2, r2, #0
 816 0336 1343     		orrs	r3, r2
 817 0338 5BB2     		sxtb	r3, r3
 818 033a DBB2     		uxtb	r3, r3
 819 033c 1800     		movs	r0, r3
 820 033e FFF7FEFF 		bl	ascii_write_cmd
 154:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	delay_mikro( 43 );
 821              		.loc 1 154 0
 822 0342 2B20     		movs	r0, #43
 823 0344 FFF7FEFF 		bl	delay_mikro
 155:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** }
 824              		.loc 1 155 0
 825 0348 C046     		nop
 826 034a BD46     		mov	sp, r7
 827 034c 04B0     		add	sp, sp, #16
 828              		@ sp needed
 829 034e 80BD     		pop	{r7, pc}
 830              		.cfi_endproc
 831              	.LFE13:
 833              		.align	1
 834              		.global	ascii_write_char
 835              		.syntax unified
 836              		.code	16
 837              		.thumb_func
 838              		.fpu softvfp
 840              	ascii_write_char:
 841              	.LFB14:
 156:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
 157:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** void ascii_write_char( unsigned char c ){
 842              		.loc 1 157 0
 843              		.cfi_startproc
 844              		@ args = 0, pretend = 0, frame = 8
 845              		@ frame_needed = 1, uses_anonymous_args = 0
 846 0350 80B5     		push	{r7, lr}
 847              		.cfi_def_cfa_offset 8
 848              		.cfi_offset 7, -8
 849              		.cfi_offset 14, -4
 850 0352 82B0     		sub	sp, sp, #8
 851              		.cfi_def_cfa_offset 16
 852 0354 00AF     		add	r7, sp, #0
 853              		.cfi_def_cfa_register 7
 854 0356 0200     		movs	r2, r0
 855 0358 FB1D     		adds	r3, r7, #7
 856 035a 1A70     		strb	r2, [r3]
 158:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	while ( (ascii_read_status() & 0x80) == 0x80 ){}
 857              		.loc 1 158 0
 858 035c C046     		nop
 859              	.L48:
 860              		.loc 1 158 0 is_stmt 0 discriminator 1
 861 035e FFF7FEFF 		bl	ascii_read_status
 862 0362 0300     		movs	r3, r0
 863 0364 1A00     		movs	r2, r3
 864 0366 8023     		movs	r3, #128
 865 0368 1340     		ands	r3, r2
 866 036a 802B     		cmp	r3, #128
 867 036c F7D0     		beq	.L48
 159:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	delay_mikro( 8 );
 868              		.loc 1 159 0 is_stmt 1
 869 036e 0820     		movs	r0, #8
 870 0370 FFF7FEFF 		bl	delay_mikro
 160:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_write_data( c );
 871              		.loc 1 160 0
 872 0374 FB1D     		adds	r3, r7, #7
 873 0376 1B78     		ldrb	r3, [r3]
 874 0378 1800     		movs	r0, r3
 875 037a FFF7FEFF 		bl	ascii_write_data
 161:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	delay_mikro( 43 );
 876              		.loc 1 161 0
 877 037e 2B20     		movs	r0, #43
 878 0380 FFF7FEFF 		bl	delay_mikro
 162:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** }
 879              		.loc 1 162 0
 880 0384 C046     		nop
 881 0386 BD46     		mov	sp, r7
 882 0388 02B0     		add	sp, sp, #8
 883              		@ sp needed
 884 038a 80BD     		pop	{r7, pc}
 885              		.cfi_endproc
 886              	.LFE14:
 888              		.align	1
 889              		.global	init_app
 890              		.syntax unified
 891              		.code	16
 892              		.thumb_func
 893              		.fpu softvfp
 895              	init_app:
 896              	.LFB15:
 163:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
 164:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** void init_app(){
 897              		.loc 1 164 0
 898              		.cfi_startproc
 899              		@ args = 0, pretend = 0, frame = 0
 900              		@ frame_needed = 1, uses_anonymous_args = 0
 901 038c 80B5     		push	{r7, lr}
 902              		.cfi_def_cfa_offset 8
 903              		.cfi_offset 7, -8
 904              		.cfi_offset 14, -4
 905 038e 00AF     		add	r7, sp, #0
 906              		.cfi_def_cfa_register 7
 165:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	*portModer   = 0x55555555;
 907              		.loc 1 165 0
 908 0390 054B     		ldr	r3, .L50
 909 0392 064A     		ldr	r2, .L50+4
 910 0394 1A60     		str	r2, [r3]
 166:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	*portOtyper  = 0x0000;
 911              		.loc 1 166 0
 912 0396 064B     		ldr	r3, .L50+8
 913 0398 0022     		movs	r2, #0
 914 039a 1A80     		strh	r2, [r3]
 167:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	*portOspeedr = 0x55555555;
 915              		.loc 1 167 0
 916 039c 054B     		ldr	r3, .L50+12
 917 039e 034A     		ldr	r2, .L50+4
 918 03a0 1A60     		str	r2, [r3]
 168:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** }
 919              		.loc 1 168 0
 920 03a2 C046     		nop
 921 03a4 BD46     		mov	sp, r7
 922              		@ sp needed
 923 03a6 80BD     		pop	{r7, pc}
 924              	.L51:
 925              		.align	2
 926              	.L50:
 927 03a8 00100240 		.word	1073876992
 928 03ac 55555555 		.word	1431655765
 929 03b0 04100240 		.word	1073876996
 930 03b4 08100240 		.word	1073877000
 931              		.cfi_endproc
 932              	.LFE15:
 934              		.section	.rodata
 935              		.align	2
 936              	.LC0:
 937 0000 20202020 		.ascii	"     *NYTT SALJ*\000"
 937      202A4E59 
 937      54542053 
 937      414C4A2A 
 937      00
 938 0011 000000   		.align	2
 939              	.LC2:
 940 0014 20204649 		.ascii	"  FILIP ZLATOIDSKY\000"
 940      4C495020 
 940      5A4C4154 
 940      4F494453 
 940      4B5900
 941              		.text
 942              		.align	1
 943              		.global	main
 944              		.syntax unified
 945              		.code	16
 946              		.thumb_func
 947              		.fpu softvfp
 949              	main:
 950              	.LFB16:
 169:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 
 170:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** int main(int argc, char **argv){
 951              		.loc 1 170 0
 952              		.cfi_startproc
 953              		@ args = 0, pretend = 0, frame = 56
 954              		@ frame_needed = 1, uses_anonymous_args = 0
 955 03b8 B0B5     		push	{r4, r5, r7, lr}
 956              		.cfi_def_cfa_offset 16
 957              		.cfi_offset 4, -16
 958              		.cfi_offset 5, -12
 959              		.cfi_offset 7, -8
 960              		.cfi_offset 14, -4
 961 03ba 8EB0     		sub	sp, sp, #56
 962              		.cfi_def_cfa_offset 72
 963 03bc 00AF     		add	r7, sp, #0
 964              		.cfi_def_cfa_register 7
 965 03be 7860     		str	r0, [r7, #4]
 966 03c0 3960     		str	r1, [r7]
 171:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	char *s;
 172:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	char test1[] = "     *NYTT SALJ*";
 967              		.loc 1 172 0
 968 03c2 2024     		movs	r4, #32
 969 03c4 3B19     		adds	r3, r7, r4
 970 03c6 204A     		ldr	r2, .L58
 971 03c8 23CA     		ldmia	r2!, {r0, r1, r5}
 972 03ca 23C3     		stmia	r3!, {r0, r1, r5}
 973 03cc 1168     		ldr	r1, [r2]
 974 03ce 1960     		str	r1, [r3]
 975 03d0 1279     		ldrb	r2, [r2, #4]
 976 03d2 1A71     		strb	r2, [r3, #4]
 173:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	char test2[] = "  FILIP ZLATOIDSKY";
 977              		.loc 1 173 0
 978 03d4 0C23     		movs	r3, #12
 979 03d6 FB18     		adds	r3, r7, r3
 980 03d8 1C4A     		ldr	r2, .L58+4
 981 03da 23CA     		ldmia	r2!, {r0, r1, r5}
 982 03dc 23C3     		stmia	r3!, {r0, r1, r5}
 983 03de 1168     		ldr	r1, [r2]
 984 03e0 1960     		str	r1, [r3]
 985 03e2 9188     		ldrh	r1, [r2, #4]
 986 03e4 9980     		strh	r1, [r3, #4]
 987 03e6 9279     		ldrb	r2, [r2, #6]
 988 03e8 9A71     		strb	r2, [r3, #6]
 174:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	
 175:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	init_app();
 989              		.loc 1 175 0
 990 03ea FFF7FEFF 		bl	init_app
 176:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_init();
 991              		.loc 1 176 0
 992 03ee FFF7FEFF 		bl	ascii_init
 177:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_gotoxy(1,1);
 993              		.loc 1 177 0
 994 03f2 0121     		movs	r1, #1
 995 03f4 0120     		movs	r0, #1
 996 03f6 FFF7FEFF 		bl	ascii_gotoxy
 178:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	s = test1;
 997              		.loc 1 178 0
 998 03fa 3B19     		adds	r3, r7, r4
 999 03fc 7B63     		str	r3, [r7, #52]
 179:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	while( *s )
 1000              		.loc 1 179 0
 1001 03fe 06E0     		b	.L53
 1002              	.L54:
 180:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 		ascii_write_char( *s++ );
 1003              		.loc 1 180 0
 1004 0400 7B6B     		ldr	r3, [r7, #52]
 1005 0402 5A1C     		adds	r2, r3, #1
 1006 0404 7A63     		str	r2, [r7, #52]
 1007 0406 1B78     		ldrb	r3, [r3]
 1008 0408 1800     		movs	r0, r3
 1009 040a FFF7FEFF 		bl	ascii_write_char
 1010              	.L53:
 179:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	while( *s )
 1011              		.loc 1 179 0
 1012 040e 7B6B     		ldr	r3, [r7, #52]
 1013 0410 1B78     		ldrb	r3, [r3]
 1014 0412 002B     		cmp	r3, #0
 1015 0414 F4D1     		bne	.L54
 181:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	ascii_gotoxy(1,2);
 1016              		.loc 1 181 0
 1017 0416 0221     		movs	r1, #2
 1018 0418 0120     		movs	r0, #1
 1019 041a FFF7FEFF 		bl	ascii_gotoxy
 182:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	s = test2;
 1020              		.loc 1 182 0
 1021 041e 0C23     		movs	r3, #12
 1022 0420 FB18     		adds	r3, r7, r3
 1023 0422 7B63     		str	r3, [r7, #52]
 183:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	while( *s )
 1024              		.loc 1 183 0
 1025 0424 06E0     		b	.L55
 1026              	.L56:
 184:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 		ascii_write_char( *s++ );
 1027              		.loc 1 184 0
 1028 0426 7B6B     		ldr	r3, [r7, #52]
 1029 0428 5A1C     		adds	r2, r3, #1
 1030 042a 7A63     		str	r2, [r7, #52]
 1031 042c 1B78     		ldrb	r3, [r3]
 1032 042e 1800     		movs	r0, r3
 1033 0430 FFF7FEFF 		bl	ascii_write_char
 1034              	.L55:
 183:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	while( *s )
 1035              		.loc 1 183 0
 1036 0434 7B6B     		ldr	r3, [r7, #52]
 1037 0436 1B78     		ldrb	r3, [r3]
 1038 0438 002B     		cmp	r3, #0
 1039 043a F4D1     		bne	.L56
 185:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** 	return 0;
 1040              		.loc 1 185 0
 1041 043c 0023     		movs	r3, #0
 186:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/asciidisplay\startup.c **** }
 1042              		.loc 1 186 0
 1043 043e 1800     		movs	r0, r3
 1044 0440 BD46     		mov	sp, r7
 1045 0442 0EB0     		add	sp, sp, #56
 1046              		@ sp needed
 1047 0444 B0BD     		pop	{r4, r5, r7, pc}
 1048              	.L59:
 1049 0446 C046     		.align	2
 1050              	.L58:
 1051 0448 00000000 		.word	.LC0
 1052 044c 14000000 		.word	.LC2
 1053              		.cfi_endproc
 1054              	.LFE16:
 1056              	.Letext0:
