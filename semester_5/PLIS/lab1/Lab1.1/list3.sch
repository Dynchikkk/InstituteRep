VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_1
        SIGNAL XLXN_2
        SIGNAL XLXN_5
        SIGNAL XLXN_6
        SIGNAL XLXN_7
        SIGNAL XLXN_8
        SIGNAL X1
        SIGNAL X2
        SIGNAL A0
        SIGNAL A1
        SIGNAL A2
        SIGNAL A3
        PORT Input X1
        PORT Input X2
        PORT Output A0
        PORT Output A1
        PORT Output A2
        PORT Output A3
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
        BEGIN BLOCK XLXI_2 and2b1
            PIN I0 X2
            PIN I1 X1
            PIN O A1
        END BLOCK
        BEGIN BLOCK XLXI_3 and2b1
            PIN I0 X1
            PIN I1 X2
            PIN O A2
        END BLOCK
        BEGIN BLOCK XLXI_4 and2
            PIN I0 X1
            PIN I1 X2
            PIN O A3
        END BLOCK
        BEGIN BLOCK XLXI_6 and2b2
            PIN I0 X1
            PIN I1 X2
            PIN O A0
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_2 1952 992 R0
        INSTANCE XLXI_3 1952 1168 R0
        INSTANCE XLXI_4 1952 1312 R0
        INSTANCE XLXI_6 1936 832 R0
        BEGIN BRANCH X1
            WIRE 1328 1136 1504 1136
            WIRE 1504 1136 1712 1136
            WIRE 1712 1136 1760 1136
            WIRE 1760 1136 1936 1136
            WIRE 1760 1136 1760 1248
            WIRE 1760 1248 1952 1248
            WIRE 1504 768 1936 768
            WIRE 1504 768 1504 1136
            WIRE 1712 864 1712 1136
            WIRE 1712 864 1952 864
            WIRE 1936 1104 1952 1104
            WIRE 1936 1104 1936 1136
        END BRANCH
        BEGIN BRANCH X2
            WIRE 1312 704 1488 704
            WIRE 1488 704 1616 704
            WIRE 1616 704 1728 704
            WIRE 1728 704 1728 928
            WIRE 1728 928 1952 928
            WIRE 1728 704 1776 704
            WIRE 1776 704 1936 704
            WIRE 1776 704 1776 1184
            WIRE 1776 1184 1952 1184
            WIRE 1616 704 1616 1040
            WIRE 1616 1040 1952 1040
        END BRANCH
        BEGIN BRANCH A0
            WIRE 2192 736 2304 736
        END BRANCH
        BEGIN BRANCH A1
            WIRE 2208 896 2304 896
        END BRANCH
        BEGIN BRANCH A2
            WIRE 2208 1072 2288 1072
        END BRANCH
        BEGIN BRANCH A3
            WIRE 2208 1216 2288 1216
        END BRANCH
        IOMARKER 1312 704 X2 R180 28
        IOMARKER 1328 1136 X1 R180 28
        IOMARKER 2304 736 A0 R0 28
        IOMARKER 2304 896 A1 R0 28
        IOMARKER 2288 1072 A2 R0 28
        IOMARKER 2288 1216 A3 R0 28
    END SHEET
END SCHEMATIC
