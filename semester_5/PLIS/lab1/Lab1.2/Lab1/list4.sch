VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_1
        SIGNAL X1
        SIGNAL XLXN_3
        SIGNAL XLXN_4
        SIGNAL XLXN_5
        SIGNAL A
        SIGNAL X2
        SIGNAL Y
        PORT Input X1
        PORT Input A
        PORT Input X2
        PORT Output Y
        BEGIN BLOCKDEF inv
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 160 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            CIRCLE N 128 -48 160 -16 
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
        BEGIN BLOCK XLXI_1 inv
            PIN I A
            PIN O XLXN_1
        END BLOCK
        BEGIN BLOCK XLXI_2 and2
            PIN I0 X1
            PIN I1 XLXN_1
            PIN O XLXN_4
        END BLOCK
        BEGIN BLOCK XLXI_3 and2
            PIN I0 X2
            PIN I1 A
            PIN O XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_4 or2
            PIN I0 XLXN_5
            PIN I1 XLXN_4
            PIN O Y
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 688 880 R0
        INSTANCE XLXI_2 1088 976 R0
        INSTANCE XLXI_3 1088 1200 R0
        INSTANCE XLXI_4 1456 1088 R0
        BEGIN BRANCH XLXN_1
            WIRE 912 848 1088 848
        END BRANCH
        BEGIN BRANCH X1
            WIRE 528 912 1088 912
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 1344 880 1392 880
            WIRE 1392 880 1392 960
            WIRE 1392 960 1456 960
        END BRANCH
        BEGIN BRANCH XLXN_5
            WIRE 1344 1104 1392 1104
            WIRE 1392 1024 1392 1104
            WIRE 1392 1024 1456 1024
        END BRANCH
        BEGIN BRANCH A
            WIRE 528 848 640 848
            WIRE 640 848 688 848
            WIRE 640 848 640 1072
            WIRE 640 1072 1088 1072
        END BRANCH
        BEGIN BRANCH X2
            WIRE 544 1136 1088 1136
        END BRANCH
        IOMARKER 528 848 A R180 28
        IOMARKER 528 912 X1 R180 28
        IOMARKER 544 1136 X2 R180 28
        BEGIN BRANCH Y
            WIRE 1712 992 1744 992
        END BRANCH
        IOMARKER 1744 992 Y R0 28
    END SHEET
END SCHEMATIC
