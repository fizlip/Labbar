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

/* Defenitioner för de olika portarna */
#define PORT_BASE 	 0x40021000
#define portModer 	((volatile unsigned long *) 	(PORT_BASE))
#define portOtyper	((volatile unsigned short *) 	(PORT_BASE+0x4))
#define portOspeedr	((volatile unsigned long *) 	(PORT_BASE+0x8))
#define portPupdr 	((volatile unsigned long *)		(PORT_BASE+0xC))
#define portIdrLow 	((volatile unsigned char *) 	(PORT_BASE+0x10))
#define portIdrHigh ((volatile unsigned char *) 	(PORT_BASE+0x11))
#define portOdrLow 	((volatile unsigned char *) 	(PORT_BASE+0x14))
#define portOdrHigh ((volatile unsigned char *) 	(PORT_BASE+0x15))
/* Bitar i styrregistret för användning av LC-Display modulen */
#define LCD_ON			0x3F
#define LCD_OFF			0x3E
#define LCD_SET_ADD		0x40
#define LCD_SET_PAGE	0xB8
#define LCD_DISP_START	0xC0
#define LCD_BUSY		0x80
#define B_E 			0x40
#define B_RST			0x20
#define B_CS2			0x10
#define B_CS1			0x8
#define B_SELECT 		0x4
#define B_RW 			0x2
#define B_RS 			0x1

void delay_250ns( void ){
	* ( (unsigned long *) 0xE000E010) = 0x0;
	* ( (unsigned long *) 0xE000E014) = ( (168/4) -1 );
	* ( (unsigned long *) 0xE000E018) = 0x0;
	* ( (unsigned char *) 0xE000E010) = 0x5;
	while(* ( (unsigned char *) 0xE000E010) & 0x10000 == 0){}
	* ( (unsigned long *) 0xE000E010) = 0x0;
}

void delay_500ns( void ){
	* ( (unsigned long *) 0xE000E010) = 0x0;
	* ( (unsigned long *) 0xE000E014) = ( (168/2) -1 );
	* ( (unsigned long *) 0xE000E018) = 0x0;
	* ( (unsigned char *) 0xE000E010) = 0x5;
	while(* ( (unsigned char *) 0xE000E010) & 0x10000 == 0){}
	* ( (unsigned long *) 0xE000E010) = 0x0;
}

// Fördröj en mikro sekund
void delay_mikro(unsigned int us){
	for(int i = 0; i < us; i++){
		for(int j = 0; j < 4; j++){
			delay_250ns();
		}
	}
}

// Fördröj en milli sekund
void delay_milli(unsigned int ms){
	int i;
	while( ms-- ){
		for( i = 0; i < 1000; i++){
			delay_250ns();
			delay_250ns();
			delay_250ns();
			delay_250ns();
		}
	}
}

typedef unsigned char uint8_t;
/* Välj grafik-display och ettställ de bitar som är 1 i x */
void graphic_ctrl_bit_set( uint8_t x ){
	uint8_t c;
	c = *portOdrLow;
	c &= ~B_SELECT;
	c |= ( ~B_SELECT & x);
	*portOdrLow = c;
}

/* Välj grafisk-diaplay och nollställ de bitar som är 1 i x */
void graphic_ctrl_bit_clear( uint8_t x ){
	uint8_t c;
	c = *portOdrLow;
	c &= ~B_SELECT;
	c &= ~x;
	*portOdrLow = c;
}

/* konfigurera CS-signalerna */
void select_controller( uint8_t controller){
	switch(controller){
		case 0: 
			graphic_ctrl_bit_clear(B_CS1|B_CS2);
			break;
		case B_CS1:
			graphic_ctrl_bit_set(B_CS1);
			graphic_ctrl_bit_clear(B_CS2);
			break;
		case B_CS2:
			graphic_ctrl_bit_clear(B_CS1);
			graphic_ctrl_bit_set(B_CS2);
			break;
		case B_CS1|B_CS2:
			graphic_ctrl_bit_set(B_CS1);
			graphic_ctrl_bit_set(B_CS2);
			break;
	}	
}

void graphic_wait_ready(void){
	uint8_t c;
	graphic_ctrl_bit_clear(B_E);
	*portModer = 0x00005555;
	graphic_ctrl_bit_clear(B_RS); graphic_ctrl_bit_set(B_RW);
	delay_500ns();
	while(1){
		graphic_ctrl_bit_set(B_E);
		delay_500ns();
		c = *portIdrHigh & LCD_BUSY;
		graphic_ctrl_bit_clear(B_E);
		delay_500ns();
		if(c == 0){break;} 
	}
	graphic_ctrl_bit_set(B_E);
	*portModer = 0x55555555;
}

uint8_t graphic_read(uint8_t controller){
	uint8_t c;
	graphic_ctrl_bit_clear(B_E);
	*portModer = 0x00005555;
	graphic_ctrl_bit_set(B_RS|B_RW);
	select_controller(controller);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	c = *portIdrHigh;
	graphic_ctrl_bit_clear(B_E);
	*portModer = 0x55555555;
	if(controller & B_CS1){
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	// Får man samma resultat med "==" ist för &?
	if(controller & B_CS2){
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	return c;
}

void graphic_write(uint8_t value, uint8_t controller){
	*portOdrHigh = value;
	select_controller(controller);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	graphic_ctrl_bit_clear(B_E);
	
	if(controller && B_CS1){
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	if(controller && B_CS2){
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	*portOdrHigh = 0;
	graphic_ctrl_bit_set(B_E);
	select_controller(0);
	
}

void graphic_write_command(uint8_t command, uint8_t controller){
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	graphic_ctrl_bit_clear(B_RS);
	graphic_ctrl_bit_clear(B_RW);
	graphic_write(command, controller);
}

void graphic_write_data(uint8_t data, uint8_t controller){
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	graphic_ctrl_bit_set(B_RS);
	graphic_ctrl_bit_clear(B_RW);
	graphic_write(data, controller);
}

uint8_t graphic_read_data(uint8_t controller){
	(void) graphic_read(controller);
	return graphic_read(controller);
}

void init_app(){
	*portModer = 0x55555555;
}

void graphic_initialize(void){
	graphic_ctrl_bit_set(B_E);
	delay_mikro(10);
	graphic_ctrl_bit_clear(B_CS1);
	graphic_ctrl_bit_clear(B_CS2);
	graphic_ctrl_bit_clear(B_RST);
	graphic_ctrl_bit_clear(B_E);
	delay_milli(30);
	graphic_ctrl_bit_set(B_RST);
	delay_milli(100);
	graphic_write_command(LCD_OFF, B_CS1|B_CS2);
	graphic_write_command(LCD_ON, B_CS1|B_CS2);
	graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
	graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
	graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
	select_controller(0);
}

void graphic_clear_screen( void ){
	for(int page = 0; page < 8; page++){
		graphic_write(LCD_SET_PAGE | page, B_CS1|B_CS2);
		graphic_write(LCD_SET_ADD | 0, B_CS1|B_CS2);
		for(int add = 0; add < 64; add++){
			graphic_write_data(0, B_CS1|B_CS2);
		}
	}
}

void pixel(int x, int y, int set){
	uint8_t mask, c, controller;
	int index;
	
	if( (x < 1) || (x > 128) || (y < 1) || (y > 64)){
		return;
	}
	index = (y-1) / 8;
	
	switch((y-1)%8){
		case 0: mask = 1; break;
		case 1: mask = 2; break; 
		case 2: mask = 4; break; 
		case 3: mask = 8; break; 
		case 4: mask = 0x10; break; 
		case 5: mask = 0x20; break; 
		case 6: mask = 0x40; break; 
		case 7: mask = 0x80; break; 
	}
	if(set == 0){
		mask = ~mask;
	}
	if(x > 64){
		controller = B_CS2;
		x = x - 65;
	}
	else{
		controller = B_CS1;
		x = x - 1;
	}
	graphic_write_command(LCD_SET_ADD | x, controller);
	graphic_write_command(LCD_SET_PAGE | index, controller);
	c = graphic_read_data(controller);
	graphic_write_command(LCD_SET_ADD | x, controller);
	if(set){
		mask = mask | c;
	}
	else{
		mask = mask & c;
	}
	graphic_write_data(mask, controller);
}

void main(void)
{
	unsigned i;
	init_app();
	//graphic_initialize();
#ifdef SIMULATOR
	graphic_clear_screen();
#endif
	for( i = 0; i < 128; i++){
		pixel(i, 10, 1);
	}
	for( i = 0; i < 64; i++){
		pixel(10, i, 1);
	}
	delay_milli( 5 );
	for( i = 0; i < 128; i++){
		pixel(i, 10, 0);
	}
	for( i = 0; i < 64; i++){
		pixel(10, i, 0);
	}

}

