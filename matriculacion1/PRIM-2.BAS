10 REM PRIM-2.BAS MATRICULACION DE PRIMERO 
15 NORMAL: HOME 
20 OPEN "R",#1, "B:CURSO.FCH",7 
30 FIELD#1,7 AS CUR$ 
40 GET#1,1 
50 IF CUR$<>"PRIMERO" THEN GOSUB 9000 :CLOSE: GOTO 15 
60 CLOSE 
70 GOSUB 9100 
75 GOSUB 9300 
80 GOTO 400 
200 REM PANTALLA 
210 NORMAL: HOME 
220 VTAB (1) : HTAB (2): PRINT STRING$ (77,"_") 
230 FOR I=2 TO 22 
240 VTAB (I):HTAB (1) :PRINT "|" 
250 VTAB (I):HTAB (79):PRINT "|" 
260 NEXT I 
270 VTAB (22) :HTAB (2):PRINT STRING$ (77,"_") 
280 VTAB (3):HTAB (15) : INVERSE:PRINT "M O D I F I C A C I O N   D E   A L U M N O S":NORMAL 
290 FOR I=0 TO 14 
300 VTAB (XYT(I,2)): HTAB (XYT(I,1)): PRINT LIT$(I) 
310 NEXT I 
399 RETURN 
400 REM MODIFICACION DE ALUMNOS 
410 GOSUB 200 
411 VTAB (XYT(0,2)) :HTAB (XYT(0,1)):PRINT LIT$(0);" ";:L%=35: GOSUB 9900:IF S$="" THEN 411 
412 GET#3, 1:N%=VAL (FIC$) 
413 FOR I=1 TO N%:GET#1, I:IF INSTR(NOM$, S$)<>0 THEN V=I: GOTO 415 
414 NEXT I: GOTO 400 
415 GOSUB 9760 
416 FOR I=0 TO 14 
417 VTAB (XYT(I,2)): HTAB (XYT(I,1)): PRINT LIT$(I);" ";A$(I)
418 NEXT I 
420 FOR I=0 TO 14 
421 IF I=11 AND A$(1) ="N" THEN I=13:GOTO 460 
422 IF I=9 AND A$(8)="D" THEN I=10:GOTO 460 
423 IF I=12 AND A$(11)="N" THEN I=13: GOTO 460 
424 IF I=10 AND A$(9)="N" THEN 460 
430 INVERSE: VTAB (XYT(I,2)) :HTAB (XYT(I,1)): PRINT LIT$(I);: NORMAL: PRINT " "; 
431 GOSUB 1000 
432 IF I=0 AND E$=CHR$(27) THEN RUN "PRIMERO.BAS" 
433 IF S$="" THEN 430 
434 IF I=0 AND INSTR(S$,"%")<>0 THEN 600 
435 IF I=2 AND ((VAL(S$)<12 OR VAL(S$) >99) AND S$<>"-") THEN 430 
437 IF I=3 AND S$<>"V" AND S$<>"M" AND S$<>"-" THEN 430 
438 IF I=4 AND S$<>"R" AND S$<>"E" AND S$<>"-" THEN 430 
439 IF I=5 AND S$<>"I" AND S$<>"F" AND S$<>"-" THEN 430 
440 IF (I=1 OR I=7 OR 1=6 OR 1=9 OR I=11) AND S$<>"S" AND S$<>"N" AND S$<>"-" THEN 430 
442 IF I=8 AND S$<>"D" AND S$<>"N" AND S$<>"-" THEN 430 
443 IF I=10 AND S$<>"1" AND S$<>"2" AND S$<>"-" THEN 430 
444 IF I=14 AND (S$<"A" OR S$>"Z") AND S$<>" " AND S$<>"-" THEN 430 
445 IF S$<>"-" THEN A$(I)=S$ 
450 NORMAL:VTAB (XYT(I, 2)) :HTAB (XYT(I,1)) :PRINT LIT$(I) 
460 NEXT I 
470 VTAB (21): HTAB (20): PRINT "CONFORME (S=SI/N=NO) "; 
480 GOSUB 9800: IF S$<>"S" AND S$<>"N" THEN 470 
490 IF S$="N" THEN 400 
500 GOSUB 9700 
510 RUN "PRIMERO.BAS"
600 VTAB(21):HTAB (10):INVERSE:PRINT "BORRAR LA FICHA.";:NORMAL:PRINT "CONFORME (S=SI/N=NO) : ";
610 GOSUB 9800 :IF S$<>"S" AND S$<>"N" THEN 600 
620 IF S$="N" THEN 400 
625 A$(0)="%"
630 GOSUB 9700 
640 RUN "PRIMERO.BAS" 
1000 IF I=0 THEN L%=35: GOSUB 9900 
1010 IF I=2 THEN L%=2:GOSUB 9900 
1020 IF I<>0 AND I<>2 AND I<>13 AND I<>12 THEN GOSUB 9800 
1030 IF I=13 OR I=12 THEN L%=3: GOSUB 9900 
1040 RETURN 
9000 REM DISCO MAL COLOCADO 
9005 PRINT CHR$ (7): CHR$ (7) 
9010 VTAB (10):HTAB (10): INVERSE: PRINT "POR FAVOR, COLOQUE EL DISCO DE PRIMERO EN LA UNIDAD 'B'"
9020 VTAB (12):HTAB (30) :PRINT "PULSE [RETURN]" 
9030 IF INKEY$<>"" THEN 9030 
9040 IF INKEY$<>CHR$(13) THEN 9040 
9050 RETURN 
9100 REM DEFINICION DE FICHEROS 
9110 OPEN "R",#1, "B:PRIMERO.FCH",54 
9120 FIELD#1,35 AS NOM$, 2 AS EDAD$,1 AS SEXO$, 1 AS REP$, 1 AS IDI$, 1 AS DIU$, 1 AS REL$, 1 AS APA$,1 AS GRU$, 1 AS SEG$, 1 AS FRAC$, 1 AS PAR$, 1 AS SUE$, 3 AS SU1$,3 AS SU2$ 
9130 OPEN "R",#2, "B:PRIMERO.NDX",4 
9140 FIELD#2, 4 AS ORD$ 
9150 OPEN "R",#3, "B:PRIMERO.ORD",5 
9160 FIELD#3,4 AS FIC$,1 AS CLA$ 
9170 RETURN 
9300 REM INICIO DE MATRICES 
9310 DIM XYT(14,2), LIT$(14), A$(14) 
9320 FOR I=0 TO 14 
9330 READ XYT(I,1),XYT(I,2), LIT$(I) 
9340 NEXT I 
9350 RETURN 
9360 DATA 3,6,"NOMBRE Y APELLIDOS :"
9361 DATA 20,8,"ES REPETIDOR (S=SI/N=NO) :"
9362 DATA 3,10,"EDAD :"
9363 DATA 13,10,"SEXO (V=VARON/M=MUJER) :"
9364 DATA 40,10,"RELIGION-ETICA (R=REL./E=ET.) :"
9365 DATA 3,12,"IDIOMA <I=INGLES/F=FRANCES) :"
9366 DATA 40,12,"SEGUNDO IDIOMA (S=SI/N=NO) :"
9367 DATA 3,14,"PAGA A.P.A. (S=SI/N=NO) :"
9368 DATA 40,14, "NOCTURNO-DIURNO (N=NOCT./D=DIUR.) :"
9369 DATA 3,16,"FRACCIONA MATRICULA (S=SI/N=NO) :"
9370 DATA 40,16,"PARCIAL (1=UNO/2=DOS) :"
9371 DATA 3,18,"ASIGNATURAS SUELTAS (S=SI/N=NO) :"
9372 DATA 44,18,"ASIG. SUELTA 1a :"
9373 DATA 44,19,"ASIG. SUELTA 2a :"
9374 DATA 3,20,"GRUPO DE CLASE (A-Z) :"
9700 REM GUARDAR EN EL DISCO 
9730 LSET NOM$=A$(0) :LSET REP$=A$(1):LSET EDAD$=A$(2) :LSET SEXO$=A$ (3) :LSET REL$=A$(4) : LSET IDI$=A$(5):LSET SEG$=A$ (6) :LSET APA$=A$(7) 
9740 LSET DIU$=A$(8) :LSET FRAC$=A$ (9) : LSET PAR$=A$(10) : LSET SUE$=A$(11) : LSET SU1$=A$(12) : LSET SU2$=A$(13) :LSET GRU$=A$(14) 
9750 PUT#1, V:LSET CLA$="N":PUT#3, 1: RETURN 
9760 REM CARGAR DEL DISCO 
9765 A$(0)=NOM$: A$(1)=REP$: A$(2)=EDAD$: A$(3)=SEXO$:A$(4)=REL$:A$(5)=IDI$:A$(6)=SEG$: A$(7)=APA$ 
9770 A$(8)=DIU$:A$(9)=FRAC$:A$(10)=PAR$:A$(11)=SUE$:A$(12)=SU1$:A$(13)=SU2$ :A$(14)=GRU$ 
9780 RETURN 
9800 REM ENTRADA SIMPLE 
9810 S$=INKEY$:IF S$<CHR$(32) OR S$>"Z" THEN 9810 
9815 PRINT S$ 
9820 RETURN 
9900 REM ENTRADA MULTIPLE 
9905 P=0 
9910 S$="" 
9920 E$=INKEY$: IF E$="" THEN 9920
9930 IF E$=CHR$(13) THEN RETURN
9940 IF E$=CHR$(8) AND LEN(S$)>0 THEN HTAB (POS(0)-1):PRINT " ";:HTAB (POS(0)-1):P=P=1 :S$=LEFT$(S$,LEN(S$)-1):GOTO 9920
9950 IF E$=CHR$(27) AND I=0 THEN RETURN
9960 IF (E$<" " OR E$>"Z") AND E$<>"ñ" AND E$<>"Ñ" THEN 9920
9970 IF P>=L% THEN 9920
9980 P=P+1:S$=S$+E$:PRINT E$; :GOTO 9920
