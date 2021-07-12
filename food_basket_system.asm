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

_aut:

;korona.c,1 ::                 void aut(){
;korona.c,2 ::                 do{PORTC=0X00;}while(PORTD.F6==0);PORTB.F7=0;PORTB.F6=1;PORTB.F1=1;delay_ms(300);do{PORTB.F1=0;PORTC=0X01;}while(PORTD.F0==0);if(PORTD.F0==1)
L_aut0:
        CLRF       PORTC+0
        BTFSS      PORTD+0, 6
        GOTO       L_aut0
        BCF        PORTB+0, 7
        BSF        PORTB+0, 6
        BSF        PORTB+0, 1
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_aut3:
        DECFSZ     R13+0, 1
        GOTO       L_aut3
        DECFSZ     R12+0, 1
        GOTO       L_aut3
        DECFSZ     R11+0, 1
        GOTO       L_aut3
        NOP
        NOP
L_aut4:
        BCF        PORTB+0, 1
        MOVLW      1
        MOVWF      PORTC+0
        BTFSS      PORTD+0, 0
        GOTO       L_aut4
        BTFSS      PORTD+0, 0
        GOTO       L_aut7
;korona.c,3 ::                 {PORTB.F1=1;delay_ms(300);}do{PORTB.F1=0;PORTC=0X03;}while(PORTD.F2==0);if(PORTD.F2==1){PORTB.F1=1;delay_ms(300);}do{PORTB.F1=0;
        BSF        PORTB+0, 1
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_aut8:
        DECFSZ     R13+0, 1
        GOTO       L_aut8
        DECFSZ     R12+0, 1
        GOTO       L_aut8
        DECFSZ     R11+0, 1
        GOTO       L_aut8
        NOP
        NOP
L_aut7:
L_aut9:
        BCF        PORTB+0, 1
        MOVLW      3
        MOVWF      PORTC+0
        BTFSS      PORTD+0, 2
        GOTO       L_aut9
        BTFSS      PORTD+0, 2
        GOTO       L_aut12
        BSF        PORTB+0, 1
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_aut13:
        DECFSZ     R13+0, 1
        GOTO       L_aut13
        DECFSZ     R12+0, 1
        GOTO       L_aut13
        DECFSZ     R11+0, 1
        GOTO       L_aut13
        NOP
        NOP
L_aut12:
L_aut14:
        BCF        PORTB+0, 1
;korona.c,4 ::                 PORTC=0X05;}while(PORTD.F4==0);if(PORTD.F4==1){PORTB.F2=1;delay_ms(300);PORTC=0X03;delay_ms(300);PORTC=0X01;delay_ms(300);PORTC=0X00;PORTB.F2=0;}
        MOVLW      5
        MOVWF      PORTC+0
        BTFSS      PORTD+0, 4
        GOTO       L_aut14
        BTFSS      PORTD+0, 4
        GOTO       L_aut17
        BSF        PORTB+0, 2
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_aut18:
        DECFSZ     R13+0, 1
        GOTO       L_aut18
        DECFSZ     R12+0, 1
        GOTO       L_aut18
        DECFSZ     R11+0, 1
        GOTO       L_aut18
        NOP
        NOP
        MOVLW      3
        MOVWF      PORTC+0
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_aut19:
        DECFSZ     R13+0, 1
        GOTO       L_aut19
        DECFSZ     R12+0, 1
        GOTO       L_aut19
        DECFSZ     R11+0, 1
        GOTO       L_aut19
        NOP
        NOP
        MOVLW      1
        MOVWF      PORTC+0
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_aut20:
        DECFSZ     R13+0, 1
        GOTO       L_aut20
        DECFSZ     R12+0, 1
        GOTO       L_aut20
        DECFSZ     R11+0, 1
        GOTO       L_aut20
        NOP
        NOP
        CLRF       PORTC+0
        BCF        PORTB+0, 2
L_aut17:
;korona.c,5 ::                 PORTB.F4=1;delay_ms(300);do{PORTB.F4=0;PORTC=0X02;}while(PORTD.F1==0);if(PORTD.F1==1){PORTB.F4=1;delay_ms(300);}do{PORTB.F4=0;PORTC=0X04;}
        BSF        PORTB+0, 4
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_aut21:
        DECFSZ     R13+0, 1
        GOTO       L_aut21
        DECFSZ     R12+0, 1
        GOTO       L_aut21
        DECFSZ     R11+0, 1
        GOTO       L_aut21
        NOP
        NOP
L_aut22:
        BCF        PORTB+0, 4
        MOVLW      2
        MOVWF      PORTC+0
        BTFSS      PORTD+0, 1
        GOTO       L_aut22
        BTFSS      PORTD+0, 1
        GOTO       L_aut25
        BSF        PORTB+0, 4
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_aut26:
        DECFSZ     R13+0, 1
        GOTO       L_aut26
        DECFSZ     R12+0, 1
        GOTO       L_aut26
        DECFSZ     R11+0, 1
        GOTO       L_aut26
        NOP
        NOP
L_aut25:
L_aut27:
        BCF        PORTB+0, 4
        MOVLW      4
        MOVWF      PORTC+0
;korona.c,6 ::                 while(PORTD.F3==0);if(PORTD.F3==1){PORTB.F4=1;delay_ms(300);}do{PORTB.F4=0;PORTC=0X06;}while(PORTD.F5==0);if(PORTD.F5==1){PORTB.F5=1;delay_ms(300);
        BTFSS      PORTD+0, 3
        GOTO       L_aut27
        BTFSS      PORTD+0, 3
        GOTO       L_aut30
        BSF        PORTB+0, 4
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_aut31:
        DECFSZ     R13+0, 1
        GOTO       L_aut31
        DECFSZ     R12+0, 1
        GOTO       L_aut31
        DECFSZ     R11+0, 1
        GOTO       L_aut31
        NOP
        NOP
L_aut30:
L_aut32:
        BCF        PORTB+0, 4
        MOVLW      6
        MOVWF      PORTC+0
        BTFSS      PORTD+0, 5
        GOTO       L_aut32
        BTFSS      PORTD+0, 5
        GOTO       L_aut35
        BSF        PORTB+0, 5
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_aut36:
        DECFSZ     R13+0, 1
        GOTO       L_aut36
        DECFSZ     R12+0, 1
        GOTO       L_aut36
        DECFSZ     R11+0, 1
        GOTO       L_aut36
        NOP
        NOP
;korona.c,7 ::                 PORTC=0X04;delay_ms(300);PORTC=0X02;delay_ms(300);PORTC=0X00;PORTB.F5=0;}PORTB.F7=1;PORTB.F6=0;PORTB.F3=1;delay_ms(15);PORTB.F3=0;}
        MOVLW      4
        MOVWF      PORTC+0
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_aut37:
        DECFSZ     R13+0, 1
        GOTO       L_aut37
        DECFSZ     R12+0, 1
        GOTO       L_aut37
        DECFSZ     R11+0, 1
        GOTO       L_aut37
        NOP
        NOP
        MOVLW      2
        MOVWF      PORTC+0
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_aut38:
        DECFSZ     R13+0, 1
        GOTO       L_aut38
        DECFSZ     R12+0, 1
        GOTO       L_aut38
        DECFSZ     R11+0, 1
        GOTO       L_aut38
        NOP
        NOP
        CLRF       PORTC+0
        BCF        PORTB+0, 5
L_aut35:
        BSF        PORTB+0, 7
        BCF        PORTB+0, 6
        BSF        PORTB+0, 3
        MOVLW      39
        MOVWF      R12+0
        MOVLW      245
        MOVWF      R13+0
L_aut39:
        DECFSZ     R13+0, 1
        GOTO       L_aut39
        DECFSZ     R12+0, 1
        GOTO       L_aut39
        BCF        PORTB+0, 3
L_end_aut:
        RETURN
; end of _aut

_s1:

;korona.c,8 ::                 void s1(){
;korona.c,9 ::                 do{PORTB.f1=0;}while(PORTD.F0==0);if(PORTD.F0==1){PORTB.F7=0;PORTB.F6=1;PORTB.f1=1;delay_ms(300);}PORTB.f1=0;do{PORTC=0X01;}while(PORTD.F0==0);
L_s140:
        BCF        PORTB+0, 1
        BTFSS      PORTD+0, 0
        GOTO       L_s140
        BTFSS      PORTD+0, 0
        GOTO       L_s143
        BCF        PORTB+0, 7
        BSF        PORTB+0, 6
        BSF        PORTB+0, 1
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s144:
        DECFSZ     R13+0, 1
        GOTO       L_s144
        DECFSZ     R12+0, 1
        GOTO       L_s144
        DECFSZ     R11+0, 1
        GOTO       L_s144
        NOP
        NOP
L_s143:
        BCF        PORTB+0, 1
L_s145:
        MOVLW      1
        MOVWF      PORTC+0
        BTFSS      PORTD+0, 0
        GOTO       L_s145
;korona.c,10 ::                 PORTB.f2=1;delay_ms(300);PORTB.f2=0;PORTC=0X00;PORTB.F7=1;PORTB.F6=0;PORTB.F3=1;delay_ms(15);PORTB.F3=0;}
        BSF        PORTB+0, 2
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s148:
        DECFSZ     R13+0, 1
        GOTO       L_s148
        DECFSZ     R12+0, 1
        GOTO       L_s148
        DECFSZ     R11+0, 1
        GOTO       L_s148
        NOP
        NOP
        BCF        PORTB+0, 2
        CLRF       PORTC+0
        BSF        PORTB+0, 7
        BCF        PORTB+0, 6
        BSF        PORTB+0, 3
        MOVLW      39
        MOVWF      R12+0
        MOVLW      245
        MOVWF      R13+0
L_s149:
        DECFSZ     R13+0, 1
        GOTO       L_s149
        DECFSZ     R12+0, 1
        GOTO       L_s149
        BCF        PORTB+0, 3
L_end_s1:
        RETURN
; end of _s1

_s2:

;korona.c,11 ::                 void s2(){
;korona.c,12 ::                 do{PORTB.f4=0;}while(PORTD.F1==0);if(PORTD.F1==1){PORTB.F7=0;PORTB.F6=1;PORTB.f4=1;delay_ms(300);}PORTB.f4=0;do{PORTC=0X02;}while(PORTD.F1==0);
L_s250:
        BCF        PORTB+0, 4
        BTFSS      PORTD+0, 1
        GOTO       L_s250
        BTFSS      PORTD+0, 1
        GOTO       L_s253
        BCF        PORTB+0, 7
        BSF        PORTB+0, 6
        BSF        PORTB+0, 4
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s254:
        DECFSZ     R13+0, 1
        GOTO       L_s254
        DECFSZ     R12+0, 1
        GOTO       L_s254
        DECFSZ     R11+0, 1
        GOTO       L_s254
        NOP
        NOP
L_s253:
        BCF        PORTB+0, 4
L_s255:
        MOVLW      2
        MOVWF      PORTC+0
        BTFSS      PORTD+0, 1
        GOTO       L_s255
;korona.c,13 ::                 PORTB.f5=1;delay_ms(300);PORTB.f5=0;PORTC=0X00;PORTB.F7=1;PORTB.F6=0;PORTB.F3=1;delay_ms(15);PORTB.F3=0;}
        BSF        PORTB+0, 5
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s258:
        DECFSZ     R13+0, 1
        GOTO       L_s258
        DECFSZ     R12+0, 1
        GOTO       L_s258
        DECFSZ     R11+0, 1
        GOTO       L_s258
        NOP
        NOP
        BCF        PORTB+0, 5
        CLRF       PORTC+0
        BSF        PORTB+0, 7
        BCF        PORTB+0, 6
        BSF        PORTB+0, 3
        MOVLW      39
        MOVWF      R12+0
        MOVLW      245
        MOVWF      R13+0
L_s259:
        DECFSZ     R13+0, 1
        GOTO       L_s259
        DECFSZ     R12+0, 1
        GOTO       L_s259
        BCF        PORTB+0, 3
L_end_s2:
        RETURN
; end of _s2

_s3:

;korona.c,14 ::                 void s3(){
;korona.c,15 ::                 do{PORTB.f1=0;}while(PORTD.F2==0);if(PORTD.F2==1){PORTB.F7=0;PORTB.F6=1;PORTB.f1=1;delay_ms(300);}PORTC=0X01;delay_ms(300);PORTB.F1=0;do{PORTC=0X03;}
L_s360:
        BCF        PORTB+0, 1
        BTFSS      PORTD+0, 2
        GOTO       L_s360
        BTFSS      PORTD+0, 2
        GOTO       L_s363
        BCF        PORTB+0, 7
        BSF        PORTB+0, 6
        BSF        PORTB+0, 1
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s364:
        DECFSZ     R13+0, 1
        GOTO       L_s364
        DECFSZ     R12+0, 1
        GOTO       L_s364
        DECFSZ     R11+0, 1
        GOTO       L_s364
        NOP
        NOP
L_s363:
        MOVLW      1
        MOVWF      PORTC+0
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s365:
        DECFSZ     R13+0, 1
        GOTO       L_s365
        DECFSZ     R12+0, 1
        GOTO       L_s365
        DECFSZ     R11+0, 1
        GOTO       L_s365
        NOP
        NOP
        BCF        PORTB+0, 1
L_s366:
        MOVLW      3
        MOVWF      PORTC+0
;korona.c,16 ::                 while(PORTD.F2==0);PORTB.f2=1;delay_ms(300);PORTC=0X01;delay_ms(300);PORTB.f2=0;PORTC=0X00;PORTB.F7=1;PORTB.F6=0;PORTB.F3=1;delay_ms(15);PORTB.F3=0;}
        BTFSS      PORTD+0, 2
        GOTO       L_s366
        BSF        PORTB+0, 2
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s369:
        DECFSZ     R13+0, 1
        GOTO       L_s369
        DECFSZ     R12+0, 1
        GOTO       L_s369
        DECFSZ     R11+0, 1
        GOTO       L_s369
        NOP
        NOP
        MOVLW      1
        MOVWF      PORTC+0
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s370:
        DECFSZ     R13+0, 1
        GOTO       L_s370
        DECFSZ     R12+0, 1
        GOTO       L_s370
        DECFSZ     R11+0, 1
        GOTO       L_s370
        NOP
        NOP
        BCF        PORTB+0, 2
        CLRF       PORTC+0
        BSF        PORTB+0, 7
        BCF        PORTB+0, 6
        BSF        PORTB+0, 3
        MOVLW      39
        MOVWF      R12+0
        MOVLW      245
        MOVWF      R13+0
L_s371:
        DECFSZ     R13+0, 1
        GOTO       L_s371
        DECFSZ     R12+0, 1
        GOTO       L_s371
        BCF        PORTB+0, 3
L_end_s3:
        RETURN
; end of _s3

_s4:

;korona.c,17 ::                 void s4(){
;korona.c,18 ::                 do{PORTB.f4=0;}while(PORTD.F3==0);if(PORTD.F3==1){PORTB.F7=0;PORTB.F6=1;PORTB.f4=1;delay_ms(300);}PORTC=0X02;delay_ms(300);PORTB.F4=0;do{PORTC=0X04;}
L_s472:
        BCF        PORTB+0, 4
        BTFSS      PORTD+0, 3
        GOTO       L_s472
        BTFSS      PORTD+0, 3
        GOTO       L_s475
        BCF        PORTB+0, 7
        BSF        PORTB+0, 6
        BSF        PORTB+0, 4
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s476:
        DECFSZ     R13+0, 1
        GOTO       L_s476
        DECFSZ     R12+0, 1
        GOTO       L_s476
        DECFSZ     R11+0, 1
        GOTO       L_s476
        NOP
        NOP
L_s475:
        MOVLW      2
        MOVWF      PORTC+0
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s477:
        DECFSZ     R13+0, 1
        GOTO       L_s477
        DECFSZ     R12+0, 1
        GOTO       L_s477
        DECFSZ     R11+0, 1
        GOTO       L_s477
        NOP
        NOP
        BCF        PORTB+0, 4
L_s478:
        MOVLW      4
        MOVWF      PORTC+0
;korona.c,19 ::                 while(PORTD.F3==0);PORTB.f5=1;delay_ms(300);PORTC=0X02;delay_ms(300);PORTB.f5=0;PORTC=0X00;PORTB.F7=1;PORTB.F6=0;PORTB.F3=1;delay_ms(15);PORTB.F3=0;}
        BTFSS      PORTD+0, 3
        GOTO       L_s478
        BSF        PORTB+0, 5
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s481:
        DECFSZ     R13+0, 1
        GOTO       L_s481
        DECFSZ     R12+0, 1
        GOTO       L_s481
        DECFSZ     R11+0, 1
        GOTO       L_s481
        NOP
        NOP
        MOVLW      2
        MOVWF      PORTC+0
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s482:
        DECFSZ     R13+0, 1
        GOTO       L_s482
        DECFSZ     R12+0, 1
        GOTO       L_s482
        DECFSZ     R11+0, 1
        GOTO       L_s482
        NOP
        NOP
        BCF        PORTB+0, 5
        CLRF       PORTC+0
        BSF        PORTB+0, 7
        BCF        PORTB+0, 6
        BSF        PORTB+0, 3
        MOVLW      39
        MOVWF      R12+0
        MOVLW      245
        MOVWF      R13+0
L_s483:
        DECFSZ     R13+0, 1
        GOTO       L_s483
        DECFSZ     R12+0, 1
        GOTO       L_s483
        BCF        PORTB+0, 3
L_end_s4:
        RETURN
; end of _s4

_s5:

;korona.c,20 ::                 void s5(){
;korona.c,21 ::                 do{PORTB.f1=0;}while(PORTD.F4==0);if(PORTD.F4==1){PORTB.F7=0;PORTB.F6=1;PORTB.f1=1;delay_ms(300);}PORTC=0X01;delay_ms(300);PORTC=0X03;delay_ms(300);
L_s584:
        BCF        PORTB+0, 1
        BTFSS      PORTD+0, 4
        GOTO       L_s584
        BTFSS      PORTD+0, 4
        GOTO       L_s587
        BCF        PORTB+0, 7
        BSF        PORTB+0, 6
        BSF        PORTB+0, 1
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s588:
        DECFSZ     R13+0, 1
        GOTO       L_s588
        DECFSZ     R12+0, 1
        GOTO       L_s588
        DECFSZ     R11+0, 1
        GOTO       L_s588
        NOP
        NOP
L_s587:
        MOVLW      1
        MOVWF      PORTC+0
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s589:
        DECFSZ     R13+0, 1
        GOTO       L_s589
        DECFSZ     R12+0, 1
        GOTO       L_s589
        DECFSZ     R11+0, 1
        GOTO       L_s589
        NOP
        NOP
        MOVLW      3
        MOVWF      PORTC+0
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s590:
        DECFSZ     R13+0, 1
        GOTO       L_s590
        DECFSZ     R12+0, 1
        GOTO       L_s590
        DECFSZ     R11+0, 1
        GOTO       L_s590
        NOP
        NOP
;korona.c,22 ::                 PORTB.F1=0;do{PORTC=0X05;}while(PORTD.F4==0);PORTB.f2=1;delay_ms(300);PORTC=0X03;delay_ms(300);PORTC=0X01;delay_ms(300);PORTB.f2=0;PORTC=0X00;
        BCF        PORTB+0, 1
L_s591:
        MOVLW      5
        MOVWF      PORTC+0
        BTFSS      PORTD+0, 4
        GOTO       L_s591
        BSF        PORTB+0, 2
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s594:
        DECFSZ     R13+0, 1
        GOTO       L_s594
        DECFSZ     R12+0, 1
        GOTO       L_s594
        DECFSZ     R11+0, 1
        GOTO       L_s594
        NOP
        NOP
        MOVLW      3
        MOVWF      PORTC+0
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s595:
        DECFSZ     R13+0, 1
        GOTO       L_s595
        DECFSZ     R12+0, 1
        GOTO       L_s595
        DECFSZ     R11+0, 1
        GOTO       L_s595
        NOP
        NOP
        MOVLW      1
        MOVWF      PORTC+0
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s596:
        DECFSZ     R13+0, 1
        GOTO       L_s596
        DECFSZ     R12+0, 1
        GOTO       L_s596
        DECFSZ     R11+0, 1
        GOTO       L_s596
        NOP
        NOP
        BCF        PORTB+0, 2
        CLRF       PORTC+0
;korona.c,23 ::                 PORTB.F7=1;PORTB.F6=0;PORTB.F3=1;delay_ms(15);PORTB.F3=0;}
        BSF        PORTB+0, 7
        BCF        PORTB+0, 6
        BSF        PORTB+0, 3
        MOVLW      39
        MOVWF      R12+0
        MOVLW      245
        MOVWF      R13+0
L_s597:
        DECFSZ     R13+0, 1
        GOTO       L_s597
        DECFSZ     R12+0, 1
        GOTO       L_s597
        BCF        PORTB+0, 3
L_end_s5:
        RETURN
; end of _s5

_s6:

;korona.c,24 ::                 void s6(){
;korona.c,25 ::                 do{PORTB.f4=0;}while(PORTD.F5==0);if(PORTD.F5==1){PORTB.F7=0;PORTB.F6=1;PORTB.f4=1;delay_ms(300);}PORTC=0X02;delay_ms(300);PORTC=0X04;delay_ms(300);
L_s698:
        BCF        PORTB+0, 4
        BTFSS      PORTD+0, 5
        GOTO       L_s698
        BTFSS      PORTD+0, 5
        GOTO       L_s6101
        BCF        PORTB+0, 7
        BSF        PORTB+0, 6
        BSF        PORTB+0, 4
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s6102:
        DECFSZ     R13+0, 1
        GOTO       L_s6102
        DECFSZ     R12+0, 1
        GOTO       L_s6102
        DECFSZ     R11+0, 1
        GOTO       L_s6102
        NOP
        NOP
L_s6101:
        MOVLW      2
        MOVWF      PORTC+0
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s6103:
        DECFSZ     R13+0, 1
        GOTO       L_s6103
        DECFSZ     R12+0, 1
        GOTO       L_s6103
        DECFSZ     R11+0, 1
        GOTO       L_s6103
        NOP
        NOP
        MOVLW      4
        MOVWF      PORTC+0
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s6104:
        DECFSZ     R13+0, 1
        GOTO       L_s6104
        DECFSZ     R12+0, 1
        GOTO       L_s6104
        DECFSZ     R11+0, 1
        GOTO       L_s6104
        NOP
        NOP
;korona.c,26 ::                 PORTB.F4=0;do{PORTC=0X06;}while(PORTD.F5==0);PORTB.f5=1;delay_ms(300);PORTC=0X04;delay_ms(300);PORTC=0X02;delay_ms(300);PORTB.f5=0;PORTC=0X00;
        BCF        PORTB+0, 4
L_s6105:
        MOVLW      6
        MOVWF      PORTC+0
        BTFSS      PORTD+0, 5
        GOTO       L_s6105
        BSF        PORTB+0, 5
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s6108:
        DECFSZ     R13+0, 1
        GOTO       L_s6108
        DECFSZ     R12+0, 1
        GOTO       L_s6108
        DECFSZ     R11+0, 1
        GOTO       L_s6108
        NOP
        NOP
        MOVLW      4
        MOVWF      PORTC+0
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s6109:
        DECFSZ     R13+0, 1
        GOTO       L_s6109
        DECFSZ     R12+0, 1
        GOTO       L_s6109
        DECFSZ     R11+0, 1
        GOTO       L_s6109
        NOP
        NOP
        MOVLW      2
        MOVWF      PORTC+0
        MOVLW      4
        MOVWF      R11+0
        MOVLW      12
        MOVWF      R12+0
        MOVLW      51
        MOVWF      R13+0
L_s6110:
        DECFSZ     R13+0, 1
        GOTO       L_s6110
        DECFSZ     R12+0, 1
        GOTO       L_s6110
        DECFSZ     R11+0, 1
        GOTO       L_s6110
        NOP
        NOP
        BCF        PORTB+0, 5
        CLRF       PORTC+0
;korona.c,27 ::                 PORTB.F7=1;PORTB.F6=0;PORTB.F3=1;delay_ms(15);PORTB.F3=0;}
        BSF        PORTB+0, 7
        BCF        PORTB+0, 6
        BSF        PORTB+0, 3
        MOVLW      39
        MOVWF      R12+0
        MOVLW      245
        MOVWF      R13+0
L_s6111:
        DECFSZ     R13+0, 1
        GOTO       L_s6111
        DECFSZ     R12+0, 1
        GOTO       L_s6111
        BCF        PORTB+0, 3
L_end_s6:
        RETURN
; end of _s6

_main:

;korona.c,28 ::                 void main() {
;korona.c,30 ::                 TRISB.F1=0;PORTB.F1=0;TRISB.F2=0;PORTB.F2=0;TRISB.F4=0;PORTB.F4=0;TRISB.F5=0;PORTB.F5=0;
        BCF        TRISB+0, 1
        BCF        PORTB+0, 1
        BCF        TRISB+0, 2
        BCF        PORTB+0, 2
        BCF        TRISB+0, 4
        BCF        PORTB+0, 4
        BCF        TRISB+0, 5
        BCF        PORTB+0, 5
;korona.c,31 ::                 TRISD.F0=1;PORTB.F0=0;TRISD.F1=1;PORTB.F1=0;TRISD.F2=1;PORTB.F2=0;TRISD.F3=1;PORTB.F3=0;TRISD.F4=1;PORTB.F4=0;TRISD.F5=1;PORTB.F5=0;
        BSF        TRISD+0, 0
        BCF        PORTB+0, 0
        BSF        TRISD+0, 1
        BCF        PORTB+0, 1
        BSF        TRISD+0, 2
        BCF        PORTB+0, 2
        BSF        TRISD+0, 3
        BCF        PORTB+0, 3
        BSF        TRISD+0, 4
        BCF        PORTB+0, 4
        BSF        TRISD+0, 5
        BCF        PORTB+0, 5
;korona.c,32 ::                 TRISD.F6=1;TRISC=0;PORTC=0;TRISB.F6=0;TRISB.F7=0;PORTB.F6=0;PORTB.F7=1;TRISB.F3=0;PORTB.F3=0;
        BSF        TRISD+0, 6
        CLRF       TRISC+0
        CLRF       PORTC+0
        BCF        TRISB+0, 6
        BCF        TRISB+0, 7
        BCF        PORTB+0, 6
        BSF        PORTB+0, 7
        BCF        TRISB+0, 3
        BCF        PORTB+0, 3
;korona.c,33 ::                 do{
L_main112:
;korona.c,34 ::                 PORTC=0X00; }
        CLRF       PORTC+0
;korona.c,35 ::                 while(PORTD==0X00);
        MOVF       PORTD+0, 0
        XORLW      0
        BTFSC      STATUS+0, 2
        GOTO       L_main112
;korona.c,36 ::                 if(PORTD.F6=1){aut();}
        BSF        PORTD+0, 6
        BTFSS      PORTD+0, 6
        GOTO       L_main115
        CALL       _aut+0
L_main115:
;korona.c,37 ::                 if(PORTD.F0=1){s1();}
        BSF        PORTD+0, 0
        BTFSS      PORTD+0, 0
        GOTO       L_main116
        CALL       _s1+0
L_main116:
;korona.c,38 ::                 if(PORTD.F1=1){s2();}
        BSF        PORTD+0, 1
        BTFSS      PORTD+0, 1
        GOTO       L_main117
        CALL       _s2+0
L_main117:
;korona.c,39 ::                 if(PORTD.F2=1){s3(); }
        BSF        PORTD+0, 2
        BTFSS      PORTD+0, 2
        GOTO       L_main118
        CALL       _s3+0
L_main118:
;korona.c,40 ::                 if(PORTD.F3=1){s4();  }
        BSF        PORTD+0, 3
        BTFSS      PORTD+0, 3
        GOTO       L_main119
        CALL       _s4+0
L_main119:
;korona.c,41 ::                 if(PORTD.F4=1){s5();   }
        BSF        PORTD+0, 4
        BTFSS      PORTD+0, 4
        GOTO       L_main120
        CALL       _s5+0
L_main120:
;korona.c,42 ::                 if(PORTD.F5=1){s6();    }
        BSF        PORTD+0, 5
        BTFSS      PORTD+0, 5
        GOTO       L_main121
        CALL       _s6+0
L_main121:
;korona.c,43 ::                 }
L_end_main:
        GOTO       $+0
; end of _main