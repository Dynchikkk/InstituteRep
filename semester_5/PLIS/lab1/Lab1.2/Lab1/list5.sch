VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL X1
        SIGNAL X2
        SIGNAL X3
        SIGNAL X4
        SIGNAL Y3
        SIGNAL Y2
        SIGNAL Y1
        SIGNAL Y13
        SIGNAL Y14
        SIGNAL Y15
        SIGNAL Y16
        SIGNAL Y4
        SIGNAL XLXN_56
        PORT Input X1
        PORT Input X2
        PORT Input X3
        PORT Input X4
        PORT Output Y3
        PORT Output Y2
        PORT Output Y1
        PORT Output Y13
        PORT Output Y14
        PORT Output Y15
        PORT Output Y16
        PORT Output Y4
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
        BEGIN BLOCKDEF and4b3
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
            LINE N 0 -128 40 -128 
            CIRCLE N 40 -140 64 -116 
            LINE N 0 -192 40 -192 
            CIRCLE N 40 -204 64 -180 
            LINE N 0 -256 64 -256 
            LINE N 256 -160 192 -160 
            LINE N 64 -64 64 -256 
            LINE N 144 -112 64 -112 
            ARC N 96 -208 192 -112 144 -112 144 -208 
            LINE N 64 -208 144 -208 
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
        BEGIN BLOCK XLXI_25 and4
            PIN I0 X4
            PIN I1 X3
            PIN I2 X2
            PIN I3 X1
            PIN O Y1
        END BLOCK
        BEGIN BLOCK XLXI_26 and4b1
            PIN I0 X4
            PIN I1 X3
            PIN I2 X2
            PIN I3 X1
            PIN O Y2
        END BLOCK
        BEGIN BLOCK XLXI_27 and4b1
            PIN I0 X3
            PIN I1 X4
            PIN I2 X2
            PIN I3 X1
            PIN O Y3
        END BLOCK
        BEGIN BLOCK XLXI_49 and4b2
            PIN I0 X4
            PIN I1 X3
            PIN I2 X2
            PIN I3 X1
            PIN O Y4
        END BLOCK
        BEGIN BLOCK XLXI_40 and4b4
            PIN I0 X1
            PIN I1 X2
            PIN I2 X3
            PIN I3 X4
            PIN O Y16
        END BLOCK
        BEGIN BLOCK XLXI_53 and4b2
            PIN I0 X1
            PIN I1 X2
            PIN I2 X3
            PIN I3 X4
            PIN O Y13
        END BLOCK
        BEGIN BLOCK XLXI_54 and4b3
            PIN I0 X1
            PIN I1 X2
            PIN I2 X4
            PIN I3 X3
            PIN O Y14
        END BLOCK
        BEGIN BLOCK XLXI_56 and4b3
            PIN I0 X1
            PIN I1 X2
            PIN I2 X3
            PIN I3 X4
            PIN O Y15
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH X1
            WIRE 400 128 656 128
            WIRE 656 128 656 224
            WIRE 656 224 1216 224
            WIRE 656 224 656 448
            WIRE 656 448 1216 448
            WIRE 656 448 656 672
            WIRE 656 672 1216 672
            WIRE 656 672 656 896
            WIRE 656 896 1216 896
            WIRE 656 896 656 1424
            WIRE 656 1424 656 1648
            WIRE 656 1648 656 1872
            WIRE 656 1872 656 2096
            WIRE 656 2096 656 2672
            WIRE 656 2096 1216 2096
            WIRE 656 1872 1200 1872
            WIRE 1200 1872 1216 1872
            WIRE 656 1648 1216 1648
            WIRE 656 1424 1216 1424
        END BRANCH
        BEGIN BRANCH X2
            WIRE 400 208 592 208
            WIRE 592 208 592 288
            WIRE 592 288 1216 288
            WIRE 592 288 592 512
            WIRE 592 512 1216 512
            WIRE 592 512 592 736
            WIRE 592 736 1216 736
            WIRE 592 736 592 960
            WIRE 592 960 1216 960
            WIRE 592 960 592 1360
            WIRE 592 1360 592 1584
            WIRE 592 1584 592 1808
            WIRE 592 1808 592 2032
            WIRE 592 2032 592 2672
            WIRE 592 2032 1216 2032
            WIRE 592 1808 1216 1808
            WIRE 592 1584 1216 1584
            WIRE 592 1360 1216 1360
        END BRANCH
        BEGIN BRANCH X3
            WIRE 400 288 528 288
            WIRE 528 288 528 352
            WIRE 528 352 1216 352
            WIRE 528 352 528 576
            WIRE 528 576 1216 576
            WIRE 528 576 528 864
            WIRE 528 864 1216 864
            WIRE 528 864 528 1024
            WIRE 528 1024 1216 1024
            WIRE 528 1024 528 1232
            WIRE 528 1232 528 1296
            WIRE 528 1296 528 1456
            WIRE 528 1456 1216 1456
            WIRE 528 1456 528 1584
            WIRE 528 1584 528 1744
            WIRE 528 1744 528 1968
            WIRE 528 1968 528 2672
            WIRE 528 1968 1216 1968
            WIRE 528 1744 1216 1744
            WIRE 528 1296 1216 1296
        END BRANCH
        BEGIN BRANCH X4
            WIRE 400 368 464 368
            WIRE 464 368 464 416
            WIRE 464 416 1216 416
            WIRE 464 416 464 640
            WIRE 464 640 1216 640
            WIRE 464 640 464 800
            WIRE 464 800 1216 800
            WIRE 464 800 464 1088
            WIRE 464 1088 1216 1088
            WIRE 464 1088 464 1216
            WIRE 464 1216 464 1216
            WIRE 464 1216 464 1232
            WIRE 464 1232 464 1232
            WIRE 464 1232 464 1248
            WIRE 464 1248 464 1296
            WIRE 464 1296 464 1520
            WIRE 464 1520 464 1680
            WIRE 464 1680 464 1904
            WIRE 464 1904 464 2672
            WIRE 464 1904 1216 1904
            WIRE 464 1680 1216 1680
            WIRE 464 1520 1216 1520
            WIRE 464 1248 832 1248
            WIRE 832 1232 832 1248
            WIRE 832 1232 1216 1232
        END BRANCH
        IOMARKER 400 128 X1 R180 28
        IOMARKER 400 208 X2 R180 28
        IOMARKER 400 288 X3 R180 28
        IOMARKER 400 368 X4 R180 28
        BEGIN BRANCH Y3
            WIRE 1472 768 1488 768
            WIRE 1488 768 1520 768
        END BRANCH
        BEGIN BRANCH Y2
            WIRE 1472 544 1488 544
            WIRE 1488 544 1520 544
        END BRANCH
        BEGIN BRANCH Y1
            WIRE 1472 320 1488 320
            WIRE 1488 320 1520 320
        END BRANCH
        INSTANCE XLXI_25 1216 480 R0
        INSTANCE XLXI_26 1216 704 R0
        INSTANCE XLXI_27 1216 928 R0
        INSTANCE XLXI_49 1216 1152 R0
        INSTANCE XLXI_40 1216 2160 R0
        BEGIN BRANCH Y13
            WIRE 1472 1328 1504 1328
        END BRANCH
        BEGIN BRANCH Y14
            WIRE 1472 1552 1504 1552
        END BRANCH
        BEGIN BRANCH Y15
            WIRE 1472 1776 1488 1776
            WIRE 1488 1776 1504 1776
        END BRANCH
        BEGIN BRANCH Y16
            WIRE 1472 2000 1504 2000
        END BRANCH
        BEGIN BRANCH Y4
            WIRE 1472 992 1504 992
        END BRANCH
        IOMARKER 1520 320 Y1 R0 28
        IOMARKER 1520 544 Y2 R0 28
        IOMARKER 1520 768 Y3 R0 28
        IOMARKER 1504 1328 Y13 R0 28
        IOMARKER 1504 1552 Y14 R0 28
        IOMARKER 1504 1776 Y15 R0 28
        IOMARKER 1504 2000 Y16 R0 28
        IOMARKER 1504 992 Y4 R0 28
        INSTANCE XLXI_53 1216 1488 R0
        INSTANCE XLXI_54 1216 1712 R0
        INSTANCE XLXI_56 1216 1936 R0
    END SHEET
END SCHEMATIC
