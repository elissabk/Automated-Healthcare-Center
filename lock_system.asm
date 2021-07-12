; Copyright 2020 Elissa Bou Karam
;   Licensed under the Apache License, Version 2.0 (the "License");
;   you may not use this file except in compliance with the License.
;   You may obtain a copy of the License at
;       http://www.apache.org/licenses/LICENSE-2.0
;   Unless required by applicable law or agreed to in writing, software
;   distributed under the License is distributed on an "AS IS" BASIS,
;   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;   See the License for the specific language governing permissions and
;   limitations under the License.

_start:

;locksystem.c,4 ::                 void start(){
;locksystem.c,5 ::                 do{ Lcd_Init();Lcd_cmd(_LCD_CLEAR);Lcd_out(1,1," CHOOSE THE SECTION");}while(PORTD==0X00) ;}
L_start0:
        CALL       _Lcd_Init+0
        MOVLW      1
        MOVWF      FARG_Lcd_Cmd_out_char+0
        CALL       _Lcd_Cmd+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_row+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_column+0
        MOVLW      ?lstr1_locksystem+0
        MOVWF      FARG_Lcd_Out_text+0
        CALL       _Lcd_Out+0
        MOVF       PORTD+0, 0
        XORLW      0
        BTFSC      STATUS+0, 2
        GOTO       L_start0
L_end_start:
        RETURN
; end of _start

_reset:

;locksystem.c,6 ::                 void reset(){
;locksystem.c,7 ::                 PORTB.F7=1;delay_ms(30);PORTB.F7=0;}
        BSF        PORTB+0, 7
        MOVLW      195
        MOVWF      R12+0
        MOVLW      205
        MOVWF      R13+0
L_reset3:
        DECFSZ     R13+0, 1
        GOTO       L_reset3
        DECFSZ     R12+0, 1
        GOTO       L_reset3
        BCF        PORTB+0, 7
L_end_reset:
        RETURN
; end of _reset

_wrong:

;locksystem.c,8 ::                 void wrong(){
;locksystem.c,9 ::                 Lcd_Init();Lcd_cmd(_LCD_CLEAR);Lcd_out(1,1,"WRONG PASSWORD");delay_ms(1000);reset();}
        CALL       _Lcd_Init+0
        MOVLW      1
        MOVWF      FARG_Lcd_Cmd_out_char+0
        CALL       _Lcd_Cmd+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_row+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_column+0
        MOVLW      ?lstr2_locksystem+0
        MOVWF      FARG_Lcd_Out_text+0
        CALL       _Lcd_Out+0
        MOVLW      26
        MOVWF      R11+0
        MOVLW      94
        MOVWF      R12+0
        MOVLW      110
        MOVWF      R13+0
L_wrong4:
        DECFSZ     R13+0, 1
        GOTO       L_wrong4
        DECFSZ     R12+0, 1
        GOTO       L_wrong4
        DECFSZ     R11+0, 1
        GOTO       L_wrong4
        NOP
        CALL       _reset+0
L_end_wrong:
        RETURN
; end of _wrong

_pass:

;locksystem.c,10 ::                 void pass(){
;locksystem.c,11 ::                 Lcd_Init();Lcd_cmd(_LCD_CLEAR);
        CALL       _Lcd_Init+0
        MOVLW      1
        MOVWF      FARG_Lcd_Cmd_out_char+0
        CALL       _Lcd_Cmd+0
;locksystem.c,12 ::                 do{Lcd_out(1,1,"PASSWORD");}while(PORTD==0X00);
L_pass5:
        MOVLW      1
        MOVWF      FARG_Lcd_Out_row+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_column+0
        MOVLW      ?lstr3_locksystem+0
        MOVWF      FARG_Lcd_Out_text+0
        CALL       _Lcd_Out+0
        MOVF       PORTD+0, 0
        XORLW      0
        BTFSC      STATUS+0, 2
        GOTO       L_pass5
;locksystem.c,13 ::                 if(PORTD==0X01){wrong();}
        MOVF       PORTD+0, 0
        XORLW      1
        BTFSS      STATUS+0, 2
        GOTO       L_pass8
        CALL       _wrong+0
L_pass8:
;locksystem.c,14 ::                 if(PORTD==0X02){wrong();}
        MOVF       PORTD+0, 0
        XORLW      2
        BTFSS      STATUS+0, 2
        GOTO       L_pass9
        CALL       _wrong+0
L_pass9:
;locksystem.c,15 ::                 if(PORTD==0X04){wrong();}
        MOVF       PORTD+0, 0
        XORLW      4
        BTFSS      STATUS+0, 2
        GOTO       L_pass10
        CALL       _wrong+0
L_pass10:
;locksystem.c,16 ::                 if(PORTD==0X10){wrong();}
        MOVF       PORTD+0, 0
        XORLW      16
        BTFSS      STATUS+0, 2
        GOTO       L_pass11
        CALL       _wrong+0
L_pass11:
;locksystem.c,17 ::                 if(PORTD==0X20){wrong();}
        MOVF       PORTD+0, 0
        XORLW      32
        BTFSS      STATUS+0, 2
        GOTO       L_pass12
        CALL       _wrong+0
L_pass12:
;locksystem.c,18 ::                 if(PORTD==0X40){wrong();}
        MOVF       PORTD+0, 0
        XORLW      64
        BTFSS      STATUS+0, 2
        GOTO       L_pass13
        CALL       _wrong+0
L_pass13:
;locksystem.c,19 ::                 if(PORTD==0X80){do{}while(PORTD.F7==1);Lcd_Init();Lcd_cmd(_LCD_CLEAR);do{Lcd_out(1,1,"7");}while(PORTD==0X00);}
        MOVF       PORTD+0, 0
        XORLW      128
        BTFSS      STATUS+0, 2
        GOTO       L_pass14
L_pass15:
        BTFSC      PORTD+0, 7
        GOTO       L_pass15
        CALL       _Lcd_Init+0
        MOVLW      1
        MOVWF      FARG_Lcd_Cmd_out_char+0
        CALL       _Lcd_Cmd+0
L_pass18:
        MOVLW      1
        MOVWF      FARG_Lcd_Out_row+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_column+0
        MOVLW      ?lstr4_locksystem+0
        MOVWF      FARG_Lcd_Out_text+0
        CALL       _Lcd_Out+0
        MOVF       PORTD+0, 0
        XORLW      0
        BTFSC      STATUS+0, 2
        GOTO       L_pass18
L_pass14:
;locksystem.c,20 ::                 if(PORTD==0X02){wrong();}
        MOVF       PORTD+0, 0
        XORLW      2
        BTFSS      STATUS+0, 2
        GOTO       L_pass21
        CALL       _wrong+0
L_pass21:
;locksystem.c,21 ::                 if(PORTD==0X04){wrong();}
        MOVF       PORTD+0, 0
        XORLW      4
        BTFSS      STATUS+0, 2
        GOTO       L_pass22
        CALL       _wrong+0
L_pass22:
;locksystem.c,22 ::                 if(PORTD==0X08){wrong();}
        MOVF       PORTD+0, 0
        XORLW      8
        BTFSS      STATUS+0, 2
        GOTO       L_pass23
        CALL       _wrong+0
L_pass23:
;locksystem.c,23 ::                 if(PORTD==0X10){wrong();}
        MOVF       PORTD+0, 0
        XORLW      16
        BTFSS      STATUS+0, 2
        GOTO       L_pass24
        CALL       _wrong+0
L_pass24:
;locksystem.c,24 ::                 if(PORTD==0X20){wrong();}
        MOVF       PORTD+0, 0
        XORLW      32
        BTFSS      STATUS+0, 2
        GOTO       L_pass25
        CALL       _wrong+0
L_pass25:
;locksystem.c,25 ::                 if(PORTD==0X40){wrong();}
        MOVF       PORTD+0, 0
        XORLW      64
        BTFSS      STATUS+0, 2
        GOTO       L_pass26
        CALL       _wrong+0
L_pass26:
;locksystem.c,26 ::                 if(PORTD==0X80){wrong();}
        MOVF       PORTD+0, 0
        XORLW      128
        BTFSS      STATUS+0, 2
        GOTO       L_pass27
        CALL       _wrong+0
L_pass27:
;locksystem.c,27 ::                 if(PORTD==0X01){do{}while(PORTD.F0==1);Lcd_Init();Lcd_cmd(_LCD_CLEAR);do{Lcd_out(1,1,"70");}while(PORTD==0X00); }
        MOVF       PORTD+0, 0
        XORLW      1
        BTFSS      STATUS+0, 2
        GOTO       L_pass28
L_pass29:
        BTFSC      PORTD+0, 0
        GOTO       L_pass29
        CALL       _Lcd_Init+0
        MOVLW      1
        MOVWF      FARG_Lcd_Cmd_out_char+0
        CALL       _Lcd_Cmd+0
L_pass32:
        MOVLW      1
        MOVWF      FARG_Lcd_Out_row+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_column+0
        MOVLW      ?lstr5_locksystem+0
        MOVWF      FARG_Lcd_Out_text+0
        CALL       _Lcd_Out+0
        MOVF       PORTD+0, 0
        XORLW      0
        BTFSC      STATUS+0, 2
        GOTO       L_pass32
L_pass28:
;locksystem.c,28 ::                 if(PORTD==0X01){wrong();}
        MOVF       PORTD+0, 0
        XORLW      1
        BTFSS      STATUS+0, 2
        GOTO       L_pass35
        CALL       _wrong+0
L_pass35:
;locksystem.c,29 ::                 if(PORTD==0X04){wrong();}
        MOVF       PORTD+0, 0
        XORLW      4
        BTFSS      STATUS+0, 2
        GOTO       L_pass36
        CALL       _wrong+0
L_pass36:
;locksystem.c,30 ::                 if(PORTD==0X08){wrong();}
        MOVF       PORTD+0, 0
        XORLW      8
        BTFSS      STATUS+0, 2
        GOTO       L_pass37
        CALL       _wrong+0
L_pass37:
;locksystem.c,31 ::                 if(PORTD==0X10){wrong();}
        MOVF       PORTD+0, 0
        XORLW      16
        BTFSS      STATUS+0, 2
        GOTO       L_pass38
        CALL       _wrong+0
L_pass38:
;locksystem.c,32 ::                 if(PORTD==0X20){wrong();}
        MOVF       PORTD+0, 0
        XORLW      32
        BTFSS      STATUS+0, 2
        GOTO       L_pass39
        CALL       _wrong+0
L_pass39:
;locksystem.c,33 ::                 if(PORTD==0X40){wrong();}
        MOVF       PORTD+0, 0
        XORLW      64
        BTFSS      STATUS+0, 2
        GOTO       L_pass40
        CALL       _wrong+0
L_pass40:
;locksystem.c,34 ::                 if(PORTD==0X80){wrong();}
        MOVF       PORTD+0, 0
        XORLW      128
        BTFSS      STATUS+0, 2
        GOTO       L_pass41
        CALL       _wrong+0
L_pass41:
;locksystem.c,35 ::                 if(PORTD==0X02){do{}while(PORTD.F1==1);Lcd_Init();Lcd_cmd(_LCD_CLEAR);do{Lcd_out(1,1,"701");}while(PORTD==0X00);  }
        MOVF       PORTD+0, 0
        XORLW      2
        BTFSS      STATUS+0, 2
        GOTO       L_pass42
L_pass43:
        BTFSC      PORTD+0, 1
        GOTO       L_pass43
        CALL       _Lcd_Init+0
        MOVLW      1
        MOVWF      FARG_Lcd_Cmd_out_char+0
        CALL       _Lcd_Cmd+0
L_pass46:
        MOVLW      1
        MOVWF      FARG_Lcd_Out_row+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_column+0
        MOVLW      ?lstr6_locksystem+0
        MOVWF      FARG_Lcd_Out_text+0
        CALL       _Lcd_Out+0
        MOVF       PORTD+0, 0
        XORLW      0
        BTFSC      STATUS+0, 2
        GOTO       L_pass46
L_pass42:
;locksystem.c,36 ::                 if(PORTD==0X01){wrong();}
        MOVF       PORTD+0, 0
        XORLW      1
        BTFSS      STATUS+0, 2
        GOTO       L_pass49
        CALL       _wrong+0
L_pass49:
;locksystem.c,37 ::                 if(PORTD==0X02){wrong();}
        MOVF       PORTD+0, 0
        XORLW      2
        BTFSS      STATUS+0, 2
        GOTO       L_pass50
        CALL       _wrong+0
L_pass50:
;locksystem.c,38 ::                 if(PORTD==0X08){wrong();}
        MOVF       PORTD+0, 0
        XORLW      8
        BTFSS      STATUS+0, 2
        GOTO       L_pass51
        CALL       _wrong+0
L_pass51:
;locksystem.c,39 ::                 if(PORTD==0X04){wrong();}
        MOVF       PORTD+0, 0
        XORLW      4
        BTFSS      STATUS+0, 2
        GOTO       L_pass52
        CALL       _wrong+0
L_pass52:
;locksystem.c,40 ::                 if(PORTD==0X20){wrong();}
        MOVF       PORTD+0, 0
        XORLW      32
        BTFSS      STATUS+0, 2
        GOTO       L_pass53
        CALL       _wrong+0
L_pass53:
;locksystem.c,41 ::                 if(PORTD==0X40){wrong();}
        MOVF       PORTD+0, 0
        XORLW      64
        BTFSS      STATUS+0, 2
        GOTO       L_pass54
        CALL       _wrong+0
L_pass54:
;locksystem.c,42 ::                 if(PORTD==0X80){wrong();}
        MOVF       PORTD+0, 0
        XORLW      128
        BTFSS      STATUS+0, 2
        GOTO       L_pass55
        CALL       _wrong+0
L_pass55:
;locksystem.c,43 ::                 if(PORTD==0X10){do{}while(PORTD.F4==1);Lcd_Init();Lcd_cmd(_LCD_CLEAR);Lcd_out(1,1,"7014");delay_ms(500);  }
        MOVF       PORTD+0, 0
        XORLW      16
        BTFSS      STATUS+0, 2
        GOTO       L_pass56
L_pass57:
        BTFSC      PORTD+0, 4
        GOTO       L_pass57
        CALL       _Lcd_Init+0
        MOVLW      1
        MOVWF      FARG_Lcd_Cmd_out_char+0
        CALL       _Lcd_Cmd+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_row+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_column+0
        MOVLW      ?lstr7_locksystem+0
        MOVWF      FARG_Lcd_Out_text+0
        CALL       _Lcd_Out+0
        MOVLW      13
        MOVWF      R11+0
        MOVLW      175
        MOVWF      R12+0
        MOVLW      182
        MOVWF      R13+0
L_pass60:
        DECFSZ     R13+0, 1
        GOTO       L_pass60
        DECFSZ     R12+0, 1
        GOTO       L_pass60
        DECFSZ     R11+0, 1
        GOTO       L_pass60
        NOP
L_pass56:
;locksystem.c,44 ::                 }
L_end_pass:
        RETURN
; end of _pass

_s1:

;locksystem.c,46 ::                 void s1(){
;locksystem.c,47 ::                 a=a+1;if(a>=2){a=0;}if(a==0){Lcd_Init();Lcd_cmd(_LCD_CLEAR);Lcd_out(1,1,"LOCK R1 R2");PORTB.F0=1;delay_ms(2500);PORTB.F0=0;reset();}
        INCF       _a+0, 1
        BTFSC      STATUS+0, 2
        INCF       _a+1, 1
        MOVLW      128
        XORWF      _a+1, 0
        MOVWF      R0+0
        MOVLW      128
        SUBWF      R0+0, 0
        BTFSS      STATUS+0, 2
        GOTO       L__s186
        MOVLW      2
        SUBWF      _a+0, 0
L__s186:
        BTFSS      STATUS+0, 0
        GOTO       L_s161
        CLRF       _a+0
        CLRF       _a+1
L_s161:
        MOVLW      0
        XORWF      _a+1, 0
        BTFSS      STATUS+0, 2
        GOTO       L__s187
        MOVLW      0
        XORWF      _a+0, 0
L__s187:
        BTFSS      STATUS+0, 2
        GOTO       L_s162
        CALL       _Lcd_Init+0
        MOVLW      1
        MOVWF      FARG_Lcd_Cmd_out_char+0
        CALL       _Lcd_Cmd+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_row+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_column+0
        MOVLW      ?lstr8_locksystem+0
        MOVWF      FARG_Lcd_Out_text+0
        CALL       _Lcd_Out+0
        BSF        PORTB+0, 0
        MOVLW      64
        MOVWF      R11+0
        MOVLW      106
        MOVWF      R12+0
        MOVLW      151
        MOVWF      R13+0
L_s163:
        DECFSZ     R13+0, 1
        GOTO       L_s163
        DECFSZ     R12+0, 1
        GOTO       L_s163
        DECFSZ     R11+0, 1
        GOTO       L_s163
        NOP
        NOP
        BCF        PORTB+0, 0
        CALL       _reset+0
L_s162:
;locksystem.c,48 ::                 if(a==1){Lcd_Init();Lcd_cmd(_LCD_CLEAR);Lcd_out(1,1,"UNLOCK R1 R2");PORTB.F1=1;delay_ms(2500);PORTB.F1=0;reset();}
        MOVLW      0
        XORWF      _a+1, 0
        BTFSS      STATUS+0, 2
        GOTO       L__s188
        MOVLW      1
        XORWF      _a+0, 0
L__s188:
        BTFSS      STATUS+0, 2
        GOTO       L_s164
        CALL       _Lcd_Init+0
        MOVLW      1
        MOVWF      FARG_Lcd_Cmd_out_char+0
        CALL       _Lcd_Cmd+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_row+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_column+0
        MOVLW      ?lstr9_locksystem+0
        MOVWF      FARG_Lcd_Out_text+0
        CALL       _Lcd_Out+0
        BSF        PORTB+0, 1
        MOVLW      64
        MOVWF      R11+0
        MOVLW      106
        MOVWF      R12+0
        MOVLW      151
        MOVWF      R13+0
L_s165:
        DECFSZ     R13+0, 1
        GOTO       L_s165
        DECFSZ     R12+0, 1
        GOTO       L_s165
        DECFSZ     R11+0, 1
        GOTO       L_s165
        NOP
        NOP
        BCF        PORTB+0, 1
        CALL       _reset+0
L_s164:
;locksystem.c,49 ::                 }
L_end_s1:
        RETURN
; end of _s1

_s2:

;locksystem.c,51 ::                 void s2(){
;locksystem.c,52 ::                 b=b+1;if(b>=2){b=0;}if(b==0){Lcd_Init();Lcd_cmd(_LCD_CLEAR);Lcd_out(1,1,"LOCK R3 R4");PORTB.F2=1;delay_ms(2500);PORTB.F2=0;reset();
        INCF       _b+0, 1
        BTFSC      STATUS+0, 2
        INCF       _b+1, 1
        MOVLW      128
        XORWF      _b+1, 0
        MOVWF      R0+0
        MOVLW      128
        SUBWF      R0+0, 0
        BTFSS      STATUS+0, 2
        GOTO       L__s290
        MOVLW      2
        SUBWF      _b+0, 0
L__s290:
        BTFSS      STATUS+0, 0
        GOTO       L_s266
        CLRF       _b+0
        CLRF       _b+1
L_s266:
        MOVLW      0
        XORWF      _b+1, 0
        BTFSS      STATUS+0, 2
        GOTO       L__s291
        MOVLW      0
        XORWF      _b+0, 0
L__s291:
        BTFSS      STATUS+0, 2
        GOTO       L_s267
        CALL       _Lcd_Init+0
        MOVLW      1
        MOVWF      FARG_Lcd_Cmd_out_char+0
        CALL       _Lcd_Cmd+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_row+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_column+0
        MOVLW      ?lstr10_locksystem+0
        MOVWF      FARG_Lcd_Out_text+0
        CALL       _Lcd_Out+0
        BSF        PORTB+0, 2
        MOVLW      64
        MOVWF      R11+0
        MOVLW      106
        MOVWF      R12+0
        MOVLW      151
        MOVWF      R13+0
L_s268:
        DECFSZ     R13+0, 1
        GOTO       L_s268
        DECFSZ     R12+0, 1
        GOTO       L_s268
        DECFSZ     R11+0, 1
        GOTO       L_s268
        NOP
        NOP
        BCF        PORTB+0, 2
        CALL       _reset+0
;locksystem.c,53 ::                 }if(b==1){Lcd_Init();Lcd_cmd(_LCD_CLEAR);Lcd_out(1,1,"UNLOCK R4 R5");PORTB.F3=1;delay_ms(2500);PORTB.F3=0;reset();}   }
L_s267:
        MOVLW      0
        XORWF      _b+1, 0
        BTFSS      STATUS+0, 2
        GOTO       L__s292
        MOVLW      1
        XORWF      _b+0, 0
L__s292:
        BTFSS      STATUS+0, 2
        GOTO       L_s269
        CALL       _Lcd_Init+0
        MOVLW      1
        MOVWF      FARG_Lcd_Cmd_out_char+0
        CALL       _Lcd_Cmd+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_row+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_column+0
        MOVLW      ?lstr11_locksystem+0
        MOVWF      FARG_Lcd_Out_text+0
        CALL       _Lcd_Out+0
        BSF        PORTB+0, 3
        MOVLW      64
        MOVWF      R11+0
        MOVLW      106
        MOVWF      R12+0
        MOVLW      151
        MOVWF      R13+0
L_s270:
        DECFSZ     R13+0, 1
        GOTO       L_s270
        DECFSZ     R12+0, 1
        GOTO       L_s270
        DECFSZ     R11+0, 1
        GOTO       L_s270
        NOP
        NOP
        BCF        PORTB+0, 3
        CALL       _reset+0
L_s269:
L_end_s2:
        RETURN
; end of _s2

_s3:

;locksystem.c,56 ::                 void s3(){
;locksystem.c,57 ::                 n=n+1;if(n>=2){n=0;}if(n==0){Lcd_Init();Lcd_cmd(_LCD_CLEAR);Lcd_out(1,1,"LOCK R5 R6");PORTB.F4=1;delay_ms(2500);PORTB.F4=0;reset();
        INCF       _n+0, 1
        BTFSC      STATUS+0, 2
        INCF       _n+1, 1
        MOVLW      128
        XORWF      _n+1, 0
        MOVWF      R0+0
        MOVLW      128
        SUBWF      R0+0, 0
        BTFSS      STATUS+0, 2
        GOTO       L__s394
        MOVLW      2
        SUBWF      _n+0, 0
L__s394:
        BTFSS      STATUS+0, 0
        GOTO       L_s371
        CLRF       _n+0
        CLRF       _n+1
L_s371:
        MOVLW      0
        XORWF      _n+1, 0
        BTFSS      STATUS+0, 2
        GOTO       L__s395
        MOVLW      0
        XORWF      _n+0, 0
L__s395:
        BTFSS      STATUS+0, 2
        GOTO       L_s372
        CALL       _Lcd_Init+0
        MOVLW      1
        MOVWF      FARG_Lcd_Cmd_out_char+0
        CALL       _Lcd_Cmd+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_row+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_column+0
        MOVLW      ?lstr12_locksystem+0
        MOVWF      FARG_Lcd_Out_text+0
        CALL       _Lcd_Out+0
        BSF        PORTB+0, 4
        MOVLW      64
        MOVWF      R11+0
        MOVLW      106
        MOVWF      R12+0
        MOVLW      151
        MOVWF      R13+0
L_s373:
        DECFSZ     R13+0, 1
        GOTO       L_s373
        DECFSZ     R12+0, 1
        GOTO       L_s373
        DECFSZ     R11+0, 1
        GOTO       L_s373
        NOP
        NOP
        BCF        PORTB+0, 4
        CALL       _reset+0
;locksystem.c,58 ::                 }if(n==1){Lcd_Init();Lcd_cmd(_LCD_CLEAR);Lcd_out(1,1,"UNLOCK R5 R6");PORTB.F5=1;delay_ms(2500);PORTB.F5=0;reset();}   }
L_s372:
        MOVLW      0
        XORWF      _n+1, 0
        BTFSS      STATUS+0, 2
        GOTO       L__s396
        MOVLW      1
        XORWF      _n+0, 0
L__s396:
        BTFSS      STATUS+0, 2
        GOTO       L_s374
        CALL       _Lcd_Init+0
        MOVLW      1
        MOVWF      FARG_Lcd_Cmd_out_char+0
        CALL       _Lcd_Cmd+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_row+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_column+0
        MOVLW      ?lstr13_locksystem+0
        MOVWF      FARG_Lcd_Out_text+0
        CALL       _Lcd_Out+0
        BSF        PORTB+0, 5
        MOVLW      64
        MOVWF      R11+0
        MOVLW      106
        MOVWF      R12+0
        MOVLW      151
        MOVWF      R13+0
L_s375:
        DECFSZ     R13+0, 1
        GOTO       L_s375
        DECFSZ     R12+0, 1
        GOTO       L_s375
        DECFSZ     R11+0, 1
        GOTO       L_s375
        NOP
        NOP
        BCF        PORTB+0, 5
        CALL       _reset+0
L_s374:
L_end_s3:
        RETURN
; end of _s3

_roomchoice:

;locksystem.c,60 ::                 void roomchoice(){
;locksystem.c,61 ::                 if(PORTD.F1==1){S1();}
        BTFSS      PORTD+0, 1
        GOTO       L_roomchoice76
        CALL       _s1+0
L_roomchoice76:
;locksystem.c,62 ::                 if(PORTD.F2==1){S2();}
        BTFSS      PORTD+0, 2
        GOTO       L_roomchoice77
        CALL       _s2+0
L_roomchoice77:
;locksystem.c,63 ::                 if(PORTD.F3==1){S3(); }
        BTFSS      PORTD+0, 3
        GOTO       L_roomchoice78
        CALL       _s3+0
        GOTO       L_roomchoice79
L_roomchoice78:
;locksystem.c,64 ::                 else {reset();}
        CALL       _reset+0
L_roomchoice79:
;locksystem.c,65 ::                 }
L_end_roomchoice:
        RETURN
; end of _roomchoice

_main:

;locksystem.c,67 ::                 void main() {
;locksystem.c,78 ::                 TRISA=0;PORTA=0;TRISE=0;PORTE=0;TRISB=0;PORTB=0;TRISD=1;PORTD=0;TRISC.F0=1;PORTC.F0=1;TRISC.F1=1;PORTC.F1=1;
        CLRF       TRISA+0
        CLRF       PORTA+0
        CLRF       TRISE+0
        CLRF       PORTE+0
        CLRF       TRISB+0
        CLRF       PORTB+0
        MOVLW      1
        MOVWF      TRISD+0
        CLRF       PORTD+0
        BSF        TRISC+0, 0
        BSF        PORTC+0, 0
        BSF        TRISC+0, 1
        BSF        PORTC+0, 1
;locksystem.c,80 ::                 Lcd_Init();Lcd_cmd(_LCD_CLEAR);Lcd_out(1,1," EEJ LOCK SYSTEM");
        CALL       _Lcd_Init+0
        MOVLW      1
        MOVWF      FARG_Lcd_Cmd_out_char+0
        CALL       _Lcd_Cmd+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_row+0
        MOVLW      1
        MOVWF      FARG_Lcd_Out_column+0
        MOVLW      ?lstr14_locksystem+0
        MOVWF      FARG_Lcd_Out_text+0
        CALL       _Lcd_Out+0
;locksystem.c,81 ::                 delay_ms(1000);
        MOVLW      26
        MOVWF      R11+0
        MOVLW      94
        MOVWF      R12+0
        MOVLW      110
        MOVWF      R13+0
L_main80:
        DECFSZ     R13+0, 1
        GOTO       L_main80
        DECFSZ     R12+0, 1
        GOTO       L_main80
        DECFSZ     R11+0, 1
        GOTO       L_main80
        NOP
;locksystem.c,82 ::                 PORTB.F7=1;
        BSF        PORTB+0, 7
;locksystem.c,83 ::                 pass();
        CALL       _pass+0
;locksystem.c,84 ::                 start();
        CALL       _start+0
;locksystem.c,85 ::                 roomchoice();
        CALL       _roomchoice+0
;locksystem.c,90 ::                 }
L_end_main:
        GOTO       $+0
; end of _main