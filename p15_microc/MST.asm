
_main:

;MST.c,40 :: 		void main()
;MST.c,42 :: 		ADCON1=9;
	MOVLW       9
	MOVWF       ADCON1+0 
;MST.c,43 :: 		TRISA=0b00101111;
	MOVLW       47
	MOVWF       TRISA+0 
;MST.c,44 :: 		TRISE=0b00000001;
	MOVLW       1
	MOVWF       TRISE+0 
;MST.c,46 :: 		PUMP1_DIR  =0;
	BCF         TRISD0_bit+0, BitPos(TRISD0_bit+0) 
;MST.c,47 :: 		PUMP2_DIR  =0;
	BCF         TRISD5_bit+0, BitPos(TRISD5_bit+0) 
;MST.c,49 :: 		VALVE2_DIR =0;
	BCF         TRISE2_bit+0, BitPos(TRISE2_bit+0) 
;MST.c,50 :: 		SLONOD_DIR =0;
	BCF         TRISA4_bit+0, BitPos(TRISA4_bit+0) 
;MST.c,52 :: 		LCD_BL_Direction=0;
	BCF         TRISD2_bit+0, BitPos(TRISD2_bit+0) 
;MST.c,54 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;MST.c,55 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MST.c,56 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MST.c,57 :: 		Lcd_Out(1, 1,"Welcome");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_MST+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_MST+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MST.c,58 :: 		delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
	NOP
;MST.c,60 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;MST.c,61 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       4
	MOVWF       SPBRGH+0 
	MOVLW       225
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;MST.c,63 :: 		LCD_BL=0;
	BCF         RD2_bit+0, BitPos(RD2_bit+0) 
;MST.c,64 :: 		PUMP1  =0;
	BCF         RD0_bit+0, BitPos(RD0_bit+0) 
;MST.c,65 :: 		PUMP2  =0;
	BCF         RD5_bit+0, BitPos(RD5_bit+0) 
;MST.c,67 :: 		VALVE2 =0;
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;MST.c,68 :: 		SLONOD =0;
	BCF         RA4_bit+0, BitPos(RA4_bit+0) 
;MST.c,70 :: 		j=0;
	CLRF        _j+0 
	CLRF        _j+1 
	CLRF        _j+2 
	CLRF        _j+3 
;MST.c,72 :: 		while(1)
L_main1:
;MST.c,74 :: 		j=0;
	CLRF        _j+0 
	CLRF        _j+1 
	CLRF        _j+2 
	CLRF        _j+3 
;MST.c,75 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;MST.c,76 :: 		Lcd_Out(1,1,x[11]);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _x+22, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        _x+23, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MST.c,77 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MST.c,81 :: 		while(j<10000)
L_main3:
	MOVLW       128
	XORWF       _j+3, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main19
	MOVLW       0
	SUBWF       _j+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main19
	MOVLW       39
	SUBWF       _j+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main19
	MOVLW       16
	SUBWF       _j+0, 0 
L__main19:
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
;MST.c,83 :: 		j++;
	MOVLW       1
	ADDWF       _j+0, 1 
	MOVLW       0
	ADDWFC      _j+1, 1 
	ADDWFC      _j+2, 1 
	ADDWFC      _j+3, 1 
;MST.c,84 :: 		SP = ADC_Read(5) ;
	MOVLW       5
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _SP+0 
	MOVF        R1, 0 
	MOVWF       _SP+1 
;MST.c,85 :: 		spnum=(SP/1023.0)*100;
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       _spnum+0 
;MST.c,86 :: 		UART1_Write(spnum);
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MST.c,87 :: 		print();
	CALL        _print+0, 0
;MST.c,88 :: 		Lcd_Out(1,1,x[11]);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _x+22, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        _x+23, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MST.c,89 :: 		if (UART1_Data_Ready())
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main5
;MST.c,91 :: 		m=UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _m+0 
;MST.c,92 :: 		if(m=='0')
	MOVF        R0, 0 
	XORLW       48
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;MST.c,94 :: 		PUMP2=0;
	BCF         RD5_bit+0, BitPos(RD5_bit+0) 
;MST.c,95 :: 		x[11]=" PUMP2 OFF" ;
	MOVLW       ?lstr2_MST+0
	MOVWF       _x+22 
	MOVLW       hi_addr(?lstr2_MST+0)
	MOVWF       _x+23 
;MST.c,96 :: 		}
	GOTO        L_main7
L_main6:
;MST.c,97 :: 		else if(m=='1')
	MOVF        _m+0, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
;MST.c,99 :: 		PUMP2=1;
	BSF         RD5_bit+0, BitPos(RD5_bit+0) 
;MST.c,100 :: 		x[11]=" PUMP2 ON " ;
	MOVLW       ?lstr3_MST+0
	MOVWF       _x+22 
	MOVLW       hi_addr(?lstr3_MST+0)
	MOVWF       _x+23 
;MST.c,101 :: 		}
L_main8:
L_main7:
;MST.c,103 :: 		if(m=='2')
	MOVF        _m+0, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
;MST.c,105 :: 		PUMP1=0;
	BCF         RD0_bit+0, BitPos(RD0_bit+0) 
;MST.c,106 :: 		x[11]=" PUMP1 OFF" ;
	MOVLW       ?lstr4_MST+0
	MOVWF       _x+22 
	MOVLW       hi_addr(?lstr4_MST+0)
	MOVWF       _x+23 
;MST.c,107 :: 		}
	GOTO        L_main10
L_main9:
;MST.c,108 :: 		else if (m=='3')
	MOVF        _m+0, 0 
	XORLW       51
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
;MST.c,110 :: 		PUMP1=1;
	BSF         RD0_bit+0, BitPos(RD0_bit+0) 
;MST.c,111 :: 		x[11]=" PUMP1 ON ";
	MOVLW       ?lstr5_MST+0
	MOVWF       _x+22 
	MOVLW       hi_addr(?lstr5_MST+0)
	MOVWF       _x+23 
;MST.c,112 :: 		}
L_main11:
L_main10:
;MST.c,113 :: 		if(m=='4')
	MOVF        _m+0, 0 
	XORLW       52
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
;MST.c,115 :: 		SLONOD=0;
	BCF         RA4_bit+0, BitPos(RA4_bit+0) 
;MST.c,116 :: 		x[11]=" Lamp OFF " ;
	MOVLW       ?lstr6_MST+0
	MOVWF       _x+22 
	MOVLW       hi_addr(?lstr6_MST+0)
	MOVWF       _x+23 
;MST.c,117 :: 		}
	GOTO        L_main13
L_main12:
;MST.c,118 :: 		else if(m=='5')
	MOVF        _m+0, 0 
	XORLW       53
	BTFSS       STATUS+0, 2 
	GOTO        L_main14
;MST.c,120 :: 		SLONOD=1;
	BSF         RA4_bit+0, BitPos(RA4_bit+0) 
;MST.c,121 :: 		x[11]=" Lamp ON  " ;
	MOVLW       ?lstr7_MST+0
	MOVWF       _x+22 
	MOVLW       hi_addr(?lstr7_MST+0)
	MOVWF       _x+23 
;MST.c,122 :: 		}
L_main14:
L_main13:
;MST.c,123 :: 		if(m=='6')
	MOVF        _m+0, 0 
	XORLW       54
	BTFSS       STATUS+0, 2 
	GOTO        L_main15
;MST.c,125 :: 		VALVE2=0;
	BCF         RE2_bit+0, BitPos(RE2_bit+0) 
;MST.c,126 :: 		x[11]=" Motor BK " ;
	MOVLW       ?lstr8_MST+0
	MOVWF       _x+22 
	MOVLW       hi_addr(?lstr8_MST+0)
	MOVWF       _x+23 
;MST.c,127 :: 		}
	GOTO        L_main16
L_main15:
;MST.c,128 :: 		else if(m=='7')
	MOVF        _m+0, 0 
	XORLW       55
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
;MST.c,130 :: 		VALVE2=1;
	BSF         RE2_bit+0, BitPos(RE2_bit+0) 
;MST.c,131 :: 		x[11]=" Motor FR " ;
	MOVLW       ?lstr9_MST+0
	MOVWF       _x+22 
	MOVLW       hi_addr(?lstr9_MST+0)
	MOVWF       _x+23 
;MST.c,132 :: 		}
L_main17:
L_main16:
;MST.c,133 :: 		Lcd_Out(1,1,x[11]);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _x+22, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        _x+23, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MST.c,134 :: 		}
L_main5:
;MST.c,135 :: 		}
	GOTO        L_main3
L_main4:
;MST.c,136 :: 		}
	GOTO        L_main1
;MST.c,137 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_print:

;MST.c,139 :: 		void print ()
;MST.c,141 :: 		k=  spnum;
	MOVF        _spnum+0, 0 
	MOVWF       _k+0 
	MOVLW       0
	MOVWF       _k+1 
;MST.c,142 :: 		Line[15] = (k)       % 10  +0x30;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _k+0, 0 
	MOVWF       R0 
	MOVF        _k+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       _Line+15 
;MST.c,143 :: 		Line[14] = (k/10)    % 10  +0x30;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _k+0, 0 
	MOVWF       R0 
	MOVF        _k+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       _Line+14 
;MST.c,144 :: 		Line[13] = (k/100)   % 10  +0x30;
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _k+0, 0 
	MOVWF       R0 
	MOVF        _k+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       _Line+13 
;MST.c,145 :: 		Line[12] = (k/1000)  % 10  +0x30;
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        _k+0, 0 
	MOVWF       R0 
	MOVF        _k+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       _Line+12 
;MST.c,146 :: 		Lcd_Out (2, 1,Line);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _Line+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_Line+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MST.c,147 :: 		}
L_end_print:
	RETURN      0
; end of _print
