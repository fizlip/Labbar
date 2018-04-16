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

void app_init( void ){
	//GPIO_MODER
	*( (unsigned long *) 0x40020C00) = 0x55005555;
	//GPIO_OTYPER
	*( (unsigned long *) 0x40020C04) &= 0xFFFF0FFF;
	*( (unsigned long *) 0x40020C04) |= 0x00000000;
	//GPIO_PUPDR
	*( (unsigned long *) 0x40020C0C) &= 0xFF00FFFF;
	*( (unsigned long *) 0x40020C0C) |= 0x00550000;
}


unsigned char keyb( void ){
	int row, col;
	unsigned char key[] = {1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE,0,0xF,0xD};
	for (row = 1; row <= 4; row++) {
		activateRow(row);
		col = readColumn();
		if ( col != 0 ){
			activateRow( 0 );
			return key[4*(row-1) + (col-1)];
		}
	}
	activateRow( 0 );
	return 0xFF;
}

void out7seg( unsigned char c){
	unsigned char nums[] = {0x3F, 0x06,0x5B,0x4F,0x66,0x5D,0x7D,0x7,0x7F,0x67,
							0x77,0x7C,0x39,0x57,0x79,0x71};
	if(0 <= c < 0x10){
		*((unsigned char *) 0x40020C14) = nums[c];
	}
	else{
		*((unsigned char *) 0x40020C14) = 0x0;
	}
}
	

int readColumn ( void ){
	unsigned char c;
	c = *((volatile unsigned char *) 0x40020C11);
	if(c & 0x8) return 4;
	if(c & 0x4) return 3;
	if(c & 0x2) return 2;
	if(c & 0x1) return 1;
	return 0;
}

void activateRow( unsigned int row ){
	//GPIO_ODR
	volatile unsigned char * GPIO_ODR_HIGH =  ((volatile unsigned char * ) 0x40020C15);
	
	switch( row ){
		case 1: *GPIO_ODR_HIGH = 0x10; break;
		case 2: *GPIO_ODR_HIGH = 0x20; break;
		case 3: *GPIO_ODR_HIGH = 0x40; break;
		case 4: *GPIO_ODR_HIGH = 0x80; break;
		case 0: *GPIO_ODR_HIGH = 0x00; break;
	}
}

void main(void)
{
	app_init();
	while(1){
		out7seg( keyb() );
	}
}