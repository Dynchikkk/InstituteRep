VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL C
        SIGNAL RST
        SIGNAL S(0)
        SIGNAL IN_RST
        SIGNAL IN_C
        SIGNAL S(1)
        SIGNAL IN_x0
        SIGNAL x0
        SIGNAL IN_x1
        SIGNAL x1
        SIGNAL IN_x2
        SIGNAL x2
        SIGNAL IN_x3
        SIGNAL x3
        SIGNAL IN_x4
        SIGNAL x4
        SIGNAL XLXN_360
        SIGNAL XLXN_1283
        SIGNAL XLXN_1249
        SIGNAL XLXN_1292
        SIGNAL XLXN_1294
        SIGNAL XLXN_1299
        SIGNAL XLXN_1300
        SIGNAL XLXN_1301
        SIGNAL XLXN_1328
        SIGNAL S(3)
        SIGNAL S(2)
        SIGNAL XLXN_363
        SIGNAL XLXN_1368
        SIGNAL XLXN_1258
        SIGNAL XLXN_1259
        SIGNAL XLXN_1374
        SIGNAL XLXN_1261
        SIGNAL XLXN_1376
        SIGNAL XLXN_1262
        SIGNAL XLXN_1402
        SIGNAL XLXN_386
        SIGNAL XLXN_1410
        SIGNAL XLXN_1270
        SIGNAL XLXN_1350
        SIGNAL XLXN_1351
        SIGNAL XLXN_1352
        SIGNAL XLXN_784
        SIGNAL XLXN_1434
        SIGNAL XLXN_1284
        SIGNAL XLXN_1354
        SIGNAL S(0:3)
        SIGNAL y0
        SIGNAL y1
        SIGNAL y2
        SIGNAL XLXN_1447
        SIGNAL XLXN_1245
        SIGNAL y3
        SIGNAL XLXN_1355
        PORT Input IN_RST
        PORT Input IN_C
        PORT Input IN_x0
        PORT Input IN_x1
        PORT Input IN_x2
        PORT Input IN_x3
        PORT Input IN_x4
        PORT Output y0
        PORT Output y1
        PORT Output y2
        PORT Output y3
        BEGIN BLOCKDEF or2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 28 -224 204 -48 112 -48 192 -96 
            ARC N -40 -152 72 -40 48 -48 48 -144 
            LINE N 112 -144 48 -144 
            ARC N 28 -144 204 32 192 -96 112 -144 
            LINE N 112 -48 48 -48 
        END BLOCKDEF
        BEGIN BLOCKDEF and3b1
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 256 -128 192 -128 
            LINE N 64 -64 64 -192 
            ARC N 96 -176 192 -80 144 -80 144 -176 
            LINE N 144 -80 64 -80 
            LINE N 64 -176 144 -176 
        END BLOCKDEF
        BEGIN BLOCKDEF ibuf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF ibufg
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF buf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 0 128 -32 
            LINE N 128 -32 64 -64 
            LINE N 64 -64 64 0 
        END BLOCKDEF
        BEGIN BLOCKDEF obuf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF and2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 96 -144 192 -48 144 -48 144 -144 
            LINE N 144 -48 64 -48 
            LINE N 64 -144 144 -144 
            LINE N 64 -48 64 -144 
        END BLOCKDEF
        BEGIN BLOCKDEF fdc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            RECTANGLE N 64 -320 320 -64 
            LINE N 64 -112 80 -128 
            LINE N 80 -128 64 -144 
            LINE N 192 -64 192 -32 
            LINE N 192 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF or3
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 48 -64 
            LINE N 0 -128 72 -128 
            LINE N 0 -192 48 -192 
            LINE N 256 -128 192 -128 
            ARC N 28 -256 204 -80 112 -80 192 -128 
            ARC N -40 -184 72 -72 48 -80 48 -176 
            LINE N 48 -64 48 -80 
            LINE N 48 -192 48 -176 
            LINE N 112 -80 48 -80 
            ARC N 28 -176 204 0 192 -128 112 -176 
            LINE N 112 -176 48 -176 
        END BLOCKDEF
        BEGIN BLOCKDEF and2b1
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -48 64 -144 
            LINE N 64 -144 144 -144 
            LINE N 144 -48 64 -48 
            ARC N 96 -144 192 -48 144 -48 144 -144 
            LINE N 256 -96 192 -96 
            LINE N 0 -128 64 -128 
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
        END BLOCKDEF
        BEGIN BLOCK XLXI_218 ibuf
            PIN I IN_RST
            PIN O RST
        END BLOCK
        BEGIN BLOCK XLXI_150 ibufg
            PIN I IN_C
            PIN O C
        END BLOCK
        BEGIN BLOCK XLXI_531 ibuf
            PIN I IN_x0
            PIN O x0
        END BLOCK
        BEGIN BLOCK XLXI_532 ibuf
            PIN I IN_x1
            PIN O x1
        END BLOCK
        BEGIN BLOCK XLXI_533 ibuf
            PIN I IN_x2
            PIN O x2
        END BLOCK
        BEGIN BLOCK XLXI_534 ibuf
            PIN I IN_x3
            PIN O x3
        END BLOCK
        BEGIN BLOCK XLXI_535 ibuf
            PIN I IN_x4
            PIN O x4
        END BLOCK
        BEGIN BLOCK XLXI_153 buf
            PIN I XLXN_360
            PIN O S(0)
        END BLOCK
        BEGIN BLOCK XLXI_536 fdc
            PIN C C
            PIN CLR RST
            PIN D XLXN_1249
            PIN Q XLXN_360
        END BLOCK
        BEGIN BLOCK XLXI_571 or2
            PIN I0 XLXN_1301
            PIN I1 XLXN_1299
            PIN O XLXN_1249
        END BLOCK
        BEGIN BLOCK XLXI_573 and3b1
            PIN I0 x2
            PIN I1 x3
            PIN I2 S(2)
            PIN O XLXN_1301
        END BLOCK
        BEGIN BLOCK XLXI_572 and2b1
            PIN I0 x1
            PIN I1 S(0)
            PIN O XLXN_1299
        END BLOCK
        BEGIN BLOCK XLXI_152 buf
            PIN I XLXN_363
            PIN O S(1)
        END BLOCK
        BEGIN BLOCK XLXI_538 fdc
            PIN C C
            PIN CLR RST
            PIN D XLXN_1258
            PIN Q XLXN_363
        END BLOCK
        BEGIN BLOCK XLXI_540 or3
            PIN I0 XLXN_1262
            PIN I1 XLXN_1261
            PIN I2 XLXN_1259
            PIN O XLXN_1258
        END BLOCK
        BEGIN BLOCK XLXI_569 and2b1
            PIN I0 x2
            PIN I1 S(1)
            PIN O XLXN_1259
        END BLOCK
        BEGIN BLOCK XLXI_574 and3b1
            PIN I0 x2
            PIN I1 x3
            PIN I2 S(2)
            PIN O XLXN_1262
        END BLOCK
        BEGIN BLOCK XLXI_575 and2
            PIN I0 x1
            PIN I1 S(0)
            PIN O XLXN_1261
        END BLOCK
        BEGIN BLOCK XLXI_151 buf
            PIN I XLXN_386
            PIN O S(2)
        END BLOCK
        BEGIN BLOCK XLXI_541 fdc
            PIN C C
            PIN CLR RST
            PIN D XLXN_1270
            PIN Q XLXN_386
        END BLOCK
        BEGIN BLOCK XLXI_576 or3
            PIN I0 XLXN_1352
            PIN I1 XLXN_1351
            PIN I2 XLXN_1350
            PIN O XLXN_1270
        END BLOCK
        BEGIN BLOCK XLXI_578 and2b1
            PIN I0 x3
            PIN I1 S(2)
            PIN O XLXN_1350
        END BLOCK
        BEGIN BLOCK XLXI_581 and3b1
            PIN I0 x1
            PIN I1 x2
            PIN I2 S(1)
            PIN O XLXN_1351
        END BLOCK
        BEGIN BLOCK XLXI_579 and2b1
            PIN I0 x2
            PIN I1 S(3)
            PIN O XLXN_1352
        END BLOCK
        BEGIN BLOCK XLXI_323 buf
            PIN I XLXN_784
            PIN O S(3)
        END BLOCK
        BEGIN BLOCK XLXI_530 fdc
            PIN C C
            PIN CLR RST
            PIN D XLXN_1284
            PIN Q XLXN_784
        END BLOCK
        BEGIN BLOCK XLXI_582 and3b1
            PIN I0 x3
            PIN I1 x1
            PIN I2 S(1)
            PIN O XLXN_1354
        END BLOCK
        BEGIN BLOCK XLXI_625 or2
            PIN I0 x0
            PIN I1 XLXN_1354
            PIN O XLXN_1284
        END BLOCK
        BEGIN BLOCK XLXI_183 obuf
            PIN I S(0)
            PIN O y0
        END BLOCK
        BEGIN BLOCK XLXI_524 obuf
            PIN I S(1)
            PIN O y1
        END BLOCK
        BEGIN BLOCK XLXI_525 obuf
            PIN I XLXN_1355
            PIN O y2
        END BLOCK
        BEGIN BLOCK XLXI_526 obuf
            PIN I XLXN_1245
            PIN O y3
        END BLOCK
        BEGIN BLOCK XLXI_626 or2
            PIN I0 S(3)
            PIN I1 S(1)
            PIN O XLXN_1355
        END BLOCK
        BEGIN BLOCK XLXI_627 or2
            PIN I0 S(3)
            PIN I1 S(2)
            PIN O XLXN_1245
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 5440 3520
        INSTANCE XLXI_218 224 128 R0
        BEGIN BRANCH IN_RST
            WIRE 192 96 224 96
        END BRANCH
        BEGIN BRANCH RST
            WIRE 448 96 592 96
            WIRE 592 96 736 96
            BEGIN DISPLAY 592 96 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_150 224 256 R0
        BEGIN BRANCH IN_C
            WIRE 176 224 224 224
        END BRANCH
        BEGIN BRANCH C
            WIRE 448 224 672 224
            WIRE 672 224 672 224
            WIRE 672 224 736 224
            BEGIN DISPLAY 676 224 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 192 96 IN_RST R180 28
        INSTANCE XLXI_531 224 416 R0
        BEGIN BRANCH IN_x0
            WIRE 192 384 224 384
        END BRANCH
        BEGIN BRANCH x0
            WIRE 448 384 592 384
            WIRE 592 384 736 384
            BEGIN DISPLAY 592 384 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 192 384 IN_x0 R180 28
        INSTANCE XLXI_532 224 512 R0
        BEGIN BRANCH IN_x1
            WIRE 192 480 224 480
        END BRANCH
        BEGIN BRANCH x1
            WIRE 448 480 592 480
            WIRE 592 480 736 480
            BEGIN DISPLAY 592 480 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 192 480 IN_x1 R180 28
        INSTANCE XLXI_533 224 608 R0
        BEGIN BRANCH IN_x2
            WIRE 192 576 224 576
        END BRANCH
        BEGIN BRANCH x2
            WIRE 448 576 592 576
            WIRE 592 576 736 576
            BEGIN DISPLAY 592 576 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 192 576 IN_x2 R180 28
        INSTANCE XLXI_534 224 704 R0
        BEGIN BRANCH IN_x3
            WIRE 192 672 224 672
        END BRANCH
        BEGIN BRANCH x3
            WIRE 448 672 592 672
            WIRE 592 672 736 672
            BEGIN DISPLAY 592 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 192 672 IN_x3 R180 28
        INSTANCE XLXI_535 224 800 R0
        BEGIN BRANCH IN_x4
            WIRE 192 768 224 768
        END BRANCH
        BEGIN BRANCH x4
            WIRE 448 768 592 768
            WIRE 592 768 736 768
            BEGIN DISPLAY 592 768 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 192 768 IN_x4 R180 28
        IOMARKER 176 224 IN_C R180 28
        BEGIN BRANCH XLXN_360
            WIRE 2976 448 3120 448
        END BRANCH
        INSTANCE XLXI_153 3120 480 R0
        BEGIN BRANCH S(0)
            WIRE 3344 448 3488 448
            WIRE 3488 448 3632 448
            BEGIN DISPLAY 3488 448 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_536 2592 704 R0
        BEGIN BRANCH C
            WIRE 2416 576 2592 576
            BEGIN DISPLAY 2416 576 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_1249
            WIRE 2288 448 2592 448
        END BRANCH
        BEGIN BRANCH RST
            WIRE 2464 672 2592 672
            BEGIN DISPLAY 2464 672 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_571 2032 544 R0
        BEGIN BRANCH XLXN_1299
            WIRE 1776 384 2016 384
            WIRE 2016 384 2016 416
            WIRE 2016 416 2032 416
        END BRANCH
        BEGIN BRANCH XLXN_1301
            WIRE 1792 592 2016 592
            WIRE 2016 480 2032 480
            WIRE 2016 480 2016 592
        END BRANCH
        INSTANCE XLXI_573 1536 720 R0
        INSTANCE XLXI_572 1520 480 R0
        BEGIN BRANCH S(0)
            WIRE 1344 352 1520 352
            BEGIN DISPLAY 1344 352 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x1
            WIRE 1344 416 1520 416
            BEGIN DISPLAY 1344 416 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S(2)
            WIRE 1344 528 1536 528
            BEGIN DISPLAY 1344 528 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x3
            WIRE 1344 592 1536 592
            BEGIN DISPLAY 1344 592 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x2
            WIRE 1344 656 1536 656
            BEGIN DISPLAY 1344 656 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_363
            WIRE 2928 896 3088 896
        END BRANCH
        INSTANCE XLXI_152 3088 928 R0
        BEGIN BRANCH S(1)
            WIRE 3312 896 3408 896
            WIRE 3408 896 3520 896
            BEGIN DISPLAY 3408 896 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C
            WIRE 2400 1024 2544 1024
            BEGIN DISPLAY 2400 1024 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_538 2544 1152 R0
        BEGIN BRANCH RST
            WIRE 2416 1120 2544 1120
            BEGIN DISPLAY 2416 1120 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_1258
            WIRE 2512 896 2544 896
        END BRANCH
        INSTANCE XLXI_540 2256 1024 R0
        BEGIN BRANCH XLXN_1259
            WIRE 1952 800 2256 800
            WIRE 2256 800 2256 816
            WIRE 2256 816 2256 832
        END BRANCH
        BEGIN BRANCH XLXN_1261
            WIRE 1888 992 2240 992
            WIRE 2240 896 2256 896
            WIRE 2240 896 2240 992
        END BRANCH
        BEGIN BRANCH XLXN_1262
            WIRE 1872 1168 2256 1168
            WIRE 2256 960 2256 976
            WIRE 2256 976 2256 1168
        END BRANCH
        BEGIN BRANCH S(1)
            WIRE 1648 768 1696 768
            BEGIN DISPLAY 1648 768 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x2
            WIRE 1648 832 1696 832
            BEGIN DISPLAY 1648 832 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_569 1696 896 R0
        INSTANCE XLXI_574 1616 1296 R0
        INSTANCE XLXI_575 1632 1088 R0
        BEGIN BRANCH S(0)
            WIRE 1472 960 1632 960
            BEGIN DISPLAY 1472 960 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x1
            WIRE 1472 1024 1632 1024
            BEGIN DISPLAY 1472 1024 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S(2)
            WIRE 1472 1104 1616 1104
            BEGIN DISPLAY 1472 1104 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x3
            WIRE 1472 1168 1616 1168
            BEGIN DISPLAY 1472 1168 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x2
            WIRE 1472 1248 1552 1248
            WIRE 1552 1232 1616 1232
            WIRE 1552 1232 1552 1248
            BEGIN DISPLAY 1472 1248 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_151 2960 1504 R0
        BEGIN BRANCH S(2)
            WIRE 3184 1472 3280 1472
            WIRE 3280 1472 3376 1472
            BEGIN DISPLAY 3280 1472 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_386
            WIRE 2864 1472 2960 1472
        END BRANCH
        INSTANCE XLXI_541 2480 1728 R0
        BEGIN BRANCH C
            WIRE 2336 1600 2480 1600
            BEGIN DISPLAY 2336 1600 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RST
            WIRE 2352 1696 2480 1696
            BEGIN DISPLAY 2352 1696 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_1270
            WIRE 2368 1472 2448 1472
            WIRE 2448 1472 2480 1472
        END BRANCH
        INSTANCE XLXI_576 2112 1600 R0
        INSTANCE XLXI_578 1696 1504 R0
        INSTANCE XLXI_581 1552 1680 R0
        BEGIN BRANCH x2
            WIRE 1408 1552 1552 1552
            BEGIN DISPLAY 1408 1552 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x1
            WIRE 1408 1616 1552 1616
            BEGIN DISPLAY 1408 1616 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S(2)
            WIRE 1552 1376 1696 1376
            BEGIN DISPLAY 1552 1376 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x3
            WIRE 1552 1440 1696 1440
            BEGIN DISPLAY 1552 1440 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_579 1680 1824 R0
        BEGIN BRANCH S(3)
            WIRE 1408 1696 1680 1696
            BEGIN DISPLAY 1408 1696 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x2
            WIRE 1536 1760 1616 1760
            WIRE 1616 1760 1680 1760
            BEGIN DISPLAY 1536 1760 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_1350
            WIRE 1952 1408 2112 1408
        END BRANCH
        BEGIN BRANCH XLXN_1351
            WIRE 1808 1552 1952 1552
            WIRE 1952 1472 1952 1552
            WIRE 1952 1472 2112 1472
        END BRANCH
        BEGIN BRANCH XLXN_1352
            WIRE 1936 1728 2112 1728
            WIRE 2112 1536 2112 1728
        END BRANCH
        BEGIN BRANCH S(1)
            WIRE 1408 1488 1488 1488
            WIRE 1488 1488 1552 1488
            BEGIN DISPLAY 1408 1488 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_323 2992 1968 R0
        BEGIN BRANCH S(3)
            WIRE 3216 1936 3312 1936
            WIRE 3312 1936 3408 1936
            BEGIN DISPLAY 3312 1936 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_784
            WIRE 2896 1936 2992 1936
        END BRANCH
        INSTANCE XLXI_530 2512 2192 R0
        BEGIN BRANCH RST
            WIRE 2384 2160 2512 2160
            BEGIN DISPLAY 2384 2160 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C
            WIRE 2368 2064 2512 2064
            BEGIN DISPLAY 2368 2064 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_1284
            WIRE 2368 1968 2416 1968
            WIRE 2416 1936 2512 1936
            WIRE 2416 1936 2416 1968
        END BRANCH
        INSTANCE XLXI_582 1712 2160 R0
        BEGIN BRANCH S(1)
            WIRE 1568 1968 1648 1968
            WIRE 1648 1968 1712 1968
            BEGIN DISPLAY 1568 1968 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x1
            WIRE 1568 2032 1648 2032
            WIRE 1648 2032 1712 2032
            BEGIN DISPLAY 1568 2032 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x3
            WIRE 1568 2096 1648 2096
            WIRE 1648 2096 1712 2096
            BEGIN DISPLAY 1568 2096 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x0
            WIRE 1616 2192 2112 2192
            WIRE 2112 2000 2112 2192
            BEGIN DISPLAY 1616 2192 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_1354
            WIRE 1968 2032 2032 2032
            WIRE 2032 1936 2032 2032
            WIRE 2032 1936 2112 1936
        END BRANCH
        INSTANCE XLXI_625 2112 2064 R0
        BEGIN BRANCH S(0:3)
            WIRE 4448 96 4608 96
            WIRE 4608 96 4928 96
            BEGIN DISPLAY 4608 96 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_183 4448 656 R0
        BEGIN BRANCH S(0)
            WIRE 4288 624 4448 624
            BEGIN DISPLAY 4288 624 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH y0
            WIRE 4672 624 4704 624
        END BRANCH
        INSTANCE XLXI_524 4448 784 R0
        BEGIN BRANCH S(1)
            WIRE 4224 752 4384 752
            WIRE 4384 752 4448 752
            BEGIN DISPLAY 4224 752 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH y1
            WIRE 4672 752 4704 752
        END BRANCH
        INSTANCE XLXI_525 4448 896 R0
        BEGIN BRANCH y2
            WIRE 4672 864 4704 864
        END BRANCH
        INSTANCE XLXI_526 4448 1024 R0
        BEGIN BRANCH XLXN_1245
            WIRE 4384 1040 4432 1040
            WIRE 4432 992 4448 992
            WIRE 4432 992 4432 1040
        END BRANCH
        BEGIN BRANCH y3
            WIRE 4672 992 4704 992
        END BRANCH
        BEGIN BRANCH XLXN_1355
            WIRE 4416 864 4448 864
        END BRANCH
        INSTANCE XLXI_626 4160 960 R0
        INSTANCE XLXI_627 4128 1136 R0
        BEGIN BRANCH S(1)
            WIRE 4000 832 4160 832
            BEGIN DISPLAY 4000 832 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S(3)
            WIRE 4000 896 4160 896
            BEGIN DISPLAY 4000 896 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S(2)
            WIRE 3968 1008 4128 1008
            BEGIN DISPLAY 3968 1008 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S(3)
            WIRE 3968 1072 4128 1072
            BEGIN DISPLAY 3968 1072 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        IOMARKER 4704 624 y0 R0 28
        IOMARKER 4704 752 y1 R0 28
        IOMARKER 4704 864 y2 R0 28
        IOMARKER 4704 992 y3 R0 28
    END SHEET
END SCHEMATIC
