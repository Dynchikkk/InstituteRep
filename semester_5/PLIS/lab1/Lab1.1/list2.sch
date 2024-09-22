VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        BEGIN SIGNAL XLXN_1
        END SIGNAL
        BEGIN SIGNAL XLXN_2
        END SIGNAL
        BEGIN SIGNAL XLXN_3
        END SIGNAL
        BEGIN SIGNAL XLXN_4
        END SIGNAL
        SIGNAL XLXN_5
        SIGNAL XLXN_6
        SIGNAL XLXN_7
        SIGNAL XLXN_8
        SIGNAL Y
        SIGNAL XLXN_30
        SIGNAL XLXN_32
        SIGNAL X1
        SIGNAL X2
        SIGNAL XLXN_36
        SIGNAL X3
        SIGNAL XLXN_38
        SIGNAL X4
        PORT Output Y
        PORT Input X1
        PORT Input X2
        PORT Input X3
        PORT Input X4
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
        BEGIN BLOCK XLXI_3 or2
            PIN I0 XLXN_8
            PIN I1 XLXN_7
            PIN O Y
        END BLOCK
        BEGIN BLOCK XLXI_1 and3b2
            PIN I0 X3
            PIN I1 X1
            PIN I2 X4
            PIN O XLXN_7
        END BLOCK
        BEGIN BLOCK XLXI_2 and3
            PIN I0 X4
            PIN I1 X2
            PIN I2 X1
            PIN O XLXN_8
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_3 1696 944 R0
        BEGIN BRANCH XLXN_7
            WIRE 1408 784 1680 784
            WIRE 1680 784 1680 816
            WIRE 1680 816 1696 816
        END BRANCH
        BEGIN BRANCH XLXN_8
            WIRE 1408 1088 1680 1088
            WIRE 1680 880 1696 880
            WIRE 1680 880 1680 1088
        END BRANCH
        BEGIN BRANCH Y
            WIRE 1952 848 2080 848
        END BRANCH
        IOMARKER 2080 848 Y R0 28
        INSTANCE XLXI_1 1152 912 R0
        INSTANCE XLXI_2 1152 1216 R0
        BEGIN BRANCH X1
            WIRE 576 720 752 720
            WIRE 752 720 752 784
            WIRE 752 784 896 784
            WIRE 896 784 976 784
            WIRE 976 784 1152 784
            WIRE 896 784 896 1024
            WIRE 896 1024 976 1024
            WIRE 976 1024 1152 1024
        END BRANCH
        BEGIN BRANCH X2
            WIRE 560 928 720 928
            WIRE 720 928 720 1088
            WIRE 720 1088 976 1088
            WIRE 976 1088 1152 1088
        END BRANCH
        BEGIN BRANCH X3
            WIRE 560 1136 704 1136
            WIRE 704 848 976 848
            WIRE 976 848 1152 848
            WIRE 704 848 704 1136
        END BRANCH
        BEGIN BRANCH X4
            WIRE 544 1312 688 1312
            WIRE 688 1312 832 1312
            WIRE 832 720 976 720
            WIRE 976 720 1152 720
            WIRE 832 720 832 1152
            WIRE 832 1152 832 1312
            WIRE 832 1152 976 1152
            WIRE 976 1152 1152 1152
        END BRANCH
        IOMARKER 576 720 X1 R180 28
        IOMARKER 560 928 X2 R180 28
        IOMARKER 560 1136 X3 R180 28
        IOMARKER 544 1312 X4 R180 28
    END SHEET
END SCHEMATIC
