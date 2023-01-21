940 REM The IBM Personal Computer Mortgage
950 REM Version 1.00 (C)Copyright IBM Corp 1981, 1982
960 REM Licensed Material - Program Property of IBM
965 REM Author - Glenn Stuart Dardick
970 REM Modified by Ayodele Isaac Anise; September, 1986.
975 DEF SEG
980 SAMPLES$="NO"
990 GOTO 1010
1000 SAMPLES$="YES"
1010 KEY OFF:SCREEN 0,1:COLOR 15,0,0:WIDTH 40:CLS:LOCATE 5,19:PRINT "IBM"
1020 LOCATE 7,12,0:PRINT "Personal Computer"
1030 COLOR 10,0:LOCATE 10,9,0:PRINT CHR$(213)+STRING$(21,205)+CHR$(184)
1040 LOCATE 11,9,0:PRINT CHR$(179)+"      MORTGAGE       "+CHR$(179)
1050 LOCATE 12,9,0:PRINT CHR$(179)+STRING$(21,32)+CHR$(179)
1060 LOCATE 13,9,0:PRINT CHR$(179)+"    Version 1.10     "+CHR$(179)
1070 LOCATE 14,9,0:PRINT CHR$(212)+STRING$(21,205)+CHR$(190)
1080 COLOR 15,0:LOCATE 17,4,0:PRINT "(C) Copyright IBM Corp 1981, 1982"
1090 COLOR 14,0:LOCATE 23,7,0:PRINT "Press space bar to continue"
1100 IF INKEY$ <> "" THEN GOTO 1100
1110 CMD$ = INKEY$
1120 IF CMD$ = " " THEN GOTO 1150
1130 IF CMD$ =CHR$(27) THEN GOTO 1210
1140 GOTO 1110
1150 COLOR 15,0:CLS:DEFDBL P:DIM AMORT(500,2):SCREEN 0
1154 DEF SEG=0
1155 IF (PEEK(&H410) AND &H30)<>&H30 THEN COLS = 3:GOTO 1158
1156 WIDTH 80:COLS=8
1158 DEF SEG
1160 GOSUB 1240
1170 IF ASC(I$)=27 THEN 1210
1180 IF MID$(I$,1,1)="2" THEN GOTO 2010
1190 IF MID$(I$,1,1)="1" THEN GOTO 1490
1200 GOTO 1160
1210 IF SAMPLES$ <> "YES" THEN GOTO 1220
1215 CHAIN "SAMPLES",1000
1220 GOSUB 1470
1230 END
1240 REM - MAIN OPTION MENU
1250 COLOR 15,0:CLS:COLOR 0,7:PRINT " MORTGAGE ANALYSIS "
1260 COLOR 15,0:LOCATE 3,1:PRINT "OPTIONS - "
1270 PRINT "1 - MORTGAGE PAYMENT COMPARISONS "
1280 PRINT "2 - MORTGAGE AMORTIZATION"
1290 PRINT "ESC KEY - EXIT"
1300 PRINT " "
1310 PRINT "OPTION NUMBER (1,2, OR ESC) =====>"
1330 PRINT " "
1340 COLOR 15,0
1350 PRINT CHR$(218)+STRING$(37,CHR$(196))+CHR$(191)
1360 PRINT CHR$(179)+"  MORTGAGE PAYMENT COMPARISONS       "+CHR$(179)
1370 PRINT CHR$(179)+"    - USE THIS OPTION TO COMPARE     "+CHR$(179)
1380 PRINT CHR$(179)+"      THE MONTHLY PAYMENTS OF        "+CHR$(179)
1390 PRINT CHR$(179)+"      MORTGAGES AT VARIOUS RATES     "+CHR$(179)
1400 PRINT CHR$(179)+"      AND PRINCIPAL AMOUNTS.         "+CHR$(179)
1410 PRINT CHR$(179)+"  MORTGAGE AMORTIZATION              "+CHR$(179)
1420 PRINT CHR$(179)+"    - USE THIS OPTION TO CALCULATE   "+CHR$(179)
1430 PRINT CHR$(179)+"      THE PRINCIPAL AND INTEREST     "+CHR$(179)
1440 PRINT CHR$(179)+"      PAID OVER ANY 12 MONTH PERIOD. "+CHR$(179)
1450 PRINT CHR$(192)+STRING$(37,CHR$(196))+CHR$(217)
1460 COLOR 0,7:LOCATE 8,37:PRINT " ":LOCATE 8,37
1461 I$=INKEY$:IF I$="" THEN 1461 ELSE PRINT I$;:RETURN
1470 COLOR 15,0:CLS:END
1480 PF = AF*(RF/(1#-(1#/((1#+RF)^NF)))):RETURN
1490 REM - mortgage comparisons
1500 COLOR 15,0:CLS:COLOR 0,7:PRINT " MORTGAGE PAYMENT COMPARISON PROGRAM "
1510 LOCATE 10,1:COLOR 15,0
1520 PRINT CHR$(218)+STRING$(37,CHR$(196))+CHR$(191)
1530 PRINT CHR$(179)+"  MORTGAGE PAYMENT COMPARISONS       "+CHR$(179)
1540 PRINT CHR$(179)+"    - USE THIS OPTION TO COMPARE     "+CHR$(179)
1550 PRINT CHR$(179)+"      THE MONTHLY PAYMENTS OF        "+CHR$(179)
1560 PRINT CHR$(179)+"      MORTGAGES AT VARIOUS RATES     "+CHR$(179)
1570 PRINT CHR$(179)+"      AND PRINCIPAL AMOUNTS.         "+CHR$(179)
1580 PRINT CHR$(179)+"                                     "+CHR$(179)
1590 PRINT CHR$(179)+"  NOTE: TO SELECT A VALUE OR AMOUNT  "+CHR$(179)
1600 PRINT CHR$(179)+"      ENTER THE APPROPRIATE VALUE    "+CHR$(179)
1610 PRINT CHR$(179)+"      AND PRESS THE ENTER KEY.       "+CHR$(179)
1620 PRINT CHR$(192)+STRING$(37,CHR$(196))+CHR$(217)
1630 LOCATE 3,1:LINE INPUT "ENTER BASE MORTGAGE AMOUNT ===> ";A$
1640 A = VAL(A$):IF A <= 0 THEN GOTO 1600
1650 AINC = 2000
1660 LOCATE 4,1:PRINT SPC(38);
1670 LOCATE 5,1:PRINT "(1 TO 35 PERCENT)";
1680 LOCATE 4,1:LINE INPUT "ENTER BASE INTEREST RATE =====> ";IR$
1690 IR = VAL(IR$):IF IR>35 OR IR<1 THEN GOTO 1660
1700 R = IR/1200:RINC = .0025/12
1710 LOCATE 5,1:PRINT SPC(38);
1720 LOCATE 6,1:PRINT "(1 TO 35 YEARS)";
1730 LOCATE 5,1:LINE INPUT "ENTER NUMBER OF YEARS IN MTG => ";Y$
1740 Y = VAL(Y$)
1750 N = Y * 12
1760 NF = N
1770 IF NF>420 OR NF<1 THEN GOTO 1710
1780 CLS
1790 COLOR 0,7:PRINT " MONTHLY MORTGAGE PAYMENT COMPARISONS "
1800 COLOR 15,0:LOCATE 3,10:PRINT Y$+"-YEAR MORTGAGE LOAN AMOUNTS";
1810 LOCATE 5,2:PRINT "RATES";:COLOR 0,7
1820 FOR I = 0 TO COLS
1830 LOCATE 4,9+I*8:PRINT SPC(7):LOCATE 4,9+I*8:PRINT A+I*AINC
1840 NEXT I
1850 FOR I = 0 TO 14
1860 LOCATE 6+I,1:PRINT SPC(7):LOCATE 6+I,2
1870 PRINT USING "##.##";INT(((R+(I*RINC))*120000!)+.5)/100
1880 NEXT I
1890 COLOR 15,0
1900 FOR I = 0 TO 14
1910 RF = R+I*RINC:AF=1:GOSUB 1480
1920 FOR J = 0 TO COLS
1930 P = PF*(A+J*AINC):P = INT((P+5.000001E-03)*100)/100
1935 IF P>10000 THEN LOCATE 22,1:PRINT "PAYMENTS TOO LARGE TO DISPLAY":GOTO 1980
1940 LOCATE 6+I,9+J*8:PRINT USING "####.##";P;
1950 NEXT J
1960 NEXT I
1970 PRINT " "
1980 PRINT "PRESS SPACE BAR TO CONTINUE";
1990 IF INKEY$ <> " " THEN GOTO 1990
2000 GOTO 1160
2010 REM - mortgage amortization
2020 COLOR 7,0
2030 CLS
2040 COLOR 0,7
2050 LOCATE 1,1
2060 PRINT " MORTGAGE AMORTIZATION PROGRAM "
2070 LOCATE 10,1:COLOR 15,0
2080 PRINT CHR$(218)+STRING$(37,CHR$(196))+CHR$(191)
2090 PRINT CHR$(179)+"  MORTGAGE AMORTIZATION              "+CHR$(179)
2100 PRINT CHR$(179)+"    - USE THIS OPTION TO CALCULATE   "+CHR$(179)
2110 PRINT CHR$(179)+"      THE PRINCIPAL AND INTEREST     "+CHR$(179)
2120 PRINT CHR$(179)+"      PAID OVER ANY 12 MONTH PERIOD. "+CHR$(179)
2130 PRINT CHR$(179)+"                                     "+CHR$(179)
2140 PRINT CHR$(179)+"  NOTE: TO SELECT A VALUE OR AMOUNT  "+CHR$(179)
2150 PRINT CHR$(179)+"      ENTER THE APPROPRIATE VALUE    "+CHR$(179)
2160 PRINT CHR$(179)+"      AND PRESS THE ENTER KEY.       "+CHR$(179)
2170 PRINT CHR$(192)+STRING$(37,CHR$(196))+CHR$(217)
2180 LOCATE 3,1
2190 LINE INPUT "ENTER MORTGAGE AMOUNT ===> ";A$
2200 AF = VAL(A$): IF AF <= 0 THEN 2150
2210 LOCATE 4,1
2220 PRINT "                                      ";
2230 LOCATE 5,1
2240 PRINT "(1 TO 35 PERCENT)";
2250 LOCATE 4,1
2260 LINE INPUT "ENTER INTEREST RATE =====> ";IR$
2270 IR = VAL(IR$)
2280 IF IR>35 THEN GOTO 2210
2290 IF IR<1 THEN GOTO 2210
2300 RF = IR/1200
2310 LOCATE 5,1
2320 PRINT "                                      ";
2330 LOCATE 6,1
2340 PRINT "(1 TO 35 YEARS)";
2350 LOCATE 5,1
2360 LINE INPUT "ENTER NUMBER OF YEARS ===> ";Y$
2370 Y = VAL(Y$)
2380 NF = Y * 12
2390 IF NF>420 THEN GOTO 2310
2400 IF NF<1 THEN GOTO 2310
2410 GOSUB 1480
2420 PF = INT((PF+5.000001E-03)*100)/100
2430 PRINT "MONTHLY PAYMENTS ARE ====>";PF
2435 COLOR 23,0
2440 PRINT "CALCULATING AMORTIZATION"
2445 COLOR 15,0
2450 IF NF>36 THEN GOTO 2470
2460 FOR I = 1 TO 1000:NEXT I
2470 AMORT(0,1) = AF
2480 FOR I = 1 TO NF
2490 AMORT(I,2) = INT((AMORT(I-1,1)*RF+5.000001E-03)*100)/100
2500 AMORT(I,1) = AMORT(I-1,1)-PF+AMORT(I,2)
2510 NEXT I
2520 FOR I = 7 TO 25:LOCATE I,1:PRINT SPC(39);:NEXT I
2530 LOCATE 9,1
2540 PRINT " - 1 TO"+STR$(NF)
2550 PRINT " - 0 TO END AMORTIZATION";
2560 LOCATE 7,1
2570 PRINT "ENTER BEGINNING PAYMENT NUMBER"
2580 LINE INPUT "OF 12 MONTH PERIOD ======> ";PERIOD$
2590 PD= VAL(PERIOD$)
2600 IF PD <> 0 THEN GOTO 2620
2610 IF PERIOD$ <> "0" THEN GOTO 2560
2620 IF PD=0 THEN GOTO 1160
2630 IF PD>NF THEN GOTO 2560
2640 IF PD<0 THEN GOTO 2560
2650 LOCATE 7,1
2660 PRINT SPC(39)
2670 PRINT SPC(39)
2680 LOCATE 9,1
2690 PRINT "PYMNT PRINCIPAL   INTEREST    BALANCE"
2700 TINT = 0
2710 FOR I = PD TO PD+11
2711 IF I> NF THEN GOTO 2750
2720 TINT = TINT + AMORT(I,2)
2730 PRINT USING "### ";I;
2740 PRINT USING "  ######.##";PF-AMORT(I,2);AMORT(I,2);AMORT(I,1)
2750 NEXT I
2760 PRINT " "
2770 PRINT "INTEREST FOR 12 PERIODS =";
2780 PRINT USING "######.## ";TINT
2790 LOCATE 25,1
2800 PRINT "PRESS SPACE BAR TO CONTINUE";
2810 LOCATE ,,0
2820 IF INKEY$ <> "" THEN GOTO 2820
2830 CMD$ = INKEY$
2840 IF CMD$ = " " THEN GOTO 2520
2850 IF CMD$ =CHR$(27) THEN GOTO 1210
2860 GOTO 2830
