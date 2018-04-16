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
  25              		.file 1 "C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4/startup.c"
   1:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** /*
   2:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c ****  * 	startup.c
   3:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c ****  *
   4:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c ****  */
   5:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 
   7:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** void startup ( void )
   8:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** {
  26              		.loc 1 8 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** __asm volatile(
  31              		.loc 1 9 0
  32              		.syntax divided
  33              	@ 9 "C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  10:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	" MOV SP,R0\n"
  12:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	" BL main\n"				/* call main */
  13:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	"_exit: B .\n"				/* never return */
  14:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	) ;
  15:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** }
  40              		.loc 1 15 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	app_init
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	app_init:
  56              	.LFB1:
  16:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 
  17:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** void app_init( void ){
  57              		.loc 1 17 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  18:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	//GPIO_MODER
  19:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	*( (unsigned long *) 0x40020C00) = 0x55005555;
  67              		.loc 1 19 0
  68 0004 0E4B     		ldr	r3, .L3
  69 0006 0F4A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  20:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	//GPIO_OTYPER
  21:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	*( (unsigned long *) 0x40020C04) &= 0xFFFF0FFF;
  71              		.loc 1 21 0
  72 000a 0F4B     		ldr	r3, .L3+8
  73 000c 1A68     		ldr	r2, [r3]
  74 000e 0E4B     		ldr	r3, .L3+8
  75 0010 0E49     		ldr	r1, .L3+12
  76 0012 0A40     		ands	r2, r1
  77 0014 1A60     		str	r2, [r3]
  22:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	*( (unsigned long *) 0x40020C04) |= 0x00000000;
  78              		.loc 1 22 0
  79 0016 0C4A     		ldr	r2, .L3+8
  80 0018 0B4B     		ldr	r3, .L3+8
  81 001a 1268     		ldr	r2, [r2]
  82 001c 1A60     		str	r2, [r3]
  23:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	//GPIO_PUPDR
  24:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	*( (unsigned long *) 0x40020C0C) &= 0xFF00FFFF;
  83              		.loc 1 24 0
  84 001e 0C4B     		ldr	r3, .L3+16
  85 0020 1A68     		ldr	r2, [r3]
  86 0022 0B4B     		ldr	r3, .L3+16
  87 0024 0B49     		ldr	r1, .L3+20
  88 0026 0A40     		ands	r2, r1
  89 0028 1A60     		str	r2, [r3]
  25:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	*( (unsigned long *) 0x40020C0C) |= 0x00550000;
  90              		.loc 1 25 0
  91 002a 094B     		ldr	r3, .L3+16
  92 002c 1A68     		ldr	r2, [r3]
  93 002e 084B     		ldr	r3, .L3+16
  94 0030 AA21     		movs	r1, #170
  95 0032 C903     		lsls	r1, r1, #15
  96 0034 0A43     		orrs	r2, r1
  97 0036 1A60     		str	r2, [r3]
  26:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** }
  98              		.loc 1 26 0
  99 0038 C046     		nop
 100 003a BD46     		mov	sp, r7
 101              		@ sp needed
 102 003c 80BD     		pop	{r7, pc}
 103              	.L4:
 104 003e C046     		.align	2
 105              	.L3:
 106 0040 000C0240 		.word	1073875968
 107 0044 55550055 		.word	1426085205
 108 0048 040C0240 		.word	1073875972
 109 004c FF0FFFFF 		.word	-61441
 110 0050 0C0C0240 		.word	1073875980
 111 0054 FFFF00FF 		.word	-16711681
 112              		.cfi_endproc
 113              	.LFE1:
 115              		.section	.rodata
 116              		.align	2
 117              	.LC0:
 118 0000 01       		.byte	1
 119 0001 02       		.byte	2
 120 0002 03       		.byte	3
 121 0003 0A       		.byte	10
 122 0004 04       		.byte	4
 123 0005 05       		.byte	5
 124 0006 06       		.byte	6
 125 0007 0B       		.byte	11
 126 0008 07       		.byte	7
 127 0009 08       		.byte	8
 128 000a 09       		.byte	9
 129 000b 0C       		.byte	12
 130 000c 0E       		.byte	14
 131 000d 00       		.byte	0
 132 000e 0F       		.byte	15
 133 000f 0D       		.byte	13
 134              		.text
 135              		.align	1
 136              		.global	keyb
 137              		.syntax unified
 138              		.code	16
 139              		.thumb_func
 140              		.fpu softvfp
 142              	keyb:
 143              	.LFB2:
  27:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 
  28:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 
  29:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** unsigned char keyb( void ){
 144              		.loc 1 29 0
 145              		.cfi_startproc
 146              		@ args = 0, pretend = 0, frame = 24
 147              		@ frame_needed = 1, uses_anonymous_args = 0
 148 0058 90B5     		push	{r4, r7, lr}
 149              		.cfi_def_cfa_offset 12
 150              		.cfi_offset 4, -12
 151              		.cfi_offset 7, -8
 152              		.cfi_offset 14, -4
 153 005a 87B0     		sub	sp, sp, #28
 154              		.cfi_def_cfa_offset 40
 155 005c 00AF     		add	r7, sp, #0
 156              		.cfi_def_cfa_register 7
  30:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	int row, col;
  31:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	unsigned char key[] = {1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE,0,0xF,0xD};
 157              		.loc 1 31 0
 158 005e 3B00     		movs	r3, r7
 159 0060 164A     		ldr	r2, .L11
 160 0062 13CA     		ldmia	r2!, {r0, r1, r4}
 161 0064 13C3     		stmia	r3!, {r0, r1, r4}
 162 0066 1268     		ldr	r2, [r2]
 163 0068 1A60     		str	r2, [r3]
  32:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	for (row = 1; row <= 4; row++) {
 164              		.loc 1 32 0
 165 006a 0123     		movs	r3, #1
 166 006c 7B61     		str	r3, [r7, #20]
 167 006e 19E0     		b	.L6
 168              	.L9:
 169              	.LBB2:
  33:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 		activateRow(row);
 170              		.loc 1 33 0
 171 0070 7B69     		ldr	r3, [r7, #20]
 172 0072 1800     		movs	r0, r3
 173 0074 FFF7FEFF 		bl	activateRow
  34:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 		col = readColumn();
 174              		.loc 1 34 0
 175 0078 FFF7FEFF 		bl	readColumn
 176 007c 0300     		movs	r3, r0
 177 007e 3B61     		str	r3, [r7, #16]
  35:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 		if ( col != 0 ){
 178              		.loc 1 35 0
 179 0080 3B69     		ldr	r3, [r7, #16]
 180 0082 002B     		cmp	r3, #0
 181 0084 0BD0     		beq	.L7
  36:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 			activateRow( 0 );
 182              		.loc 1 36 0
 183 0086 0020     		movs	r0, #0
 184 0088 FFF7FEFF 		bl	activateRow
  37:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 			return key[4*(row-1) + (col-1)];
 185              		.loc 1 37 0
 186 008c 7B69     		ldr	r3, [r7, #20]
 187 008e 013B     		subs	r3, r3, #1
 188 0090 9A00     		lsls	r2, r3, #2
 189 0092 3B69     		ldr	r3, [r7, #16]
 190 0094 013B     		subs	r3, r3, #1
 191 0096 D318     		adds	r3, r2, r3
 192 0098 3A00     		movs	r2, r7
 193 009a D35C     		ldrb	r3, [r2, r3]
 194 009c 09E0     		b	.L10
 195              	.L7:
 196              	.LBE2:
  32:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 		activateRow(row);
 197              		.loc 1 32 0 discriminator 2
 198 009e 7B69     		ldr	r3, [r7, #20]
 199 00a0 0133     		adds	r3, r3, #1
 200 00a2 7B61     		str	r3, [r7, #20]
 201              	.L6:
  32:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 		activateRow(row);
 202              		.loc 1 32 0 is_stmt 0 discriminator 1
 203 00a4 7B69     		ldr	r3, [r7, #20]
 204 00a6 042B     		cmp	r3, #4
 205 00a8 E2DD     		ble	.L9
  38:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 		}
  39:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	}
  40:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	activateRow( 0 );
 206              		.loc 1 40 0 is_stmt 1
 207 00aa 0020     		movs	r0, #0
 208 00ac FFF7FEFF 		bl	activateRow
  41:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	return 0xFF;
 209              		.loc 1 41 0
 210 00b0 FF23     		movs	r3, #255
 211              	.L10:
  42:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** }
 212              		.loc 1 42 0 discriminator 1
 213 00b2 1800     		movs	r0, r3
 214 00b4 BD46     		mov	sp, r7
 215 00b6 07B0     		add	sp, sp, #28
 216              		@ sp needed
 217 00b8 90BD     		pop	{r4, r7, pc}
 218              	.L12:
 219 00ba C046     		.align	2
 220              	.L11:
 221 00bc 00000000 		.word	.LC0
 222              		.cfi_endproc
 223              	.LFE2:
 225              		.section	.rodata
 226              		.align	2
 227              	.LC1:
 228 0010 3F       		.byte	63
 229 0011 06       		.byte	6
 230 0012 5B       		.byte	91
 231 0013 4F       		.byte	79
 232 0014 66       		.byte	102
 233 0015 5D       		.byte	93
 234 0016 7D       		.byte	125
 235 0017 07       		.byte	7
 236 0018 7F       		.byte	127
 237 0019 67       		.byte	103
 238 001a 77       		.byte	119
 239 001b 7C       		.byte	124
 240 001c 39       		.byte	57
 241 001d 57       		.byte	87
 242 001e 79       		.byte	121
 243 001f 71       		.byte	113
 244              		.text
 245              		.align	1
 246              		.global	out7seg
 247              		.syntax unified
 248              		.code	16
 249              		.thumb_func
 250              		.fpu softvfp
 252              	out7seg:
 253              	.LFB3:
  43:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 
  44:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** void out7seg( unsigned char c){
 254              		.loc 1 44 0
 255              		.cfi_startproc
 256              		@ args = 0, pretend = 0, frame = 24
 257              		@ frame_needed = 1, uses_anonymous_args = 0
 258 00c0 B0B5     		push	{r4, r5, r7, lr}
 259              		.cfi_def_cfa_offset 16
 260              		.cfi_offset 4, -16
 261              		.cfi_offset 5, -12
 262              		.cfi_offset 7, -8
 263              		.cfi_offset 14, -4
 264 00c2 86B0     		sub	sp, sp, #24
 265              		.cfi_def_cfa_offset 40
 266 00c4 00AF     		add	r7, sp, #0
 267              		.cfi_def_cfa_register 7
 268 00c6 0200     		movs	r2, r0
 269 00c8 FB1D     		adds	r3, r7, #7
 270 00ca 1A70     		strb	r2, [r3]
  45:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	unsigned char nums[] = {0x3F, 0x06,0x5B,0x4F,0x66,0x5D,0x7D,0x7,0x7F,0x67,
 271              		.loc 1 45 0
 272 00cc 0820     		movs	r0, #8
 273 00ce 3B18     		adds	r3, r7, r0
 274 00d0 074A     		ldr	r2, .L14
 275 00d2 32CA     		ldmia	r2!, {r1, r4, r5}
 276 00d4 32C3     		stmia	r3!, {r1, r4, r5}
 277 00d6 1268     		ldr	r2, [r2]
 278 00d8 1A60     		str	r2, [r3]
  46:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 							0x77,0x7C,0x39,0x57,0x79,0x71};
  47:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	if(0 <= c < 0x10){
  48:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 		*((unsigned char *) 0x40020C14) = nums[c];
 279              		.loc 1 48 0
 280 00da FB1D     		adds	r3, r7, #7
 281 00dc 1B78     		ldrb	r3, [r3]
 282 00de 0549     		ldr	r1, .L14+4
 283 00e0 3A18     		adds	r2, r7, r0
 284 00e2 D35C     		ldrb	r3, [r2, r3]
 285 00e4 0B70     		strb	r3, [r1]
  49:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	}
  50:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	else{
  51:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 		*((unsigned char *) 0x40020C14) = 0x0;
  52:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	}
  53:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** }
 286              		.loc 1 53 0
 287 00e6 C046     		nop
 288 00e8 BD46     		mov	sp, r7
 289 00ea 06B0     		add	sp, sp, #24
 290              		@ sp needed
 291 00ec B0BD     		pop	{r4, r5, r7, pc}
 292              	.L15:
 293 00ee C046     		.align	2
 294              	.L14:
 295 00f0 10000000 		.word	.LC1
 296 00f4 140C0240 		.word	1073875988
 297              		.cfi_endproc
 298              	.LFE3:
 300              		.align	1
 301              		.global	readColumn
 302              		.syntax unified
 303              		.code	16
 304              		.thumb_func
 305              		.fpu softvfp
 307              	readColumn:
 308              	.LFB4:
  54:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	
  55:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 
  56:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** int readColumn ( void ){
 309              		.loc 1 56 0
 310              		.cfi_startproc
 311              		@ args = 0, pretend = 0, frame = 8
 312              		@ frame_needed = 1, uses_anonymous_args = 0
 313 00f8 80B5     		push	{r7, lr}
 314              		.cfi_def_cfa_offset 8
 315              		.cfi_offset 7, -8
 316              		.cfi_offset 14, -4
 317 00fa 82B0     		sub	sp, sp, #8
 318              		.cfi_def_cfa_offset 16
 319 00fc 00AF     		add	r7, sp, #0
 320              		.cfi_def_cfa_register 7
  57:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	unsigned char c;
  58:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	c = *((volatile unsigned char *) 0x40020C11);
 321              		.loc 1 58 0
 322 00fe 124A     		ldr	r2, .L22
 323 0100 FB1D     		adds	r3, r7, #7
 324 0102 1278     		ldrb	r2, [r2]
 325 0104 1A70     		strb	r2, [r3]
  59:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	if(c & 0x8) return 4;
 326              		.loc 1 59 0
 327 0106 FB1D     		adds	r3, r7, #7
 328 0108 1B78     		ldrb	r3, [r3]
 329 010a 0822     		movs	r2, #8
 330 010c 1340     		ands	r3, r2
 331 010e 01D0     		beq	.L17
 332              		.loc 1 59 0 is_stmt 0 discriminator 1
 333 0110 0423     		movs	r3, #4
 334 0112 15E0     		b	.L18
 335              	.L17:
  60:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	if(c & 0x4) return 3;
 336              		.loc 1 60 0 is_stmt 1
 337 0114 FB1D     		adds	r3, r7, #7
 338 0116 1B78     		ldrb	r3, [r3]
 339 0118 0422     		movs	r2, #4
 340 011a 1340     		ands	r3, r2
 341 011c 01D0     		beq	.L19
 342              		.loc 1 60 0 is_stmt 0 discriminator 1
 343 011e 0323     		movs	r3, #3
 344 0120 0EE0     		b	.L18
 345              	.L19:
  61:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	if(c & 0x2) return 2;
 346              		.loc 1 61 0 is_stmt 1
 347 0122 FB1D     		adds	r3, r7, #7
 348 0124 1B78     		ldrb	r3, [r3]
 349 0126 0222     		movs	r2, #2
 350 0128 1340     		ands	r3, r2
 351 012a 01D0     		beq	.L20
 352              		.loc 1 61 0 is_stmt 0 discriminator 1
 353 012c 0223     		movs	r3, #2
 354 012e 07E0     		b	.L18
 355              	.L20:
  62:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	if(c & 0x1) return 1;
 356              		.loc 1 62 0 is_stmt 1
 357 0130 FB1D     		adds	r3, r7, #7
 358 0132 1B78     		ldrb	r3, [r3]
 359 0134 0122     		movs	r2, #1
 360 0136 1340     		ands	r3, r2
 361 0138 01D0     		beq	.L21
 362              		.loc 1 62 0 is_stmt 0 discriminator 1
 363 013a 0123     		movs	r3, #1
 364 013c 00E0     		b	.L18
 365              	.L21:
  63:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	return 0;
 366              		.loc 1 63 0 is_stmt 1
 367 013e 0023     		movs	r3, #0
 368              	.L18:
  64:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** }
 369              		.loc 1 64 0
 370 0140 1800     		movs	r0, r3
 371 0142 BD46     		mov	sp, r7
 372 0144 02B0     		add	sp, sp, #8
 373              		@ sp needed
 374 0146 80BD     		pop	{r7, pc}
 375              	.L23:
 376              		.align	2
 377              	.L22:
 378 0148 110C0240 		.word	1073875985
 379              		.cfi_endproc
 380              	.LFE4:
 382              		.align	1
 383              		.global	activateRow
 384              		.syntax unified
 385              		.code	16
 386              		.thumb_func
 387              		.fpu softvfp
 389              	activateRow:
 390              	.LFB5:
  65:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 
  66:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** void activateRow( unsigned int row ){
 391              		.loc 1 66 0
 392              		.cfi_startproc
 393              		@ args = 0, pretend = 0, frame = 16
 394              		@ frame_needed = 1, uses_anonymous_args = 0
 395 014c 80B5     		push	{r7, lr}
 396              		.cfi_def_cfa_offset 8
 397              		.cfi_offset 7, -8
 398              		.cfi_offset 14, -4
 399 014e 84B0     		sub	sp, sp, #16
 400              		.cfi_def_cfa_offset 24
 401 0150 00AF     		add	r7, sp, #0
 402              		.cfi_def_cfa_register 7
 403 0152 7860     		str	r0, [r7, #4]
  67:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	//GPIO_ODR
  68:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	volatile unsigned char * GPIO_ODR_HIGH =  ((volatile unsigned char * ) 0x40020C15);
 404              		.loc 1 68 0
 405 0154 114B     		ldr	r3, .L33
 406 0156 FB60     		str	r3, [r7, #12]
  69:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	
  70:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	switch( row ){
 407              		.loc 1 70 0
 408 0158 7B68     		ldr	r3, [r7, #4]
 409 015a 042B     		cmp	r3, #4
 410 015c 19D8     		bhi	.L32
 411 015e 7B68     		ldr	r3, [r7, #4]
 412 0160 9A00     		lsls	r2, r3, #2
 413 0162 0F4B     		ldr	r3, .L33+4
 414 0164 D318     		adds	r3, r2, r3
 415 0166 1B68     		ldr	r3, [r3]
 416 0168 9F46     		mov	pc, r3
 417              		.section	.rodata
 418              		.align	2
 419              	.L27:
 420 0020 8A010000 		.word	.L26
 421 0024 6A010000 		.word	.L28
 422 0028 72010000 		.word	.L29
 423 002c 7A010000 		.word	.L30
 424 0030 82010000 		.word	.L31
 425              		.text
 426              	.L28:
  71:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 		case 1: *GPIO_ODR_HIGH = 0x10; break;
 427              		.loc 1 71 0
 428 016a FB68     		ldr	r3, [r7, #12]
 429 016c 1022     		movs	r2, #16
 430 016e 1A70     		strb	r2, [r3]
 431 0170 0FE0     		b	.L25
 432              	.L29:
  72:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 		case 2: *GPIO_ODR_HIGH = 0x20; break;
 433              		.loc 1 72 0
 434 0172 FB68     		ldr	r3, [r7, #12]
 435 0174 2022     		movs	r2, #32
 436 0176 1A70     		strb	r2, [r3]
 437 0178 0BE0     		b	.L25
 438              	.L30:
  73:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 		case 3: *GPIO_ODR_HIGH = 0x40; break;
 439              		.loc 1 73 0
 440 017a FB68     		ldr	r3, [r7, #12]
 441 017c 4022     		movs	r2, #64
 442 017e 1A70     		strb	r2, [r3]
 443 0180 07E0     		b	.L25
 444              	.L31:
  74:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 		case 4: *GPIO_ODR_HIGH = 0x80; break;
 445              		.loc 1 74 0
 446 0182 FB68     		ldr	r3, [r7, #12]
 447 0184 8022     		movs	r2, #128
 448 0186 1A70     		strb	r2, [r3]
 449 0188 03E0     		b	.L25
 450              	.L26:
  75:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 		case 0: *GPIO_ODR_HIGH = 0x00; break;
 451              		.loc 1 75 0
 452 018a FB68     		ldr	r3, [r7, #12]
 453 018c 0022     		movs	r2, #0
 454 018e 1A70     		strb	r2, [r3]
 455 0190 C046     		nop
 456              	.L25:
 457              	.L32:
  76:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	}
  77:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** }
 458              		.loc 1 77 0
 459 0192 C046     		nop
 460 0194 BD46     		mov	sp, r7
 461 0196 04B0     		add	sp, sp, #16
 462              		@ sp needed
 463 0198 80BD     		pop	{r7, pc}
 464              	.L34:
 465 019a C046     		.align	2
 466              	.L33:
 467 019c 150C0240 		.word	1073875989
 468 01a0 20000000 		.word	.L27
 469              		.cfi_endproc
 470              	.LFE5:
 472              		.align	1
 473              		.global	main
 474              		.syntax unified
 475              		.code	16
 476              		.thumb_func
 477              		.fpu softvfp
 479              	main:
 480              	.LFB6:
  78:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 
  79:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** void main(void)
  80:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** {
 481              		.loc 1 80 0
 482              		.cfi_startproc
 483              		@ args = 0, pretend = 0, frame = 0
 484              		@ frame_needed = 1, uses_anonymous_args = 0
 485 01a4 80B5     		push	{r7, lr}
 486              		.cfi_def_cfa_offset 8
 487              		.cfi_offset 7, -8
 488              		.cfi_offset 14, -4
 489 01a6 00AF     		add	r7, sp, #0
 490              		.cfi_def_cfa_register 7
  81:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	app_init();
 491              		.loc 1 81 0
 492 01a8 FFF7FEFF 		bl	app_init
 493              	.L36:
  82:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 	while(1){
  83:C:/Users/f_ill/OneDrive/Dokument/Moplaborationer/kap4\startup.c **** 		out7seg( keyb() );
 494              		.loc 1 83 0 discriminator 1
 495 01ac FFF7FEFF 		bl	keyb
 496 01b0 0300     		movs	r3, r0
 497 01b2 1800     		movs	r0, r3
 498 01b4 FFF7FEFF 		bl	out7seg
 499 01b8 F8E7     		b	.L36
 500              		.cfi_endproc
 501              	.LFE6:
 503              	.Letext0:
