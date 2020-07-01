// Malak Ehab Al-Ashi
// Taymaa Abd Elraheem Al-Zayan
char *x[11];
long int j=0;
int k;
unsigned SP;
char  spnum , m;

char Line[17]="Reference = 0000";

void print(void);
void LCD_Def (void);

sbit PUMP1  at RD0_bit;
sbit PUMP2  at RD5_bit;

sbit VALVE2 at RE2_bit;
sbit SLONOD at RA4_bit;

sbit PUMP1_DIR  at TRISD0_bit;
sbit PUMP2_DIR  at TRISD5_bit;

sbit VALVE2_DIR at TRISE2_bit;
sbit SLONOD_DIR at TRISA4_bit;

sbit LCD_BL at RD2_bit;
sbit LCD_BL_Direction at TRISD2_bit;

sbit LCD_RS at RB6_bit;
sbit LCD_EN at RB4_bit;
sbit LCD_D4 at RD7_bit;
sbit LCD_D5 at RD6_bit;
sbit LCD_D6 at RD1_bit;
sbit LCD_D7 at RD4_bit;
sbit LCD_RS_Direction at TRISB6_bit;
sbit LCD_EN_Direction at TRISB4_bit;
sbit LCD_D4_Direction at TRISD7_bit;
sbit LCD_D5_Direction at TRISD6_bit;
sbit LCD_D6_Direction at TRISD1_bit;
sbit LCD_D7_Direction at TRISD4_bit;

void main()
{
  ADCON1=9;
  TRISA=0b00101111;
  TRISE=0b00000001;
  
  PUMP1_DIR  =0;
  PUMP2_DIR  =0;

  VALVE2_DIR =0;
  SLONOD_DIR =0;

  LCD_BL_Direction=0;
  
  Lcd_Init();
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Out(1, 1,"Welcome");
  delay_ms(2000);
  
  ADC_Init();
  UART1_Init(9600);
  
  LCD_BL=0;
  PUMP1  =0;
  PUMP2  =0;
  
  VALVE2 =0;
  SLONOD =0;

  j=0;
  
  while(1)
  {
   j=0;
   Lcd_Init();
   Lcd_Out(1,1,x[11]);
   Lcd_Cmd(_LCD_CURSOR_OFF);
   //Lcd_Cmd(_LCD_CLEAR);


   while(j<10000)
    {
       j++;
       SP = ADC_Read(5) ;
       spnum=(SP/1023.0)*100;
       UART1_Write(spnum);
       print();
       Lcd_Out(1,1,x[11]);
       if (UART1_Data_Ready())
       {
         m=UART1_Read();
         if(m=='0')
          {
           PUMP2=0;
           x[11]=" PUMP2 OFF" ;
           }
         else if(m=='1')
         {
          PUMP2=1;
          x[11]=" PUMP2 ON " ;
          }
          
         if(m=='2')
         {
         PUMP1=0;
         x[11]=" PUMP1 OFF" ;
         }
         else if (m=='3')
         {
         PUMP1=1;
         x[11]=" PUMP1 ON ";
         }
         if(m=='4')
         {
         SLONOD=0;
         x[11]=" Lamp OFF " ;
         }
         else if(m=='5')
         {
         SLONOD=1;
         x[11]=" Lamp ON  " ;
         }
         if(m=='6')
         {
         VALVE2=0;
         x[11]=" Motor BK " ;
         }
         else if(m=='7')
         {
         VALVE2=1;
         x[11]=" Motor FR " ;
         }
       Lcd_Out(1,1,x[11]);
       }
     }
}
}

void print ()
{
  k=  spnum;
  Line[15] = (k)       % 10  +0x30;
  Line[14] = (k/10)    % 10  +0x30;
  Line[13] = (k/100)   % 10  +0x30;
  Line[12] = (k/1000)  % 10  +0x30;
  Lcd_Out (2, 1,Line);
}