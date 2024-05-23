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
        SIGNAL RST
        SIGNAL IN_X
        SIGNAL IN_RST
        SIGNAL IN_C
        SIGNAL Q(1:4)
        SIGNAL No_Q(1:4)
        SIGNAL XLXN_761
        SIGNAL XLXN_788
        SIGNAL XLXN_799
        SIGNAL XLXN_802
        SIGNAL XLXN_812
        SIGNAL XLXN_815
        SIGNAL XLXN_818
        SIGNAL XLXN_823
        SIGNAL XLXN_829
        SIGNAL XLXN_824
        SIGNAL XLXN_825
        SIGNAL XLXN_826
        SIGNAL XLXN_827
        SIGNAL XLXN_828
        SIGNAL XLXN_843
        SIGNAL XLXN_844
        SIGNAL XLXN_848
        SIGNAL XLXN_821
        SIGNAL XLXN_822
        SIGNAL XLXN_838
        SIGNAL XLXN_839
        SIGNAL XLXN_840
        SIGNAL XLXN_841
        SIGNAL XLXN_856
        SIGNAL XLXN_837
        SIGNAL XLXN_858
        SIGNAL XLXN_859
        SIGNAL XLXN_860
        SIGNAL XLXN_861
        SIGNAL XLXN_862
        SIGNAL XLXN_863
        SIGNAL XLXN_867
        SIGNAL XLXN_360
        SIGNAL XLXN_693
        SIGNAL No_Q(1)
        SIGNAL XLXN_789
        SIGNAL XLXN_889
        SIGNAL XLXN_892
        SIGNAL XLXN_363
        SIGNAL XLXN_700
        SIGNAL No_Q(2)
        SIGNAL XLXN_804
        SIGNAL XLXN_810
        SIGNAL XLXN_798
        SIGNAL XLXN_904
        SIGNAL XLXN_800
        SIGNAL XLXN_817
        SIGNAL XLXN_907
        SIGNAL XLXN_819
        SIGNAL XLXN_820
        SIGNAL XLXN_704
        SIGNAL XLXN_386
        SIGNAL No_Q(3)
        SIGNAL XLXN_929
        SIGNAL XLXN_933
        SIGNAL XLXN_457
        SIGNAL Y
        SIGNAL XLXN_782
        SIGNAL Q(4)
        SIGNAL XLXN_784
        SIGNAL No_Q(4)
        SIGNAL XLXN_847
        SIGNAL XLXN_952
        SIGNAL XLXN_849
        SIGNAL XLXN_1018
        SIGNAL XLXN_1030
        SIGNAL XLXN_1042
        SIGNAL XLXN_1044
        SIGNAL XLXN_1045
        SIGNAL XLXN_1077
        SIGNAL XLXN_1078
        SIGNAL XLXN_1079
        SIGNAL XLXN_1080
        SIGNAL XLXN_1081
        PORT Input IN_X
        PORT Input IN_RST
        PORT Input IN_C
        PORT Output No_Q(1)
        PORT Output No_Q(2)
        PORT Output No_Q(3)
        PORT Output Y
        PORT Output No_Q(4)
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
        BEGIN BLOCKDEF Flip_Flop_RS
            TIMESTAMP 2024 4 19 12 23 44
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -224 384 -224 
            LINE N 320 -32 384 -32 
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
        BEGIN BLOCKDEF and4
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 144 -112 64 -112 
            ARC N 96 -208 192 -112 144 -112 144 -208 
            LINE N 64 -208 144 -208 
            LINE N 64 -64 64 -256 
            LINE N 256 -160 192 -160 
            LINE N 0 -256 64 -256 
            LINE N 0 -192 64 -192 
            LINE N 0 -128 64 -128 
            LINE N 0 -64 64 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF and5b4
            TIMESTAMP 2000 1 1 10 10 10
            ARC N 96 -240 192 -144 144 -144 144 -240 
            LINE N 64 -240 144 -240 
            LINE N 144 -144 64 -144 
            LINE N 64 -64 64 -320 
            LINE N 256 -192 192 -192 
            LINE N 0 -320 64 -320 
            LINE N 0 -256 40 -256 
            CIRCLE N 40 -268 64 -244 
            LINE N 0 -192 40 -192 
            CIRCLE N 40 -204 64 -180 
            LINE N 0 -128 40 -128 
            CIRCLE N 40 -140 64 -116 
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
        BEGIN BLOCK XLXI_360 or5
            PIN I0 XLXN_841
            PIN I1 XLXN_863
            PIN I2 XLXN_862
            PIN I3 XLXN_861
            PIN I4 XLXN_837
            PIN O XLXN_829
        END BLOCK
        BEGIN BLOCK XLXI_352 or2
            PIN I0 XLXN_859
            PIN I1 XLXN_858
            PIN O XLXN_823
        END BLOCK
        BEGIN BLOCK XLXI_263 Flip_Flop_RS
            PIN RST RST
            PIN R Q(1)
            PIN S XLXN_789
            PIN C C
            PIN Q XLXN_360
            PIN not_Q XLXN_693
        END BLOCK
        BEGIN BLOCK XLXI_153 buf
            PIN I XLXN_360
            PIN O Q(1)
        END BLOCK
        BEGIN BLOCK XLXI_287 buf
            PIN I XLXN_693
            PIN O No_Q(1)
        END BLOCK
        BEGIN BLOCK XLXI_328 and4
            PIN I0 Q(4)
            PIN I1 Q(3)
            PIN I2 Q(2)
            PIN I3 X
            PIN O XLXN_789
        END BLOCK
        BEGIN BLOCK XLXI_264 Flip_Flop_RS
            PIN RST RST
            PIN R XLXN_804
            PIN S XLXN_810
            PIN C C
            PIN Q XLXN_363
            PIN not_Q XLXN_700
        END BLOCK
        BEGIN BLOCK XLXI_152 buf
            PIN I XLXN_363
            PIN O Q(2)
        END BLOCK
        BEGIN BLOCK XLXI_289 buf
            PIN I XLXN_700
            PIN O No_Q(2)
        END BLOCK
        BEGIN BLOCK XLXI_341 or3
            PIN I0 XLXN_820
            PIN I1 XLXN_819
            PIN I2 XLXN_817
            PIN O XLXN_810
        END BLOCK
        BEGIN BLOCK XLXI_329 and4b1
            PIN I0 X
            PIN I1 Q(4)
            PIN I2 Q(3)
            PIN I3 Q(2)
            PIN O XLXN_798
        END BLOCK
        BEGIN BLOCK XLXI_330 and3
            PIN I0 Q(4)
            PIN I1 Q(3)
            PIN I2 X
            PIN O XLXN_800
        END BLOCK
        BEGIN BLOCK XLXI_333 or2
            PIN I0 XLXN_800
            PIN I1 XLXN_798
            PIN O XLXN_804
        END BLOCK
        BEGIN BLOCK XLXI_338 and4b2
            PIN I0 Q(2)
            PIN I1 X
            PIN I2 Q(4)
            PIN I3 Q(3)
            PIN O XLXN_817
        END BLOCK
        BEGIN BLOCK XLXI_339 and4b2
            PIN I0 Q(3)
            PIN I1 Q(2)
            PIN I2 Q(4)
            PIN I3 X
            PIN O XLXN_819
        END BLOCK
        BEGIN BLOCK XLXI_340 and2b1
            PIN I0 Q(4)
            PIN I1 Q(3)
            PIN O XLXN_820
        END BLOCK
        BEGIN BLOCK XLXI_265 Flip_Flop_RS
            PIN RST RST
            PIN R XLXN_823
            PIN S XLXN_829
            PIN C C
            PIN Q XLXN_386
            PIN not_Q XLXN_704
        END BLOCK
        BEGIN BLOCK XLXI_151 buf
            PIN I XLXN_386
            PIN O Q(3)
        END BLOCK
        BEGIN BLOCK XLXI_293 buf
            PIN I XLXN_704
            PIN O No_Q(3)
        END BLOCK
        BEGIN BLOCK XLXI_353 and3b1
            PIN I0 Q(4)
            PIN I1 Q(3)
            PIN I2 X
            PIN O XLXN_858
        END BLOCK
        BEGIN BLOCK XLXI_354 and3
            PIN I0 Q(4)
            PIN I1 Q(3)
            PIN I2 Q(2)
            PIN O XLXN_859
        END BLOCK
        BEGIN BLOCK XLXI_355 and5b4
            PIN I0 Q(4)
            PIN I1 Q(3)
            PIN I2 Q(2)
            PIN I3 Q(1)
            PIN I4 X
            PIN O XLXN_837
        END BLOCK
        BEGIN BLOCK XLXI_356 and3b1
            PIN I0 Q(3)
            PIN I1 Q(2)
            PIN I2 X
            PIN O XLXN_861
        END BLOCK
        BEGIN BLOCK XLXI_357 and3b1
            PIN I0 Q(3)
            PIN I1 Q(2)
            PIN I2 Q(4)
            PIN O XLXN_862
        END BLOCK
        BEGIN BLOCK XLXI_358 and3b2
            PIN I0 Q(2)
            PIN I1 X
            PIN I2 Q(4)
            PIN O XLXN_863
        END BLOCK
        BEGIN BLOCK XLXI_359 and2b1
            PIN I0 X
            PIN I1 Q(1)
            PIN O XLXN_841
        END BLOCK
        BEGIN BLOCK XLXI_183 obuf
            PIN I XLXN_457
            PIN O Y
        END BLOCK
        BEGIN BLOCK XLXI_322 Flip_Flop_RS
            PIN RST RST
            PIN R XLXN_1018
            PIN S XLXN_1030
            PIN C C
            PIN Q XLXN_784
            PIN not_Q XLXN_782
        END BLOCK
        BEGIN BLOCK XLXI_323 buf
            PIN I XLXN_784
            PIN O Q(4)
        END BLOCK
        BEGIN BLOCK XLXI_324 buf
            PIN I XLXN_782
            PIN O No_Q(4)
        END BLOCK
        BEGIN BLOCK XLXI_362 or2
            PIN I0 XLXN_849
            PIN I1 XLXN_847
            PIN O XLXN_1018
        END BLOCK
        BEGIN BLOCK XLXI_372 and3b2
            PIN I0 Q(2)
            PIN I1 X
            PIN I2 Q(4)
            PIN O XLXN_847
        END BLOCK
        BEGIN BLOCK XLXI_374 and2
            PIN I0 Q(4)
            PIN I1 X
            PIN O XLXN_849
        END BLOCK
        BEGIN BLOCK XLXI_382 and4b4
            PIN I0 Q(4)
            PIN I1 Q(3)
            PIN I2 Q(2)
            PIN I3 Q(1)
            PIN O XLXN_1042
        END BLOCK
        BEGIN BLOCK XLXI_440 and4b2
            PIN I0 Q(4)
            PIN I1 Q(3)
            PIN I2 Q(2)
            PIN I3 X
            PIN O XLXN_1044
        END BLOCK
        BEGIN BLOCK XLXI_441 and3b2
            PIN I0 Q(3)
            PIN I1 X
            PIN I2 Q(2)
            PIN O XLXN_1045
        END BLOCK
        BEGIN BLOCK XLXI_442 or3
            PIN I0 XLXN_1045
            PIN I1 XLXN_1044
            PIN I2 XLXN_1042
            PIN O XLXN_1030
        END BLOCK
        BEGIN BLOCK XLXI_443 or4
            PIN I0 XLXN_1081
            PIN I1 XLXN_1080
            PIN I2 XLXN_1078
            PIN I3 XLXN_1077
            PIN O XLXN_457
        END BLOCK
        BEGIN BLOCK XLXI_444 and4b4
            PIN I0 Q(4)
            PIN I1 Q(3)
            PIN I2 Q(2)
            PIN I3 Q(1)
            PIN O XLXN_1077
        END BLOCK
        BEGIN BLOCK XLXI_445 and3b1
            PIN I0 Q(4)
            PIN I1 Q(3)
            PIN I2 Q(2)
            PIN O XLXN_1078
        END BLOCK
        BEGIN BLOCK XLXI_446 and3b1
            PIN I0 Q(3)
            PIN I1 Q(4)
            PIN I2 Q(2)
            PIN O XLXN_1080
        END BLOCK
        BEGIN BLOCK XLXI_447 and2b1
            PIN I0 Q(2)
            PIN I1 Q(4)
            PIN O XLXN_1081
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 5440 3520
        BEGIN BRANCH X
            WIRE 640 336 784 336
            WIRE 784 336 928 336
            BEGIN DISPLAY 784 336 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_149 416 368 R0
        BEGIN BRANCH IN_X
            WIRE 384 336 400 336
            WIRE 400 336 416 336
            BEGIN DISPLAY 400 336 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 384 336 IN_X R180 28
        INSTANCE XLXI_218 416 496 R0
        BEGIN BRANCH IN_RST
            WIRE 384 464 416 464
        END BRANCH
        BEGIN BRANCH RST
            WIRE 640 464 784 464
            WIRE 784 464 928 464
            BEGIN DISPLAY 784 464 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 384 464 IN_RST R180 28
        INSTANCE XLXI_150 416 624 R0
        BEGIN BRANCH IN_C
            WIRE 384 592 416 592
        END BRANCH
        BEGIN BRANCH C
            WIRE 640 592 864 592
            WIRE 864 592 928 592
            BEGIN DISPLAY 868 592 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 384 592 IN_C R180 28
        BEGIN BRANCH Q(1:4)
            WIRE 4880 320 5040 320
            WIRE 5040 320 5360 320
            BEGIN DISPLAY 5040 320 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH No_Q(1:4)
            WIRE 4880 432 5040 432
            WIRE 5040 432 5360 432
            BEGIN DISPLAY 5040 432 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_841
            WIRE 720 3296 800 3296
            WIRE 800 2928 800 3296
        END BRANCH
        INSTANCE XLXI_352 896 2064 R0
        BEGIN BRANCH XLXN_858
            WIRE 672 1856 880 1856
            WIRE 880 1856 880 1936
            WIRE 880 1936 896 1936
        END BRANCH
        BEGIN BRANCH XLXN_859
            WIRE 688 2096 880 2096
            WIRE 880 2000 896 2000
            WIRE 880 2000 880 2096
        END BRANCH
        BEGIN INSTANCE XLXI_263 2240 448 R0
        END INSTANCE
        BEGIN BRANCH C
            WIRE 2064 416 2240 416
            BEGIN DISPLAY 2064 416 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_360
            WIRE 2624 224 2768 224
        END BRANCH
        INSTANCE XLXI_153 2768 256 R0
        BEGIN BRANCH Q(1)
            WIRE 2992 224 3136 224
            WIRE 3136 224 3280 224
            BEGIN DISPLAY 3136 224 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_693
            WIRE 2624 416 2768 416
        END BRANCH
        INSTANCE XLXI_287 2768 448 R0
        BEGIN BRANCH No_Q(1)
            WIRE 2992 416 3216 416
        END BRANCH
        BEGIN BRANCH RST
            WIRE 2112 224 2240 224
            BEGIN DISPLAY 2112 224 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_789
            WIRE 1760 256 1872 256
            WIRE 1872 256 1872 352
            WIRE 1872 352 2240 352
        END BRANCH
        BEGIN BRANCH Q(1)
            WIRE 1536 80 1936 80
            WIRE 1936 80 1936 288
            WIRE 1936 288 2240 288
            BEGIN DISPLAY 1536 80 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_328 1504 416 R0
        BEGIN BRANCH X
            WIRE 1408 160 1504 160
            BEGIN DISPLAY 1408 160 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 1408 224 1504 224
            BEGIN DISPLAY 1408 224 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 1408 288 1504 288
            BEGIN DISPLAY 1408 288 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 1408 352 1504 352
            BEGIN DISPLAY 1408 352 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        IOMARKER 3216 416 No_Q(1) R0 28
        BEGIN INSTANCE XLXI_264 2560 1216 R0
        END INSTANCE
        BEGIN BRANCH C
            WIRE 2416 1184 2560 1184
            BEGIN DISPLAY 2416 1184 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_363
            WIRE 2944 992 3104 992
        END BRANCH
        INSTANCE XLXI_152 3104 1024 R0
        BEGIN BRANCH Q(2)
            WIRE 3328 992 3424 992
            WIRE 3424 992 3536 992
            BEGIN DISPLAY 3424 992 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_289 3104 1216 R0
        BEGIN BRANCH XLXN_700
            WIRE 2944 1184 3104 1184
        END BRANCH
        BEGIN BRANCH No_Q(2)
            WIRE 3328 1184 3344 1184
            WIRE 3344 1184 3440 1184
        END BRANCH
        BEGIN BRANCH RST
            WIRE 2432 992 2560 992
            BEGIN DISPLAY 2432 992 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_804
            WIRE 2080 656 2544 656
            WIRE 2544 656 2544 1056
            WIRE 2544 1056 2560 1056
        END BRANCH
        INSTANCE XLXI_341 1952 1360 R0
        BEGIN BRANCH XLXN_810
            WIRE 2208 1232 2384 1232
            WIRE 2384 1120 2384 1232
            WIRE 2384 1120 2560 1120
        END BRANCH
        INSTANCE XLXI_329 1504 704 R0
        INSTANCE XLXI_330 1504 928 R0
        INSTANCE XLXI_333 1824 752 R0
        BEGIN BRANCH XLXN_798
            WIRE 1760 544 1792 544
            WIRE 1792 544 1792 624
            WIRE 1792 624 1824 624
        END BRANCH
        BEGIN BRANCH XLXN_800
            WIRE 1760 800 1776 800
            WIRE 1776 688 1824 688
            WIRE 1776 688 1776 800
        END BRANCH
        INSTANCE XLXI_338 1520 1184 R0
        INSTANCE XLXI_339 1520 1456 R0
        INSTANCE XLXI_340 1520 1632 R0
        BEGIN BRANCH XLXN_817
            WIRE 1776 1024 1952 1024
            WIRE 1952 1024 1952 1168
        END BRANCH
        BEGIN BRANCH XLXN_819
            WIRE 1776 1296 1792 1296
            WIRE 1792 1232 1952 1232
            WIRE 1792 1232 1792 1296
        END BRANCH
        BEGIN BRANCH XLXN_820
            WIRE 1776 1536 1952 1536
            WIRE 1952 1296 1952 1536
        END BRANCH
        BEGIN INSTANCE XLXI_265 1488 2256 R0
        END INSTANCE
        BEGIN BRANCH C
            WIRE 1344 2224 1488 2224
            BEGIN DISPLAY 1344 2224 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_704
            WIRE 1872 2224 1968 2224
        END BRANCH
        INSTANCE XLXI_151 1968 2064 R0
        BEGIN BRANCH Q(3)
            WIRE 2192 2032 2288 2032
            WIRE 2288 2032 2384 2032
            BEGIN DISPLAY 2288 2032 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_386
            WIRE 1872 2032 1968 2032
        END BRANCH
        INSTANCE XLXI_293 1968 2256 R0
        BEGIN BRANCH No_Q(3)
            WIRE 2192 2224 2368 2224
        END BRANCH
        BEGIN BRANCH RST
            WIRE 1360 2032 1488 2032
            BEGIN DISPLAY 1360 2032 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        IOMARKER 2368 2224 No_Q(3) R0 28
        BEGIN BRANCH XLXN_823
            WIRE 1152 1968 1168 1968
            WIRE 1168 1968 1168 2096
            WIRE 1168 2096 1488 2096
        END BRANCH
        INSTANCE XLXI_353 416 1984 R0
        INSTANCE XLXI_354 432 2224 R0
        INSTANCE XLXI_355 464 2624 R0
        INSTANCE XLXI_356 464 2816 R0
        INSTANCE XLXI_357 448 3008 R0
        INSTANCE XLXI_358 464 3216 R0
        INSTANCE XLXI_359 464 3392 R0
        BEGIN BRANCH XLXN_837
            WIRE 720 2432 800 2432
            WIRE 800 2432 800 2672
        END BRANCH
        INSTANCE XLXI_360 800 2992 R0
        BEGIN BRANCH XLXN_861
            WIRE 720 2688 736 2688
            WIRE 736 2688 736 2736
            WIRE 736 2736 800 2736
        END BRANCH
        BEGIN BRANCH XLXN_862
            WIRE 704 2880 720 2880
            WIRE 720 2800 800 2800
            WIRE 720 2800 720 2880
        END BRANCH
        BEGIN BRANCH XLXN_863
            WIRE 720 3088 736 3088
            WIRE 736 2864 800 2864
            WIRE 736 2864 736 3088
        END BRANCH
        BEGIN BRANCH XLXN_829
            WIRE 1056 2800 1120 2800
            WIRE 1120 2160 1488 2160
            WIRE 1120 2160 1120 2800
        END BRANCH
        INSTANCE XLXI_183 4800 1056 R0
        BEGIN BRANCH XLXN_457
            WIRE 4736 1024 4800 1024
        END BRANCH
        BEGIN BRANCH Y
            WIRE 5024 1024 5056 1024
        END BRANCH
        IOMARKER 5056 1024 Y R0 28
        BEGIN INSTANCE XLXI_322 4064 2800 R0
        END INSTANCE
        BEGIN BRANCH C
            WIRE 3920 2768 4064 2768
            BEGIN DISPLAY 3920 2768 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_782
            WIRE 4448 2768 4544 2768
        END BRANCH
        INSTANCE XLXI_323 4544 2608 R0
        BEGIN BRANCH Q(4)
            WIRE 4768 2576 4864 2576
            WIRE 4864 2576 4960 2576
            BEGIN DISPLAY 4864 2576 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_784
            WIRE 4448 2576 4544 2576
        END BRANCH
        INSTANCE XLXI_324 4544 2800 R0
        BEGIN BRANCH No_Q(4)
            WIRE 4768 2768 4944 2768
        END BRANCH
        BEGIN BRANCH RST
            WIRE 3936 2576 4064 2576
            BEGIN DISPLAY 3936 2576 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        IOMARKER 4944 2768 No_Q(4) R0 28
        INSTANCE XLXI_362 3152 2608 R0
        INSTANCE XLXI_372 2720 2512 R0
        INSTANCE XLXI_374 2720 2704 R0
        BEGIN BRANCH XLXN_847
            WIRE 2976 2384 3056 2384
            WIRE 3056 2384 3056 2480
            WIRE 3056 2480 3152 2480
        END BRANCH
        BEGIN BRANCH XLXN_849
            WIRE 2976 2608 2992 2608
            WIRE 2992 2544 3152 2544
            WIRE 2992 2544 2992 2608
        END BRANCH
        INSTANCE XLXI_382 1952 2800 R0
        BEGIN BRANCH Q(2)
            WIRE 1408 448 1504 448
            BEGIN DISPLAY 1408 448 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 1408 512 1504 512
            BEGIN DISPLAY 1408 512 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 1408 576 1504 576
            BEGIN DISPLAY 1408 576 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 1408 640 1504 640
            BEGIN DISPLAY 1408 640 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 1408 736 1504 736
            BEGIN DISPLAY 1408 736 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 1408 800 1504 800
            BEGIN DISPLAY 1408 800 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 1408 864 1504 864
            BEGIN DISPLAY 1408 864 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 1424 928 1520 928
            BEGIN DISPLAY 1424 928 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 1424 992 1520 992
            BEGIN DISPLAY 1424 992 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 1424 1056 1520 1056
            BEGIN DISPLAY 1424 1056 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 1424 1120 1520 1120
            BEGIN DISPLAY 1424 1120 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 1424 1200 1520 1200
            BEGIN DISPLAY 1424 1200 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 1424 1264 1520 1264
            BEGIN DISPLAY 1424 1264 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 1424 1328 1520 1328
            BEGIN DISPLAY 1424 1328 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 1424 1392 1520 1392
            BEGIN DISPLAY 1424 1392 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 1424 1504 1520 1504
            BEGIN DISPLAY 1424 1504 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 1424 1568 1520 1568
            BEGIN DISPLAY 1424 1568 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 320 1792 416 1792
            BEGIN DISPLAY 320 1792 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 320 1856 416 1856
            BEGIN DISPLAY 320 1856 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 320 1920 416 1920
            BEGIN DISPLAY 320 1920 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 336 2032 432 2032
            BEGIN DISPLAY 336 2032 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 336 2096 432 2096
            BEGIN DISPLAY 336 2096 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 336 2160 432 2160
            BEGIN DISPLAY 336 2160 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 368 2304 464 2304
            BEGIN DISPLAY 368 2304 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(1)
            WIRE 368 2368 464 2368
            BEGIN DISPLAY 368 2368 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 368 2432 464 2432
            BEGIN DISPLAY 368 2432 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 368 2496 464 2496
            BEGIN DISPLAY 368 2496 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 368 2624 464 2624
            BEGIN DISPLAY 368 2624 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 368 2688 464 2688
            BEGIN DISPLAY 368 2688 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 368 2752 464 2752
            BEGIN DISPLAY 368 2752 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 352 2816 448 2816
            BEGIN DISPLAY 352 2816 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 352 2880 448 2880
            BEGIN DISPLAY 352 2880 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 352 2944 448 2944
            BEGIN DISPLAY 352 2944 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 368 2560 464 2560
            BEGIN DISPLAY 368 2560 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 368 3024 464 3024
            BEGIN DISPLAY 368 3024 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 368 3088 464 3088
            BEGIN DISPLAY 368 3088 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 368 3152 464 3152
            BEGIN DISPLAY 368 3152 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(1)
            WIRE 368 3264 464 3264
            BEGIN DISPLAY 368 3264 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 368 3328 464 3328
            BEGIN DISPLAY 368 3328 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(1)
            WIRE 1856 2544 1952 2544
            BEGIN DISPLAY 1856 2544 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 1856 2608 1952 2608
            BEGIN DISPLAY 1856 2608 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 1856 2672 1952 2672
            BEGIN DISPLAY 1856 2672 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 1856 2736 1952 2736
            BEGIN DISPLAY 1856 2736 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_1018
            WIRE 3408 2512 3728 2512
            WIRE 3728 2512 3728 2640
            WIRE 3728 2640 4064 2640
        END BRANCH
        BEGIN BRANCH X
            WIRE 2624 2576 2720 2576
            BEGIN DISPLAY 2624 2576 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 2624 2640 2720 2640
            BEGIN DISPLAY 2624 2640 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 2624 2320 2720 2320
            BEGIN DISPLAY 2624 2320 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 2624 2384 2720 2384
            BEGIN DISPLAY 2624 2384 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 2624 2448 2720 2448
            BEGIN DISPLAY 2624 2448 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_1030
            WIRE 3552 3056 3568 3056
            WIRE 3568 3056 3808 3056
            WIRE 3808 2704 4064 2704
            WIRE 3808 2704 3808 3056
        END BRANCH
        INSTANCE XLXI_440 1952 3056 R0
        INSTANCE XLXI_441 1968 3312 R0
        BEGIN BRANCH Q(2)
            WIRE 1856 2864 1952 2864
            BEGIN DISPLAY 1856 2864 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 1856 2800 1952 2800
            BEGIN DISPLAY 1856 2800 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 1856 2928 1952 2928
            BEGIN DISPLAY 1856 2928 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH X
            WIRE 1872 3184 1968 3184
            BEGIN DISPLAY 1872 3184 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 1872 3120 1968 3120
            BEGIN DISPLAY 1872 3120 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 1872 3248 1968 3248
            BEGIN DISPLAY 1872 3248 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 1856 2992 1952 2992
            BEGIN DISPLAY 1856 2992 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_442 3296 3184 R0
        BEGIN BRANCH XLXN_1042
            WIRE 2208 2640 2272 2640
            WIRE 2272 2640 2272 2992
            WIRE 2272 2992 3296 2992
        END BRANCH
        BEGIN BRANCH XLXN_1044
            WIRE 2208 2896 2752 2896
            WIRE 2752 2896 2752 3056
            WIRE 2752 3056 3296 3056
        END BRANCH
        BEGIN BRANCH XLXN_1045
            WIRE 2224 3184 3296 3184
            WIRE 3296 3120 3296 3184
        END BRANCH
        INSTANCE XLXI_443 4480 1184 R0
        IOMARKER 3440 1184 No_Q(2) R0 28
        INSTANCE XLXI_444 4016 784 R0
        INSTANCE XLXI_445 4016 992 R0
        INSTANCE XLXI_446 4016 1216 R0
        INSTANCE XLXI_447 4016 1392 R0
        BEGIN BRANCH Q(3)
            WIRE 3904 656 4016 656
            BEGIN DISPLAY 3904 656 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 3904 592 4016 592
            BEGIN DISPLAY 3904 592 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(1)
            WIRE 3904 528 4016 528
            BEGIN DISPLAY 3904 528 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 3904 928 4016 928
            BEGIN DISPLAY 3904 928 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 3904 864 4016 864
            BEGIN DISPLAY 3904 864 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 3904 800 4016 800
            BEGIN DISPLAY 3904 800 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 3904 1152 4016 1152
            BEGIN DISPLAY 3904 1152 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 3904 1088 4016 1088
            BEGIN DISPLAY 3904 1088 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 3904 1024 4016 1024
            BEGIN DISPLAY 3904 1024 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 3904 1328 4016 1328
            BEGIN DISPLAY 3904 1328 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 3904 1264 4016 1264
            BEGIN DISPLAY 3904 1264 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 3904 720 4016 720
            BEGIN DISPLAY 3904 720 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_1077
            WIRE 4272 624 4480 624
            WIRE 4480 624 4480 928
        END BRANCH
        BEGIN BRANCH XLXN_1078
            WIRE 4272 864 4368 864
            WIRE 4368 864 4368 992
            WIRE 4368 992 4480 992
        END BRANCH
        BEGIN BRANCH XLXN_1080
            WIRE 4272 1088 4288 1088
            WIRE 4288 1056 4480 1056
            WIRE 4288 1056 4288 1088
        END BRANCH
        BEGIN BRANCH XLXN_1081
            WIRE 4272 1296 4480 1296
            WIRE 4480 1120 4480 1296
        END BRANCH
    END SHEET
END SCHEMATIC
