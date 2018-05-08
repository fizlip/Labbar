# 1 "startup.c"
# 1 "C:\\Users\\f_ill\\OneDrive\\Dokument\\Moplaborationer\\flipflop_irq//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "startup.c"




void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
 " LDR R0,=0x2001C000\n"
 " MOV SP,R0\n"
 " BL main\n"
 "_exit: B .\n"
 ) ;
}
# 29 "startup.c"
static volatile int count = 0;

void irq_handler( void ){
 if((*((volatile unsigned char *) (0x40013C14)) & 8) != 0){
  count += 1;
  *((volatile unsigned char *) (0x40013C14)) |= 8;
 }
}

void app_init( void ){
 *((volatile unsigned long *) (0x40020C00)) = 0x00005555;

 *((unsigned int *) 0x40013808) &= ~0xF000;

 *((unsigned int *) 0x40013808) |= 0x4000;


 * ((unsigned int *) 0x40013C00) |= 8;

 * ((unsigned int *) 0x40013C0C) |= 8;

 * ((unsigned int *) 0x40013C08) &= ~8;

 * ((unsigned int *) 0xE000E100) |= (1<<9);

 *((void (**) (void) ) 0x2001C064 ) = irq_handler;
 *((volatile unsigned char *) (0x40013C14)) |= 1<<9;
}

void main(void)
{
 app_init();
 while(1){
  *((volatile unsigned char *) (0x40020C00 +0x14)) = count;
 }

}
