10 REM PRIMERO.BAS MATRICULACION DE PRIMERO
20 NORMAL :HOME
30 OPEN "R", #1 ,"B:CURSO.FCH" ,7
40 FIELD#1 ,7 AS CUR$
50 GET#1, 1
60 IF CUR$<>"PRIMERO" THEN GOSUB 670:CLOSE:GOTO 20
70 CLOSE
80 GOSUB 740
90 GOSUB 820
100 NORMAL :HOME
110 VTAB (3) :HTAB (20): INVERSE:PRINT "MATRICULACION DE PRIMERO" :NORMAL
120 VTAB (8) :HTAB (25): INVERSE:PRINT "A";:NORMAL:PRINT ".- ALTAS"
130 VTAB (10) :HTAB (25) :INVERSE:PRINT "M";:NORMAL:PRINT ".- MODIFICACION/BAJAS"
140 VTAB (12):HTAB (25): INVERSE:PRINT "L";:NORMAL:PRINT ".- LISTADOS"
150 VTAB (14) :HTAB (25): INVERSE:PRINT "V";:NORMAL:PRINT ".- VOLVER AL MENU"
160 VTAB (18):HTAB (20):PRINT "ELIJA OPCION --> ";
170 GOSUB 1100:IF S$<>"A" AND S$<>"M" AND S$<>"L" AND S$<>"V" THEN 160
180 IF S$="A" THEN 350
190 IF S$="M" THEN RUN "PRIM-2.BAS"
200 IF S$="L" THEN RUN "PRIM-1.BAS"
210 CLOSE:RUN "MENU.BAS"
220 REM PANTALLA
230 NORMAL :HOME
240 VTAB (1) :HTAB (2):PRINT STRING$(77,"_")
250 FOR I=2 TO 22
260 VTAB (I) :HTAB (1):PRINT "|"
270 VTAB (I):HTAB (79):PRINT "|"
280 NEXT I
290 VTAB (22) :HTAB (2):PRINT STRING$(77,"_")
300 VTAB (3):HTAB (25):INVERSE:PRINT "A L T A S   D E   A L U M N O S":NORMAL
310 FOR I=0 TO 14
320 VTAB (XYT(I,2)):HTAB (XYT(I,1)) :PRINT LIT$(I)
330 NEXT I
340 RETURN
350 REM ALTAS DE ALUMNOS
360 GOSUB 220
370 FOR I=0 TO 14:A$(I)=""
380 IF I=11 AND A$(1)="N" THEN I=13:GOTO 560
390 IF I=9 AND A$(8)="D" THEN I=10:GOTO 560
400 IF I=12 AND A$(11)="N" THEN I=13:GOTO 560
410 IF I=10 AND A$(9)="N" THEN 560
420 INVERSE:VTAB (XYT(I,2)):HTAB (XYT(I,1)) :PRINT LIT$(I);:NORMAL:PRINT " ";
430 GOSUB 620
440 IF I=0 AND E$=CHR$(27) THEN 100
450 IF S$="" THEN 420
460 IF I=2 AND (VAL(S$)<12 OR VAL(S$)>99) THEN 420
470 IF I=3 AND S$<>"V" AND S$<>"M" THEN 420
480 IF I=4 AND S$<>"R" AND S$<>"E" THEN 420
490 IF I=5 AND S$<>"I" AND S$<>"F" THEN 420
500 IF (I=1 OR I=7 OR I=6 OR I=9 OR I=11) AND S$<>"S" AND S$<>"N" THEN 420
510 IF I=8 AND S$<>"D" AND S$<>"N" THEN 420
520 IF I=10 AND S$<>"1" AND S$<>"2" THEN 420
530 IF I=14 AND (S$<"A" OR S$>"Z") AND S$<>" " THEN 420
540 A$(I)=S$
550 NORMAL: VTAB (XYT(I,2)):HTAB (XYT(I, 1) ):PRINT LIT$(I)
560 NEXT I
570 VTAB (21) :HTAB (20) :PRINT "CONFORME (S=SI/N=NO) : ";
580 GOSUB 1100:IF S$<>"S" AND S$<>"N" THEN 570
590 IF S$="N" THEN 350
600 GOSUB 1030
610 GOTO 350
620 IF I=0 THEN L%=35:GOSUB 1140
630 IF I=2 THEN L%=2:GOSUB 1140
640 IF I<>0 AND I<>2 AND I<>13 AND I<>12 THEN GOSUB 1100
650 IF I=13 OR I=12 THEN L%=3:GOSUB 1140
660 RETURN
670 REM DISCO MAL COLOCADO
680 PRINT CHR$(7) ;CHR$(7)
690 VTAB (10) :HTAB (10): INVERSE:PRINT "POR FAVOR, COLOQUE EL DISCO DE PRIMERO EN LA UNIDAD 'B'"
700 VTAB (12):HTAB (30):PRINT "PULSE [RETURN]"
710 IF INKEY$<>"" THEN 710
720 IF INKEY$<>CHR$(13) THEN 720
730 RETURN
740 REM DEFINICION DE FICHEROS
750 OPEN "R", #1 ,"B:PRIMERO.FCH" ,54
760 FIELD#1,35 AS NOM$,2 AS EDAD$,1 AS SEXO$,1 AS REP$,1 AS IDI$,1 AS DIU$,1 AS REL$,1 AS APA$,1 AS GRU$,1 AS SEG$,1 AS FRAC$,1 AS PAR$,1 AS SUE$,3 AS SU1$,3 AS SU2$
770 OPEN "R",#2,"B:PRIMERO.NDX", 4
780 FIELD#2,4 AS ORD$
790 OPEN "R",#3,"B:PRIMERO.ORD", 5
800 FIELD#3,4 AS FIC$,1 AS CLA$
810 RETURN
820 REM INICIO DE MATRICES
830 DIM XYT(14,2) ,LIT$(14) ,A$(14)
840 FOR I=0 TO 14
850 READ XYT(I,1) ,XYT(I,2) ,LIT$(I)
860 NEXT I
870 RETURN
880 DATA 3,6,"NOMBRE Y APELLIDOS :"
890 DATA 20,8,"ES REPETIDOR (S=SI/N=NO) :"
900 DATA 3,10,"EDAD :"
910 DATA 13,10,"SEXO (V=VARON/M=MUJER) :"
920 DATA 40,10,"RELIGION-ETICA (R=REL./E=ET.) :"
930 DATA 3,12,"IDIOMA <I=INGLES/F=FRANCES) :"
940 DATA 40,12,"SEGUNDO IDIOMA (S=SI/N=NO) :"
950 DATA 3,14,"PAGA A.P.A. (S=SI/N=NO) :"
960 DATA 40,14, "NOCTURNO-DIURNO (N=NOCT./D=DIUR.) :"
970 DATA 3,16,"FRACCIONA MATRICULA (S=SI/N=NO) :"
980 DATA 40,16,"PARCIAL (1=UNO/2=DOS) :"
990 DATA 3,18,"ASIGNATURAS SUELTAS (S=SI/N=NO) :"
1000 DATA 44,18,"ASIG. SUELTA 1a :"
1010 DATA 44,19,"ASIG. SUELTA 2a :"
1020 DATA 3,20,"GRUPO DE CLASE (A-Z) :"
1030 REM GUARDAR EN EL DISCO
1040 GET#3, 1 :N%=VAL (FIC$)
1050 FOR I=1 TO N%:GET#1,I:IF INSTR(NOM$,"%")<>0  THEN V=I:GOTO 1070
1060 NEXT I: N%=N%+1 : V = N%
1070 LSET NOM$=A$(0):LSET REP$=A$(1):LSET EDAD$=A$(2):LSET SEXO$=A$(3):LSET REL$=A$(4):LSET IDI$=A$(5):LSET SEG$=A$(4) :LSET APA$=A$(7)
1080 LSET DIU$=A$(8):LSET FRAC$=A$(9) :LSET PAR$=A$(10):LSET SUE$=A$( 11) :LSET SU1$=A$(12):LSET SU2$=A$(13):LSET GRU$=A$(14)
1090 PUT#1 ,V: LSET FIC$=STR$(N%) :LSET CLA$="N":PUT#3,1 :RETURN
1100 REM ENTRADA SIMPLE
1110 S$=INKEY$:IF S$<CHR$(32) OR S$>"Z" THEN 1110
1120 PRINT S$
1130 RETURN
1140 REM ENTRADA MULTIPLE
1150 P=0
1160 S$=""
1170 E$=INKEY$:IF E$="" THEN 1170
1180 IF E$=CHR$(13) THEN RETURN
1190 IF E$=CHR$(8) AND LEN(S$)>0 THEN HTAB (POS(0)-1):PRINT " ";:HTAB (POS(0)-1):P=P=1:S$=LEFT$(S$,LEN(S$)-1):GOTO 1170
1200 IF E$=CHR$(27) AND I=0 THEN RETURN
1210 IF (E$<" " OR E$>"Z") AND E$<>"ñ" AND E$<>"Ñ" THEN 1170
1220 IF P>=L% THEN 1170
1230 P=P+1: S$=S$+E$: PRINT E$;:GOTO 1170
