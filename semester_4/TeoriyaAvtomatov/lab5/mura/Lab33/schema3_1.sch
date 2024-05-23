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
        SIGNAL S(3)
        SIGNAL S(2)
        SIGNAL S(0:3)
        SIGNAL No_S(0:3)
        SIGNAL XLXN_1643
        SIGNAL XLXN_1648
        SIGNAL XLXN_1651
        SIGNAL XLXN_1653
        SIGNAL XLXN_1656
        SIGNAL XLXN_1658
        SIGNAL XLXN_1660
        SIGNAL XLXN_1666
        SIGNAL XLXN_1668
        SIGNAL XLXN_1672
        SIGNAL XLXN_1683
        SIGNAL XLXN_1699
        SIGNAL XLXN_1717
        SIGNAL XLXN_1720
        SIGNAL XLXN_1722
        SIGNAL XLXN_1724
        SIGNAL XLXN_1706
        SIGNAL XLXN_1746
        SIGNAL XLXN_1762
        SIGNAL XLXN_1765
        SIGNAL XLXN_1767
        SIGNAL XLXN_1769
        SIGNAL XLXN_1771
        SIGNAL XLXN_1774
        SIGNAL XLXN_1790
        SIGNAL XLXN_1793
        SIGNAL XLXN_1795
        SIGNAL XLXN_1797
        SIGNAL XLXN_1799
        SIGNAL XLXN_386
        SIGNAL No_S(2)
        SIGNAL XLXN_1514
        SIGNAL XLXN_1352
        SIGNAL XLXN_1816
        SIGNAL XLXN_1351
        SIGNAL XLXN_1819
        SIGNAL XLXN_1821
        SIGNAL XLXN_1723
        SIGNAL XLXN_1823
        SIGNAL XLXN_1726
        SIGNAL XLXN_1825
        SIGNAL XLXN_1727
        SIGNAL XLXN_1730
        SIGNAL XLXN_1842
        SIGNAL XLXN_1846
        SIGNAL XLXN_1863
        SIGNAL XLXN_1867
        SIGNAL XLXN_1646
        SIGNAL XLXN_1870
        SIGNAL XLXN_1872
        SIGNAL XLXN_1874
        SIGNAL XLXN_1876
        SIGNAL XLXN_1878
        SIGNAL XLXN_1880
        SIGNAL XLXN_1261
        SIGNAL XLXN_1890
        SIGNAL XLXN_1262
        SIGNAL XLXN_1644
        SIGNAL XLXN_1896
        SIGNAL XLXN_1898
        SIGNAL XLXN_363
        SIGNAL No_S(1)
        SIGNAL XLXN_1513
        SIGNAL XLXN_1920
        SIGNAL XLXN_1921
        SIGNAL XLXN_1923
        SIGNAL XLXN_1871
        SIGNAL XLXN_1925
        SIGNAL XLXN_1873
        SIGNAL XLXN_1641
        SIGNAL XLXN_1945
        SIGNAL XLXN_1875
        SIGNAL XLXN_1947
        SIGNAL XLXN_1877
        SIGNAL XLXN_360
        SIGNAL No_S(0)
        SIGNAL XLXN_1512
        SIGNAL y0
        SIGNAL y1
        SIGNAL y2
        SIGNAL XLXN_1966
        SIGNAL XLXN_1245
        SIGNAL y3
        SIGNAL XLXN_1355
        SIGNAL XLXN_1974
        SIGNAL XLXN_1975
        SIGNAL XLXN_1705
        SIGNAL XLXN_1990
        SIGNAL XLXN_1992
        SIGNAL No_S(3)
        SIGNAL XLXN_1689
        SIGNAL XLXN_1690
        SIGNAL XLXN_2000
        SIGNAL XLXN_1879
        SIGNAL XLXN_2002
        SIGNAL XLXN_1881
        SIGNAL XLXN_2004
        SIGNAL XLXN_2005
        PORT Input IN_RST
        PORT Input IN_C
        PORT Input IN_x0
        PORT Input IN_x1
        PORT Input IN_x2
        PORT Input IN_x3
        PORT Input IN_x4
        PORT Output No_S(2)
        PORT Output No_S(1)
        PORT Output No_S(0)
        PORT Output y0
        PORT Output y1
        PORT Output y2
        PORT Output y3
        PORT Output No_S(3)
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
        BEGIN BLOCKDEF or2b1
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 32 -64 
            CIRCLE N 32 -76 56 -52 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            LINE N 112 -48 48 -48 
            ARC N 28 -144 204 32 192 -96 112 -144 
            LINE N 112 -144 48 -144 
            ARC N -40 -152 72 -40 48 -48 48 -144 
            ARC N 28 -224 204 -48 112 -48 192 -96 
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
        BEGIN BLOCK XLXI_151 buf
            PIN I XLXN_386
            PIN O S(2)
        END BLOCK
        BEGIN BLOCK XLXI_652 buf
            PIN I XLXN_1514
            PIN O No_S(2)
        END BLOCK
        BEGIN BLOCK XLXI_634 Flip_Flop_RS
            PIN RST RST
            PIN R XLXN_1730
            PIN S XLXN_1723
            PIN C C
            PIN Q XLXN_386
            PIN not_Q XLXN_1514
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
        BEGIN BLOCK XLXI_643 or2
            PIN I0 XLXN_1352
            PIN I1 XLXN_1351
            PIN O XLXN_1723
        END BLOCK
        BEGIN BLOCK XLXI_646 and2
            PIN I0 x3
            PIN I1 S(2)
            PIN O XLXN_1648
        END BLOCK
        BEGIN BLOCK XLXI_682 or2
            PIN I0 RST
            PIN I1 XLXN_1648
            PIN O XLXN_1726
        END BLOCK
        BEGIN BLOCK XLXI_712 xor2
            PIN I0 XLXN_1723
            PIN I1 XLXN_1726
            PIN O XLXN_1727
        END BLOCK
        BEGIN BLOCK XLXI_713 and2
            PIN I0 XLXN_1727
            PIN I1 XLXN_1726
            PIN O XLXN_1730
        END BLOCK
        BEGIN BLOCK XLXI_575 and2
            PIN I0 x1
            PIN I1 S(0)
            PIN O XLXN_1261
        END BLOCK
        BEGIN BLOCK XLXI_645 and2
            PIN I0 x2
            PIN I1 S(1)
            PIN O XLXN_1644
        END BLOCK
        BEGIN BLOCK XLXI_642 or2
            PIN I0 XLXN_1262
            PIN I1 XLXN_1261
            PIN O XLXN_1920
        END BLOCK
        BEGIN BLOCK XLXI_574 and3b1
            PIN I0 x2
            PIN I1 x3
            PIN I2 S(2)
            PIN O XLXN_1262
        END BLOCK
        BEGIN BLOCK XLXI_152 buf
            PIN I XLXN_363
            PIN O S(1)
        END BLOCK
        BEGIN BLOCK XLXI_651 buf
            PIN I XLXN_1513
            PIN O No_S(1)
        END BLOCK
        BEGIN BLOCK XLXI_633 Flip_Flop_RS
            PIN RST RST
            PIN R XLXN_1921
            PIN S XLXN_1920
            PIN C C
            PIN Q XLXN_363
            PIN not_Q XLXN_1513
        END BLOCK
        BEGIN BLOCK XLXI_680 or2
            PIN I0 RST
            PIN I1 XLXN_1644
            PIN O XLXN_1871
        END BLOCK
        BEGIN BLOCK XLXI_766 xor2
            PIN I0 XLXN_1920
            PIN I1 XLXN_1871
            PIN O XLXN_1873
        END BLOCK
        BEGIN BLOCK XLXI_767 and2
            PIN I0 XLXN_1873
            PIN I1 XLXN_1871
            PIN O XLXN_1921
        END BLOCK
        BEGIN BLOCK XLXI_573 and3b1
            PIN I0 x2
            PIN I1 x3
            PIN I2 S(2)
            PIN O XLXN_1974
        END BLOCK
        BEGIN BLOCK XLXI_644 and2
            PIN I0 x1
            PIN I1 S(0)
            PIN O XLXN_1641
        END BLOCK
        BEGIN BLOCK XLXI_655 or2
            PIN I0 RST
            PIN I1 XLXN_1641
            PIN O XLXN_1875
        END BLOCK
        BEGIN BLOCK XLXI_768 xor2
            PIN I0 XLXN_1974
            PIN I1 XLXN_1875
            PIN O XLXN_1877
        END BLOCK
        BEGIN BLOCK XLXI_769 and2
            PIN I0 XLXN_1877
            PIN I1 XLXN_1875
            PIN O XLXN_1975
        END BLOCK
        BEGIN BLOCK XLXI_632 Flip_Flop_RS
            PIN RST RST
            PIN R XLXN_1975
            PIN S XLXN_1974
            PIN C C
            PIN Q XLXN_360
            PIN not_Q XLXN_1512
        END BLOCK
        BEGIN BLOCK XLXI_153 buf
            PIN I XLXN_360
            PIN O S(0)
        END BLOCK
        BEGIN BLOCK XLXI_287 buf
            PIN I XLXN_1512
            PIN O No_S(0)
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
        BEGIN BLOCK XLXI_582 and3b1
            PIN I0 x3
            PIN I1 x1
            PIN I2 S(1)
            PIN O XLXN_1705
        END BLOCK
        BEGIN BLOCK XLXI_699 or2b1
            PIN I0 x0
            PIN I1 RST
            PIN O XLXN_1879
        END BLOCK
        BEGIN BLOCK XLXI_701 or2
            PIN I0 XLXN_1705
            PIN I1 x0
            PIN O XLXN_2004
        END BLOCK
        BEGIN BLOCK XLXI_323 buf
            PIN I XLXN_1689
            PIN O S(3)
        END BLOCK
        BEGIN BLOCK XLXI_692 buf
            PIN I XLXN_1690
            PIN O No_S(3)
        END BLOCK
        BEGIN BLOCK XLXI_690 Flip_Flop_RS
            PIN RST RST
            PIN R XLXN_2005
            PIN S XLXN_2004
            PIN C C
            PIN Q XLXN_1689
            PIN not_Q XLXN_1690
        END BLOCK
        BEGIN BLOCK XLXI_770 xor2
            PIN I0 XLXN_2004
            PIN I1 XLXN_1879
            PIN O XLXN_1881
        END BLOCK
        BEGIN BLOCK XLXI_771 and2
            PIN I0 XLXN_1881
            PIN I1 XLXN_1879
            PIN O XLXN_2005
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
        BEGIN BRANCH S(0:3)
            WIRE 4448 96 4608 96
            WIRE 4608 96 4928 96
            BEGIN DISPLAY 4608 96 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH No_S(0:3)
            WIRE 4464 224 4624 224
            WIRE 4624 224 4944 224
            BEGIN DISPLAY 4624 224 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_151 3296 1808 R0
        BEGIN BRANCH S(2)
            WIRE 3520 1776 3616 1776
            WIRE 3616 1776 3712 1776
            BEGIN DISPLAY 3616 1776 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_386
            WIRE 3200 1776 3296 1776
        END BRANCH
        INSTANCE XLXI_652 3296 2000 R0
        BEGIN BRANCH No_S(2)
            WIRE 3520 1968 3744 1968
        END BRANCH
        BEGIN BRANCH XLXN_1514
            WIRE 3200 1968 3296 1968
        END BRANCH
        BEGIN INSTANCE XLXI_634 2816 2000 R0
        END INSTANCE
        BEGIN BRANCH C
            WIRE 2672 1968 2816 1968
            BEGIN DISPLAY 2672 1968 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RST
            WIRE 2688 1776 2816 1776
            BEGIN DISPLAY 2688 1776 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_581 1280 2112 R0
        BEGIN BRANCH x2
            WIRE 1136 1984 1280 1984
            BEGIN DISPLAY 1136 1984 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x1
            WIRE 1136 2048 1280 2048
            BEGIN DISPLAY 1136 2048 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S(2)
            WIRE 1280 1808 1424 1808
            BEGIN DISPLAY 1280 1808 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x3
            WIRE 1280 1872 1424 1872
            BEGIN DISPLAY 1280 1872 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_579 1408 2256 R0
        BEGIN BRANCH S(3)
            WIRE 1136 2128 1408 2128
            BEGIN DISPLAY 1136 2128 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x2
            WIRE 1264 2192 1408 2192
            BEGIN DISPLAY 1264 2192 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_1352
            WIRE 1664 2160 1696 2160
            WIRE 1696 2016 1696 2160
        END BRANCH
        BEGIN BRANCH S(1)
            WIRE 1136 1920 1280 1920
            BEGIN DISPLAY 1136 1920 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_1351
            WIRE 1536 1984 1552 1984
            WIRE 1552 1952 1696 1952
            WIRE 1552 1952 1552 1984
        END BRANCH
        INSTANCE XLXI_643 1696 2080 R0
        INSTANCE XLXI_646 1424 1936 R0
        BEGIN BRANCH RST
            WIRE 1792 1776 1808 1776
            BEGIN DISPLAY 1792 1776 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_682 1808 1840 R0
        BEGIN BRANCH XLXN_1648
            WIRE 1680 1840 1696 1840
            WIRE 1696 1712 1808 1712
            WIRE 1696 1712 1696 1840
        END BRANCH
        BEGIN BRANCH XLXN_1723
            WIRE 1952 1984 2032 1984
            WIRE 2032 1984 2384 1984
            WIRE 2032 1808 2112 1808
            WIRE 2032 1808 2032 1984
            WIRE 2384 1904 2384 1984
            WIRE 2384 1904 2816 1904
        END BRANCH
        INSTANCE XLXI_712 2112 1872 R0
        INSTANCE XLXI_713 2432 1760 R0
        BEGIN BRANCH XLXN_1726
            WIRE 2064 1744 2096 1744
            WIRE 2096 1744 2112 1744
            WIRE 2096 1632 2432 1632
            WIRE 2096 1632 2096 1744
        END BRANCH
        BEGIN BRANCH XLXN_1727
            WIRE 2368 1776 2384 1776
            WIRE 2384 1696 2432 1696
            WIRE 2384 1696 2384 1776
        END BRANCH
        BEGIN BRANCH XLXN_1730
            WIRE 2688 1664 2752 1664
            WIRE 2752 1664 2752 1840
            WIRE 2752 1840 2816 1840
        END BRANCH
        IOMARKER 3744 1968 No_S(2) R0 28
        INSTANCE XLXI_575 976 1328 R0
        BEGIN BRANCH S(0)
            WIRE 816 1200 976 1200
            BEGIN DISPLAY 816 1200 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x1
            WIRE 816 1264 976 1264
            BEGIN DISPLAY 816 1264 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S(2)
            WIRE 816 1344 960 1344
            BEGIN DISPLAY 816 1344 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x3
            WIRE 816 1408 960 1408
            BEGIN DISPLAY 816 1408 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S(1)
            WIRE 928 1056 976 1056
            BEGIN DISPLAY 928 1056 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_645 976 1184 R0
        BEGIN BRANCH x2
            WIRE 896 1120 976 1120
            BEGIN DISPLAY 896 1120 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_642 1440 1424 R0
        BEGIN BRANCH XLXN_1261
            WIRE 1232 1232 1248 1232
            WIRE 1248 1232 1248 1296
            WIRE 1248 1296 1440 1296
        END BRANCH
        BEGIN BRANCH XLXN_1262
            WIRE 1216 1408 1232 1408
            WIRE 1232 1360 1440 1360
            WIRE 1232 1360 1232 1408
        END BRANCH
        BEGIN BRANCH x2
            WIRE 880 1472 960 1472
            BEGIN DISPLAY 880 1472 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_574 960 1536 R0
        BEGIN BRANCH XLXN_363
            WIRE 3040 1200 3168 1200
        END BRANCH
        INSTANCE XLXI_152 3168 1232 R0
        BEGIN BRANCH S(1)
            WIRE 3392 1200 3488 1200
            WIRE 3488 1200 3600 1200
            BEGIN DISPLAY 3488 1200 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C
            WIRE 2560 1392 2656 1392
            BEGIN DISPLAY 2560 1392 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_651 3152 1424 R0
        BEGIN BRANCH No_S(1)
            WIRE 3376 1392 3600 1392
        END BRANCH
        BEGIN BRANCH XLXN_1513
            WIRE 3040 1392 3152 1392
        END BRANCH
        BEGIN BRANCH RST
            WIRE 2576 1200 2656 1200
            BEGIN DISPLAY 2576 1200 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_633 2656 1424 R0
        END INSTANCE
        IOMARKER 3600 1392 No_S(1) R0 28
        BEGIN BRANCH XLXN_1921
            WIRE 2400 1008 2416 1008
            WIRE 2416 1008 2416 1264
            WIRE 2416 1264 2656 1264
        END BRANCH
        BEGIN BRANCH RST
            WIRE 1376 1120 1472 1120
            BEGIN DISPLAY 1376 1120 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_680 1472 1184 R0
        INSTANCE XLXI_766 1824 1216 R0
        BEGIN BRANCH XLXN_1871
            WIRE 1728 1088 1808 1088
            WIRE 1808 1088 1824 1088
            WIRE 1808 976 2144 976
            WIRE 1808 976 1808 1088
        END BRANCH
        BEGIN BRANCH XLXN_1873
            WIRE 2080 1120 2096 1120
            WIRE 2096 1040 2144 1040
            WIRE 2096 1040 2096 1120
        END BRANCH
        INSTANCE XLXI_767 2144 1104 R0
        BEGIN BRANCH XLXN_1644
            WIRE 1232 1088 1248 1088
            WIRE 1248 1056 1472 1056
            WIRE 1248 1056 1248 1088
        END BRANCH
        BEGIN BRANCH XLXN_1920
            WIRE 1696 1328 1840 1328
            WIRE 1840 1328 2656 1328
            WIRE 1744 1152 1824 1152
            WIRE 1744 1152 1744 1248
            WIRE 1744 1248 1840 1248
            WIRE 1840 1248 1840 1328
        END BRANCH
        INSTANCE XLXI_573 1248 800 R0
        BEGIN BRANCH S(2)
            WIRE 1056 608 1248 608
            BEGIN DISPLAY 1056 608 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x3
            WIRE 1056 672 1248 672
            BEGIN DISPLAY 1056 672 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x2
            WIRE 1056 736 1248 736
            BEGIN DISPLAY 1056 736 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S(0)
            WIRE 960 368 1136 368
            BEGIN DISPLAY 960 368 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x1
            WIRE 960 432 1136 432
            BEGIN DISPLAY 960 432 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_644 1136 496 R0
        BEGIN BRANCH XLXN_1641
            WIRE 1392 400 1712 400
        END BRANCH
        BEGIN BRANCH RST
            WIRE 1600 464 1712 464
            BEGIN DISPLAY 1600 464 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_655 1712 528 R0
        INSTANCE XLXI_768 2080 560 R0
        BEGIN BRANCH XLXN_1875
            WIRE 1968 432 2064 432
            WIRE 2064 432 2080 432
            WIRE 2064 320 2400 320
            WIRE 2064 320 2064 432
        END BRANCH
        BEGIN BRANCH XLXN_1877
            WIRE 2336 464 2352 464
            WIRE 2352 384 2400 384
            WIRE 2352 384 2352 464
        END BRANCH
        INSTANCE XLXI_769 2400 448 R0
        BEGIN INSTANCE XLXI_632 2928 768 R0
        END INSTANCE
        BEGIN BRANCH XLXN_360
            WIRE 3312 544 3456 544
        END BRANCH
        INSTANCE XLXI_153 3456 576 R0
        BEGIN BRANCH S(0)
            WIRE 3680 544 3824 544
            WIRE 3824 544 3968 544
            BEGIN DISPLAY 3824 544 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C
            WIRE 2752 736 2928 736
            BEGIN DISPLAY 2752 736 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_287 3328 768 R0
        BEGIN BRANCH No_S(0)
            WIRE 3552 736 3776 736
        END BRANCH
        BEGIN BRANCH XLXN_1512
            WIRE 3312 736 3328 736
        END BRANCH
        BEGIN BRANCH RST
            WIRE 2800 544 2928 544
            BEGIN DISPLAY 2800 544 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        IOMARKER 3776 736 No_S(0) R0 28
        INSTANCE XLXI_183 4688 656 R0
        BEGIN BRANCH S(0)
            WIRE 4528 624 4688 624
            BEGIN DISPLAY 4528 624 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH y0
            WIRE 4912 624 4944 624
        END BRANCH
        INSTANCE XLXI_524 4688 784 R0
        BEGIN BRANCH S(1)
            WIRE 4464 752 4688 752
            BEGIN DISPLAY 4464 752 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH y1
            WIRE 4912 752 4944 752
        END BRANCH
        INSTANCE XLXI_525 4688 896 R0
        BEGIN BRANCH y2
            WIRE 4912 864 4944 864
        END BRANCH
        INSTANCE XLXI_526 4688 1024 R0
        BEGIN BRANCH XLXN_1245
            WIRE 4624 1040 4672 1040
            WIRE 4672 992 4688 992
            WIRE 4672 992 4672 1040
        END BRANCH
        BEGIN BRANCH y3
            WIRE 4912 992 4944 992
        END BRANCH
        BEGIN BRANCH XLXN_1355
            WIRE 4656 864 4688 864
        END BRANCH
        INSTANCE XLXI_626 4400 960 R0
        INSTANCE XLXI_627 4368 1136 R0
        BEGIN BRANCH S(1)
            WIRE 4240 832 4400 832
            BEGIN DISPLAY 4240 832 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S(3)
            WIRE 4240 896 4400 896
            BEGIN DISPLAY 4240 896 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S(3)
            WIRE 4208 1072 4368 1072
            BEGIN DISPLAY 4208 1072 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S(2)
            WIRE 4208 1008 4368 1008
            BEGIN DISPLAY 4208 1008 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        IOMARKER 4944 624 y0 R0 28
        IOMARKER 4944 752 y1 R0 28
        IOMARKER 4944 864 y2 R0 28
        IOMARKER 4944 992 y3 R0 28
        BEGIN BRANCH XLXN_1974
            WIRE 1504 672 1904 672
            WIRE 1904 672 2928 672
            WIRE 1904 496 2080 496
            WIRE 1904 496 1904 672
        END BRANCH
        BEGIN BRANCH XLXN_1975
            WIRE 2656 352 2688 352
            WIRE 2688 352 2688 608
            WIRE 2688 608 2928 608
        END BRANCH
        BEGIN BRANCH x0
            WIRE 1392 2624 1840 2624
            BEGIN DISPLAY 1392 2624 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_582 1440 2912 R0
        BEGIN BRANCH S(1)
            WIRE 1296 2720 1440 2720
            BEGIN DISPLAY 1296 2720 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x1
            WIRE 1296 2784 1440 2784
            BEGIN DISPLAY 1296 2784 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x3
            WIRE 1296 2848 1440 2848
            BEGIN DISPLAY 1296 2848 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH x0
            WIRE 1424 2512 1696 2512
            BEGIN DISPLAY 1424 2512 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_699 1696 2576 R0
        BEGIN BRANCH RST
            WIRE 1568 2448 1696 2448
            BEGIN DISPLAY 1568 2448 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_1705
            WIRE 1696 2784 1760 2784
            WIRE 1760 2688 1760 2784
            WIRE 1760 2688 1840 2688
        END BRANCH
        INSTANCE XLXI_701 1840 2752 R0
        INSTANCE XLXI_323 3360 2560 R0
        BEGIN BRANCH S(3)
            WIRE 3584 2528 3680 2528
            WIRE 3680 2528 3776 2528
            BEGIN DISPLAY 3680 2528 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_692 3360 2752 R0
        BEGIN BRANCH No_S(3)
            WIRE 3584 2720 3808 2720
        END BRANCH
        BEGIN BRANCH RST
            WIRE 2784 2528 2912 2528
            BEGIN DISPLAY 2784 2528 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C
            WIRE 2768 2720 2912 2720
            BEGIN DISPLAY 2768 2720 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_1689
            WIRE 3296 2528 3360 2528
        END BRANCH
        BEGIN BRANCH XLXN_1690
            WIRE 3296 2720 3360 2720
        END BRANCH
        BEGIN INSTANCE XLXI_690 2912 2752 R0
        END INSTANCE
        IOMARKER 3808 2720 No_S(3) R0 28
        INSTANCE XLXI_770 2112 2592 R0
        BEGIN BRANCH XLXN_1879
            WIRE 1952 2480 2064 2480
            WIRE 2064 2464 2096 2464
            WIRE 2096 2464 2112 2464
            WIRE 2064 2464 2064 2480
            WIRE 2096 2352 2432 2352
            WIRE 2096 2352 2096 2464
        END BRANCH
        BEGIN BRANCH XLXN_1881
            WIRE 2368 2496 2384 2496
            WIRE 2384 2416 2432 2416
            WIRE 2384 2416 2384 2496
        END BRANCH
        INSTANCE XLXI_771 2432 2480 R0
        BEGIN BRANCH XLXN_2004
            WIRE 2048 2528 2112 2528
            WIRE 2048 2528 2048 2592
            WIRE 2048 2592 2272 2592
            WIRE 2272 2592 2272 2656
            WIRE 2272 2656 2912 2656
            WIRE 2096 2656 2272 2656
        END BRANCH
        BEGIN BRANCH XLXN_2005
            WIRE 2688 2384 2688 2592
            WIRE 2688 2592 2912 2592
        END BRANCH
    END SHEET
END SCHEMATIC
