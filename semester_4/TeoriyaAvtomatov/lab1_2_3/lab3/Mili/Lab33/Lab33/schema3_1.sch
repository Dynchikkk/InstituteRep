VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL C
        SIGNAL Q(1)
        SIGNAL X
        SIGNAL Q(2)
        SIGNAL Q(3)
        BEGIN SIGNAL RST
        END SIGNAL
        SIGNAL XLXN_457
        SIGNAL Y
        SIGNAL XLXN_495
        SIGNAL XLXN_503
        SIGNAL XLXN_473
        SIGNAL Q(1:4)
        SIGNAL XLXN_548
        SIGNAL XLXN_558
        SIGNAL XLXN_360
        SIGNAL XLXN_471
        SIGNAL Q(4)
        SIGNAL XLXN_100
        SIGNAL XLXN_363
        SIGNAL XLXN_622
        SIGNAL XLXN_623
        SIGNAL XLXN_624
        SIGNAL XLXN_625
        SIGNAL XLXN_626
        SIGNAL XLXN_629
        SIGNAL XLXN_386
        SIGNAL XLXN_143
        SIGNAL XLXN_656
        SIGNAL XLXN_657
        SIGNAL XLXN_658
        SIGNAL XLXN_660
        SIGNAL XLXN_664
        SIGNAL XLXN_686
        SIGNAL XLXN_687
        SIGNAL XLXN_694
        SIGNAL XLXN_695
        SIGNAL XLXN_696
        SIGNAL XLXN_697
        SIGNAL IN_X
        SIGNAL IN_RST
        SIGNAL IN_C
        PORT Output Y
        PORT Input IN_X
        PORT Input IN_RST
        PORT Input IN_C
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
        BEGIN BLOCKDEF or4
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 48 -64 
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -256 48 -256 
            LINE N 256 -160 192 -160 
            ARC N 28 -208 204 -32 192 -160 112 -208 
            LINE N 112 -208 48 -208 
            LINE N 112 -112 48 -112 
            LINE N 48 -256 48 -208 
            LINE N 48 -64 48 -112 
            ARC N -40 -216 72 -104 48 -112 48 -208 
            ARC N 28 -288 204 -112 112 -112 192 -160 
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
        BEGIN BLOCKDEF and3b2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
            LINE N 0 -128 40 -128 
            CIRCLE N 40 -140 64 -116 
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
        BEGIN BLOCKDEF and4b2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
            LINE N 0 -128 40 -128 
            CIRCLE N 40 -140 64 -116 
            LINE N 0 -192 64 -192 
            LINE N 0 -256 64 -256 
            LINE N 256 -160 192 -160 
            LINE N 64 -208 144 -208 
            ARC N 96 -208 192 -112 144 -112 144 -208 
            LINE N 64 -64 64 -256 
            LINE N 144 -112 64 -112 
        END BLOCKDEF
        BEGIN BLOCKDEF or5
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 48 -64 
            LINE N 0 -128 48 -128 
            LINE N 0 -192 72 -192 
            LINE N 0 -256 48 -256 
            LINE N 0 -320 48 -320 
            LINE N 256 -192 192 -192 
            ARC N 28 -320 204 -144 112 -144 192 -192 
            LINE N 112 -240 48 -240 
            LINE N 112 -144 48 -144 
            LINE N 48 -64 48 -144 
            LINE N 48 -320 48 -240 
            ARC N 28 -240 204 -64 192 -192 112 -240 
            ARC N -40 -248 72 -136 48 -144 48 -240 
        END BLOCKDEF
        BEGIN BLOCKDEF and3
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 256 -128 192 -128 
            LINE N 64 -176 144 -176 
            LINE N 144 -80 64 -80 
            ARC N 96 -176 192 -80 144 -80 144 -176 
            LINE N 64 -64 64 -192 
        END BLOCKDEF
        BEGIN BLOCKDEF and2b2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
            LINE N 0 -128 40 -128 
            CIRCLE N 40 -140 64 -116 
            LINE N 256 -96 192 -96 
            ARC N 96 -144 192 -48 144 -48 144 -144 
            LINE N 64 -48 64 -144 
            LINE N 144 -48 64 -48 
            LINE N 64 -144 144 -144 
        END BLOCKDEF
        BEGIN BLOCKDEF and4b4
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
            LINE N 0 -128 40 -128 
            CIRCLE N 40 -140 64 -116 
            LINE N 0 -192 40 -192 
            CIRCLE N 40 -204 64 -180 
            LINE N 0 -256 40 -256 
            CIRCLE N 40 -268 64 -244 
            LINE N 256 -160 192 -160 
            LINE N 64 -208 144 -208 
            ARC N 96 -208 192 -112 144 -112 144 -208 
            LINE N 64 -64 64 -256 
            LINE N 144 -112 64 -112 
        END BLOCKDEF
        BEGIN BLOCKDEF and4b1
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -256 64 -256 
            LINE N 256 -160 192 -160 
            LINE N 64 -64 64 -256 
            LINE N 144 -112 64 -112 
            ARC N 96 -208 192 -112 144 -112 144 -208 
            LINE N 64 -208 144 -208 
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
        BEGIN BLOCKDEF or5b1
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 28 -64 
            CIRCLE N 28 -72 48 -52 
            LINE N 0 -128 48 -128 
            LINE N 0 -192 72 -192 
            LINE N 0 -256 48 -256 
            LINE N 0 -320 48 -320 
            LINE N 256 -192 192 -192 
            ARC N -40 -248 72 -136 48 -144 48 -240 
            ARC N 28 -240 204 -64 192 -192 112 -240 
            LINE N 48 -320 48 -240 
            LINE N 48 -64 48 -144 
            LINE N 112 -144 48 -144 
            LINE N 112 -240 48 -240 
            ARC N 28 -320 204 -144 112 -144 192 -192 
        END BLOCKDEF
        BEGIN BLOCK XLXI_183 obuf
            PIN I XLXN_457
            PIN O Y
        END BLOCK
        BEGIN BLOCK FF1 fdc
            PIN C C
            PIN CLR RST
            PIN D XLXN_471
            PIN Q XLXN_360
        END BLOCK
        BEGIN BLOCK XLXI_244 and4b2
            PIN I0 Q(3)
            PIN I1 X
            PIN I2 Q(4)
            PIN I3 Q(2)
            PIN O XLXN_471
        END BLOCK
        BEGIN BLOCK XLXI_153 buf
            PIN I XLXN_360
            PIN O Q(1)
        END BLOCK
        BEGIN BLOCK XLXI_152 buf
            PIN I XLXN_363
            PIN O Q(2)
        END BLOCK
        BEGIN BLOCK FF2 fdc
            PIN C C
            PIN CLR RST
            PIN D XLXN_100
            PIN Q XLXN_363
        END BLOCK
        BEGIN BLOCK XLXI_253 or5
            PIN I0 XLXN_626
            PIN I1 XLXN_625
            PIN I2 XLXN_624
            PIN I3 XLXN_623
            PIN I4 XLXN_622
            PIN O XLXN_100
        END BLOCK
        BEGIN BLOCK XLXI_254 and3b1
            PIN I0 Q(4)
            PIN I1 Q(3)
            PIN I2 X
            PIN O XLXN_622
        END BLOCK
        BEGIN BLOCK XLXI_256 and3b2
            PIN I0 Q(4)
            PIN I1 Q(2)
            PIN I2 Q(3)
            PIN O XLXN_624
        END BLOCK
        BEGIN BLOCK XLXI_257 and3b1
            PIN I0 Q(2)
            PIN I1 Q(3)
            PIN I2 Q(4)
            PIN O XLXN_625
        END BLOCK
        BEGIN BLOCK XLXI_258 and2b1
            PIN I0 X
            PIN I1 Q(1)
            PIN O XLXN_626
        END BLOCK
        BEGIN BLOCK XLXI_255 and3
            PIN I0 Q(4)
            PIN I1 Q(3)
            PIN I2 X
            PIN O XLXN_623
        END BLOCK
        BEGIN BLOCK XLXI_80 or4
            PIN I0 Q(1)
            PIN I1 XLXN_658
            PIN I2 XLXN_657
            PIN I3 XLXN_656
            PIN O XLXN_143
        END BLOCK
        BEGIN BLOCK XLXI_151 buf
            PIN I XLXN_386
            PIN O Q(3)
        END BLOCK
        BEGIN BLOCK FF3 fdc
            PIN C C
            PIN CLR RST
            PIN D XLXN_143
            PIN Q XLXN_386
        END BLOCK
        BEGIN BLOCK XLXI_280 and3b2
            PIN I0 Q(4)
            PIN I1 X
            PIN I2 Q(2)
            PIN O XLXN_656
        END BLOCK
        BEGIN BLOCK XLXI_281 and3b1
            PIN I0 Q(2)
            PIN I1 Q(4)
            PIN I2 X
            PIN O XLXN_657
        END BLOCK
        BEGIN BLOCK XLXI_282 and3b2
            PIN I0 Q(3)
            PIN I1 Q(2)
            PIN I2 Q(4)
            PIN O XLXN_658
        END BLOCK
        BEGIN BLOCK XLXI_284 buf
            PIN I XLXN_660
            PIN O Q(4)
        END BLOCK
        BEGIN BLOCK FF4 fdc
            PIN C C
            PIN CLR RST
            PIN D XLXN_664
            PIN Q XLXN_660
        END BLOCK
        BEGIN BLOCK XLXI_289 and4b2
            PIN I0 Q(3)
            PIN I1 Q(2)
            PIN I2 Q(4)
            PIN I3 X
            PIN O XLXN_686
        END BLOCK
        BEGIN BLOCK XLXI_290 and2b2
            PIN I0 Q(4)
            PIN I1 X
            PIN O XLXN_687
        END BLOCK
        BEGIN BLOCK XLXI_291 or3
            PIN I0 Q(1)
            PIN I1 XLXN_687
            PIN I2 XLXN_686
            PIN O XLXN_664
        END BLOCK
        BEGIN BLOCK XLXI_293 and4b4
            PIN I0 Q(4)
            PIN I1 Q(2)
            PIN I2 Q(1)
            PIN I3 X
            PIN O XLXN_694
        END BLOCK
        BEGIN BLOCK XLXI_294 and4b1
            PIN I0 Q(4)
            PIN I1 Q(3)
            PIN I2 Q(2)
            PIN I3 X
            PIN O XLXN_695
        END BLOCK
        BEGIN BLOCK XLXI_295 and4b2
            PIN I0 Q(3)
            PIN I1 Q(2)
            PIN I2 Q(4)
            PIN I3 X
            PIN O XLXN_696
        END BLOCK
        BEGIN BLOCK XLXI_296 and2
            PIN I0 Q(1)
            PIN I1 X
            PIN O XLXN_697
        END BLOCK
        BEGIN BLOCK XLXI_297 or5b1
            PIN I0 X
            PIN I1 XLXN_697
            PIN I2 XLXN_696
            PIN I3 XLXN_695
            PIN I4 XLXN_694
            PIN O XLXN_457
        END BLOCK
        BEGIN BLOCK XLXI_149 ibuf
            PIN I IN_X
            PIN O X
        END BLOCK
        BEGIN BLOCK XLXI_218 ibuf
            PIN I IN_RST
            PIN O RST
        END BLOCK
        BEGIN BLOCK XLXI_150 ibufg
            PIN I IN_C
            PIN O C
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 5440 3520
        INSTANCE XLXI_183 4752 2208 R0
        BEGIN BRANCH XLXN_457
            WIRE 4672 2176 4752 2176
        END BRANCH
        BEGIN BRANCH Y
            WIRE 4976 2176 5008 2176
        END BRANCH
        IOMARKER 5008 2176 Y R0 28
        BEGIN BRANCH Q(1:4)
            WIRE 4880 208 5040 208
            WIRE 5040 208 5360 208
            BEGIN DISPLAY 5040 208 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C
            WIRE 2160 336 2176 336
            WIRE 2176 336 2176 352
            WIRE 2176 352 2304 352
            BEGIN DISPLAY 2160 336 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE FF1 2304 480 R0
            BEGIN DISPLAY 0 -412 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH XLXN_471
            WIRE 1984 224 2288 224
            WIRE 2288 224 2304 224
        END BRANCH
        BEGIN BRANCH RST
            WIRE 2016 448 2272 448
            WIRE 2272 448 2304 448
            BEGIN DISPLAY 2016 448 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_244 1728 384 R0
        BEGIN BRANCH X
            WIRE 1616 256 1632 256
            WIRE 1632 256 1728 256
            BEGIN DISPLAY 1616 256 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 1616 320 1632 320
            WIRE 1632 320 1728 320
            BEGIN DISPLAY 1616 320 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 1616 128 1632 128
            WIRE 1632 128 1728 128
            BEGIN DISPLAY 1616 128 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 1616 192 1632 192
            WIRE 1632 192 1728 192
            BEGIN DISPLAY 1616 192 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_360
            WIRE 2688 224 2704 224
            WIRE 2704 224 2800 224
        END BRANCH
        INSTANCE XLXI_153 2800 256 R0
        BEGIN BRANCH Q(1)
            WIRE 3024 224 3168 224
            WIRE 3168 224 3312 224
            BEGIN DISPLAY 3168 224 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_100
            WIRE 2448 1056 2704 1056
        END BRANCH
        BEGIN BRANCH C
            WIRE 2576 1184 2704 1184
            BEGIN DISPLAY 2576 1184 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_152 3232 1088 R0
        BEGIN BRANCH XLXN_363
            WIRE 3088 1056 3216 1056
            WIRE 3216 1056 3232 1056
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 3456 1056 3552 1056
            WIRE 3552 1056 3664 1056
            BEGIN DISPLAY 3552 1056 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE FF2 2704 1312 R0
            BEGIN DISPLAY 0 -412 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH RST
            WIRE 2464 1280 2704 1280
            BEGIN DISPLAY 2464 1280 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_254 1728 784 R0
        INSTANCE XLXI_256 1728 1216 R0
        INSTANCE XLXI_257 1728 1408 R0
        INSTANCE XLXI_258 1728 1600 R0
        INSTANCE XLXI_255 1728 1008 R0
        BEGIN BRANCH X
            WIRE 1616 592 1632 592
            WIRE 1632 592 1728 592
            BEGIN DISPLAY 1616 592 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 1616 656 1632 656
            WIRE 1632 656 1728 656
            BEGIN DISPLAY 1616 656 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 1616 720 1632 720
            WIRE 1632 720 1728 720
            BEGIN DISPLAY 1616 720 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 1616 816 1632 816
            WIRE 1632 816 1728 816
            BEGIN DISPLAY 1616 816 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 1616 880 1632 880
            WIRE 1632 880 1728 880
            BEGIN DISPLAY 1616 880 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 1616 944 1632 944
            WIRE 1632 944 1728 944
            BEGIN DISPLAY 1616 944 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 1616 1024 1632 1024
            WIRE 1632 1024 1728 1024
            BEGIN DISPLAY 1616 1024 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 1616 1088 1632 1088
            WIRE 1632 1088 1728 1088
            BEGIN DISPLAY 1616 1088 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 1616 1152 1632 1152
            WIRE 1632 1152 1728 1152
            BEGIN DISPLAY 1616 1152 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 1616 1216 1632 1216
            WIRE 1632 1216 1728 1216
            BEGIN DISPLAY 1616 1216 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 1616 1280 1632 1280
            WIRE 1632 1280 1728 1280
            BEGIN DISPLAY 1616 1280 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 1616 1344 1632 1344
            WIRE 1632 1344 1728 1344
            BEGIN DISPLAY 1616 1344 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(1)
            WIRE 1616 1472 1632 1472
            WIRE 1632 1472 1728 1472
            BEGIN DISPLAY 1616 1472 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 1616 1536 1632 1536
            WIRE 1632 1536 1728 1536
            BEGIN DISPLAY 1616 1536 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_253 2192 1248 R0
        BEGIN BRANCH XLXN_622
            WIRE 1984 656 2192 656
            WIRE 2192 656 2192 928
        END BRANCH
        BEGIN BRANCH XLXN_623
            WIRE 1984 880 2080 880
            WIRE 2080 880 2080 992
            WIRE 2080 992 2176 992
            WIRE 2176 992 2192 992
        END BRANCH
        BEGIN BRANCH XLXN_624
            WIRE 1984 1088 2080 1088
            WIRE 2080 1056 2080 1088
            WIRE 2080 1056 2192 1056
        END BRANCH
        BEGIN BRANCH XLXN_625
            WIRE 1984 1280 2080 1280
            WIRE 2080 1120 2080 1280
            WIRE 2080 1120 2176 1120
            WIRE 2176 1120 2192 1120
        END BRANCH
        BEGIN BRANCH XLXN_626
            WIRE 1984 1504 2192 1504
            WIRE 2192 1184 2192 1504
        END BRANCH
        INSTANCE XLXI_80 2176 2144 R0
        INSTANCE XLXI_151 3024 2016 R0
        BEGIN BRANCH XLXN_386
            WIRE 2928 1984 3008 1984
            WIRE 3008 1984 3024 1984
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 3248 1984 3344 1984
            WIRE 3344 1984 3440 1984
            BEGIN DISPLAY 3344 1984 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RST
            WIRE 2336 2208 2512 2208
            WIRE 2512 2208 2528 2208
            WIRE 2528 2208 2544 2208
            BEGIN DISPLAY 2336 2208 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C
            WIRE 2400 2112 2416 2112
            WIRE 2416 2112 2544 2112
            BEGIN DISPLAY 2400 2112 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_143
            WIRE 2432 1984 2448 1984
            WIRE 2448 1984 2544 1984
        END BRANCH
        BEGIN INSTANCE FF3 2544 2240 R0
            BEGIN DISPLAY 0 -412 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        INSTANCE XLXI_280 1728 1840 R0
        BEGIN BRANCH Q(2)
            WIRE 1616 1648 1632 1648
            WIRE 1632 1648 1728 1648
            BEGIN DISPLAY 1616 1648 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 1616 1712 1632 1712
            WIRE 1632 1712 1728 1712
            BEGIN DISPLAY 1616 1712 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 1616 1776 1632 1776
            WIRE 1632 1776 1728 1776
            BEGIN DISPLAY 1616 1776 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_281 1728 2032 R0
        BEGIN BRANCH X
            WIRE 1616 1840 1632 1840
            WIRE 1632 1840 1728 1840
            BEGIN DISPLAY 1616 1840 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 1616 1904 1632 1904
            WIRE 1632 1904 1728 1904
            BEGIN DISPLAY 1616 1904 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 1616 1968 1632 1968
            WIRE 1632 1968 1728 1968
            BEGIN DISPLAY 1616 1968 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_282 1728 2224 R0
        BEGIN BRANCH Q(4)
            WIRE 1616 2032 1632 2032
            WIRE 1632 2032 1728 2032
            BEGIN DISPLAY 1616 2032 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 1616 2096 1632 2096
            WIRE 1632 2096 1728 2096
            BEGIN DISPLAY 1616 2096 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 1616 2160 1632 2160
            WIRE 1632 2160 1728 2160
            BEGIN DISPLAY 1616 2160 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_656
            WIRE 1984 1712 2176 1712
            WIRE 2176 1712 2176 1888
        END BRANCH
        BEGIN BRANCH XLXN_657
            WIRE 1984 1904 2080 1904
            WIRE 2080 1904 2080 1952
            WIRE 2080 1952 2176 1952
        END BRANCH
        BEGIN BRANCH XLXN_658
            WIRE 1984 2096 2080 2096
            WIRE 2080 2016 2080 2096
            WIRE 2080 2016 2176 2016
        END BRANCH
        BEGIN BRANCH Q(1)
            WIRE 1792 2288 2176 2288
            WIRE 2176 2080 2176 2288
            BEGIN DISPLAY 1792 2288 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_284 3024 2784 R0
        BEGIN BRANCH XLXN_660
            WIRE 2928 2752 3008 2752
            WIRE 3008 2752 3024 2752
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 3248 2752 3344 2752
            WIRE 3344 2752 3440 2752
            BEGIN DISPLAY 3344 2752 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RST
            WIRE 2336 2976 2512 2976
            WIRE 2512 2976 2528 2976
            WIRE 2528 2976 2544 2976
            BEGIN DISPLAY 2336 2976 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C
            WIRE 2400 2880 2416 2880
            WIRE 2416 2880 2544 2880
            BEGIN DISPLAY 2400 2880 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_664
            WIRE 2432 2752 2544 2752
        END BRANCH
        BEGIN INSTANCE FF4 2544 3008 R0
            BEGIN DISPLAY 0 -412 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        INSTANCE XLXI_289 1728 2640 R0
        INSTANCE XLXI_290 1728 2768 R0
        BEGIN BRANCH X
            WIRE 1616 2384 1632 2384
            WIRE 1632 2384 1728 2384
            BEGIN DISPLAY 1616 2384 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 1616 2448 1632 2448
            WIRE 1632 2448 1728 2448
            BEGIN DISPLAY 1616 2448 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 1616 2512 1632 2512
            WIRE 1632 2512 1728 2512
            BEGIN DISPLAY 1616 2512 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 1616 2576 1632 2576
            WIRE 1632 2576 1728 2576
            BEGIN DISPLAY 1616 2576 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 1616 2640 1632 2640
            WIRE 1632 2640 1728 2640
            BEGIN DISPLAY 1616 2640 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 1616 2704 1632 2704
            WIRE 1632 2704 1728 2704
            BEGIN DISPLAY 1616 2704 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_291 2176 2880 R0
        BEGIN BRANCH XLXN_686
            WIRE 1984 2480 2176 2480
            WIRE 2176 2480 2176 2688
        END BRANCH
        BEGIN BRANCH XLXN_687
            WIRE 1984 2672 2080 2672
            WIRE 2080 2672 2080 2752
            WIRE 2080 2752 2176 2752
        END BRANCH
        BEGIN BRANCH Q(1)
            WIRE 1920 2816 2176 2816
            BEGIN DISPLAY 1920 2816 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_293 3776 1952 R0
        INSTANCE XLXI_294 3776 2224 R0
        INSTANCE XLXI_295 3776 2496 R0
        INSTANCE XLXI_296 3776 2672 R0
        BEGIN BRANCH XLXN_694
            WIRE 4032 1792 4416 1792
            WIRE 4416 1792 4416 2048
        END BRANCH
        BEGIN BRANCH XLXN_695
            WIRE 4032 2064 4224 2064
            WIRE 4224 2064 4224 2112
            WIRE 4224 2112 4416 2112
        END BRANCH
        BEGIN BRANCH XLXN_696
            WIRE 4032 2336 4224 2336
            WIRE 4224 2176 4224 2336
            WIRE 4224 2176 4416 2176
        END BRANCH
        BEGIN BRANCH XLXN_697
            WIRE 4032 2576 4240 2576
            WIRE 4240 2240 4240 2576
            WIRE 4240 2240 4416 2240
        END BRANCH
        BEGIN BRANCH X
            WIRE 3984 2736 4416 2736
            WIRE 4416 2304 4416 2736
            BEGIN DISPLAY 3984 2736 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 3664 1696 3776 1696
            BEGIN DISPLAY 3664 1696 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(1)
            WIRE 3664 1760 3776 1760
            BEGIN DISPLAY 3664 1760 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 3664 1824 3776 1824
            BEGIN DISPLAY 3664 1824 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 3664 1968 3776 1968
            BEGIN DISPLAY 3664 1968 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 3664 2032 3776 2032
            BEGIN DISPLAY 3664 2032 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 3664 2096 3776 2096
            BEGIN DISPLAY 3664 2096 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 3664 2240 3776 2240
            BEGIN DISPLAY 3664 2240 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 3664 2304 3776 2304
            BEGIN DISPLAY 3664 2304 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 3664 2368 3776 2368
            BEGIN DISPLAY 3664 2368 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 3664 2544 3776 2544
            BEGIN DISPLAY 3664 2544 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(1)
            WIRE 3664 2608 3776 2608
            BEGIN DISPLAY 3664 2608 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 3664 1888 3776 1888
            BEGIN DISPLAY 3664 1888 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 3664 2160 3776 2160
            BEGIN DISPLAY 3664 2160 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 3664 2432 3776 2432
            BEGIN DISPLAY 3664 2432 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_297 4416 2368 R0
        BEGIN BRANCH X
            WIRE 528 176 672 176
            WIRE 672 176 816 176
            BEGIN DISPLAY 672 176 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_149 304 208 R0
        BEGIN BRANCH IN_X
            WIRE 272 176 288 176
            WIRE 288 176 304 176
            BEGIN DISPLAY 288 176 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_218 336 480 R0
        BEGIN BRANCH IN_RST
            WIRE 304 448 336 448
        END BRANCH
        BEGIN BRANCH RST
            WIRE 560 448 704 448
            WIRE 704 448 848 448
            BEGIN DISPLAY 704 448 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_150 320 624 R0
        BEGIN BRANCH IN_C
            WIRE 288 592 320 592
        END BRANCH
        BEGIN BRANCH C
            WIRE 544 592 768 592
            WIRE 768 592 768 592
            WIRE 768 592 896 592
            BEGIN DISPLAY 772 592 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 272 176 IN_X R180 28
        IOMARKER 304 448 IN_RST R180 28
        IOMARKER 288 592 IN_C R180 28
    END SHEET
END SCHEMATIC
