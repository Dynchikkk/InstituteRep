VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xc9500"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL A1
        BEGIN SIGNAL XLXN_3
        END SIGNAL
        BEGIN SIGNAL XLXN_4
        END SIGNAL
        BEGIN SIGNAL XLXN_5
        END SIGNAL
        SIGNAL XLXN_6
        BEGIN SIGNAL P
        END SIGNAL
        SIGNAL XLXN_9
        SIGNAL S1
        SIGNAL B1
        SIGNAL XLXN_13
        SIGNAL XLXN_14
        SIGNAL XLXN_15
        SIGNAL XLXN_16
        SIGNAL XLXN_17
        SIGNAL XLXN_18
        SIGNAL XLXN_19
        SIGNAL XLXN_20
        SIGNAL B2
        SIGNAL A2
        SIGNAL S2
        SIGNAL S3
        PORT Input A1
        PORT Output S1
        PORT Input B1
        PORT Input B2
        PORT Input A2
        PORT Output S2
        PORT Output S3
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
        BEGIN BLOCKDEF xor2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 60 -128 
            LINE N 256 -96 208 -96 
            ARC N -40 -152 72 -40 48 -48 44 -144 
            ARC N -24 -152 88 -40 64 -48 64 -144 
            LINE N 128 -144 64 -144 
            LINE N 128 -48 64 -48 
            ARC N 44 -144 220 32 208 -96 128 -144 
            ARC N 44 -224 220 -48 128 -48 208 -96 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 and2
            PIN I0 B1
            PIN I1 A1
            PIN O P
        END BLOCK
        BEGIN BLOCK XLXI_2 and2b1
            PIN I0 P
            PIN I1 XLXN_6
            PIN O S1
        END BLOCK
        BEGIN BLOCK XLXI_3 or2
            PIN I0 B1
            PIN I1 A1
            PIN O XLXN_6
        END BLOCK
        BEGIN BLOCK XLXI_4 xor2
            PIN I0 B2
            PIN I1 A2
            PIN O XLXN_16
        END BLOCK
        BEGIN BLOCK XLXI_5 xor2
            PIN I0 XLXN_16
            PIN I1 P
            PIN O S2
        END BLOCK
        BEGIN BLOCK XLXI_6 or2
            PIN I0 XLXN_18
            PIN I1 XLXN_17
            PIN O S3
        END BLOCK
        BEGIN BLOCK XLXI_8 and2
            PIN I0 A2
            PIN I1 B2
            PIN O XLXN_18
        END BLOCK
        BEGIN BLOCK XLXI_9 and2
            PIN I0 XLXN_16
            PIN I1 P
            PIN O XLXN_17
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_2 1296 1088 R0
        INSTANCE XLXI_1 832 1376 R0
        INSTANCE XLXI_3 816 1056 R0
        BEGIN BRANCH XLXN_6
            WIRE 1072 960 1296 960
        END BRANCH
        BEGIN BRANCH P
            WIRE 1088 1280 1120 1280
            WIRE 1120 1280 1712 1280
            WIRE 1712 1280 1712 1408
            WIRE 1120 1024 1296 1024
            WIRE 1120 1024 1120 1280
            WIRE 1120 1408 1712 1408
            WIRE 1120 1408 1120 1536
            WIRE 1120 1536 1184 1536
            WIRE 1120 1536 1120 1760
            WIRE 1120 1760 1136 1760
        END BRANCH
        BEGIN BRANCH S1
            WIRE 1552 992 1664 992
        END BRANCH
        IOMARKER 1664 992 S1 R0 28
        BEGIN BRANCH B1
            WIRE 304 1312 640 1312
            WIRE 640 1312 832 1312
            WIRE 640 992 816 992
            WIRE 640 992 640 1312
        END BRANCH
        BEGIN BRANCH A1
            WIRE 304 928 608 928
            WIRE 608 928 608 1248
            WIRE 608 1248 832 1248
            WIRE 608 928 816 928
        END BRANCH
        INSTANCE XLXI_5 1184 1664 R0
        INSTANCE XLXI_9 1136 1888 R0
        IOMARKER 304 928 A1 R180 28
        IOMARKER 304 1312 B1 R180 28
        INSTANCE XLXI_4 608 1696 R0
        INSTANCE XLXI_8 608 1888 R0
        INSTANCE XLXI_6 912 2144 R0
        BEGIN BRANCH XLXN_16
            WIRE 864 1600 992 1600
            WIRE 992 1600 1184 1600
            WIRE 992 1600 992 1824
            WIRE 992 1824 1136 1824
        END BRANCH
        BEGIN BRANCH XLXN_17
            WIRE 848 1952 1472 1952
            WIRE 848 1952 848 2016
            WIRE 848 2016 912 2016
            WIRE 1392 1792 1472 1792
            WIRE 1472 1792 1472 1952
        END BRANCH
        BEGIN BRANCH XLXN_18
            WIRE 864 1792 896 1792
            WIRE 896 1792 896 2080
            WIRE 896 2080 912 2080
        END BRANCH
        BEGIN BRANCH B2
            WIRE 352 1632 512 1632
            WIRE 512 1632 608 1632
            WIRE 512 1632 512 1760
            WIRE 512 1760 608 1760
        END BRANCH
        BEGIN BRANCH A2
            WIRE 352 1568 464 1568
            WIRE 464 1568 608 1568
            WIRE 464 1568 464 1824
            WIRE 464 1824 608 1824
        END BRANCH
        BEGIN BRANCH S2
            WIRE 1440 1568 1696 1568
        END BRANCH
        BEGIN BRANCH S3
            WIRE 1168 2048 1696 2048
        END BRANCH
        IOMARKER 352 1568 A2 R180 28
        IOMARKER 352 1632 B2 R180 28
        IOMARKER 1696 1568 S2 R0 28
        IOMARKER 1696 2048 S3 R0 28
    END SHEET
END SCHEMATIC
