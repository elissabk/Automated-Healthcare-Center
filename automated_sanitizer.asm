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




        LIST p=16F84A                        ; quelle pic on utilise

        #include <P16F84A.INC>        ; librairie de cette pic

        __CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _HS_OSC





        #define button PORTA,0

        #define MOTOR PORTB,0



        CBLOCK 0x0C                ; ici on fait declarer les variables

        cmpt1:1

        cmpt2:1

        cmpt3:1                        ; la variable:nombre d'octets



        STATUS_temp:1

        W_temp:1



        count:1

        ENDC





;-------  L'adresse qui guide vers le programme principale  -----



        ORG 0x00

        GOTO init



        ORG 0x04

        

        ;Sauvegarde de STATUS et W

        movwf W_temp

        swapf STATUS,0

        movwf  STATUS_temp

        ; Fin sauvegarde



        

        ; Action à réaliser par l'interruption

        ;remettre à zéro le flag de l'interruption

        

        ; Fin Action





        ;Restauration de STATUS et W



        swapf         STATUS_temp,0

        movwf        STATUS

        

        swapf        W_temp,1

        swapf         W_temp,0

        ;Fin Restauration

        retfie

;-------  Programme principale  -------









init 

        BSF         STATUS,RP0        ; Bank1

        BCF         TRISA,0

        BCF TRISB,0

                CLRF         EEADR

        ;Configuration du registre OPTION (OPTION_REG);

        

        ;OPTION_REG --> /RBPU INTEDG T0CS T0SE PSA PS2 PS1 PS0

        

        MOVLW         b'10001000';0x88;

         MOVWF         OPTION_REG



        BCF        STATUS,RP0; Bank0

        

        

        



;        BSF INTCON,GIE ; Validation globale des interruptions

;        BSF        INTCON,INTE; Validation spécifique de l'interruption choisie

;        BCF        INTCON,INTF; initialisation à zéro du flag de l'interruption choisie







        

        GOTO         START



; tous les sous-programmes



;Delay 500 ms;3/140/86

Tempo



                 MOVLW        .15

                MOVWF        cmpt3

boucle3

                MOVLW        .100

                MOVWF        cmpt2

boucle2

                MOVLW        .100

                MOVWF        cmpt1

boucle1

                DECFSZ        cmpt1,f

                GOTO        boucle1

                DECFSZ        cmpt2,f

                GOTO        boucle2

                DECFSZ        cmpt3,f

                GOTO        boucle3

                RETURN



Tempo1



                 MOVLW        .1

                MOVWF        cmpt3

boucle31

                MOVLW        .2

                MOVWF        cmpt2

boucle21

                MOVLW        .100

                MOVWF        cmpt1

boucle11

                DECFSZ        cmpt1,f

                GOTO        boucle11

                DECFSZ        cmpt2,f

                GOTO        boucle21

                DECFSZ        cmpt3,f

                GOTO        boucle31

                RETURN 





START

        BCF MOTOR

        BTFSC button

        GOTO START

        BSF PORTB,0

        CALL Tempo1

        BCF PORTB,0

        GOTO START

        END