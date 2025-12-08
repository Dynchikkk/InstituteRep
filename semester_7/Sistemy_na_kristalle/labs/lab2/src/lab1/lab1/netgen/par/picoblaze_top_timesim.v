////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: J.30
//  \   \         Application: netgen
//  /   /         Filename: picoblaze_top_timesim.v
// /___/   /\     Timestamp: Mon Nov 24 11:31:18 2025
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -s 5 -pcf picoblaze_top.pcf -sdf_anno true -sdf_path netgen/par -insert_glbl true -w -dir netgen/par -ofmt verilog -sim picoblaze_top.ncd picoblaze_top_timesim.v 
// Device	: 3s500efg320-5 (PRODUCTION 1.26 2006-10-19)
// Input file	: picoblaze_top.ncd
// Output file	: \\vboxsvr\winxptogetherfolder\xl\CHK\lab1\lab1\netgen\par\picoblaze_top_timesim.v
// # of Modules	: 1
// Design Name	: picoblaze_top
// Xilinx        : C:\Xilinx91i
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Development System Reference Guide, Chapter 23
//     Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module picoblaze_top (
  clk, led, sw
);
  input clk;
  output [7 : 0] led;
  input [7 : 0] sw;
  wire clk_BUFGP;
  wire \K1/processor/memory_enable_0 ;
  wire \K1/processor/store_loop[6].memory_bit/F5.S0 ;
  wire \K1/processor/store_loop[6].memory_bit/F5.S1 ;
  wire \out_port<6>_0 ;
  wire \K1/processor/t_state ;
  wire \K1/processor/store_loop[5].memory_bit/F5.S0 ;
  wire \K1/processor/store_loop[5].memory_bit/F5.S1 ;
  wire \out_port<5>_0 ;
  wire \K1/processor/store_loop[4].memory_bit/F5.S0 ;
  wire \K1/processor/store_loop[4].memory_bit/F5.S1 ;
  wire \out_port<4>_0 ;
  wire \K1/processor/store_loop[3].memory_bit/F5.S0 ;
  wire \K1/processor/store_loop[3].memory_bit/F5.S1 ;
  wire \out_port<3>_0 ;
  wire \K1/processor/store_loop[2].memory_bit/F5.S0 ;
  wire \K1/processor/store_loop[2].memory_bit/F5.S1 ;
  wire \out_port<2>_0 ;
  wire \K1/processor/store_loop[1].memory_bit/F5.S0 ;
  wire \K1/processor/store_loop[1].memory_bit/F5.S1 ;
  wire \out_port<1>_0 ;
  wire \K1/processor/store_loop[0].memory_bit/F5.S0 ;
  wire \K1/processor/store_loop[0].memory_bit/F5.S1 ;
  wire \out_port<0>_0 ;
  wire \K1/processor/pc_vector_carry[1] ;
  wire \K1/processor/pc_vector_carry[3] ;
  wire \K1/processor/pc_vector_carry[5] ;
  wire GLOBAL_LOGIC1;
  wire \K1/processor/sel_arith_0 ;
  wire \K1/processor/carry_flag ;
  wire \K1/processor/arith_internal_carry[0] ;
  wire \K1/processor/arith_internal_carry[2] ;
  wire \K1/processor/arith_internal_carry[4] ;
  wire \out_port<7>_0 ;
  wire \K1/processor/internal_reset ;
  wire \K1/processor/arith_carry ;
  wire \K1/processor/normal_count_0 ;
  wire \K1/processor/pc_value_carry[1] ;
  wire \K1/processor/pc_value_carry[3] ;
  wire \K1/processor/pc_value_carry[5] ;
  wire GLOBAL_LOGIC0;
  wire \K1/processor/shift_carry ;
  wire \K1/processor/flag_enable_0 ;
  wire \K1/processor/parity ;
  wire \K1/processor/valid_to_move_0 ;
  wire \K1/processor/push_or_pop_type_0 ;
  wire \K1/processor/call_type ;
  wire \K1/processor/zero_flag ;
  wire led_and0000_0;
  wire \K1/processor/shift_in ;
  wire \K1/processor/sel_group ;
  wire led_and0000_map2_0;
  wire \led_and000027/O ;
  wire \K1/processor/flag_write ;
  wire \K1/processor/sel_logical_0 ;
  wire \K1/processor/memory_write ;
  wire \K1/processor/register_write ;
  wire \K1/processor/register_enable_0 ;
  wire \K1/processor/sy<0>_0 ;
  wire \K1/processor/sy<7>_0 ;
  wire \K1/processor/sy<6>_0 ;
  wire \K1/processor/condition_met ;
  wire \K1/processor/sy<5>_0 ;
  wire \K1/processor/sy<4>_0 ;
  wire \K1/processor/sy<1>_0 ;
  wire \K1/processor/sy<3>_0 ;
  wire \K1/processor/sy<2>_0 ;
  wire write_strobe;
  wire \K1/processor/reset_delay ;
  wire \K1/processor/move_group ;
  wire \K1/processor/io_initial_decode ;
  wire \K1/processor/store_loop[7].memory_bit/F5.S0 ;
  wire \K1/processor/store_loop[7].memory_bit/F5.S1 ;
  wire \K1/processor/inc_pc_vector<4>/XORF_0 ;
  wire \K1/processor/inc_pc_vector<4>/CYINIT_1 ;
  wire \K1/processor/inc_pc_vector<4>/XORG_2 ;
  wire \K1/processor/pc_vector_carry[4] ;
  wire \K1/processor/inc_pc_vector<4>/CYSELF_3 ;
  wire \K1/processor/inc_pc_vector<4>/CYMUXFAST_4 ;
  wire \K1/processor/inc_pc_vector<4>/CYAND_5 ;
  wire \K1/processor/inc_pc_vector<4>/FASTCARRY_6 ;
  wire \K1/processor/inc_pc_vector<4>/CYMUXG2_7 ;
  wire \K1/processor/inc_pc_vector<4>/CYMUXF2_8 ;
  wire \K1/processor/inc_pc_vector<4>/LOGIC_ZERO_9 ;
  wire \K1/processor/inc_pc_vector<4>/CYSELG_10 ;
  wire \K1/processor/inc_pc_vector<6>/XORF_11 ;
  wire \K1/processor/inc_pc_vector<6>/CYINIT_12 ;
  wire \K1/processor/inc_pc_vector<6>/XORG_13 ;
  wire \K1/processor/pc_vector_carry[6] ;
  wire \K1/processor/inc_pc_vector<6>/CYSELF_14 ;
  wire \K1/processor/inc_pc_vector<6>/CYMUXFAST_15 ;
  wire \K1/processor/inc_pc_vector<6>/CYAND_16 ;
  wire \K1/processor/inc_pc_vector<6>/FASTCARRY_17 ;
  wire \K1/processor/inc_pc_vector<6>/CYMUXG2_18 ;
  wire \K1/processor/inc_pc_vector<6>/CYMUXF2_19 ;
  wire \K1/processor/inc_pc_vector<6>/LOGIC_ZERO_20 ;
  wire \K1/processor/inc_pc_vector<6>/CYSELG_21 ;
  wire \K1/processor/inc_pc_vector<8>/XORF_22 ;
  wire \K1/processor/inc_pc_vector<8>/LOGIC_ZERO_23 ;
  wire \K1/processor/inc_pc_vector<8>/CYINIT_24 ;
  wire \K1/processor/inc_pc_vector<8>/CYSELF_25 ;
  wire \K1/processor/inc_pc_vector<8>/XORG_26 ;
  wire \K1/processor/pc_vector_carry[8] ;
  wire \K1/processor/arith_result<0>/LOGIC_ZERO_27 ;
  wire \K1/processor/arith_result<0>/CYINIT_28 ;
  wire \K1/processor/arith_result<0>/CYSELF_29 ;
  wire \K1/processor/sel_arith_carry_in ;
  wire \K1/processor/arith_result<0>/DYMUX_30 ;
  wire \K1/processor/arith_result<0>/XORG_31 ;
  wire \K1/processor/arith_result<0>/CYMUXG_32 ;
  wire \K1/processor/arith_carry_in ;
  wire \K1/processor/arith_result<0>/CY0G_33 ;
  wire \K1/processor/arith_result<0>/CYSELG_34 ;
  wire \K1/processor/arith_result<0>/SRINV_35 ;
  wire \K1/processor/arith_result<0>/CLKINV_36 ;
  wire \K1/processor/arith_result<1>/DXMUX_37 ;
  wire \K1/processor/arith_result<1>/XORF_38 ;
  wire \K1/processor/arith_result<1>/CYINIT_39 ;
  wire \K1/processor/arith_result<1>/CY0F_40 ;
  wire \K1/processor/arith_result<1>/DYMUX_41 ;
  wire \K1/processor/arith_result<1>/XORG_42 ;
  wire \K1/processor/arith_internal_carry[1] ;
  wire \K1/processor/arith_result<1>/CYSELF_43 ;
  wire \K1/processor/arith_result<1>/CYMUXFAST_44 ;
  wire \K1/processor/arith_result<1>/CYAND_45 ;
  wire \K1/processor/arith_result<1>/FASTCARRY_46 ;
  wire \K1/processor/arith_result<1>/CYMUXG2_47 ;
  wire \K1/processor/arith_result<1>/CYMUXF2_48 ;
  wire \K1/processor/arith_result<1>/CY0G_49 ;
  wire \K1/processor/arith_result<1>/CYSELG_50 ;
  wire \K1/processor/arith_result<1>/SRINV_51 ;
  wire \K1/processor/arith_result<1>/CLKINV_52 ;
  wire \K1/processor/arith_result<3>/DXMUX_53 ;
  wire \K1/processor/arith_result<3>/XORF_54 ;
  wire \K1/processor/arith_result<3>/CYINIT_55 ;
  wire \K1/processor/arith_result<3>/CY0F_56 ;
  wire \K1/processor/arith_result<3>/DYMUX_57 ;
  wire \K1/processor/arith_result<3>/XORG_58 ;
  wire \K1/processor/arith_internal_carry[3] ;
  wire \K1/processor/arith_result<3>/CYSELF_59 ;
  wire \K1/processor/arith_result<3>/CYMUXFAST_60 ;
  wire \K1/processor/arith_result<3>/CYAND_61 ;
  wire \K1/processor/arith_result<3>/FASTCARRY_62 ;
  wire \K1/processor/arith_result<3>/CYMUXG2_63 ;
  wire \K1/processor/arith_result<3>/CYMUXF2_64 ;
  wire \K1/processor/arith_result<3>/CY0G_65 ;
  wire \K1/processor/arith_result<3>/CYSELG_66 ;
  wire \K1/processor/arith_result<3>/SRINV_67 ;
  wire \K1/processor/arith_result<3>/CLKINV_68 ;
  wire \K1/processor/arith_result<5>/DXMUX_69 ;
  wire \K1/processor/arith_result<5>/XORF_70 ;
  wire \K1/processor/arith_result<5>/CYINIT_71 ;
  wire \K1/processor/arith_result<5>/CY0F_72 ;
  wire \K1/processor/arith_result<5>/DYMUX_73 ;
  wire \K1/processor/arith_result<5>/XORG_74 ;
  wire \K1/processor/arith_internal_carry[5] ;
  wire \K1/processor/arith_result<5>/CYSELF_75 ;
  wire \K1/processor/arith_result<5>/CYMUXFAST_76 ;
  wire \K1/processor/arith_result<5>/CYAND_77 ;
  wire \K1/processor/arith_result<5>/FASTCARRY_78 ;
  wire \K1/processor/arith_result<5>/CYMUXG2_79 ;
  wire \K1/processor/arith_result<5>/CYMUXF2_80 ;
  wire \K1/processor/arith_result<5>/CY0G_81 ;
  wire \K1/processor/arith_result<5>/CYSELG_82 ;
  wire \K1/processor/arith_result<5>/SRINV_83 ;
  wire \K1/processor/arith_result<5>/CLKINV_84 ;
  wire \K1/processor/arith_result<7>/DXMUX_85 ;
  wire \K1/processor/arith_result<7>/XORF_86 ;
  wire \K1/processor/arith_result<7>/CYINIT_87 ;
  wire \K1/processor/arith_result<7>/CY0F_88 ;
  wire \K1/processor/arith_result<7>/CYSELF_89 ;
  wire \K1/processor/arith_result<7>/DYMUX_90 ;
  wire \K1/processor/arith_result<7>/XORG_91 ;
  wire \K1/processor/arith_internal_carry[7] ;
  wire \K1/processor/invert_arith_carry ;
  wire \K1/processor/arith_result<7>/SRINV_92 ;
  wire \K1/processor/arith_result<7>/CLKINV_93 ;
  wire \K1/address<0>/DXMUX_94 ;
  wire \K1/address<0>/XORF_95 ;
  wire \K1/address<0>/CYINIT_96 ;
  wire \K1/address<0>/CYSELF_97 ;
  wire \K1/address<0>/DYMUX_98 ;
  wire \K1/address<0>/XORG_99 ;
  wire \K1/address<0>/CYMUXG_100 ;
  wire \K1/processor/pc_value_carry[0] ;
  wire \K1/address<0>/LOGIC_ZERO_101 ;
  wire \K1/address<0>/CYSELG_102 ;
  wire \K1/address<0>/SRINV_103 ;
  wire \K1/address<0>/CLKINV_104 ;
  wire \K1/address<0>/CEINVNOT ;
  wire \K1/processor/store_loop[3].memory_bit/F5.S1/F5MUX_105 ;
  wire \K1/processor/store_loop[3].memory_bit/F.S1_106 ;
  wire \K1/processor/store_loop[3].memory_bit/F5.S1/DIF_MUX_107 ;
  wire \K1/processor/store_loop[3].memory_bit/G.S1_108 ;
  wire \K1/processor/store_loop[3].memory_bit/F5.S1/DIG_MUX_109 ;
  wire \K1/processor/store_loop[3].memory_bit/F5.S1/CLKINV_110 ;
  wire \K1/processor/store_loop[3].memory_bit/F5.S1/WSF ;
  wire \K1/processor/store_loop[3].memory_bit/F5.S1/WSG ;
  wire \K1/processor/store_loop[3].memory_bit/F5.S1/SRINV_111 ;
  wire \K1/processor/store_loop[3].memory_bit/F5.S1/SLICEWE0USED_112 ;
  wire \K1/processor/store_loop[3].memory_bit/F5.S1/BXINV_113 ;
  wire \K1/processor/store_loop[3].memory_bit/F5.S1/SLICEWE1USED_114 ;
  wire \K1/processor/store_data<2>/F5MUX_115 ;
  wire \K1/processor/store_loop[2].memory_bit/F.S0_116 ;
  wire \K1/processor/store_data<2>/DIF_MUX_117 ;
  wire \K1/processor/store_data<2>/DYMUX_118 ;
  wire \K1/processor/store_data<2>/F6MUX_119 ;
  wire \K1/processor/store_loop[2].memory_bit/G.S0_120 ;
  wire \K1/processor/store_data<2>/DIG_MUX_121 ;
  wire \K1/processor/store_data<2>/BYINV_122 ;
  wire \K1/processor/store_data<2>/CLKINV_123 ;
  wire \K1/processor/store_data<2>/WSF ;
  wire \K1/processor/store_data<2>/WSG ;
  wire \K1/processor/store_data<2>/SRINV_124 ;
  wire \K1/processor/store_data<2>/SLICEWE0USED_125 ;
  wire \K1/processor/store_data<2>/BXINV_126 ;
  wire \K1/processor/store_data<2>/SLICEWE1USED_127 ;
  wire \K1/processor/store_loop[2].memory_bit/F5.S1/F5MUX_128 ;
  wire \K1/processor/store_loop[2].memory_bit/F.S1_129 ;
  wire \K1/processor/store_loop[2].memory_bit/F5.S1/DIF_MUX_130 ;
  wire \K1/processor/store_loop[2].memory_bit/G.S1_131 ;
  wire \K1/processor/store_loop[2].memory_bit/F5.S1/DIG_MUX_132 ;
  wire \K1/processor/store_loop[2].memory_bit/F5.S1/CLKINV_133 ;
  wire \K1/processor/store_loop[2].memory_bit/F5.S1/WSF ;
  wire \K1/processor/store_loop[2].memory_bit/F5.S1/WSG ;
  wire \K1/processor/store_loop[2].memory_bit/F5.S1/SRINV_134 ;
  wire \K1/processor/store_loop[2].memory_bit/F5.S1/SLICEWE0USED_135 ;
  wire \K1/processor/store_loop[2].memory_bit/F5.S1/BXINV_136 ;
  wire \K1/processor/store_loop[2].memory_bit/F5.S1/SLICEWE1USED_137 ;
  wire \K1/processor/store_data<1>/F5MUX_138 ;
  wire \K1/processor/store_loop[1].memory_bit/F.S0_139 ;
  wire \K1/processor/store_data<1>/DIF_MUX_140 ;
  wire \K1/processor/store_data<1>/DYMUX_141 ;
  wire \K1/processor/store_data<1>/F6MUX_142 ;
  wire \K1/processor/store_loop[1].memory_bit/G.S0_143 ;
  wire \K1/processor/store_data<1>/DIG_MUX_144 ;
  wire \K1/processor/store_data<1>/BYINV_145 ;
  wire \K1/processor/store_data<1>/CLKINV_146 ;
  wire \K1/processor/store_data<1>/WSF ;
  wire \K1/processor/store_data<1>/WSG ;
  wire \K1/processor/store_data<1>/SRINV_147 ;
  wire \K1/processor/store_data<1>/SLICEWE0USED_148 ;
  wire \K1/processor/store_data<1>/BXINV_149 ;
  wire \K1/processor/store_data<1>/SLICEWE1USED_150 ;
  wire \K1/processor/store_loop[1].memory_bit/F5.S1/F5MUX_151 ;
  wire \K1/processor/store_loop[1].memory_bit/F.S1_152 ;
  wire \K1/processor/store_loop[1].memory_bit/F5.S1/DIF_MUX_153 ;
  wire \K1/processor/store_loop[1].memory_bit/G.S1_154 ;
  wire \K1/processor/store_loop[1].memory_bit/F5.S1/DIG_MUX_155 ;
  wire \K1/processor/store_loop[1].memory_bit/F5.S1/CLKINV_156 ;
  wire \K1/processor/store_loop[1].memory_bit/F5.S1/WSF ;
  wire \K1/processor/store_loop[1].memory_bit/F5.S1/WSG ;
  wire \K1/processor/store_loop[1].memory_bit/F5.S1/SRINV_157 ;
  wire \K1/processor/store_loop[1].memory_bit/F5.S1/SLICEWE0USED_158 ;
  wire \K1/processor/store_loop[1].memory_bit/F5.S1/BXINV_159 ;
  wire \K1/processor/store_loop[1].memory_bit/F5.S1/SLICEWE1USED_160 ;
  wire \K1/processor/store_data<0>/F5MUX_161 ;
  wire \K1/processor/store_loop[0].memory_bit/F.S0_162 ;
  wire \K1/processor/store_data<0>/DIF_MUX_163 ;
  wire \K1/processor/store_data<0>/DYMUX_164 ;
  wire \K1/processor/store_data<0>/F6MUX_165 ;
  wire \K1/processor/store_loop[0].memory_bit/G.S0_166 ;
  wire \K1/processor/store_data<0>/DIG_MUX_167 ;
  wire \K1/processor/store_data<0>/BYINV_168 ;
  wire \K1/processor/store_data<0>/CLKINV_169 ;
  wire \K1/processor/store_data<0>/WSF ;
  wire \K1/processor/store_data<0>/WSG ;
  wire \K1/processor/store_data<0>/SRINV_170 ;
  wire \K1/processor/store_data<0>/SLICEWE0USED_171 ;
  wire \K1/processor/store_data<0>/BXINV_172 ;
  wire \K1/processor/store_data<0>/SLICEWE1USED_173 ;
  wire \K1/processor/store_loop[0].memory_bit/F5.S1/F5MUX_174 ;
  wire \K1/processor/store_loop[0].memory_bit/F.S1_175 ;
  wire \K1/processor/store_loop[0].memory_bit/F5.S1/DIF_MUX_176 ;
  wire \K1/processor/store_loop[0].memory_bit/G.S1_177 ;
  wire \K1/processor/store_loop[0].memory_bit/F5.S1/DIG_MUX_178 ;
  wire \K1/processor/store_loop[0].memory_bit/F5.S1/CLKINV_179 ;
  wire \K1/processor/store_loop[0].memory_bit/F5.S1/WSF ;
  wire \K1/processor/store_loop[0].memory_bit/F5.S1/WSG ;
  wire \K1/processor/store_loop[0].memory_bit/F5.S1/SRINV_180 ;
  wire \K1/processor/store_loop[0].memory_bit/F5.S1/SLICEWE0USED_181 ;
  wire \K1/processor/store_loop[0].memory_bit/F5.S1/BXINV_182 ;
  wire \K1/processor/store_loop[0].memory_bit/F5.S1/SLICEWE1USED_183 ;
  wire \K1/processor/inc_pc_vector<0>/XORF_184 ;
  wire \K1/processor/inc_pc_vector<0>/CYINIT_185 ;
  wire \K1/processor/inc_pc_vector<0>/CYSELF_186 ;
  wire \K1/processor/inc_pc_vector<0>/XORG_187 ;
  wire \K1/processor/inc_pc_vector<0>/CYMUXG_188 ;
  wire \K1/processor/pc_vector_carry[0] ;
  wire \K1/processor/inc_pc_vector<0>/LOGIC_ZERO_189 ;
  wire \K1/processor/inc_pc_vector<0>/CYSELG_190 ;
  wire \K1/processor/inc_pc_vector<2>/XORF_191 ;
  wire \K1/processor/inc_pc_vector<2>/CYINIT_192 ;
  wire \K1/processor/inc_pc_vector<2>/XORG_193 ;
  wire \K1/processor/pc_vector_carry[2] ;
  wire \K1/processor/inc_pc_vector<2>/CYSELF_194 ;
  wire \K1/processor/inc_pc_vector<2>/CYMUXFAST_195 ;
  wire \K1/processor/inc_pc_vector<2>/CYAND_196 ;
  wire \K1/processor/inc_pc_vector<2>/FASTCARRY_197 ;
  wire \K1/processor/inc_pc_vector<2>/CYMUXG2_198 ;
  wire \K1/processor/inc_pc_vector<2>/CYMUXF2_199 ;
  wire \K1/processor/inc_pc_vector<2>/LOGIC_ZERO_200 ;
  wire \K1/processor/inc_pc_vector<2>/CYSELG_201 ;
  wire \K1/processor/store_loop[5].memory_bit/F5.S1/F5MUX_202 ;
  wire \K1/processor/store_loop[5].memory_bit/F.S1_203 ;
  wire \K1/processor/store_loop[5].memory_bit/F5.S1/DIF_MUX_204 ;
  wire \K1/processor/store_loop[5].memory_bit/G.S1_205 ;
  wire \K1/processor/store_loop[5].memory_bit/F5.S1/DIG_MUX_206 ;
  wire \K1/processor/store_loop[5].memory_bit/F5.S1/CLKINV_207 ;
  wire \K1/processor/store_loop[5].memory_bit/F5.S1/WSF ;
  wire \K1/processor/store_loop[5].memory_bit/F5.S1/WSG ;
  wire \K1/processor/store_loop[5].memory_bit/F5.S1/SRINV_208 ;
  wire \K1/processor/store_loop[5].memory_bit/F5.S1/SLICEWE0USED_209 ;
  wire \K1/processor/store_loop[5].memory_bit/F5.S1/BXINV_210 ;
  wire \K1/processor/store_loop[5].memory_bit/F5.S1/SLICEWE1USED_211 ;
  wire \K1/processor/stack_pop_data<7>/DXMUX_212 ;
  wire \K1/processor/stack_pop_data<7>/F5MUX_213 ;
  wire \K1/processor/stack_ram_loop[7].stack_bit/F_214 ;
  wire \K1/processor/stack_pop_data<7>/DIF_MUX_215 ;
  wire \K1/processor/stack_ram_loop[7].stack_bit/G_216 ;
  wire \K1/processor/stack_pop_data<7>/DIG_MUX_217 ;
  wire \K1/processor/stack_pop_data<7>/CLKINV_218 ;
  wire \K1/processor/stack_pop_data<7>/WSF ;
  wire \K1/processor/stack_pop_data<7>/WSG ;
  wire \K1/processor/stack_pop_data<7>/SRINVNOT ;
  wire \K1/processor/stack_pop_data<7>/SLICEWE0USED_219 ;
  wire \K1/processor/stack_pop_data<7>/BXINV_220 ;
  wire \K1/processor/stack_pop_data<6>/DXMUX_221 ;
  wire \K1/processor/stack_pop_data<6>/F5MUX_222 ;
  wire \K1/processor/stack_ram_loop[6].stack_bit/F_223 ;
  wire \K1/processor/stack_pop_data<6>/DIF_MUX_224 ;
  wire \K1/processor/stack_ram_loop[6].stack_bit/G_225 ;
  wire \K1/processor/stack_pop_data<6>/DIG_MUX_226 ;
  wire \K1/processor/stack_pop_data<6>/CLKINV_227 ;
  wire \K1/processor/stack_pop_data<6>/WSF ;
  wire \K1/processor/stack_pop_data<6>/WSG ;
  wire \K1/processor/stack_pop_data<6>/SRINVNOT ;
  wire \K1/processor/stack_pop_data<6>/SLICEWE0USED_228 ;
  wire \K1/processor/stack_pop_data<6>/BXINV_229 ;
  wire \K1/processor/stack_pop_data<5>/DXMUX_230 ;
  wire \K1/processor/stack_pop_data<5>/F5MUX_231 ;
  wire \K1/processor/stack_ram_loop[5].stack_bit/F_232 ;
  wire \K1/processor/stack_pop_data<5>/DIF_MUX_233 ;
  wire \K1/processor/stack_ram_loop[5].stack_bit/G_234 ;
  wire \K1/processor/stack_pop_data<5>/DIG_MUX_235 ;
  wire \K1/processor/stack_pop_data<5>/CLKINV_236 ;
  wire \K1/processor/stack_pop_data<5>/WSF ;
  wire \K1/processor/stack_pop_data<5>/WSG ;
  wire \K1/processor/stack_pop_data<5>/SRINVNOT ;
  wire \K1/processor/stack_pop_data<5>/SLICEWE0USED_237 ;
  wire \K1/processor/stack_pop_data<5>/BXINV_238 ;
  wire \K1/processor/stack_pop_data<4>/DXMUX_239 ;
  wire \K1/processor/stack_pop_data<4>/F5MUX_240 ;
  wire \K1/processor/stack_ram_loop[4].stack_bit/F_241 ;
  wire \K1/processor/stack_pop_data<4>/DIF_MUX_242 ;
  wire \K1/processor/stack_ram_loop[4].stack_bit/G_243 ;
  wire \K1/processor/stack_pop_data<4>/DIG_MUX_244 ;
  wire \K1/processor/stack_pop_data<4>/CLKINV_245 ;
  wire \K1/processor/stack_pop_data<4>/WSF ;
  wire \K1/processor/stack_pop_data<4>/WSG ;
  wire \K1/processor/stack_pop_data<4>/SRINVNOT ;
  wire \K1/processor/stack_pop_data<4>/SLICEWE0USED_246 ;
  wire \K1/processor/stack_pop_data<4>/BXINV_247 ;
  wire \K1/processor/stack_pop_data<3>/DXMUX_248 ;
  wire \K1/processor/stack_pop_data<3>/F5MUX_249 ;
  wire \K1/processor/stack_ram_loop[3].stack_bit/F_250 ;
  wire \K1/processor/stack_pop_data<3>/DIF_MUX_251 ;
  wire \K1/processor/stack_ram_loop[3].stack_bit/G_252 ;
  wire \K1/processor/stack_pop_data<3>/DIG_MUX_253 ;
  wire \K1/processor/stack_pop_data<3>/CLKINV_254 ;
  wire \K1/processor/stack_pop_data<3>/WSF ;
  wire \K1/processor/stack_pop_data<3>/WSG ;
  wire \K1/processor/stack_pop_data<3>/SRINVNOT ;
  wire \K1/processor/stack_pop_data<3>/SLICEWE0USED_255 ;
  wire \K1/processor/stack_pop_data<3>/BXINV_256 ;
  wire \K1/processor/store_data<4>/F5MUX_257 ;
  wire \K1/processor/store_loop[4].memory_bit/F.S0_258 ;
  wire \K1/processor/store_data<4>/DIF_MUX_259 ;
  wire \K1/processor/store_data<4>/DYMUX_260 ;
  wire \K1/processor/store_data<4>/F6MUX_261 ;
  wire \K1/processor/store_loop[4].memory_bit/G.S0_262 ;
  wire \K1/processor/store_data<4>/DIG_MUX_263 ;
  wire \K1/processor/store_data<4>/BYINV_264 ;
  wire \K1/processor/store_data<4>/CLKINV_265 ;
  wire \K1/processor/store_data<4>/WSF ;
  wire \K1/processor/store_data<4>/WSG ;
  wire \K1/processor/store_data<4>/SRINV_266 ;
  wire \K1/processor/store_data<4>/SLICEWE0USED_267 ;
  wire \K1/processor/store_data<4>/BXINV_268 ;
  wire \K1/processor/store_data<4>/SLICEWE1USED_269 ;
  wire \K1/processor/store_loop[4].memory_bit/F5.S1/F5MUX_270 ;
  wire \K1/processor/store_loop[4].memory_bit/F.S1_271 ;
  wire \K1/processor/store_loop[4].memory_bit/F5.S1/DIF_MUX_272 ;
  wire \K1/processor/store_loop[4].memory_bit/G.S1_273 ;
  wire \K1/processor/store_loop[4].memory_bit/F5.S1/DIG_MUX_274 ;
  wire \K1/processor/store_loop[4].memory_bit/F5.S1/CLKINV_275 ;
  wire \K1/processor/store_loop[4].memory_bit/F5.S1/WSF ;
  wire \K1/processor/store_loop[4].memory_bit/F5.S1/WSG ;
  wire \K1/processor/store_loop[4].memory_bit/F5.S1/SRINV_276 ;
  wire \K1/processor/store_loop[4].memory_bit/F5.S1/SLICEWE0USED_277 ;
  wire \K1/processor/store_loop[4].memory_bit/F5.S1/BXINV_278 ;
  wire \K1/processor/store_loop[4].memory_bit/F5.S1/SLICEWE1USED_279 ;
  wire \K1/processor/store_data<3>/F5MUX_280 ;
  wire \K1/processor/store_loop[3].memory_bit/F.S0_281 ;
  wire \K1/processor/store_data<3>/DIF_MUX_282 ;
  wire \K1/processor/store_data<3>/DYMUX_283 ;
  wire \K1/processor/store_data<3>/F6MUX_284 ;
  wire \K1/processor/store_loop[3].memory_bit/G.S0_285 ;
  wire \K1/processor/store_data<3>/DIG_MUX_286 ;
  wire \K1/processor/store_data<3>/BYINV_287 ;
  wire \K1/processor/store_data<3>/CLKINV_288 ;
  wire \K1/processor/store_data<3>/WSF ;
  wire \K1/processor/store_data<3>/WSG ;
  wire \K1/processor/store_data<3>/SRINV_289 ;
  wire \K1/processor/store_data<3>/SLICEWE0USED_290 ;
  wire \K1/processor/store_data<3>/BXINV_291 ;
  wire \K1/processor/store_data<3>/SLICEWE1USED_292 ;
  wire \K1/processor/store_data<6>/F5MUX_293 ;
  wire \K1/processor/store_loop[6].memory_bit/F.S0_294 ;
  wire \K1/processor/store_data<6>/DIF_MUX_295 ;
  wire \K1/processor/store_data<6>/DYMUX_296 ;
  wire \K1/processor/store_data<6>/F6MUX_297 ;
  wire \K1/processor/store_loop[6].memory_bit/G.S0_298 ;
  wire \K1/processor/store_data<6>/DIG_MUX_299 ;
  wire \K1/processor/store_data<6>/BYINV_300 ;
  wire \K1/processor/store_data<6>/CLKINV_301 ;
  wire \K1/processor/store_data<6>/WSF ;
  wire \K1/processor/store_data<6>/WSG ;
  wire \K1/processor/store_data<6>/SRINV_302 ;
  wire \K1/processor/store_data<6>/SLICEWE0USED_303 ;
  wire \K1/processor/store_data<6>/BXINV_304 ;
  wire \K1/processor/store_data<6>/SLICEWE1USED_305 ;
  wire \K1/processor/store_loop[6].memory_bit/F5.S1/F5MUX_306 ;
  wire \K1/processor/store_loop[6].memory_bit/F.S1_307 ;
  wire \K1/processor/store_loop[6].memory_bit/F5.S1/DIF_MUX_308 ;
  wire \K1/processor/store_loop[6].memory_bit/G.S1_309 ;
  wire \K1/processor/store_loop[6].memory_bit/F5.S1/DIG_MUX_310 ;
  wire \K1/processor/store_loop[6].memory_bit/F5.S1/CLKINV_311 ;
  wire \K1/processor/store_loop[6].memory_bit/F5.S1/WSF ;
  wire \K1/processor/store_loop[6].memory_bit/F5.S1/WSG ;
  wire \K1/processor/store_loop[6].memory_bit/F5.S1/SRINV_312 ;
  wire \K1/processor/store_loop[6].memory_bit/F5.S1/SLICEWE0USED_313 ;
  wire \K1/processor/store_loop[6].memory_bit/F5.S1/BXINV_314 ;
  wire \K1/processor/store_loop[6].memory_bit/F5.S1/SLICEWE1USED_315 ;
  wire \K1/processor/stack_pop_data<2>/DXMUX_316 ;
  wire \K1/processor/stack_pop_data<2>/F5MUX_317 ;
  wire \K1/processor/stack_ram_loop[2].stack_bit/F_318 ;
  wire \K1/processor/stack_pop_data<2>/DIF_MUX_319 ;
  wire \K1/processor/stack_ram_loop[2].stack_bit/G_320 ;
  wire \K1/processor/stack_pop_data<2>/DIG_MUX_321 ;
  wire \K1/processor/stack_pop_data<2>/CLKINV_322 ;
  wire \K1/processor/stack_pop_data<2>/WSF ;
  wire \K1/processor/stack_pop_data<2>/WSG ;
  wire \K1/processor/stack_pop_data<2>/SRINVNOT ;
  wire \K1/processor/stack_pop_data<2>/SLICEWE0USED_323 ;
  wire \K1/processor/stack_pop_data<2>/BXINV_324 ;
  wire \K1/processor/stack_pop_data<1>/DXMUX_325 ;
  wire \K1/processor/stack_pop_data<1>/F5MUX_326 ;
  wire \K1/processor/stack_ram_loop[1].stack_bit/F_327 ;
  wire \K1/processor/stack_pop_data<1>/DIF_MUX_328 ;
  wire \K1/processor/stack_ram_loop[1].stack_bit/G_329 ;
  wire \K1/processor/stack_pop_data<1>/DIG_MUX_330 ;
  wire \K1/processor/stack_pop_data<1>/CLKINV_331 ;
  wire \K1/processor/stack_pop_data<1>/WSF ;
  wire \K1/processor/stack_pop_data<1>/WSG ;
  wire \K1/processor/stack_pop_data<1>/SRINVNOT ;
  wire \K1/processor/stack_pop_data<1>/SLICEWE0USED_332 ;
  wire \K1/processor/stack_pop_data<1>/BXINV_333 ;
  wire \K1/processor/stack_pop_data<9>/DXMUX_334 ;
  wire \K1/processor/stack_pop_data<9>/F5MUX_335 ;
  wire \K1/processor/stack_ram_loop[9].stack_bit/F_336 ;
  wire \K1/processor/stack_pop_data<9>/DIF_MUX_337 ;
  wire \K1/processor/stack_ram_loop[9].stack_bit/G_338 ;
  wire \K1/processor/stack_pop_data<9>/DIG_MUX_339 ;
  wire \K1/processor/stack_pop_data<9>/CLKINV_340 ;
  wire \K1/processor/stack_pop_data<9>/WSF ;
  wire \K1/processor/stack_pop_data<9>/WSG ;
  wire \K1/processor/stack_pop_data<9>/SRINVNOT ;
  wire \K1/processor/stack_pop_data<9>/SLICEWE0USED_341 ;
  wire \K1/processor/stack_pop_data<9>/BXINV_342 ;
  wire \K1/processor/stack_pop_data<0>/DXMUX_343 ;
  wire \K1/processor/stack_pop_data<0>/F5MUX_344 ;
  wire \K1/processor/stack_ram_loop[0].stack_bit/F_345 ;
  wire \K1/processor/stack_pop_data<0>/DIF_MUX_346 ;
  wire \K1/processor/stack_ram_loop[0].stack_bit/G_347 ;
  wire \K1/processor/stack_pop_data<0>/DIG_MUX_348 ;
  wire \K1/processor/stack_pop_data<0>/CLKINV_349 ;
  wire \K1/processor/stack_pop_data<0>/WSF ;
  wire \K1/processor/stack_pop_data<0>/WSG ;
  wire \K1/processor/stack_pop_data<0>/SRINVNOT ;
  wire \K1/processor/stack_pop_data<0>/SLICEWE0USED_350 ;
  wire \K1/processor/stack_pop_data<0>/BXINV_351 ;
  wire \K1/processor/store_data<5>/F5MUX_352 ;
  wire \K1/processor/store_loop[5].memory_bit/F.S0_353 ;
  wire \K1/processor/store_data<5>/DIF_MUX_354 ;
  wire \K1/processor/store_data<5>/DYMUX_355 ;
  wire \K1/processor/store_data<5>/F6MUX_356 ;
  wire \K1/processor/store_loop[5].memory_bit/G.S0_357 ;
  wire \K1/processor/store_data<5>/DIG_MUX_358 ;
  wire \K1/processor/store_data<5>/BYINV_359 ;
  wire \K1/processor/store_data<5>/CLKINV_360 ;
  wire \K1/processor/store_data<5>/WSF ;
  wire \K1/processor/store_data<5>/WSG ;
  wire \K1/processor/store_data<5>/SRINV_361 ;
  wire \K1/processor/store_data<5>/SLICEWE0USED_362 ;
  wire \K1/processor/store_data<5>/BXINV_363 ;
  wire \K1/processor/store_data<5>/SLICEWE1USED_364 ;
  wire \K1/processor/stack_pop_data<8>/DXMUX_365 ;
  wire \K1/processor/stack_pop_data<8>/F5MUX_366 ;
  wire \K1/processor/stack_ram_loop[8].stack_bit/F_367 ;
  wire \K1/processor/stack_pop_data<8>/DIF_MUX_368 ;
  wire \K1/processor/stack_ram_loop[8].stack_bit/G_369 ;
  wire \K1/processor/stack_pop_data<8>/DIG_MUX_370 ;
  wire \K1/processor/stack_pop_data<8>/CLKINV_371 ;
  wire \K1/processor/stack_pop_data<8>/WSF ;
  wire \K1/processor/stack_pop_data<8>/WSG ;
  wire \K1/processor/stack_pop_data<8>/SRINVNOT ;
  wire \K1/processor/stack_pop_data<8>/SLICEWE0USED_372 ;
  wire \K1/processor/stack_pop_data<8>/BXINV_373 ;
  wire \K1/processor/zero_flag/LOGIC_ZERO_374 ;
  wire \K1/processor/zero_flag/CYINIT_375 ;
  wire \K1/processor/zero_flag/CYSELF_376 ;
  wire \K1/processor/sel_shadow_zero ;
  wire \K1/processor/zero_flag/DYMUX_377 ;
  wire \K1/processor/zero_flag/XORG_378 ;
  wire \K1/processor/zero_carry ;
  wire \K1/processor/zero_flag/G ;
  wire \K1/processor/zero_flag/SRINV_379 ;
  wire \K1/processor/zero_flag/CLKINV_380 ;
  wire \K1/processor/zero_flag/CEINV_381 ;
  wire \K1/processor/parity/LOGIC_ZERO_382 ;
  wire \K1/processor/parity/CYINIT_383 ;
  wire \K1/processor/parity/CYSELF_384 ;
  wire \K1/processor/low_parity ;
  wire \K1/processor/parity/XORG_385 ;
  wire \K1/processor/parity_carry ;
  wire \K1/processor/high_parity ;
  wire \led<0>/O ;
  wire \led<0>/OUTPUT/OTCLK1INV_386 ;
  wire \led<0>/OUTPUT/OFF/OCEINV_387 ;
  wire led_0_388;
  wire \led<0>/OUTPUT/OFF/ODDRIN1_MUX ;
  wire \led<1>/O ;
  wire \led<1>/OUTPUT/OTCLK1INV_389 ;
  wire \led<1>/OUTPUT/OFF/OCEINV_390 ;
  wire led_1_391;
  wire \led<1>/OUTPUT/OFF/ODDRIN1_MUX ;
  wire \led<2>/O ;
  wire \led<2>/OUTPUT/OTCLK1INV_392 ;
  wire \led<2>/OUTPUT/OFF/OCEINV_393 ;
  wire led_2_394;
  wire \led<2>/OUTPUT/OFF/ODDRIN1_MUX ;
  wire \clk/INBUF ;
  wire \led<3>/O ;
  wire \led<3>/OUTPUT/OTCLK1INV_395 ;
  wire \led<3>/OUTPUT/OFF/OCEINV_396 ;
  wire led_3_397;
  wire \led<3>/OUTPUT/OFF/ODDRIN1_MUX ;
  wire \led<4>/O ;
  wire \led<4>/OUTPUT/OTCLK1INV_398 ;
  wire \led<4>/OUTPUT/OFF/OCEINV_399 ;
  wire led_4_400;
  wire \led<4>/OUTPUT/OFF/ODDRIN1_MUX ;
  wire \led<5>/O ;
  wire \led<5>/OUTPUT/OTCLK1INV_401 ;
  wire \led<5>/OUTPUT/OFF/OCEINV_402 ;
  wire led_5_403;
  wire \led<5>/OUTPUT/OFF/ODDRIN1_MUX ;
  wire \led<6>/O ;
  wire \led<6>/OUTPUT/OTCLK1INV_404 ;
  wire \led<6>/OUTPUT/OFF/OCEINV_405 ;
  wire led_6_406;
  wire \led<6>/OUTPUT/OFF/ODDRIN1_MUX ;
  wire \led<7>/O ;
  wire \led<7>/OUTPUT/OTCLK1INV_407 ;
  wire \led<7>/OUTPUT/OFF/OCEINV_408 ;
  wire led_7_409;
  wire \led<7>/OUTPUT/OFF/ODDRIN1_MUX ;
  wire \sw<0>/INBUF ;
  wire \sw<1>/INBUF ;
  wire \sw<2>/INBUF ;
  wire \sw<3>/INBUF ;
  wire \sw<4>/INBUF ;
  wire \K1/address<2>/DXMUX_410 ;
  wire \K1/address<2>/XORF_411 ;
  wire \K1/address<2>/CYINIT_412 ;
  wire \K1/address<2>/DYMUX_413 ;
  wire \K1/address<2>/XORG_414 ;
  wire \K1/processor/pc_value_carry[2] ;
  wire \K1/address<2>/CYSELF_415 ;
  wire \K1/address<2>/CYMUXFAST_416 ;
  wire \K1/address<2>/CYAND_417 ;
  wire \K1/address<2>/FASTCARRY_418 ;
  wire \K1/address<2>/CYMUXG2_419 ;
  wire \K1/address<2>/CYMUXF2_420 ;
  wire \K1/address<2>/LOGIC_ZERO_421 ;
  wire \K1/address<2>/CYSELG_422 ;
  wire \K1/address<2>/SRINV_423 ;
  wire \K1/address<2>/CLKINV_424 ;
  wire \K1/address<2>/CEINVNOT ;
  wire \K1/address<4>/DXMUX_425 ;
  wire \K1/address<4>/XORF_426 ;
  wire \K1/address<4>/CYINIT_427 ;
  wire \K1/address<4>/DYMUX_428 ;
  wire \K1/address<4>/XORG_429 ;
  wire \K1/processor/pc_value_carry[4] ;
  wire \K1/address<4>/CYSELF_430 ;
  wire \K1/address<4>/CYMUXFAST_431 ;
  wire \K1/address<4>/CYAND_432 ;
  wire \K1/address<4>/FASTCARRY_433 ;
  wire \K1/address<4>/CYMUXG2_434 ;
  wire \K1/address<4>/CYMUXF2_435 ;
  wire \K1/address<4>/LOGIC_ZERO_436 ;
  wire \K1/address<4>/CYSELG_437 ;
  wire \K1/address<4>/SRINV_438 ;
  wire \K1/address<4>/CLKINV_439 ;
  wire \K1/address<4>/CEINVNOT ;
  wire \K1/address<6>/DXMUX_440 ;
  wire \K1/address<6>/XORF_441 ;
  wire \K1/address<6>/CYINIT_442 ;
  wire \K1/address<6>/DYMUX_443 ;
  wire \K1/address<6>/XORG_444 ;
  wire \K1/processor/pc_value_carry[6] ;
  wire \K1/address<6>/CYSELF_445 ;
  wire \K1/address<6>/CYMUXFAST_446 ;
  wire \K1/address<6>/CYAND_447 ;
  wire \K1/address<6>/FASTCARRY_448 ;
  wire \K1/address<6>/CYMUXG2_449 ;
  wire \K1/address<6>/CYMUXF2_450 ;
  wire \K1/address<6>/LOGIC_ZERO_451 ;
  wire \K1/address<6>/CYSELG_452 ;
  wire \K1/address<6>/SRINV_453 ;
  wire \K1/address<6>/CLKINV_454 ;
  wire \K1/address<6>/CEINVNOT ;
  wire \K1/address<8>/DXMUX_455 ;
  wire \K1/address<8>/XORF_456 ;
  wire \K1/address<8>/LOGIC_ZERO_457 ;
  wire \K1/address<8>/CYINIT_458 ;
  wire \K1/address<8>/CYSELF_459 ;
  wire \K1/address<8>/DYMUX_460 ;
  wire \K1/address<8>/XORG_461 ;
  wire \K1/processor/pc_value_carry[8] ;
  wire \K1/address<8>/SRINV_462 ;
  wire \K1/address<8>/CLKINV_463 ;
  wire \K1/address<8>/CEINVNOT ;
  wire \K1/processor/sel_carry<2>/CYINIT_464 ;
  wire \K1/processor/sel_carry<2>/CY0F_465 ;
  wire \K1/processor/sel_carry<2>/CYSELF_466 ;
  wire \K1/instruction<15>_rt_467 ;
  wire \K1/processor/sel_carry<2>/CYMUXG_468 ;
  wire \K1/processor/sel_carry[1] ;
  wire \K1/processor/sel_carry<2>/CY0G_469 ;
  wire \K1/processor/sel_carry<2>/CYSELG_470 ;
  wire \K1/processor/sel_arith_carry ;
  wire \K1/processor/carry_flag/CYINIT_471 ;
  wire \K1/processor/carry_flag/CY0F_472 ;
  wire \K1/processor/carry_flag/CYSELF_473 ;
  wire \K1/processor/sel_parity ;
  wire \K1/processor/carry_flag/DYMUX_474 ;
  wire \K1/processor/carry_flag/XORG_475 ;
  wire \K1/processor/sel_carry[3] ;
  wire \K1/processor/carry_flag/G ;
  wire \K1/processor/carry_flag/SRINV_476 ;
  wire \K1/processor/carry_flag/CLKINV_477 ;
  wire \K1/processor/carry_flag/CEINV_478 ;
  wire \K1/processor/stack_address<0>/DXMUX_479 ;
  wire \K1/processor/stack_address<0>/XORF_480 ;
  wire \K1/processor/stack_address<0>/CYINIT_481 ;
  wire \K1/processor/stack_address<0>/CY0F_482 ;
  wire \K1/processor/stack_address<0>/CYSELF_483 ;
  wire \K1/processor/stack_address<0>/DYMUX_484 ;
  wire \K1/processor/stack_address<0>/XORG_485 ;
  wire \K1/processor/stack_address<0>/CYMUXG_486 ;
  wire \K1/processor/stack_address<0>/CY0G_487 ;
  wire \K1/processor/stack_address<0>/CYSELG_488 ;
  wire \K1/processor/stack_address<0>/SRINV_489 ;
  wire \K1/processor/stack_address<0>/CLKINV_490 ;
  wire \K1/processor/stack_address<2>/DXMUX_491 ;
  wire \K1/processor/stack_address<2>/XORF_492 ;
  wire \K1/processor/stack_address<2>/CYINIT_493 ;
  wire \K1/processor/stack_address<2>/CY0F_494 ;
  wire \K1/processor/stack_address<2>/DYMUX_495 ;
  wire \K1/processor/stack_address<2>/XORG_496 ;
  wire \K1/processor/stack_address<2>/CYSELF_497 ;
  wire \K1/processor/stack_address<2>/CYMUXFAST_498 ;
  wire \K1/processor/stack_address<2>/CYAND_499 ;
  wire \K1/processor/stack_address<2>/FASTCARRY_500 ;
  wire \K1/processor/stack_address<2>/CYMUXG2_501 ;
  wire \K1/processor/stack_address<2>/CYMUXF2_502 ;
  wire \K1/processor/stack_address<2>/CY0G_503 ;
  wire \K1/processor/stack_address<2>/CYSELG_504 ;
  wire \K1/processor/stack_address<2>/SRINV_505 ;
  wire \K1/processor/stack_address<2>/CLKINV_506 ;
  wire \K1/processor/high_zero_carry/CYINIT_507 ;
  wire \K1/processor/high_zero_carry/CYSELF_508 ;
  wire \K1/processor/low_zero ;
  wire \K1/processor/high_zero_carry/CYMUXG_509 ;
  wire \K1/processor/low_zero_carry ;
  wire \K1/processor/high_zero_carry/LOGIC_ZERO_510 ;
  wire \K1/processor/high_zero_carry/CYSELG_511 ;
  wire \K1/processor/high_zero ;
  wire \sw<5>/INBUF ;
  wire \sw<6>/INBUF ;
  wire \sw<7>/INBUF ;
  wire \clk_BUFGP/BUFG/S_INVNOT ;
  wire \clk_BUFGP/BUFG/I0_INV ;
  wire \K1/program/ram_1024_x_18/DIPA1 ;
  wire \K1/program/ram_1024_x_18/DIPA0 ;
  wire \K1/program/ram_1024_x_18/DIA15 ;
  wire \K1/program/ram_1024_x_18/DIA14 ;
  wire \K1/program/ram_1024_x_18/DIA13 ;
  wire \K1/program/ram_1024_x_18/DIA12 ;
  wire \K1/program/ram_1024_x_18/DIA11 ;
  wire \K1/program/ram_1024_x_18/DIA10 ;
  wire \K1/program/ram_1024_x_18/DIA9 ;
  wire \K1/program/ram_1024_x_18/DIA8 ;
  wire \K1/program/ram_1024_x_18/DIA7 ;
  wire \K1/program/ram_1024_x_18/DIA6 ;
  wire \K1/program/ram_1024_x_18/DIA5 ;
  wire \K1/program/ram_1024_x_18/DIA4 ;
  wire \K1/program/ram_1024_x_18/DIA3 ;
  wire \K1/program/ram_1024_x_18/DIA2 ;
  wire \K1/program/ram_1024_x_18/DIA1 ;
  wire \K1/program/ram_1024_x_18/DIA0 ;
  wire \K1/processor/shift_in/F5MUX_512 ;
  wire \K1/processor/high_shift_in ;
  wire \K1/processor/shift_in/BXINV_513 ;
  wire \K1/processor/low_shift_in ;
  wire \K1/processor/alu_result<6>/F5MUX_514 ;
  wire \K1/processor/alu_result<6>/BXINV_515 ;
  wire \K1/processor/alu_result<5>/F5MUX_516 ;
  wire \K1/processor/alu_result<5>/BXINV_517 ;
  wire \K1/processor/alu_result<4>/F5MUX_518 ;
  wire \K1/processor/alu_result<4>/BXINV_519 ;
  wire \K1/processor/alu_result<3>/F5MUX_520 ;
  wire \K1/processor/alu_result<3>/BXINV_521 ;
  wire \K1/processor/alu_result<2>/F5MUX_522 ;
  wire \K1/processor/alu_result<2>/BXINV_523 ;
  wire \K1/processor/alu_result<1>/F5MUX_524 ;
  wire \K1/processor/alu_result<1>/BXINV_525 ;
  wire \K1/processor/alu_result<0>/F5MUX_526 ;
  wire \K1/processor/alu_result<0>/BXINV_527 ;
  wire \K1/processor/alu_result<7>/F5MUX_528 ;
  wire \K1/processor/alu_result<7>/BXINV_529 ;
  wire led_and0000;
  wire \led_and000027/O_pack_1 ;
  wire \K1/processor/shift_result<7>/DXMUX_530 ;
  wire \K1/processor/shift_result<7>/DYMUX_531 ;
  wire \K1/processor/shift_result<7>/SRINVNOT ;
  wire \K1/processor/shift_result<7>/CLKINV_532 ;
  wire \K1/processor/shift_carry/DYMUX_533 ;
  wire \K1/processor/shift_carry_value ;
  wire \K1/processor/shift_carry/CLKINV_534 ;
  wire \K1/processor/push_or_pop_type ;
  wire \K1/processor/flag_write/DYMUX_535 ;
  wire \K1/processor/flag_type ;
  wire \K1/processor/flag_write/CLKINV_536 ;
  wire \K1/processor/memory_enable ;
  wire \K1/processor/logical_result<0>/DYMUX_537 ;
  wire \K1/processor/logical_result<0>/SRINV_538 ;
  wire \K1/processor/logical_result<0>/CLKINV_539 ;
  wire \K1/processor/register_write/DXMUX_540 ;
  wire \K1/processor/register_type ;
  wire \K1/processor/register_write/DYMUX_541 ;
  wire \K1/processor/memory_type ;
  wire \K1/processor/register_write/CLKINV_542 ;
  wire \K1/processor/flag_enable ;
  wire \K1/processor/t_state/DYMUX_543 ;
  wire \K1/processor/not_t_state ;
  wire \K1/processor/t_state/CLKINV_544 ;
  wire \K1/processor/shift_result<1>/DXMUX_545 ;
  wire \K1/processor/shift_result<1>/DYMUX_546 ;
  wire \K1/processor/shift_result<1>/SRINVNOT ;
  wire \K1/processor/shift_result<1>/CLKINV_547 ;
  wire \K1/processor/shift_result<3>/DXMUX_548 ;
  wire \K1/processor/shift_result<3>/DYMUX_549 ;
  wire \K1/processor/shift_result<3>/SRINVNOT ;
  wire \K1/processor/shift_result<3>/CLKINV_550 ;
  wire \K1/processor/sel_logical ;
  wire \K1/processor/sel_group/DYMUX_551 ;
  wire \K1/processor/input_fetch_type ;
  wire \K1/processor/sel_group/CLKINV_552 ;
  wire \K1/processor/shift_result<5>/DXMUX_553 ;
  wire \K1/processor/shift_result<5>/DYMUX_554 ;
  wire \K1/processor/shift_result<5>/SRINVNOT ;
  wire \K1/processor/shift_result<5>/CLKINV_555 ;
  wire \K1/processor/sy<0>/DIF_MUX_556 ;
  wire \K1/processor/sy<0>/DIG_MUX_557 ;
  wire \K1/processor/sy<0>/CLKINV_558 ;
  wire \K1/processor/sy<0>/SRINV_559 ;
  wire \K1/processor/logical_result<7>/DXMUX_560 ;
  wire \port_id<7>_pack_1 ;
  wire \K1/processor/logical_result<7>/SRINV_561 ;
  wire \K1/processor/logical_result<7>/CLKINV_562 ;
  wire \K1/processor/logical_result<6>/DXMUX_563 ;
  wire \port_id<6>_pack_1 ;
  wire \K1/processor/logical_result<6>/SRINV_564 ;
  wire \K1/processor/logical_result<6>/CLKINV_565 ;
  wire \K1/processor/valid_to_move ;
  wire \K1/processor/condition_met_pack_1 ;
  wire \K1/processor/sy<5>/DIF_MUX_566 ;
  wire \K1/processor/sy<5>/DIG_MUX_567 ;
  wire \K1/processor/sy<5>/CLKINV_568 ;
  wire \K1/processor/sy<5>/SRINV_569 ;
  wire \K1/processor/logical_result<5>/DXMUX_570 ;
  wire \port_id<5>_pack_1 ;
  wire \K1/processor/logical_result<5>/SRINV_571 ;
  wire \K1/processor/logical_result<5>/CLKINV_572 ;
  wire \K1/processor/logical_result<4>/DXMUX_573 ;
  wire \port_id<4>_pack_1 ;
  wire \K1/processor/logical_result<4>/SRINV_574 ;
  wire \K1/processor/logical_result<4>/CLKINV_575 ;
  wire \K1/processor/sy<1>/DIF_MUX_576 ;
  wire \K1/processor/sy<1>/DIG_MUX_577 ;
  wire \K1/processor/sy<1>/CLKINV_578 ;
  wire \K1/processor/sy<1>/SRINV_579 ;
  wire \K1/processor/logical_result<3>/DXMUX_580 ;
  wire \port_id<3>_pack_1 ;
  wire \K1/processor/logical_result<3>/SRINV_581 ;
  wire \K1/processor/logical_result<3>/CLKINV_582 ;
  wire \K1/processor/logical_result<2>/DXMUX_583 ;
  wire \port_id<2>_pack_1 ;
  wire \K1/processor/logical_result<2>/SRINV_584 ;
  wire \K1/processor/logical_result<2>/CLKINV_585 ;
  wire \K1/processor/sy<6>/DIF_MUX_586 ;
  wire \K1/processor/sy<6>/DIG_MUX_587 ;
  wire \K1/processor/sy<6>/CLKINV_588 ;
  wire \K1/processor/sy<6>/SRINV_589 ;
  wire \K1/processor/register_enable ;
  wire \K1/processor/logical_result<1>/DXMUX_590 ;
  wire \port_id<1>_pack_1 ;
  wire \K1/processor/logical_result<1>/SRINV_591 ;
  wire \K1/processor/logical_result<1>/CLKINV_592 ;
  wire led_and0000_map2;
  wire \port_id<0>_pack_1 ;
  wire \K1/processor/sy<2>/DIF_MUX_593 ;
  wire \K1/processor/sy<2>/DIG_MUX_594 ;
  wire \K1/processor/sy<2>/CLKINV_595 ;
  wire \K1/processor/sy<2>/SRINV_596 ;
  wire \K1/processor/stack_address<4>/DXMUX_597 ;
  wire \K1/processor/stack_address<4>/XORF_598 ;
  wire \K1/processor/stack_address<4>/CYINIT_599 ;
  wire \K1/processor/call_type_pack_1 ;
  wire \K1/processor/stack_address<4>/SRINV_600 ;
  wire \K1/processor/stack_address<4>/CLKINV_601 ;
  wire \K1/processor/sy<7>/DIF_MUX_602 ;
  wire \K1/processor/sy<7>/DIG_MUX_603 ;
  wire \K1/processor/sy<7>/CLKINV_604 ;
  wire \K1/processor/sy<7>/SRINV_605 ;
  wire \K1/processor/reset_delay/DYMUX_606 ;
  wire \K1/processor/reset_delay/CLKINV_607 ;
  wire \K1/processor/internal_reset/DYMUX_608 ;
  wire \K1/processor/internal_reset/CLKINV_609 ;
  wire \K1/processor/sy<3>/DIF_MUX_610 ;
  wire \K1/processor/sy<3>/DIG_MUX_611 ;
  wire \K1/processor/sy<3>/CLKINV_612 ;
  wire \K1/processor/sy<3>/SRINV_613 ;
  wire \K1/processor/sel_arith ;
  wire \K1/processor/normal_count ;
  wire \K1/processor/move_group_pack_1 ;
  wire \write_strobe/DXMUX_614 ;
  wire \K1/processor/write_active ;
  wire \K1/processor/io_initial_decode_pack_1 ;
  wire \write_strobe/SRINV_615 ;
  wire \write_strobe/CLKINV_616 ;
  wire \K1/processor/sy<4>/DIF_MUX_617 ;
  wire \K1/processor/sy<4>/DIG_MUX_618 ;
  wire \K1/processor/sy<4>/CLKINV_619 ;
  wire \K1/processor/sy<4>/SRINV_620 ;
  wire \K1/processor/store_data<7>/F5MUX_621 ;
  wire \K1/processor/store_loop[7].memory_bit/F.S0_622 ;
  wire \K1/processor/store_data<7>/DIF_MUX_623 ;
  wire \K1/processor/store_data<7>/DYMUX_624 ;
  wire \K1/processor/store_data<7>/F6MUX_625 ;
  wire \K1/processor/store_loop[7].memory_bit/G.S0_626 ;
  wire \K1/processor/store_data<7>/DIG_MUX_627 ;
  wire \K1/processor/store_data<7>/BYINV_628 ;
  wire \K1/processor/store_data<7>/CLKINV_629 ;
  wire \K1/processor/store_data<7>/WSF ;
  wire \K1/processor/store_data<7>/WSG ;
  wire \K1/processor/store_data<7>/SRINV_630 ;
  wire \K1/processor/store_data<7>/SLICEWE0USED_631 ;
  wire \K1/processor/store_data<7>/BXINV_632 ;
  wire \K1/processor/store_data<7>/SLICEWE1USED_633 ;
  wire \K1/processor/store_loop[7].memory_bit/F5.S1/F5MUX_634 ;
  wire \K1/processor/store_loop[7].memory_bit/F.S1_635 ;
  wire \K1/processor/store_loop[7].memory_bit/F5.S1/DIF_MUX_636 ;
  wire \K1/processor/store_loop[7].memory_bit/G.S1_637 ;
  wire \K1/processor/store_loop[7].memory_bit/F5.S1/DIG_MUX_638 ;
  wire \K1/processor/store_loop[7].memory_bit/F5.S1/CLKINV_639 ;
  wire \K1/processor/store_loop[7].memory_bit/F5.S1/WSF ;
  wire \K1/processor/store_loop[7].memory_bit/F5.S1/WSG ;
  wire \K1/processor/store_loop[7].memory_bit/F5.S1/SRINV_640 ;
  wire \K1/processor/store_loop[7].memory_bit/F5.S1/SLICEWE0USED_641 ;
  wire \K1/processor/store_loop[7].memory_bit/F5.S1/BXINV_642 ;
  wire \K1/processor/store_loop[7].memory_bit/F5.S1/SLICEWE1USED_643 ;
  wire \sw<0>/IFF/ICLK1INV_644 ;
  wire \sw<0>/IFF/IDDRIN_MUX_645 ;
  wire \sw<1>/IFF/ICLK1INV_646 ;
  wire \sw<1>/IFF/IDDRIN_MUX_647 ;
  wire \sw<2>/IFF/ICLK1INV_648 ;
  wire \sw<2>/IFF/IDDRIN_MUX_649 ;
  wire \sw<3>/IFF/ICLK1INV_650 ;
  wire \sw<3>/IFF/IDDRIN_MUX_651 ;
  wire \sw<4>/IFF/ICLK1INV_652 ;
  wire \sw<4>/IFF/IDDRIN_MUX_653 ;
  wire \sw<5>/IFF/ICLK1INV_654 ;
  wire \sw<5>/IFF/IDDRIN_MUX_655 ;
  wire \sw<6>/IFF/ICLK1INV_656 ;
  wire \sw<6>/IFF/IDDRIN_MUX_657 ;
  wire \sw<7>/IFF/ICLK1INV_658 ;
  wire \sw<7>/IFF/IDDRIN_MUX_659 ;
  wire VCC;
  wire GND;
  wire \NlwInverterSignal_K1/processor/store_loop[3].memory_bit/F.S1.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/store_loop[2].memory_bit/F.S0.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/store_loop[2].memory_bit/F.S1.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/store_loop[1].memory_bit/F.S0.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/store_loop[1].memory_bit/F.S1.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/store_loop[0].memory_bit/F.S0.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/store_loop[0].memory_bit/F.S1.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/store_loop[5].memory_bit/F.S1.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/stack_ram_loop[7].stack_bit/F.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/stack_ram_loop[6].stack_bit/F.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/stack_ram_loop[5].stack_bit/F.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/stack_ram_loop[4].stack_bit/F.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/stack_ram_loop[3].stack_bit/F.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/store_loop[4].memory_bit/F.S0.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/store_loop[4].memory_bit/F.S1.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/store_loop[3].memory_bit/F.S0.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/store_loop[6].memory_bit/F.S0.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/store_loop[6].memory_bit/F.S1.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/stack_ram_loop[2].stack_bit/F.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/stack_ram_loop[1].stack_bit/F.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/stack_ram_loop[9].stack_bit/F.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/stack_ram_loop[0].stack_bit/F.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/store_loop[5].memory_bit/F.S0.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/stack_ram_loop[8].stack_bit/F.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/store_loop[7].memory_bit/F.S0.WE/WSGAND/WE0 ;
  wire \NlwInverterSignal_K1/processor/store_loop[7].memory_bit/F.S1.WE/WSGAND/WE0 ;
  wire [7 : 0] port_id;
  wire [7 : 0] \K1/processor/store_data ;
  wire [4 : 0] \K1/processor/stack_address ;
  wire [9 : 0] \K1/address ;
  wire [9 : 0] \K1/processor/stack_pop_data ;
  wire [17 : 0] \K1/instruction ;
  wire [9 : 0] \K1/processor/inc_pc_vector ;
  wire [7 : 0] \K1/processor/arith_result ;
  wire [2 : 0] \K1/processor/stack_address_carry ;
  wire [7 : 0] \K1/processor/alu_result ;
  wire [7 : 0] \K1/processor/logical_result ;
  wire [7 : 0] in_port;
  wire [7 : 0] \K1/processor/shift_result ;
  wire [9 : 0] \K1/processor/pc_vector ;
  wire [7 : 0] \K1/processor/half_arith ;
  wire [9 : 0] \K1/processor/pc_value ;
  wire [4 : 0] \K1/processor/half_stack_address ;
  wire [7 : 0] \K1/processor/input_group ;
  wire [7 : 0] \K1/processor/alu_group ;
  wire [7 : 0] \K1/processor/shift_value ;
  wire [7 : 0] \K1/processor/logical_value ;
  wire [7 : 0] \K1/processor/sy ;
  wire [7 : 0] out_port;
  initial $sdf_annotate("netgen/par/picoblaze_top_timesim.sdf");
  defparam \K1/processor/inc_pc_vector<4>/LOGIC_ZERO .LOC = "SLICE_X54Y14";
  X_ZERO \K1/processor/inc_pc_vector<4>/LOGIC_ZERO  (
    .O(\K1/processor/inc_pc_vector<4>/LOGIC_ZERO_9 )
  );
  defparam \K1/processor/inc_pc_vector<4>/XUSED .LOC = "SLICE_X54Y14";
  X_BUF \K1/processor/inc_pc_vector<4>/XUSED  (
    .I(\K1/processor/inc_pc_vector<4>/XORF_0 ),
    .O(\K1/processor/inc_pc_vector [4])
  );
  defparam \K1/processor/inc_pc_vector<4>/XORF .LOC = "SLICE_X54Y14";
  X_XOR2 \K1/processor/inc_pc_vector<4>/XORF  (
    .I0(\K1/processor/inc_pc_vector<4>/CYINIT_1 ),
    .I1(\K1/processor/pc_vector [4]),
    .O(\K1/processor/inc_pc_vector<4>/XORF_0 )
  );
  defparam \K1/processor/inc_pc_vector<4>/CYMUXF .LOC = "SLICE_X54Y14";
  X_MUX2 \K1/processor/inc_pc_vector<4>/CYMUXF  (
    .IA(\K1/processor/inc_pc_vector<4>/LOGIC_ZERO_9 ),
    .IB(\K1/processor/inc_pc_vector<4>/CYINIT_1 ),
    .SEL(\K1/processor/inc_pc_vector<4>/CYSELF_3 ),
    .O(\K1/processor/pc_vector_carry[4] )
  );
  defparam \K1/processor/inc_pc_vector<4>/CYMUXF2 .LOC = "SLICE_X54Y14";
  X_MUX2 \K1/processor/inc_pc_vector<4>/CYMUXF2  (
    .IA(\K1/processor/inc_pc_vector<4>/LOGIC_ZERO_9 ),
    .IB(\K1/processor/inc_pc_vector<4>/LOGIC_ZERO_9 ),
    .SEL(\K1/processor/inc_pc_vector<4>/CYSELF_3 ),
    .O(\K1/processor/inc_pc_vector<4>/CYMUXF2_8 )
  );
  defparam \K1/processor/inc_pc_vector<4>/CYINIT .LOC = "SLICE_X54Y14";
  X_BUF \K1/processor/inc_pc_vector<4>/CYINIT  (
    .I(\K1/processor/pc_vector_carry[3] ),
    .O(\K1/processor/inc_pc_vector<4>/CYINIT_1 )
  );
  defparam \K1/processor/inc_pc_vector<4>/CYSELF .LOC = "SLICE_X54Y14";
  X_BUF \K1/processor/inc_pc_vector<4>/CYSELF  (
    .I(\K1/processor/pc_vector [4]),
    .O(\K1/processor/inc_pc_vector<4>/CYSELF_3 )
  );
  defparam \K1/processor/inc_pc_vector<4>/YUSED .LOC = "SLICE_X54Y14";
  X_BUF \K1/processor/inc_pc_vector<4>/YUSED  (
    .I(\K1/processor/inc_pc_vector<4>/XORG_2 ),
    .O(\K1/processor/inc_pc_vector [5])
  );
  defparam \K1/processor/inc_pc_vector<4>/XORG .LOC = "SLICE_X54Y14";
  X_XOR2 \K1/processor/inc_pc_vector<4>/XORG  (
    .I0(\K1/processor/pc_vector_carry[4] ),
    .I1(\K1/processor/pc_vector [5]),
    .O(\K1/processor/inc_pc_vector<4>/XORG_2 )
  );
  defparam \K1/processor/inc_pc_vector<4>/COUTUSED .LOC = "SLICE_X54Y14";
  X_BUF \K1/processor/inc_pc_vector<4>/COUTUSED  (
    .I(\K1/processor/inc_pc_vector<4>/CYMUXFAST_4 ),
    .O(\K1/processor/pc_vector_carry[5] )
  );
  defparam \K1/processor/inc_pc_vector<4>/FASTCARRY .LOC = "SLICE_X54Y14";
  X_BUF \K1/processor/inc_pc_vector<4>/FASTCARRY  (
    .I(\K1/processor/pc_vector_carry[3] ),
    .O(\K1/processor/inc_pc_vector<4>/FASTCARRY_6 )
  );
  defparam \K1/processor/inc_pc_vector<4>/CYAND .LOC = "SLICE_X54Y14";
  X_AND2 \K1/processor/inc_pc_vector<4>/CYAND  (
    .I0(\K1/processor/inc_pc_vector<4>/CYSELG_10 ),
    .I1(\K1/processor/inc_pc_vector<4>/CYSELF_3 ),
    .O(\K1/processor/inc_pc_vector<4>/CYAND_5 )
  );
  defparam \K1/processor/inc_pc_vector<4>/CYMUXFAST .LOC = "SLICE_X54Y14";
  X_MUX2 \K1/processor/inc_pc_vector<4>/CYMUXFAST  (
    .IA(\K1/processor/inc_pc_vector<4>/CYMUXG2_7 ),
    .IB(\K1/processor/inc_pc_vector<4>/FASTCARRY_6 ),
    .SEL(\K1/processor/inc_pc_vector<4>/CYAND_5 ),
    .O(\K1/processor/inc_pc_vector<4>/CYMUXFAST_4 )
  );
  defparam \K1/processor/inc_pc_vector<4>/CYMUXG2 .LOC = "SLICE_X54Y14";
  X_MUX2 \K1/processor/inc_pc_vector<4>/CYMUXG2  (
    .IA(\K1/processor/inc_pc_vector<4>/LOGIC_ZERO_9 ),
    .IB(\K1/processor/inc_pc_vector<4>/CYMUXF2_8 ),
    .SEL(\K1/processor/inc_pc_vector<4>/CYSELG_10 ),
    .O(\K1/processor/inc_pc_vector<4>/CYMUXG2_7 )
  );
  defparam \K1/processor/inc_pc_vector<4>/CYSELG .LOC = "SLICE_X54Y14";
  X_BUF \K1/processor/inc_pc_vector<4>/CYSELG  (
    .I(\K1/processor/pc_vector [5]),
    .O(\K1/processor/inc_pc_vector<4>/CYSELG_10 )
  );
  defparam \K1/processor/inc_pc_vector<6>/LOGIC_ZERO .LOC = "SLICE_X54Y15";
  X_ZERO \K1/processor/inc_pc_vector<6>/LOGIC_ZERO  (
    .O(\K1/processor/inc_pc_vector<6>/LOGIC_ZERO_20 )
  );
  defparam \K1/processor/inc_pc_vector<6>/XUSED .LOC = "SLICE_X54Y15";
  X_BUF \K1/processor/inc_pc_vector<6>/XUSED  (
    .I(\K1/processor/inc_pc_vector<6>/XORF_11 ),
    .O(\K1/processor/inc_pc_vector [6])
  );
  defparam \K1/processor/inc_pc_vector<6>/XORF .LOC = "SLICE_X54Y15";
  X_XOR2 \K1/processor/inc_pc_vector<6>/XORF  (
    .I0(\K1/processor/inc_pc_vector<6>/CYINIT_12 ),
    .I1(\K1/processor/pc_vector [6]),
    .O(\K1/processor/inc_pc_vector<6>/XORF_11 )
  );
  defparam \K1/processor/inc_pc_vector<6>/CYMUXF .LOC = "SLICE_X54Y15";
  X_MUX2 \K1/processor/inc_pc_vector<6>/CYMUXF  (
    .IA(\K1/processor/inc_pc_vector<6>/LOGIC_ZERO_20 ),
    .IB(\K1/processor/inc_pc_vector<6>/CYINIT_12 ),
    .SEL(\K1/processor/inc_pc_vector<6>/CYSELF_14 ),
    .O(\K1/processor/pc_vector_carry[6] )
  );
  defparam \K1/processor/inc_pc_vector<6>/CYMUXF2 .LOC = "SLICE_X54Y15";
  X_MUX2 \K1/processor/inc_pc_vector<6>/CYMUXF2  (
    .IA(\K1/processor/inc_pc_vector<6>/LOGIC_ZERO_20 ),
    .IB(\K1/processor/inc_pc_vector<6>/LOGIC_ZERO_20 ),
    .SEL(\K1/processor/inc_pc_vector<6>/CYSELF_14 ),
    .O(\K1/processor/inc_pc_vector<6>/CYMUXF2_19 )
  );
  defparam \K1/processor/inc_pc_vector<6>/CYINIT .LOC = "SLICE_X54Y15";
  X_BUF \K1/processor/inc_pc_vector<6>/CYINIT  (
    .I(\K1/processor/pc_vector_carry[5] ),
    .O(\K1/processor/inc_pc_vector<6>/CYINIT_12 )
  );
  defparam \K1/processor/inc_pc_vector<6>/CYSELF .LOC = "SLICE_X54Y15";
  X_BUF \K1/processor/inc_pc_vector<6>/CYSELF  (
    .I(\K1/processor/pc_vector [6]),
    .O(\K1/processor/inc_pc_vector<6>/CYSELF_14 )
  );
  defparam \K1/processor/inc_pc_vector<6>/YUSED .LOC = "SLICE_X54Y15";
  X_BUF \K1/processor/inc_pc_vector<6>/YUSED  (
    .I(\K1/processor/inc_pc_vector<6>/XORG_13 ),
    .O(\K1/processor/inc_pc_vector [7])
  );
  defparam \K1/processor/inc_pc_vector<6>/XORG .LOC = "SLICE_X54Y15";
  X_XOR2 \K1/processor/inc_pc_vector<6>/XORG  (
    .I0(\K1/processor/pc_vector_carry[6] ),
    .I1(\K1/processor/pc_vector [7]),
    .O(\K1/processor/inc_pc_vector<6>/XORG_13 )
  );
  defparam \K1/processor/inc_pc_vector<6>/FASTCARRY .LOC = "SLICE_X54Y15";
  X_BUF \K1/processor/inc_pc_vector<6>/FASTCARRY  (
    .I(\K1/processor/pc_vector_carry[5] ),
    .O(\K1/processor/inc_pc_vector<6>/FASTCARRY_17 )
  );
  defparam \K1/processor/inc_pc_vector<6>/CYAND .LOC = "SLICE_X54Y15";
  X_AND2 \K1/processor/inc_pc_vector<6>/CYAND  (
    .I0(\K1/processor/inc_pc_vector<6>/CYSELG_21 ),
    .I1(\K1/processor/inc_pc_vector<6>/CYSELF_14 ),
    .O(\K1/processor/inc_pc_vector<6>/CYAND_16 )
  );
  defparam \K1/processor/inc_pc_vector<6>/CYMUXFAST .LOC = "SLICE_X54Y15";
  X_MUX2 \K1/processor/inc_pc_vector<6>/CYMUXFAST  (
    .IA(\K1/processor/inc_pc_vector<6>/CYMUXG2_18 ),
    .IB(\K1/processor/inc_pc_vector<6>/FASTCARRY_17 ),
    .SEL(\K1/processor/inc_pc_vector<6>/CYAND_16 ),
    .O(\K1/processor/inc_pc_vector<6>/CYMUXFAST_15 )
  );
  defparam \K1/processor/inc_pc_vector<6>/CYMUXG2 .LOC = "SLICE_X54Y15";
  X_MUX2 \K1/processor/inc_pc_vector<6>/CYMUXG2  (
    .IA(\K1/processor/inc_pc_vector<6>/LOGIC_ZERO_20 ),
    .IB(\K1/processor/inc_pc_vector<6>/CYMUXF2_19 ),
    .SEL(\K1/processor/inc_pc_vector<6>/CYSELG_21 ),
    .O(\K1/processor/inc_pc_vector<6>/CYMUXG2_18 )
  );
  defparam \K1/processor/inc_pc_vector<6>/CYSELG .LOC = "SLICE_X54Y15";
  X_BUF \K1/processor/inc_pc_vector<6>/CYSELG  (
    .I(\K1/processor/pc_vector [7]),
    .O(\K1/processor/inc_pc_vector<6>/CYSELG_21 )
  );
  defparam \K1/processor/inc_pc_vector<8>/LOGIC_ZERO .LOC = "SLICE_X54Y16";
  X_ZERO \K1/processor/inc_pc_vector<8>/LOGIC_ZERO  (
    .O(\K1/processor/inc_pc_vector<8>/LOGIC_ZERO_23 )
  );
  defparam \K1/processor/inc_pc_vector<8>/XUSED .LOC = "SLICE_X54Y16";
  X_BUF \K1/processor/inc_pc_vector<8>/XUSED  (
    .I(\K1/processor/inc_pc_vector<8>/XORF_22 ),
    .O(\K1/processor/inc_pc_vector [8])
  );
  defparam \K1/processor/inc_pc_vector<8>/XORF .LOC = "SLICE_X54Y16";
  X_XOR2 \K1/processor/inc_pc_vector<8>/XORF  (
    .I0(\K1/processor/inc_pc_vector<8>/CYINIT_24 ),
    .I1(\K1/processor/pc_vector [8]),
    .O(\K1/processor/inc_pc_vector<8>/XORF_22 )
  );
  defparam \K1/processor/inc_pc_vector<8>/CYMUXF .LOC = "SLICE_X54Y16";
  X_MUX2 \K1/processor/inc_pc_vector<8>/CYMUXF  (
    .IA(\K1/processor/inc_pc_vector<8>/LOGIC_ZERO_23 ),
    .IB(\K1/processor/inc_pc_vector<8>/CYINIT_24 ),
    .SEL(\K1/processor/inc_pc_vector<8>/CYSELF_25 ),
    .O(\K1/processor/pc_vector_carry[8] )
  );
  defparam \K1/processor/inc_pc_vector<8>/CYINIT .LOC = "SLICE_X54Y16";
  X_BUF \K1/processor/inc_pc_vector<8>/CYINIT  (
    .I(\K1/processor/inc_pc_vector<6>/CYMUXFAST_15 ),
    .O(\K1/processor/inc_pc_vector<8>/CYINIT_24 )
  );
  defparam \K1/processor/inc_pc_vector<8>/CYSELF .LOC = "SLICE_X54Y16";
  X_BUF \K1/processor/inc_pc_vector<8>/CYSELF  (
    .I(\K1/processor/pc_vector [8]),
    .O(\K1/processor/inc_pc_vector<8>/CYSELF_25 )
  );
  defparam \K1/processor/inc_pc_vector<8>/YUSED .LOC = "SLICE_X54Y16";
  X_BUF \K1/processor/inc_pc_vector<8>/YUSED  (
    .I(\K1/processor/inc_pc_vector<8>/XORG_26 ),
    .O(\K1/processor/inc_pc_vector [9])
  );
  defparam \K1/processor/inc_pc_vector<8>/XORG .LOC = "SLICE_X54Y16";
  X_XOR2 \K1/processor/inc_pc_vector<8>/XORG  (
    .I0(\K1/processor/pc_vector_carry[8] ),
    .I1(\K1/processor/pc_vector [9]),
    .O(\K1/processor/inc_pc_vector<8>/XORG_26 )
  );
  defparam \K1/processor/arith_result<0>/LOGIC_ZERO .LOC = "SLICE_X54Y47";
  X_ZERO \K1/processor/arith_result<0>/LOGIC_ZERO  (
    .O(\K1/processor/arith_result<0>/LOGIC_ZERO_27 )
  );
  defparam \K1/processor/arith_result<0>/CYMUXF .LOC = "SLICE_X54Y47";
  X_MUX2 \K1/processor/arith_result<0>/CYMUXF  (
    .IA(\K1/processor/arith_result<0>/LOGIC_ZERO_27 ),
    .IB(\K1/processor/arith_result<0>/CYINIT_28 ),
    .SEL(\K1/processor/arith_result<0>/CYSELF_29 ),
    .O(\K1/processor/arith_carry_in )
  );
  defparam \K1/processor/arith_result<0>/CYINIT .LOC = "SLICE_X54Y47";
  X_BUF \K1/processor/arith_result<0>/CYINIT  (
    .I(GLOBAL_LOGIC1),
    .O(\K1/processor/arith_result<0>/CYINIT_28 )
  );
  defparam \K1/processor/arith_result<0>/CYSELF .LOC = "SLICE_X54Y47";
  X_BUF \K1/processor/arith_result<0>/CYSELF  (
    .I(\K1/processor/sel_arith_carry_in ),
    .O(\K1/processor/arith_result<0>/CYSELF_29 )
  );
  defparam \K1/processor/arith_result<0>/DYMUX .LOC = "SLICE_X54Y47";
  X_BUF \K1/processor/arith_result<0>/DYMUX  (
    .I(\K1/processor/arith_result<0>/XORG_31 ),
    .O(\K1/processor/arith_result<0>/DYMUX_30 )
  );
  defparam \K1/processor/arith_result<0>/XORG .LOC = "SLICE_X54Y47";
  X_XOR2 \K1/processor/arith_result<0>/XORG  (
    .I0(\K1/processor/arith_carry_in ),
    .I1(\K1/processor/half_arith [0]),
    .O(\K1/processor/arith_result<0>/XORG_31 )
  );
  defparam \K1/processor/arith_result<0>/COUTUSED .LOC = "SLICE_X54Y47";
  X_BUF \K1/processor/arith_result<0>/COUTUSED  (
    .I(\K1/processor/arith_result<0>/CYMUXG_32 ),
    .O(\K1/processor/arith_internal_carry[0] )
  );
  defparam \K1/processor/arith_result<0>/CYMUXG .LOC = "SLICE_X54Y47";
  X_MUX2 \K1/processor/arith_result<0>/CYMUXG  (
    .IA(\K1/processor/arith_result<0>/CY0G_33 ),
    .IB(\K1/processor/arith_carry_in ),
    .SEL(\K1/processor/arith_result<0>/CYSELG_34 ),
    .O(\K1/processor/arith_result<0>/CYMUXG_32 )
  );
  defparam \K1/processor/arith_result<0>/CY0G .LOC = "SLICE_X54Y47";
  X_BUF \K1/processor/arith_result<0>/CY0G  (
    .I(\out_port<0>_0 ),
    .O(\K1/processor/arith_result<0>/CY0G_33 )
  );
  defparam \K1/processor/arith_result<0>/CYSELG .LOC = "SLICE_X54Y47";
  X_BUF \K1/processor/arith_result<0>/CYSELG  (
    .I(\K1/processor/half_arith [0]),
    .O(\K1/processor/arith_result<0>/CYSELG_34 )
  );
  defparam \K1/processor/arith_result<0>/SRINV .LOC = "SLICE_X54Y47";
  X_BUF \K1/processor/arith_result<0>/SRINV  (
    .I(\K1/processor/sel_arith_0 ),
    .O(\K1/processor/arith_result<0>/SRINV_35 )
  );
  defparam \K1/processor/arith_result<0>/CLKINV .LOC = "SLICE_X54Y47";
  X_BUF \K1/processor/arith_result<0>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/arith_result<0>/CLKINV_36 )
  );
  defparam \K1/processor/arith_loop[0].arith_lut .INIT = 16'h9966;
  defparam \K1/processor/arith_loop[0].arith_lut .LOC = "SLICE_X54Y47";
  X_LUT4 \K1/processor/arith_loop[0].arith_lut  (
    .ADR0(port_id[0]),
    .ADR1(\out_port<0>_0 ),
    .ADR2(VCC),
    .ADR3(\K1/instruction [14]),
    .O(\K1/processor/half_arith [0])
  );
  defparam \K1/processor/arith_result<1>/DXMUX .LOC = "SLICE_X54Y48";
  X_BUF \K1/processor/arith_result<1>/DXMUX  (
    .I(\K1/processor/arith_result<1>/XORF_38 ),
    .O(\K1/processor/arith_result<1>/DXMUX_37 )
  );
  defparam \K1/processor/arith_result<1>/XORF .LOC = "SLICE_X54Y48";
  X_XOR2 \K1/processor/arith_result<1>/XORF  (
    .I0(\K1/processor/arith_result<1>/CYINIT_39 ),
    .I1(\K1/processor/half_arith [1]),
    .O(\K1/processor/arith_result<1>/XORF_38 )
  );
  defparam \K1/processor/arith_result<1>/CYMUXF .LOC = "SLICE_X54Y48";
  X_MUX2 \K1/processor/arith_result<1>/CYMUXF  (
    .IA(\K1/processor/arith_result<1>/CY0F_40 ),
    .IB(\K1/processor/arith_result<1>/CYINIT_39 ),
    .SEL(\K1/processor/arith_result<1>/CYSELF_43 ),
    .O(\K1/processor/arith_internal_carry[1] )
  );
  defparam \K1/processor/arith_result<1>/CYMUXF2 .LOC = "SLICE_X54Y48";
  X_MUX2 \K1/processor/arith_result<1>/CYMUXF2  (
    .IA(\K1/processor/arith_result<1>/CY0F_40 ),
    .IB(\K1/processor/arith_result<1>/CY0F_40 ),
    .SEL(\K1/processor/arith_result<1>/CYSELF_43 ),
    .O(\K1/processor/arith_result<1>/CYMUXF2_48 )
  );
  defparam \K1/processor/arith_result<1>/CYINIT .LOC = "SLICE_X54Y48";
  X_BUF \K1/processor/arith_result<1>/CYINIT  (
    .I(\K1/processor/arith_internal_carry[0] ),
    .O(\K1/processor/arith_result<1>/CYINIT_39 )
  );
  defparam \K1/processor/arith_result<1>/CY0F .LOC = "SLICE_X54Y48";
  X_BUF \K1/processor/arith_result<1>/CY0F  (
    .I(\out_port<1>_0 ),
    .O(\K1/processor/arith_result<1>/CY0F_40 )
  );
  defparam \K1/processor/arith_result<1>/CYSELF .LOC = "SLICE_X54Y48";
  X_BUF \K1/processor/arith_result<1>/CYSELF  (
    .I(\K1/processor/half_arith [1]),
    .O(\K1/processor/arith_result<1>/CYSELF_43 )
  );
  defparam \K1/processor/arith_result<1>/DYMUX .LOC = "SLICE_X54Y48";
  X_BUF \K1/processor/arith_result<1>/DYMUX  (
    .I(\K1/processor/arith_result<1>/XORG_42 ),
    .O(\K1/processor/arith_result<1>/DYMUX_41 )
  );
  defparam \K1/processor/arith_result<1>/XORG .LOC = "SLICE_X54Y48";
  X_XOR2 \K1/processor/arith_result<1>/XORG  (
    .I0(\K1/processor/arith_internal_carry[1] ),
    .I1(\K1/processor/half_arith [2]),
    .O(\K1/processor/arith_result<1>/XORG_42 )
  );
  defparam \K1/processor/arith_result<1>/COUTUSED .LOC = "SLICE_X54Y48";
  X_BUF \K1/processor/arith_result<1>/COUTUSED  (
    .I(\K1/processor/arith_result<1>/CYMUXFAST_44 ),
    .O(\K1/processor/arith_internal_carry[2] )
  );
  defparam \K1/processor/arith_result<1>/FASTCARRY .LOC = "SLICE_X54Y48";
  X_BUF \K1/processor/arith_result<1>/FASTCARRY  (
    .I(\K1/processor/arith_internal_carry[0] ),
    .O(\K1/processor/arith_result<1>/FASTCARRY_46 )
  );
  defparam \K1/processor/arith_result<1>/CYAND .LOC = "SLICE_X54Y48";
  X_AND2 \K1/processor/arith_result<1>/CYAND  (
    .I0(\K1/processor/arith_result<1>/CYSELG_50 ),
    .I1(\K1/processor/arith_result<1>/CYSELF_43 ),
    .O(\K1/processor/arith_result<1>/CYAND_45 )
  );
  defparam \K1/processor/arith_result<1>/CYMUXFAST .LOC = "SLICE_X54Y48";
  X_MUX2 \K1/processor/arith_result<1>/CYMUXFAST  (
    .IA(\K1/processor/arith_result<1>/CYMUXG2_47 ),
    .IB(\K1/processor/arith_result<1>/FASTCARRY_46 ),
    .SEL(\K1/processor/arith_result<1>/CYAND_45 ),
    .O(\K1/processor/arith_result<1>/CYMUXFAST_44 )
  );
  defparam \K1/processor/arith_result<1>/CYMUXG2 .LOC = "SLICE_X54Y48";
  X_MUX2 \K1/processor/arith_result<1>/CYMUXG2  (
    .IA(\K1/processor/arith_result<1>/CY0G_49 ),
    .IB(\K1/processor/arith_result<1>/CYMUXF2_48 ),
    .SEL(\K1/processor/arith_result<1>/CYSELG_50 ),
    .O(\K1/processor/arith_result<1>/CYMUXG2_47 )
  );
  defparam \K1/processor/arith_result<1>/CY0G .LOC = "SLICE_X54Y48";
  X_BUF \K1/processor/arith_result<1>/CY0G  (
    .I(\out_port<2>_0 ),
    .O(\K1/processor/arith_result<1>/CY0G_49 )
  );
  defparam \K1/processor/arith_result<1>/CYSELG .LOC = "SLICE_X54Y48";
  X_BUF \K1/processor/arith_result<1>/CYSELG  (
    .I(\K1/processor/half_arith [2]),
    .O(\K1/processor/arith_result<1>/CYSELG_50 )
  );
  defparam \K1/processor/arith_result<1>/SRINV .LOC = "SLICE_X54Y48";
  X_BUF \K1/processor/arith_result<1>/SRINV  (
    .I(\K1/processor/sel_arith_0 ),
    .O(\K1/processor/arith_result<1>/SRINV_51 )
  );
  defparam \K1/processor/arith_result<1>/CLKINV .LOC = "SLICE_X54Y48";
  X_BUF \K1/processor/arith_result<1>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/arith_result<1>/CLKINV_52 )
  );
  defparam \K1/processor/arith_loop[2].arith_lut .INIT = 16'h9966;
  defparam \K1/processor/arith_loop[2].arith_lut .LOC = "SLICE_X54Y48";
  X_LUT4 \K1/processor/arith_loop[2].arith_lut  (
    .ADR0(\out_port<2>_0 ),
    .ADR1(port_id[2]),
    .ADR2(VCC),
    .ADR3(\K1/instruction [14]),
    .O(\K1/processor/half_arith [2])
  );
  defparam \K1/processor/arith_result<3>/DXMUX .LOC = "SLICE_X54Y49";
  X_BUF \K1/processor/arith_result<3>/DXMUX  (
    .I(\K1/processor/arith_result<3>/XORF_54 ),
    .O(\K1/processor/arith_result<3>/DXMUX_53 )
  );
  defparam \K1/processor/arith_result<3>/XORF .LOC = "SLICE_X54Y49";
  X_XOR2 \K1/processor/arith_result<3>/XORF  (
    .I0(\K1/processor/arith_result<3>/CYINIT_55 ),
    .I1(\K1/processor/half_arith [3]),
    .O(\K1/processor/arith_result<3>/XORF_54 )
  );
  defparam \K1/processor/arith_result<3>/CYMUXF .LOC = "SLICE_X54Y49";
  X_MUX2 \K1/processor/arith_result<3>/CYMUXF  (
    .IA(\K1/processor/arith_result<3>/CY0F_56 ),
    .IB(\K1/processor/arith_result<3>/CYINIT_55 ),
    .SEL(\K1/processor/arith_result<3>/CYSELF_59 ),
    .O(\K1/processor/arith_internal_carry[3] )
  );
  defparam \K1/processor/arith_result<3>/CYMUXF2 .LOC = "SLICE_X54Y49";
  X_MUX2 \K1/processor/arith_result<3>/CYMUXF2  (
    .IA(\K1/processor/arith_result<3>/CY0F_56 ),
    .IB(\K1/processor/arith_result<3>/CY0F_56 ),
    .SEL(\K1/processor/arith_result<3>/CYSELF_59 ),
    .O(\K1/processor/arith_result<3>/CYMUXF2_64 )
  );
  defparam \K1/processor/arith_result<3>/CYINIT .LOC = "SLICE_X54Y49";
  X_BUF \K1/processor/arith_result<3>/CYINIT  (
    .I(\K1/processor/arith_internal_carry[2] ),
    .O(\K1/processor/arith_result<3>/CYINIT_55 )
  );
  defparam \K1/processor/arith_result<3>/CY0F .LOC = "SLICE_X54Y49";
  X_BUF \K1/processor/arith_result<3>/CY0F  (
    .I(\out_port<3>_0 ),
    .O(\K1/processor/arith_result<3>/CY0F_56 )
  );
  defparam \K1/processor/arith_result<3>/CYSELF .LOC = "SLICE_X54Y49";
  X_BUF \K1/processor/arith_result<3>/CYSELF  (
    .I(\K1/processor/half_arith [3]),
    .O(\K1/processor/arith_result<3>/CYSELF_59 )
  );
  defparam \K1/processor/arith_result<3>/DYMUX .LOC = "SLICE_X54Y49";
  X_BUF \K1/processor/arith_result<3>/DYMUX  (
    .I(\K1/processor/arith_result<3>/XORG_58 ),
    .O(\K1/processor/arith_result<3>/DYMUX_57 )
  );
  defparam \K1/processor/arith_result<3>/XORG .LOC = "SLICE_X54Y49";
  X_XOR2 \K1/processor/arith_result<3>/XORG  (
    .I0(\K1/processor/arith_internal_carry[3] ),
    .I1(\K1/processor/half_arith [4]),
    .O(\K1/processor/arith_result<3>/XORG_58 )
  );
  defparam \K1/processor/arith_result<3>/COUTUSED .LOC = "SLICE_X54Y49";
  X_BUF \K1/processor/arith_result<3>/COUTUSED  (
    .I(\K1/processor/arith_result<3>/CYMUXFAST_60 ),
    .O(\K1/processor/arith_internal_carry[4] )
  );
  defparam \K1/processor/arith_result<3>/FASTCARRY .LOC = "SLICE_X54Y49";
  X_BUF \K1/processor/arith_result<3>/FASTCARRY  (
    .I(\K1/processor/arith_internal_carry[2] ),
    .O(\K1/processor/arith_result<3>/FASTCARRY_62 )
  );
  defparam \K1/processor/arith_result<3>/CYAND .LOC = "SLICE_X54Y49";
  X_AND2 \K1/processor/arith_result<3>/CYAND  (
    .I0(\K1/processor/arith_result<3>/CYSELG_66 ),
    .I1(\K1/processor/arith_result<3>/CYSELF_59 ),
    .O(\K1/processor/arith_result<3>/CYAND_61 )
  );
  defparam \K1/processor/arith_result<3>/CYMUXFAST .LOC = "SLICE_X54Y49";
  X_MUX2 \K1/processor/arith_result<3>/CYMUXFAST  (
    .IA(\K1/processor/arith_result<3>/CYMUXG2_63 ),
    .IB(\K1/processor/arith_result<3>/FASTCARRY_62 ),
    .SEL(\K1/processor/arith_result<3>/CYAND_61 ),
    .O(\K1/processor/arith_result<3>/CYMUXFAST_60 )
  );
  defparam \K1/processor/arith_result<3>/CYMUXG2 .LOC = "SLICE_X54Y49";
  X_MUX2 \K1/processor/arith_result<3>/CYMUXG2  (
    .IA(\K1/processor/arith_result<3>/CY0G_65 ),
    .IB(\K1/processor/arith_result<3>/CYMUXF2_64 ),
    .SEL(\K1/processor/arith_result<3>/CYSELG_66 ),
    .O(\K1/processor/arith_result<3>/CYMUXG2_63 )
  );
  defparam \K1/processor/arith_result<3>/CY0G .LOC = "SLICE_X54Y49";
  X_BUF \K1/processor/arith_result<3>/CY0G  (
    .I(\out_port<4>_0 ),
    .O(\K1/processor/arith_result<3>/CY0G_65 )
  );
  defparam \K1/processor/arith_result<3>/CYSELG .LOC = "SLICE_X54Y49";
  X_BUF \K1/processor/arith_result<3>/CYSELG  (
    .I(\K1/processor/half_arith [4]),
    .O(\K1/processor/arith_result<3>/CYSELG_66 )
  );
  defparam \K1/processor/arith_result<3>/SRINV .LOC = "SLICE_X54Y49";
  X_BUF \K1/processor/arith_result<3>/SRINV  (
    .I(\K1/processor/sel_arith_0 ),
    .O(\K1/processor/arith_result<3>/SRINV_67 )
  );
  defparam \K1/processor/arith_result<3>/CLKINV .LOC = "SLICE_X54Y49";
  X_BUF \K1/processor/arith_result<3>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/arith_result<3>/CLKINV_68 )
  );
  defparam \K1/processor/arith_loop[4].arith_lut .INIT = 16'h9966;
  defparam \K1/processor/arith_loop[4].arith_lut .LOC = "SLICE_X54Y49";
  X_LUT4 \K1/processor/arith_loop[4].arith_lut  (
    .ADR0(port_id[4]),
    .ADR1(\out_port<4>_0 ),
    .ADR2(VCC),
    .ADR3(\K1/instruction [14]),
    .O(\K1/processor/half_arith [4])
  );
  defparam \K1/processor/arith_result<5>/DXMUX .LOC = "SLICE_X54Y50";
  X_BUF \K1/processor/arith_result<5>/DXMUX  (
    .I(\K1/processor/arith_result<5>/XORF_70 ),
    .O(\K1/processor/arith_result<5>/DXMUX_69 )
  );
  defparam \K1/processor/arith_result<5>/XORF .LOC = "SLICE_X54Y50";
  X_XOR2 \K1/processor/arith_result<5>/XORF  (
    .I0(\K1/processor/arith_result<5>/CYINIT_71 ),
    .I1(\K1/processor/half_arith [5]),
    .O(\K1/processor/arith_result<5>/XORF_70 )
  );
  defparam \K1/processor/arith_result<5>/CYMUXF .LOC = "SLICE_X54Y50";
  X_MUX2 \K1/processor/arith_result<5>/CYMUXF  (
    .IA(\K1/processor/arith_result<5>/CY0F_72 ),
    .IB(\K1/processor/arith_result<5>/CYINIT_71 ),
    .SEL(\K1/processor/arith_result<5>/CYSELF_75 ),
    .O(\K1/processor/arith_internal_carry[5] )
  );
  defparam \K1/processor/arith_result<5>/CYMUXF2 .LOC = "SLICE_X54Y50";
  X_MUX2 \K1/processor/arith_result<5>/CYMUXF2  (
    .IA(\K1/processor/arith_result<5>/CY0F_72 ),
    .IB(\K1/processor/arith_result<5>/CY0F_72 ),
    .SEL(\K1/processor/arith_result<5>/CYSELF_75 ),
    .O(\K1/processor/arith_result<5>/CYMUXF2_80 )
  );
  defparam \K1/processor/arith_result<5>/CYINIT .LOC = "SLICE_X54Y50";
  X_BUF \K1/processor/arith_result<5>/CYINIT  (
    .I(\K1/processor/arith_internal_carry[4] ),
    .O(\K1/processor/arith_result<5>/CYINIT_71 )
  );
  defparam \K1/processor/arith_result<5>/CY0F .LOC = "SLICE_X54Y50";
  X_BUF \K1/processor/arith_result<5>/CY0F  (
    .I(\out_port<5>_0 ),
    .O(\K1/processor/arith_result<5>/CY0F_72 )
  );
  defparam \K1/processor/arith_result<5>/CYSELF .LOC = "SLICE_X54Y50";
  X_BUF \K1/processor/arith_result<5>/CYSELF  (
    .I(\K1/processor/half_arith [5]),
    .O(\K1/processor/arith_result<5>/CYSELF_75 )
  );
  defparam \K1/processor/arith_result<5>/DYMUX .LOC = "SLICE_X54Y50";
  X_BUF \K1/processor/arith_result<5>/DYMUX  (
    .I(\K1/processor/arith_result<5>/XORG_74 ),
    .O(\K1/processor/arith_result<5>/DYMUX_73 )
  );
  defparam \K1/processor/arith_result<5>/XORG .LOC = "SLICE_X54Y50";
  X_XOR2 \K1/processor/arith_result<5>/XORG  (
    .I0(\K1/processor/arith_internal_carry[5] ),
    .I1(\K1/processor/half_arith [6]),
    .O(\K1/processor/arith_result<5>/XORG_74 )
  );
  defparam \K1/processor/arith_result<5>/FASTCARRY .LOC = "SLICE_X54Y50";
  X_BUF \K1/processor/arith_result<5>/FASTCARRY  (
    .I(\K1/processor/arith_internal_carry[4] ),
    .O(\K1/processor/arith_result<5>/FASTCARRY_78 )
  );
  defparam \K1/processor/arith_result<5>/CYAND .LOC = "SLICE_X54Y50";
  X_AND2 \K1/processor/arith_result<5>/CYAND  (
    .I0(\K1/processor/arith_result<5>/CYSELG_82 ),
    .I1(\K1/processor/arith_result<5>/CYSELF_75 ),
    .O(\K1/processor/arith_result<5>/CYAND_77 )
  );
  defparam \K1/processor/arith_result<5>/CYMUXFAST .LOC = "SLICE_X54Y50";
  X_MUX2 \K1/processor/arith_result<5>/CYMUXFAST  (
    .IA(\K1/processor/arith_result<5>/CYMUXG2_79 ),
    .IB(\K1/processor/arith_result<5>/FASTCARRY_78 ),
    .SEL(\K1/processor/arith_result<5>/CYAND_77 ),
    .O(\K1/processor/arith_result<5>/CYMUXFAST_76 )
  );
  defparam \K1/processor/arith_result<5>/CYMUXG2 .LOC = "SLICE_X54Y50";
  X_MUX2 \K1/processor/arith_result<5>/CYMUXG2  (
    .IA(\K1/processor/arith_result<5>/CY0G_81 ),
    .IB(\K1/processor/arith_result<5>/CYMUXF2_80 ),
    .SEL(\K1/processor/arith_result<5>/CYSELG_82 ),
    .O(\K1/processor/arith_result<5>/CYMUXG2_79 )
  );
  defparam \K1/processor/arith_result<5>/CY0G .LOC = "SLICE_X54Y50";
  X_BUF \K1/processor/arith_result<5>/CY0G  (
    .I(\out_port<6>_0 ),
    .O(\K1/processor/arith_result<5>/CY0G_81 )
  );
  defparam \K1/processor/arith_result<5>/CYSELG .LOC = "SLICE_X54Y50";
  X_BUF \K1/processor/arith_result<5>/CYSELG  (
    .I(\K1/processor/half_arith [6]),
    .O(\K1/processor/arith_result<5>/CYSELG_82 )
  );
  defparam \K1/processor/arith_result<5>/SRINV .LOC = "SLICE_X54Y50";
  X_BUF \K1/processor/arith_result<5>/SRINV  (
    .I(\K1/processor/sel_arith_0 ),
    .O(\K1/processor/arith_result<5>/SRINV_83 )
  );
  defparam \K1/processor/arith_result<5>/CLKINV .LOC = "SLICE_X54Y50";
  X_BUF \K1/processor/arith_result<5>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/arith_result<5>/CLKINV_84 )
  );
  defparam \K1/processor/arith_loop[6].arith_lut .INIT = 16'h9696;
  defparam \K1/processor/arith_loop[6].arith_lut .LOC = "SLICE_X54Y50";
  X_LUT4 \K1/processor/arith_loop[6].arith_lut  (
    .ADR0(\out_port<6>_0 ),
    .ADR1(port_id[6]),
    .ADR2(\K1/instruction [14]),
    .ADR3(VCC),
    .O(\K1/processor/half_arith [6])
  );
  defparam \K1/processor/arith_result<7>/DXMUX .LOC = "SLICE_X54Y51";
  X_BUF \K1/processor/arith_result<7>/DXMUX  (
    .I(\K1/processor/arith_result<7>/XORF_86 ),
    .O(\K1/processor/arith_result<7>/DXMUX_85 )
  );
  defparam \K1/processor/arith_result<7>/XORF .LOC = "SLICE_X54Y51";
  X_XOR2 \K1/processor/arith_result<7>/XORF  (
    .I0(\K1/processor/arith_result<7>/CYINIT_87 ),
    .I1(\K1/processor/half_arith [7]),
    .O(\K1/processor/arith_result<7>/XORF_86 )
  );
  defparam \K1/processor/arith_result<7>/CYMUXF .LOC = "SLICE_X54Y51";
  X_MUX2 \K1/processor/arith_result<7>/CYMUXF  (
    .IA(\K1/processor/arith_result<7>/CY0F_88 ),
    .IB(\K1/processor/arith_result<7>/CYINIT_87 ),
    .SEL(\K1/processor/arith_result<7>/CYSELF_89 ),
    .O(\K1/processor/arith_internal_carry[7] )
  );
  defparam \K1/processor/arith_result<7>/CYINIT .LOC = "SLICE_X54Y51";
  X_BUF \K1/processor/arith_result<7>/CYINIT  (
    .I(\K1/processor/arith_result<5>/CYMUXFAST_76 ),
    .O(\K1/processor/arith_result<7>/CYINIT_87 )
  );
  defparam \K1/processor/arith_result<7>/CY0F .LOC = "SLICE_X54Y51";
  X_BUF \K1/processor/arith_result<7>/CY0F  (
    .I(\out_port<7>_0 ),
    .O(\K1/processor/arith_result<7>/CY0F_88 )
  );
  defparam \K1/processor/arith_result<7>/CYSELF .LOC = "SLICE_X54Y51";
  X_BUF \K1/processor/arith_result<7>/CYSELF  (
    .I(\K1/processor/half_arith [7]),
    .O(\K1/processor/arith_result<7>/CYSELF_89 )
  );
  defparam \K1/processor/arith_result<7>/DYMUX .LOC = "SLICE_X54Y51";
  X_BUF \K1/processor/arith_result<7>/DYMUX  (
    .I(\K1/processor/arith_result<7>/XORG_91 ),
    .O(\K1/processor/arith_result<7>/DYMUX_90 )
  );
  defparam \K1/processor/arith_result<7>/XORG .LOC = "SLICE_X54Y51";
  X_XOR2 \K1/processor/arith_result<7>/XORG  (
    .I0(\K1/processor/arith_internal_carry[7] ),
    .I1(\K1/processor/invert_arith_carry ),
    .O(\K1/processor/arith_result<7>/XORG_91 )
  );
  defparam \K1/processor/arith_result<7>/SRINV .LOC = "SLICE_X54Y51";
  X_BUF \K1/processor/arith_result<7>/SRINV  (
    .I(\K1/processor/sel_arith_0 ),
    .O(\K1/processor/arith_result<7>/SRINV_92 )
  );
  defparam \K1/processor/arith_result<7>/CLKINV .LOC = "SLICE_X54Y51";
  X_BUF \K1/processor/arith_result<7>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/arith_result<7>/CLKINV_93 )
  );
  defparam \K1/processor/arith_loop[7].msb_arith.arith_carry_out_lut .INIT = 16'h4444;
  defparam \K1/processor/arith_loop[7].msb_arith.arith_carry_out_lut .LOC = "SLICE_X54Y51";
  X_LUT4 \K1/processor/arith_loop[7].msb_arith.arith_carry_out_lut  (
    .ADR0(\K1/processor/internal_reset ),
    .ADR1(\K1/instruction [14]),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\K1/processor/invert_arith_carry )
  );
  defparam \K1/address<0>/LOGIC_ZERO .LOC = "SLICE_X55Y14";
  X_ZERO \K1/address<0>/LOGIC_ZERO  (
    .O(\K1/address<0>/LOGIC_ZERO_101 )
  );
  defparam \K1/address<0>/DXMUX .LOC = "SLICE_X55Y14";
  X_BUF \K1/address<0>/DXMUX  (
    .I(\K1/address<0>/XORF_95 ),
    .O(\K1/address<0>/DXMUX_94 )
  );
  defparam \K1/address<0>/XORF .LOC = "SLICE_X55Y14";
  X_XOR2 \K1/address<0>/XORF  (
    .I0(\K1/address<0>/CYINIT_96 ),
    .I1(\K1/processor/pc_value [0]),
    .O(\K1/address<0>/XORF_95 )
  );
  defparam \K1/address<0>/CYMUXF .LOC = "SLICE_X55Y14";
  X_MUX2 \K1/address<0>/CYMUXF  (
    .IA(\K1/address<0>/LOGIC_ZERO_101 ),
    .IB(\K1/address<0>/CYINIT_96 ),
    .SEL(\K1/address<0>/CYSELF_97 ),
    .O(\K1/processor/pc_value_carry[0] )
  );
  defparam \K1/address<0>/CYINIT .LOC = "SLICE_X55Y14";
  X_BUF \K1/address<0>/CYINIT  (
    .I(\K1/processor/normal_count_0 ),
    .O(\K1/address<0>/CYINIT_96 )
  );
  defparam \K1/address<0>/CYSELF .LOC = "SLICE_X55Y14";
  X_BUF \K1/address<0>/CYSELF  (
    .I(\K1/processor/pc_value [0]),
    .O(\K1/address<0>/CYSELF_97 )
  );
  defparam \K1/address<0>/DYMUX .LOC = "SLICE_X55Y14";
  X_BUF \K1/address<0>/DYMUX  (
    .I(\K1/address<0>/XORG_99 ),
    .O(\K1/address<0>/DYMUX_98 )
  );
  defparam \K1/address<0>/XORG .LOC = "SLICE_X55Y14";
  X_XOR2 \K1/address<0>/XORG  (
    .I0(\K1/processor/pc_value_carry[0] ),
    .I1(\K1/processor/pc_value [1]),
    .O(\K1/address<0>/XORG_99 )
  );
  defparam \K1/address<0>/COUTUSED .LOC = "SLICE_X55Y14";
  X_BUF \K1/address<0>/COUTUSED  (
    .I(\K1/address<0>/CYMUXG_100 ),
    .O(\K1/processor/pc_value_carry[1] )
  );
  defparam \K1/address<0>/CYMUXG .LOC = "SLICE_X55Y14";
  X_MUX2 \K1/address<0>/CYMUXG  (
    .IA(\K1/address<0>/LOGIC_ZERO_101 ),
    .IB(\K1/processor/pc_value_carry[0] ),
    .SEL(\K1/address<0>/CYSELG_102 ),
    .O(\K1/address<0>/CYMUXG_100 )
  );
  defparam \K1/address<0>/CYSELG .LOC = "SLICE_X55Y14";
  X_BUF \K1/address<0>/CYSELG  (
    .I(\K1/processor/pc_value [1]),
    .O(\K1/address<0>/CYSELG_102 )
  );
  defparam \K1/address<0>/SRINV .LOC = "SLICE_X55Y14";
  X_BUF \K1/address<0>/SRINV  (
    .I(\K1/processor/internal_reset ),
    .O(\K1/address<0>/SRINV_103 )
  );
  defparam \K1/address<0>/CLKINV .LOC = "SLICE_X55Y14";
  X_BUF \K1/address<0>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/address<0>/CLKINV_104 )
  );
  defparam \K1/address<0>/CEINV .LOC = "SLICE_X55Y14";
  X_INV \K1/address<0>/CEINV  (
    .I(\K1/processor/t_state ),
    .O(\K1/address<0>/CEINVNOT )
  );
  defparam \K1/processor/pc_loop[1].value_select_mux .INIT = 16'hAACC;
  defparam \K1/processor/pc_loop[1].value_select_mux .LOC = "SLICE_X55Y14";
  X_LUT4 \K1/processor/pc_loop[1].value_select_mux  (
    .ADR0(\K1/address [1]),
    .ADR1(\K1/processor/inc_pc_vector [1]),
    .ADR2(VCC),
    .ADR3(\K1/processor/normal_count_0 ),
    .O(\K1/processor/pc_value [1])
  );
  defparam \K1/processor/store_loop[3].memory_bit/F5.S1/F5USED .LOC = "SLICE_X66Y45";
  X_BUF \K1/processor/store_loop[3].memory_bit/F5.S1/F5USED  (
    .I(\K1/processor/store_loop[3].memory_bit/F5.S1/F5MUX_105 ),
    .O(\K1/processor/store_loop[3].memory_bit/F5.S1 )
  );
  defparam \K1/processor/store_loop[3].memory_bit/F5.S1/F5MUX .LOC = "SLICE_X66Y45";
  X_MUX2 \K1/processor/store_loop[3].memory_bit/F5.S1/F5MUX  (
    .IA(\K1/processor/store_loop[3].memory_bit/G.S1_108 ),
    .IB(\K1/processor/store_loop[3].memory_bit/F.S1_106 ),
    .SEL(\K1/processor/store_loop[3].memory_bit/F5.S1/BXINV_113 ),
    .O(\K1/processor/store_loop[3].memory_bit/F5.S1/F5MUX_105 )
  );
  defparam \K1/processor/store_loop[3].memory_bit/F5.S1/DIF_MUX .LOC = "SLICE_X66Y45";
  X_BUF \K1/processor/store_loop[3].memory_bit/F5.S1/DIF_MUX  (
    .I(\K1/processor/store_loop[3].memory_bit/F5.S1/DIG_MUX_109 ),
    .O(\K1/processor/store_loop[3].memory_bit/F5.S1/DIF_MUX_107 )
  );
  defparam \K1/processor/store_loop[3].memory_bit/F5.S1/BXINV .LOC = "SLICE_X66Y45";
  X_BUF \K1/processor/store_loop[3].memory_bit/F5.S1/BXINV  (
    .I(port_id[4]),
    .O(\K1/processor/store_loop[3].memory_bit/F5.S1/BXINV_113 )
  );
  defparam \K1/processor/store_loop[3].memory_bit/F5.S1/DIG_MUX .LOC = "SLICE_X66Y45";
  X_BUF \K1/processor/store_loop[3].memory_bit/F5.S1/DIG_MUX  (
    .I(\out_port<3>_0 ),
    .O(\K1/processor/store_loop[3].memory_bit/F5.S1/DIG_MUX_109 )
  );
  defparam \K1/processor/store_loop[3].memory_bit/F5.S1/SRINV .LOC = "SLICE_X66Y45";
  X_BUF \K1/processor/store_loop[3].memory_bit/F5.S1/SRINV  (
    .I(\K1/processor/memory_enable_0 ),
    .O(\K1/processor/store_loop[3].memory_bit/F5.S1/SRINV_111 )
  );
  defparam \K1/processor/store_loop[3].memory_bit/F5.S1/CLKINV .LOC = "SLICE_X66Y45";
  X_BUF \K1/processor/store_loop[3].memory_bit/F5.S1/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/store_loop[3].memory_bit/F5.S1/CLKINV_110 )
  );
  defparam \K1/processor/store_loop[3].memory_bit/F5.S1/SLICEWE0USED .LOC = "SLICE_X66Y45";
  X_BUF \K1/processor/store_loop[3].memory_bit/F5.S1/SLICEWE0USED  (
    .I(\K1/processor/store_loop[3].memory_bit/F5.S1/BXINV_113 ),
    .O(\K1/processor/store_loop[3].memory_bit/F5.S1/SLICEWE0USED_112 )
  );
  defparam \K1/processor/store_loop[3].memory_bit/F5.S1/SLICEWE1USED .LOC = "SLICE_X66Y45";
  X_INV \K1/processor/store_loop[3].memory_bit/F5.S1/SLICEWE1USED  (
    .I(\K1/processor/store_data<3>/BYINV_287 ),
    .O(\K1/processor/store_loop[3].memory_bit/F5.S1/SLICEWE1USED_114 )
  );
  defparam \K1/processor/store_data<2>/F5USED .LOC = "SLICE_X64Y48";
  X_BUF \K1/processor/store_data<2>/F5USED  (
    .I(\K1/processor/store_data<2>/F5MUX_115 ),
    .O(\K1/processor/store_loop[2].memory_bit/F5.S0 )
  );
  defparam \K1/processor/store_data<2>/F5MUX .LOC = "SLICE_X64Y48";
  X_MUX2 \K1/processor/store_data<2>/F5MUX  (
    .IA(\K1/processor/store_loop[2].memory_bit/G.S0_120 ),
    .IB(\K1/processor/store_loop[2].memory_bit/F.S0_116 ),
    .SEL(\K1/processor/store_data<2>/BXINV_126 ),
    .O(\K1/processor/store_data<2>/F5MUX_115 )
  );
  defparam \K1/processor/store_data<2>/DIF_MUX .LOC = "SLICE_X64Y48";
  X_BUF \K1/processor/store_data<2>/DIF_MUX  (
    .I(\K1/processor/store_data<2>/DIG_MUX_121 ),
    .O(\K1/processor/store_data<2>/DIF_MUX_117 )
  );
  defparam \K1/processor/store_data<2>/BXINV .LOC = "SLICE_X64Y48";
  X_BUF \K1/processor/store_data<2>/BXINV  (
    .I(port_id[4]),
    .O(\K1/processor/store_data<2>/BXINV_126 )
  );
  defparam \K1/processor/store_data<2>/DYMUX .LOC = "SLICE_X64Y48";
  X_BUF \K1/processor/store_data<2>/DYMUX  (
    .I(\K1/processor/store_data<2>/F6MUX_119 ),
    .O(\K1/processor/store_data<2>/DYMUX_118 )
  );
  defparam \K1/processor/store_data<2>/F6MUX .LOC = "SLICE_X64Y48";
  X_MUX2 \K1/processor/store_data<2>/F6MUX  (
    .IA(\K1/processor/store_loop[2].memory_bit/F5.S1 ),
    .IB(\K1/processor/store_loop[2].memory_bit/F5.S0 ),
    .SEL(\K1/processor/store_data<2>/BYINV_122 ),
    .O(\K1/processor/store_data<2>/F6MUX_119 )
  );
  defparam \K1/processor/store_data<2>/DIG_MUX .LOC = "SLICE_X64Y48";
  X_BUF \K1/processor/store_data<2>/DIG_MUX  (
    .I(\K1/processor/store_loop[2].memory_bit/F5.S1/DIG_MUX_132 ),
    .O(\K1/processor/store_data<2>/DIG_MUX_121 )
  );
  defparam \K1/processor/store_data<2>/BYINV .LOC = "SLICE_X64Y48";
  X_BUF \K1/processor/store_data<2>/BYINV  (
    .I(port_id[5]),
    .O(\K1/processor/store_data<2>/BYINV_122 )
  );
  defparam \K1/processor/store_data<2>/SRINV .LOC = "SLICE_X64Y48";
  X_BUF \K1/processor/store_data<2>/SRINV  (
    .I(\K1/processor/memory_enable_0 ),
    .O(\K1/processor/store_data<2>/SRINV_124 )
  );
  defparam \K1/processor/store_data<2>/CLKINV .LOC = "SLICE_X64Y48";
  X_BUF \K1/processor/store_data<2>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/store_data<2>/CLKINV_123 )
  );
  defparam \K1/processor/store_data<2>/SLICEWE0USED .LOC = "SLICE_X64Y48";
  X_BUF \K1/processor/store_data<2>/SLICEWE0USED  (
    .I(\K1/processor/store_data<2>/BXINV_126 ),
    .O(\K1/processor/store_data<2>/SLICEWE0USED_125 )
  );
  defparam \K1/processor/store_data<2>/SLICEWE1USED .LOC = "SLICE_X64Y48";
  X_BUF \K1/processor/store_data<2>/SLICEWE1USED  (
    .I(\K1/processor/store_data<2>/BYINV_122 ),
    .O(\K1/processor/store_data<2>/SLICEWE1USED_127 )
  );
  defparam \K1/processor/store_loop[2].memory_bit/F5.S1/F5USED .LOC = "SLICE_X64Y49";
  X_BUF \K1/processor/store_loop[2].memory_bit/F5.S1/F5USED  (
    .I(\K1/processor/store_loop[2].memory_bit/F5.S1/F5MUX_128 ),
    .O(\K1/processor/store_loop[2].memory_bit/F5.S1 )
  );
  defparam \K1/processor/store_loop[2].memory_bit/F5.S1/F5MUX .LOC = "SLICE_X64Y49";
  X_MUX2 \K1/processor/store_loop[2].memory_bit/F5.S1/F5MUX  (
    .IA(\K1/processor/store_loop[2].memory_bit/G.S1_131 ),
    .IB(\K1/processor/store_loop[2].memory_bit/F.S1_129 ),
    .SEL(\K1/processor/store_loop[2].memory_bit/F5.S1/BXINV_136 ),
    .O(\K1/processor/store_loop[2].memory_bit/F5.S1/F5MUX_128 )
  );
  defparam \K1/processor/store_loop[2].memory_bit/F5.S1/DIF_MUX .LOC = "SLICE_X64Y49";
  X_BUF \K1/processor/store_loop[2].memory_bit/F5.S1/DIF_MUX  (
    .I(\K1/processor/store_loop[2].memory_bit/F5.S1/DIG_MUX_132 ),
    .O(\K1/processor/store_loop[2].memory_bit/F5.S1/DIF_MUX_130 )
  );
  defparam \K1/processor/store_loop[2].memory_bit/F5.S1/BXINV .LOC = "SLICE_X64Y49";
  X_BUF \K1/processor/store_loop[2].memory_bit/F5.S1/BXINV  (
    .I(port_id[4]),
    .O(\K1/processor/store_loop[2].memory_bit/F5.S1/BXINV_136 )
  );
  defparam \K1/processor/store_loop[2].memory_bit/F5.S1/DIG_MUX .LOC = "SLICE_X64Y49";
  X_BUF \K1/processor/store_loop[2].memory_bit/F5.S1/DIG_MUX  (
    .I(\out_port<2>_0 ),
    .O(\K1/processor/store_loop[2].memory_bit/F5.S1/DIG_MUX_132 )
  );
  defparam \K1/processor/store_loop[2].memory_bit/F5.S1/SRINV .LOC = "SLICE_X64Y49";
  X_BUF \K1/processor/store_loop[2].memory_bit/F5.S1/SRINV  (
    .I(\K1/processor/memory_enable_0 ),
    .O(\K1/processor/store_loop[2].memory_bit/F5.S1/SRINV_134 )
  );
  defparam \K1/processor/store_loop[2].memory_bit/F5.S1/CLKINV .LOC = "SLICE_X64Y49";
  X_BUF \K1/processor/store_loop[2].memory_bit/F5.S1/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/store_loop[2].memory_bit/F5.S1/CLKINV_133 )
  );
  defparam \K1/processor/store_loop[2].memory_bit/F5.S1/SLICEWE0USED .LOC = "SLICE_X64Y49";
  X_BUF \K1/processor/store_loop[2].memory_bit/F5.S1/SLICEWE0USED  (
    .I(\K1/processor/store_loop[2].memory_bit/F5.S1/BXINV_136 ),
    .O(\K1/processor/store_loop[2].memory_bit/F5.S1/SLICEWE0USED_135 )
  );
  defparam \K1/processor/store_loop[2].memory_bit/F5.S1/SLICEWE1USED .LOC = "SLICE_X64Y49";
  X_INV \K1/processor/store_loop[2].memory_bit/F5.S1/SLICEWE1USED  (
    .I(\K1/processor/store_data<2>/BYINV_122 ),
    .O(\K1/processor/store_loop[2].memory_bit/F5.S1/SLICEWE1USED_137 )
  );
  defparam \K1/processor/store_data<1>/F5USED .LOC = "SLICE_X52Y48";
  X_BUF \K1/processor/store_data<1>/F5USED  (
    .I(\K1/processor/store_data<1>/F5MUX_138 ),
    .O(\K1/processor/store_loop[1].memory_bit/F5.S0 )
  );
  defparam \K1/processor/store_data<1>/F5MUX .LOC = "SLICE_X52Y48";
  X_MUX2 \K1/processor/store_data<1>/F5MUX  (
    .IA(\K1/processor/store_loop[1].memory_bit/G.S0_143 ),
    .IB(\K1/processor/store_loop[1].memory_bit/F.S0_139 ),
    .SEL(\K1/processor/store_data<1>/BXINV_149 ),
    .O(\K1/processor/store_data<1>/F5MUX_138 )
  );
  defparam \K1/processor/store_data<1>/DIF_MUX .LOC = "SLICE_X52Y48";
  X_BUF \K1/processor/store_data<1>/DIF_MUX  (
    .I(\K1/processor/store_data<1>/DIG_MUX_144 ),
    .O(\K1/processor/store_data<1>/DIF_MUX_140 )
  );
  defparam \K1/processor/store_data<1>/BXINV .LOC = "SLICE_X52Y48";
  X_BUF \K1/processor/store_data<1>/BXINV  (
    .I(port_id[4]),
    .O(\K1/processor/store_data<1>/BXINV_149 )
  );
  defparam \K1/processor/store_data<1>/DYMUX .LOC = "SLICE_X52Y48";
  X_BUF \K1/processor/store_data<1>/DYMUX  (
    .I(\K1/processor/store_data<1>/F6MUX_142 ),
    .O(\K1/processor/store_data<1>/DYMUX_141 )
  );
  defparam \K1/processor/store_data<1>/F6MUX .LOC = "SLICE_X52Y48";
  X_MUX2 \K1/processor/store_data<1>/F6MUX  (
    .IA(\K1/processor/store_loop[1].memory_bit/F5.S1 ),
    .IB(\K1/processor/store_loop[1].memory_bit/F5.S0 ),
    .SEL(\K1/processor/store_data<1>/BYINV_145 ),
    .O(\K1/processor/store_data<1>/F6MUX_142 )
  );
  defparam \K1/processor/store_data<1>/DIG_MUX .LOC = "SLICE_X52Y48";
  X_BUF \K1/processor/store_data<1>/DIG_MUX  (
    .I(\K1/processor/store_loop[1].memory_bit/F5.S1/DIG_MUX_155 ),
    .O(\K1/processor/store_data<1>/DIG_MUX_144 )
  );
  defparam \K1/processor/store_data<1>/BYINV .LOC = "SLICE_X52Y48";
  X_BUF \K1/processor/store_data<1>/BYINV  (
    .I(port_id[5]),
    .O(\K1/processor/store_data<1>/BYINV_145 )
  );
  defparam \K1/processor/store_data<1>/SRINV .LOC = "SLICE_X52Y48";
  X_BUF \K1/processor/store_data<1>/SRINV  (
    .I(\K1/processor/memory_enable_0 ),
    .O(\K1/processor/store_data<1>/SRINV_147 )
  );
  defparam \K1/processor/store_data<1>/CLKINV .LOC = "SLICE_X52Y48";
  X_BUF \K1/processor/store_data<1>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/store_data<1>/CLKINV_146 )
  );
  defparam \K1/processor/store_data<1>/SLICEWE0USED .LOC = "SLICE_X52Y48";
  X_BUF \K1/processor/store_data<1>/SLICEWE0USED  (
    .I(\K1/processor/store_data<1>/BXINV_149 ),
    .O(\K1/processor/store_data<1>/SLICEWE0USED_148 )
  );
  defparam \K1/processor/store_data<1>/SLICEWE1USED .LOC = "SLICE_X52Y48";
  X_BUF \K1/processor/store_data<1>/SLICEWE1USED  (
    .I(\K1/processor/store_data<1>/BYINV_145 ),
    .O(\K1/processor/store_data<1>/SLICEWE1USED_150 )
  );
  defparam \K1/processor/store_loop[1].memory_bit/F5.S1/F5USED .LOC = "SLICE_X52Y49";
  X_BUF \K1/processor/store_loop[1].memory_bit/F5.S1/F5USED  (
    .I(\K1/processor/store_loop[1].memory_bit/F5.S1/F5MUX_151 ),
    .O(\K1/processor/store_loop[1].memory_bit/F5.S1 )
  );
  defparam \K1/processor/store_loop[1].memory_bit/F5.S1/F5MUX .LOC = "SLICE_X52Y49";
  X_MUX2 \K1/processor/store_loop[1].memory_bit/F5.S1/F5MUX  (
    .IA(\K1/processor/store_loop[1].memory_bit/G.S1_154 ),
    .IB(\K1/processor/store_loop[1].memory_bit/F.S1_152 ),
    .SEL(\K1/processor/store_loop[1].memory_bit/F5.S1/BXINV_159 ),
    .O(\K1/processor/store_loop[1].memory_bit/F5.S1/F5MUX_151 )
  );
  defparam \K1/processor/store_loop[1].memory_bit/F5.S1/DIF_MUX .LOC = "SLICE_X52Y49";
  X_BUF \K1/processor/store_loop[1].memory_bit/F5.S1/DIF_MUX  (
    .I(\K1/processor/store_loop[1].memory_bit/F5.S1/DIG_MUX_155 ),
    .O(\K1/processor/store_loop[1].memory_bit/F5.S1/DIF_MUX_153 )
  );
  defparam \K1/processor/store_loop[1].memory_bit/F5.S1/BXINV .LOC = "SLICE_X52Y49";
  X_BUF \K1/processor/store_loop[1].memory_bit/F5.S1/BXINV  (
    .I(port_id[4]),
    .O(\K1/processor/store_loop[1].memory_bit/F5.S1/BXINV_159 )
  );
  defparam \K1/processor/store_loop[1].memory_bit/F5.S1/DIG_MUX .LOC = "SLICE_X52Y49";
  X_BUF \K1/processor/store_loop[1].memory_bit/F5.S1/DIG_MUX  (
    .I(\out_port<1>_0 ),
    .O(\K1/processor/store_loop[1].memory_bit/F5.S1/DIG_MUX_155 )
  );
  defparam \K1/processor/store_loop[1].memory_bit/F5.S1/SRINV .LOC = "SLICE_X52Y49";
  X_BUF \K1/processor/store_loop[1].memory_bit/F5.S1/SRINV  (
    .I(\K1/processor/memory_enable_0 ),
    .O(\K1/processor/store_loop[1].memory_bit/F5.S1/SRINV_157 )
  );
  defparam \K1/processor/store_loop[1].memory_bit/F5.S1/CLKINV .LOC = "SLICE_X52Y49";
  X_BUF \K1/processor/store_loop[1].memory_bit/F5.S1/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/store_loop[1].memory_bit/F5.S1/CLKINV_156 )
  );
  defparam \K1/processor/store_loop[1].memory_bit/F5.S1/SLICEWE0USED .LOC = "SLICE_X52Y49";
  X_BUF \K1/processor/store_loop[1].memory_bit/F5.S1/SLICEWE0USED  (
    .I(\K1/processor/store_loop[1].memory_bit/F5.S1/BXINV_159 ),
    .O(\K1/processor/store_loop[1].memory_bit/F5.S1/SLICEWE0USED_158 )
  );
  defparam \K1/processor/store_loop[1].memory_bit/F5.S1/SLICEWE1USED .LOC = "SLICE_X52Y49";
  X_INV \K1/processor/store_loop[1].memory_bit/F5.S1/SLICEWE1USED  (
    .I(\K1/processor/store_data<1>/BYINV_145 ),
    .O(\K1/processor/store_loop[1].memory_bit/F5.S1/SLICEWE1USED_160 )
  );
  defparam \K1/processor/store_data<0>/F5USED .LOC = "SLICE_X66Y48";
  X_BUF \K1/processor/store_data<0>/F5USED  (
    .I(\K1/processor/store_data<0>/F5MUX_161 ),
    .O(\K1/processor/store_loop[0].memory_bit/F5.S0 )
  );
  defparam \K1/processor/store_data<0>/F5MUX .LOC = "SLICE_X66Y48";
  X_MUX2 \K1/processor/store_data<0>/F5MUX  (
    .IA(\K1/processor/store_loop[0].memory_bit/G.S0_166 ),
    .IB(\K1/processor/store_loop[0].memory_bit/F.S0_162 ),
    .SEL(\K1/processor/store_data<0>/BXINV_172 ),
    .O(\K1/processor/store_data<0>/F5MUX_161 )
  );
  defparam \K1/processor/store_data<0>/DIF_MUX .LOC = "SLICE_X66Y48";
  X_BUF \K1/processor/store_data<0>/DIF_MUX  (
    .I(\K1/processor/store_data<0>/DIG_MUX_167 ),
    .O(\K1/processor/store_data<0>/DIF_MUX_163 )
  );
  defparam \K1/processor/store_data<0>/BXINV .LOC = "SLICE_X66Y48";
  X_BUF \K1/processor/store_data<0>/BXINV  (
    .I(port_id[4]),
    .O(\K1/processor/store_data<0>/BXINV_172 )
  );
  defparam \K1/processor/store_data<0>/DYMUX .LOC = "SLICE_X66Y48";
  X_BUF \K1/processor/store_data<0>/DYMUX  (
    .I(\K1/processor/store_data<0>/F6MUX_165 ),
    .O(\K1/processor/store_data<0>/DYMUX_164 )
  );
  defparam \K1/processor/store_data<0>/F6MUX .LOC = "SLICE_X66Y48";
  X_MUX2 \K1/processor/store_data<0>/F6MUX  (
    .IA(\K1/processor/store_loop[0].memory_bit/F5.S1 ),
    .IB(\K1/processor/store_loop[0].memory_bit/F5.S0 ),
    .SEL(\K1/processor/store_data<0>/BYINV_168 ),
    .O(\K1/processor/store_data<0>/F6MUX_165 )
  );
  defparam \K1/processor/store_data<0>/DIG_MUX .LOC = "SLICE_X66Y48";
  X_BUF \K1/processor/store_data<0>/DIG_MUX  (
    .I(\K1/processor/store_loop[0].memory_bit/F5.S1/DIG_MUX_178 ),
    .O(\K1/processor/store_data<0>/DIG_MUX_167 )
  );
  defparam \K1/processor/store_data<0>/BYINV .LOC = "SLICE_X66Y48";
  X_BUF \K1/processor/store_data<0>/BYINV  (
    .I(port_id[5]),
    .O(\K1/processor/store_data<0>/BYINV_168 )
  );
  defparam \K1/processor/store_data<0>/SRINV .LOC = "SLICE_X66Y48";
  X_BUF \K1/processor/store_data<0>/SRINV  (
    .I(\K1/processor/memory_enable_0 ),
    .O(\K1/processor/store_data<0>/SRINV_170 )
  );
  defparam \K1/processor/store_data<0>/CLKINV .LOC = "SLICE_X66Y48";
  X_BUF \K1/processor/store_data<0>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/store_data<0>/CLKINV_169 )
  );
  defparam \K1/processor/store_data<0>/SLICEWE0USED .LOC = "SLICE_X66Y48";
  X_BUF \K1/processor/store_data<0>/SLICEWE0USED  (
    .I(\K1/processor/store_data<0>/BXINV_172 ),
    .O(\K1/processor/store_data<0>/SLICEWE0USED_171 )
  );
  defparam \K1/processor/store_data<0>/SLICEWE1USED .LOC = "SLICE_X66Y48";
  X_BUF \K1/processor/store_data<0>/SLICEWE1USED  (
    .I(\K1/processor/store_data<0>/BYINV_168 ),
    .O(\K1/processor/store_data<0>/SLICEWE1USED_173 )
  );
  defparam \K1/processor/store_loop[0].memory_bit/F5.S1/F5USED .LOC = "SLICE_X66Y49";
  X_BUF \K1/processor/store_loop[0].memory_bit/F5.S1/F5USED  (
    .I(\K1/processor/store_loop[0].memory_bit/F5.S1/F5MUX_174 ),
    .O(\K1/processor/store_loop[0].memory_bit/F5.S1 )
  );
  defparam \K1/processor/store_loop[0].memory_bit/F5.S1/F5MUX .LOC = "SLICE_X66Y49";
  X_MUX2 \K1/processor/store_loop[0].memory_bit/F5.S1/F5MUX  (
    .IA(\K1/processor/store_loop[0].memory_bit/G.S1_177 ),
    .IB(\K1/processor/store_loop[0].memory_bit/F.S1_175 ),
    .SEL(\K1/processor/store_loop[0].memory_bit/F5.S1/BXINV_182 ),
    .O(\K1/processor/store_loop[0].memory_bit/F5.S1/F5MUX_174 )
  );
  defparam \K1/processor/store_loop[0].memory_bit/F5.S1/DIF_MUX .LOC = "SLICE_X66Y49";
  X_BUF \K1/processor/store_loop[0].memory_bit/F5.S1/DIF_MUX  (
    .I(\K1/processor/store_loop[0].memory_bit/F5.S1/DIG_MUX_178 ),
    .O(\K1/processor/store_loop[0].memory_bit/F5.S1/DIF_MUX_176 )
  );
  defparam \K1/processor/store_loop[0].memory_bit/F5.S1/BXINV .LOC = "SLICE_X66Y49";
  X_BUF \K1/processor/store_loop[0].memory_bit/F5.S1/BXINV  (
    .I(port_id[4]),
    .O(\K1/processor/store_loop[0].memory_bit/F5.S1/BXINV_182 )
  );
  defparam \K1/processor/store_loop[0].memory_bit/F5.S1/DIG_MUX .LOC = "SLICE_X66Y49";
  X_BUF \K1/processor/store_loop[0].memory_bit/F5.S1/DIG_MUX  (
    .I(\out_port<0>_0 ),
    .O(\K1/processor/store_loop[0].memory_bit/F5.S1/DIG_MUX_178 )
  );
  defparam \K1/processor/store_loop[0].memory_bit/F5.S1/SRINV .LOC = "SLICE_X66Y49";
  X_BUF \K1/processor/store_loop[0].memory_bit/F5.S1/SRINV  (
    .I(\K1/processor/memory_enable_0 ),
    .O(\K1/processor/store_loop[0].memory_bit/F5.S1/SRINV_180 )
  );
  defparam \K1/processor/store_loop[0].memory_bit/F5.S1/CLKINV .LOC = "SLICE_X66Y49";
  X_BUF \K1/processor/store_loop[0].memory_bit/F5.S1/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/store_loop[0].memory_bit/F5.S1/CLKINV_179 )
  );
  defparam \K1/processor/store_loop[0].memory_bit/F5.S1/SLICEWE0USED .LOC = "SLICE_X66Y49";
  X_BUF \K1/processor/store_loop[0].memory_bit/F5.S1/SLICEWE0USED  (
    .I(\K1/processor/store_loop[0].memory_bit/F5.S1/BXINV_182 ),
    .O(\K1/processor/store_loop[0].memory_bit/F5.S1/SLICEWE0USED_181 )
  );
  defparam \K1/processor/store_loop[0].memory_bit/F5.S1/SLICEWE1USED .LOC = "SLICE_X66Y49";
  X_INV \K1/processor/store_loop[0].memory_bit/F5.S1/SLICEWE1USED  (
    .I(\K1/processor/store_data<0>/BYINV_168 ),
    .O(\K1/processor/store_loop[0].memory_bit/F5.S1/SLICEWE1USED_183 )
  );
  defparam \K1/processor/inc_pc_vector<0>/LOGIC_ZERO .LOC = "SLICE_X54Y12";
  X_ZERO \K1/processor/inc_pc_vector<0>/LOGIC_ZERO  (
    .O(\K1/processor/inc_pc_vector<0>/LOGIC_ZERO_189 )
  );
  defparam \K1/processor/inc_pc_vector<0>/XUSED .LOC = "SLICE_X54Y12";
  X_BUF \K1/processor/inc_pc_vector<0>/XUSED  (
    .I(\K1/processor/inc_pc_vector<0>/XORF_184 ),
    .O(\K1/processor/inc_pc_vector [0])
  );
  defparam \K1/processor/inc_pc_vector<0>/XORF .LOC = "SLICE_X54Y12";
  X_XOR2 \K1/processor/inc_pc_vector<0>/XORF  (
    .I0(\K1/processor/inc_pc_vector<0>/CYINIT_185 ),
    .I1(\K1/processor/pc_vector [0]),
    .O(\K1/processor/inc_pc_vector<0>/XORF_184 )
  );
  defparam \K1/processor/inc_pc_vector<0>/CYMUXF .LOC = "SLICE_X54Y12";
  X_MUX2 \K1/processor/inc_pc_vector<0>/CYMUXF  (
    .IA(\K1/processor/inc_pc_vector<0>/LOGIC_ZERO_189 ),
    .IB(\K1/processor/inc_pc_vector<0>/CYINIT_185 ),
    .SEL(\K1/processor/inc_pc_vector<0>/CYSELF_186 ),
    .O(\K1/processor/pc_vector_carry[0] )
  );
  defparam \K1/processor/inc_pc_vector<0>/CYINIT .LOC = "SLICE_X54Y12";
  X_BUF \K1/processor/inc_pc_vector<0>/CYINIT  (
    .I(\K1/instruction [13]),
    .O(\K1/processor/inc_pc_vector<0>/CYINIT_185 )
  );
  defparam \K1/processor/inc_pc_vector<0>/CYSELF .LOC = "SLICE_X54Y12";
  X_BUF \K1/processor/inc_pc_vector<0>/CYSELF  (
    .I(\K1/processor/pc_vector [0]),
    .O(\K1/processor/inc_pc_vector<0>/CYSELF_186 )
  );
  defparam \K1/processor/inc_pc_vector<0>/YUSED .LOC = "SLICE_X54Y12";
  X_BUF \K1/processor/inc_pc_vector<0>/YUSED  (
    .I(\K1/processor/inc_pc_vector<0>/XORG_187 ),
    .O(\K1/processor/inc_pc_vector [1])
  );
  defparam \K1/processor/inc_pc_vector<0>/XORG .LOC = "SLICE_X54Y12";
  X_XOR2 \K1/processor/inc_pc_vector<0>/XORG  (
    .I0(\K1/processor/pc_vector_carry[0] ),
    .I1(\K1/processor/pc_vector [1]),
    .O(\K1/processor/inc_pc_vector<0>/XORG_187 )
  );
  defparam \K1/processor/inc_pc_vector<0>/COUTUSED .LOC = "SLICE_X54Y12";
  X_BUF \K1/processor/inc_pc_vector<0>/COUTUSED  (
    .I(\K1/processor/inc_pc_vector<0>/CYMUXG_188 ),
    .O(\K1/processor/pc_vector_carry[1] )
  );
  defparam \K1/processor/inc_pc_vector<0>/CYMUXG .LOC = "SLICE_X54Y12";
  X_MUX2 \K1/processor/inc_pc_vector<0>/CYMUXG  (
    .IA(\K1/processor/inc_pc_vector<0>/LOGIC_ZERO_189 ),
    .IB(\K1/processor/pc_vector_carry[0] ),
    .SEL(\K1/processor/inc_pc_vector<0>/CYSELG_190 ),
    .O(\K1/processor/inc_pc_vector<0>/CYMUXG_188 )
  );
  defparam \K1/processor/inc_pc_vector<0>/CYSELG .LOC = "SLICE_X54Y12";
  X_BUF \K1/processor/inc_pc_vector<0>/CYSELG  (
    .I(\K1/processor/pc_vector [1]),
    .O(\K1/processor/inc_pc_vector<0>/CYSELG_190 )
  );
  defparam \K1/processor/inc_pc_vector<2>/LOGIC_ZERO .LOC = "SLICE_X54Y13";
  X_ZERO \K1/processor/inc_pc_vector<2>/LOGIC_ZERO  (
    .O(\K1/processor/inc_pc_vector<2>/LOGIC_ZERO_200 )
  );
  defparam \K1/processor/inc_pc_vector<2>/XUSED .LOC = "SLICE_X54Y13";
  X_BUF \K1/processor/inc_pc_vector<2>/XUSED  (
    .I(\K1/processor/inc_pc_vector<2>/XORF_191 ),
    .O(\K1/processor/inc_pc_vector [2])
  );
  defparam \K1/processor/inc_pc_vector<2>/XORF .LOC = "SLICE_X54Y13";
  X_XOR2 \K1/processor/inc_pc_vector<2>/XORF  (
    .I0(\K1/processor/inc_pc_vector<2>/CYINIT_192 ),
    .I1(\K1/processor/pc_vector [2]),
    .O(\K1/processor/inc_pc_vector<2>/XORF_191 )
  );
  defparam \K1/processor/inc_pc_vector<2>/CYMUXF .LOC = "SLICE_X54Y13";
  X_MUX2 \K1/processor/inc_pc_vector<2>/CYMUXF  (
    .IA(\K1/processor/inc_pc_vector<2>/LOGIC_ZERO_200 ),
    .IB(\K1/processor/inc_pc_vector<2>/CYINIT_192 ),
    .SEL(\K1/processor/inc_pc_vector<2>/CYSELF_194 ),
    .O(\K1/processor/pc_vector_carry[2] )
  );
  defparam \K1/processor/inc_pc_vector<2>/CYMUXF2 .LOC = "SLICE_X54Y13";
  X_MUX2 \K1/processor/inc_pc_vector<2>/CYMUXF2  (
    .IA(\K1/processor/inc_pc_vector<2>/LOGIC_ZERO_200 ),
    .IB(\K1/processor/inc_pc_vector<2>/LOGIC_ZERO_200 ),
    .SEL(\K1/processor/inc_pc_vector<2>/CYSELF_194 ),
    .O(\K1/processor/inc_pc_vector<2>/CYMUXF2_199 )
  );
  defparam \K1/processor/inc_pc_vector<2>/CYINIT .LOC = "SLICE_X54Y13";
  X_BUF \K1/processor/inc_pc_vector<2>/CYINIT  (
    .I(\K1/processor/pc_vector_carry[1] ),
    .O(\K1/processor/inc_pc_vector<2>/CYINIT_192 )
  );
  defparam \K1/processor/inc_pc_vector<2>/CYSELF .LOC = "SLICE_X54Y13";
  X_BUF \K1/processor/inc_pc_vector<2>/CYSELF  (
    .I(\K1/processor/pc_vector [2]),
    .O(\K1/processor/inc_pc_vector<2>/CYSELF_194 )
  );
  defparam \K1/processor/inc_pc_vector<2>/YUSED .LOC = "SLICE_X54Y13";
  X_BUF \K1/processor/inc_pc_vector<2>/YUSED  (
    .I(\K1/processor/inc_pc_vector<2>/XORG_193 ),
    .O(\K1/processor/inc_pc_vector [3])
  );
  defparam \K1/processor/inc_pc_vector<2>/XORG .LOC = "SLICE_X54Y13";
  X_XOR2 \K1/processor/inc_pc_vector<2>/XORG  (
    .I0(\K1/processor/pc_vector_carry[2] ),
    .I1(\K1/processor/pc_vector [3]),
    .O(\K1/processor/inc_pc_vector<2>/XORG_193 )
  );
  defparam \K1/processor/inc_pc_vector<2>/COUTUSED .LOC = "SLICE_X54Y13";
  X_BUF \K1/processor/inc_pc_vector<2>/COUTUSED  (
    .I(\K1/processor/inc_pc_vector<2>/CYMUXFAST_195 ),
    .O(\K1/processor/pc_vector_carry[3] )
  );
  defparam \K1/processor/inc_pc_vector<2>/FASTCARRY .LOC = "SLICE_X54Y13";
  X_BUF \K1/processor/inc_pc_vector<2>/FASTCARRY  (
    .I(\K1/processor/pc_vector_carry[1] ),
    .O(\K1/processor/inc_pc_vector<2>/FASTCARRY_197 )
  );
  defparam \K1/processor/inc_pc_vector<2>/CYAND .LOC = "SLICE_X54Y13";
  X_AND2 \K1/processor/inc_pc_vector<2>/CYAND  (
    .I0(\K1/processor/inc_pc_vector<2>/CYSELG_201 ),
    .I1(\K1/processor/inc_pc_vector<2>/CYSELF_194 ),
    .O(\K1/processor/inc_pc_vector<2>/CYAND_196 )
  );
  defparam \K1/processor/inc_pc_vector<2>/CYMUXFAST .LOC = "SLICE_X54Y13";
  X_MUX2 \K1/processor/inc_pc_vector<2>/CYMUXFAST  (
    .IA(\K1/processor/inc_pc_vector<2>/CYMUXG2_198 ),
    .IB(\K1/processor/inc_pc_vector<2>/FASTCARRY_197 ),
    .SEL(\K1/processor/inc_pc_vector<2>/CYAND_196 ),
    .O(\K1/processor/inc_pc_vector<2>/CYMUXFAST_195 )
  );
  defparam \K1/processor/inc_pc_vector<2>/CYMUXG2 .LOC = "SLICE_X54Y13";
  X_MUX2 \K1/processor/inc_pc_vector<2>/CYMUXG2  (
    .IA(\K1/processor/inc_pc_vector<2>/LOGIC_ZERO_200 ),
    .IB(\K1/processor/inc_pc_vector<2>/CYMUXF2_199 ),
    .SEL(\K1/processor/inc_pc_vector<2>/CYSELG_201 ),
    .O(\K1/processor/inc_pc_vector<2>/CYMUXG2_198 )
  );
  defparam \K1/processor/inc_pc_vector<2>/CYSELG .LOC = "SLICE_X54Y13";
  X_BUF \K1/processor/inc_pc_vector<2>/CYSELG  (
    .I(\K1/processor/pc_vector [3]),
    .O(\K1/processor/inc_pc_vector<2>/CYSELG_201 )
  );
  defparam \K1/processor/store_loop[5].memory_bit/F5.S1/F5USED .LOC = "SLICE_X66Y47";
  X_BUF \K1/processor/store_loop[5].memory_bit/F5.S1/F5USED  (
    .I(\K1/processor/store_loop[5].memory_bit/F5.S1/F5MUX_202 ),
    .O(\K1/processor/store_loop[5].memory_bit/F5.S1 )
  );
  defparam \K1/processor/store_loop[5].memory_bit/F5.S1/F5MUX .LOC = "SLICE_X66Y47";
  X_MUX2 \K1/processor/store_loop[5].memory_bit/F5.S1/F5MUX  (
    .IA(\K1/processor/store_loop[5].memory_bit/G.S1_205 ),
    .IB(\K1/processor/store_loop[5].memory_bit/F.S1_203 ),
    .SEL(\K1/processor/store_loop[5].memory_bit/F5.S1/BXINV_210 ),
    .O(\K1/processor/store_loop[5].memory_bit/F5.S1/F5MUX_202 )
  );
  defparam \K1/processor/store_loop[5].memory_bit/F5.S1/DIF_MUX .LOC = "SLICE_X66Y47";
  X_BUF \K1/processor/store_loop[5].memory_bit/F5.S1/DIF_MUX  (
    .I(\K1/processor/store_loop[5].memory_bit/F5.S1/DIG_MUX_206 ),
    .O(\K1/processor/store_loop[5].memory_bit/F5.S1/DIF_MUX_204 )
  );
  defparam \K1/processor/store_loop[5].memory_bit/F5.S1/BXINV .LOC = "SLICE_X66Y47";
  X_BUF \K1/processor/store_loop[5].memory_bit/F5.S1/BXINV  (
    .I(port_id[4]),
    .O(\K1/processor/store_loop[5].memory_bit/F5.S1/BXINV_210 )
  );
  defparam \K1/processor/store_loop[5].memory_bit/F5.S1/DIG_MUX .LOC = "SLICE_X66Y47";
  X_BUF \K1/processor/store_loop[5].memory_bit/F5.S1/DIG_MUX  (
    .I(\out_port<5>_0 ),
    .O(\K1/processor/store_loop[5].memory_bit/F5.S1/DIG_MUX_206 )
  );
  defparam \K1/processor/store_loop[5].memory_bit/F5.S1/SRINV .LOC = "SLICE_X66Y47";
  X_BUF \K1/processor/store_loop[5].memory_bit/F5.S1/SRINV  (
    .I(\K1/processor/memory_enable_0 ),
    .O(\K1/processor/store_loop[5].memory_bit/F5.S1/SRINV_208 )
  );
  defparam \K1/processor/store_loop[5].memory_bit/F5.S1/CLKINV .LOC = "SLICE_X66Y47";
  X_BUF \K1/processor/store_loop[5].memory_bit/F5.S1/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/store_loop[5].memory_bit/F5.S1/CLKINV_207 )
  );
  defparam \K1/processor/store_loop[5].memory_bit/F5.S1/SLICEWE0USED .LOC = "SLICE_X66Y47";
  X_BUF \K1/processor/store_loop[5].memory_bit/F5.S1/SLICEWE0USED  (
    .I(\K1/processor/store_loop[5].memory_bit/F5.S1/BXINV_210 ),
    .O(\K1/processor/store_loop[5].memory_bit/F5.S1/SLICEWE0USED_209 )
  );
  defparam \K1/processor/store_loop[5].memory_bit/F5.S1/SLICEWE1USED .LOC = "SLICE_X66Y47";
  X_INV \K1/processor/store_loop[5].memory_bit/F5.S1/SLICEWE1USED  (
    .I(\K1/processor/store_data<5>/BYINV_359 ),
    .O(\K1/processor/store_loop[5].memory_bit/F5.S1/SLICEWE1USED_211 )
  );
  defparam \K1/processor/stack_pop_data<7>/DXMUX .LOC = "SLICE_X64Y14";
  X_BUF \K1/processor/stack_pop_data<7>/DXMUX  (
    .I(\K1/processor/stack_pop_data<7>/F5MUX_213 ),
    .O(\K1/processor/stack_pop_data<7>/DXMUX_212 )
  );
  defparam \K1/processor/stack_pop_data<7>/F5MUX .LOC = "SLICE_X64Y14";
  X_MUX2 \K1/processor/stack_pop_data<7>/F5MUX  (
    .IA(\K1/processor/stack_ram_loop[7].stack_bit/G_216 ),
    .IB(\K1/processor/stack_ram_loop[7].stack_bit/F_214 ),
    .SEL(\K1/processor/stack_pop_data<7>/BXINV_220 ),
    .O(\K1/processor/stack_pop_data<7>/F5MUX_213 )
  );
  defparam \K1/processor/stack_pop_data<7>/DIF_MUX .LOC = "SLICE_X64Y14";
  X_BUF \K1/processor/stack_pop_data<7>/DIF_MUX  (
    .I(\K1/processor/stack_pop_data<7>/DIG_MUX_217 ),
    .O(\K1/processor/stack_pop_data<7>/DIF_MUX_215 )
  );
  defparam \K1/processor/stack_pop_data<7>/BXINV .LOC = "SLICE_X64Y14";
  X_BUF \K1/processor/stack_pop_data<7>/BXINV  (
    .I(\K1/processor/stack_address [4]),
    .O(\K1/processor/stack_pop_data<7>/BXINV_220 )
  );
  defparam \K1/processor/stack_pop_data<7>/DIG_MUX .LOC = "SLICE_X64Y14";
  X_BUF \K1/processor/stack_pop_data<7>/DIG_MUX  (
    .I(\K1/address [7]),
    .O(\K1/processor/stack_pop_data<7>/DIG_MUX_217 )
  );
  defparam \K1/processor/stack_pop_data<7>/SRINV .LOC = "SLICE_X64Y14";
  X_INV \K1/processor/stack_pop_data<7>/SRINV  (
    .I(\K1/processor/t_state ),
    .O(\K1/processor/stack_pop_data<7>/SRINVNOT )
  );
  defparam \K1/processor/stack_pop_data<7>/CLKINV .LOC = "SLICE_X64Y14";
  X_BUF \K1/processor/stack_pop_data<7>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/stack_pop_data<7>/CLKINV_218 )
  );
  defparam \K1/processor/stack_pop_data<7>/SLICEWE0USED .LOC = "SLICE_X64Y14";
  X_BUF \K1/processor/stack_pop_data<7>/SLICEWE0USED  (
    .I(\K1/processor/stack_pop_data<7>/BXINV_220 ),
    .O(\K1/processor/stack_pop_data<7>/SLICEWE0USED_219 )
  );
  defparam \K1/processor/stack_pop_data<6>/DXMUX .LOC = "SLICE_X52Y14";
  X_BUF \K1/processor/stack_pop_data<6>/DXMUX  (
    .I(\K1/processor/stack_pop_data<6>/F5MUX_222 ),
    .O(\K1/processor/stack_pop_data<6>/DXMUX_221 )
  );
  defparam \K1/processor/stack_pop_data<6>/F5MUX .LOC = "SLICE_X52Y14";
  X_MUX2 \K1/processor/stack_pop_data<6>/F5MUX  (
    .IA(\K1/processor/stack_ram_loop[6].stack_bit/G_225 ),
    .IB(\K1/processor/stack_ram_loop[6].stack_bit/F_223 ),
    .SEL(\K1/processor/stack_pop_data<6>/BXINV_229 ),
    .O(\K1/processor/stack_pop_data<6>/F5MUX_222 )
  );
  defparam \K1/processor/stack_pop_data<6>/DIF_MUX .LOC = "SLICE_X52Y14";
  X_BUF \K1/processor/stack_pop_data<6>/DIF_MUX  (
    .I(\K1/processor/stack_pop_data<6>/DIG_MUX_226 ),
    .O(\K1/processor/stack_pop_data<6>/DIF_MUX_224 )
  );
  defparam \K1/processor/stack_pop_data<6>/BXINV .LOC = "SLICE_X52Y14";
  X_BUF \K1/processor/stack_pop_data<6>/BXINV  (
    .I(\K1/processor/stack_address [4]),
    .O(\K1/processor/stack_pop_data<6>/BXINV_229 )
  );
  defparam \K1/processor/stack_pop_data<6>/DIG_MUX .LOC = "SLICE_X52Y14";
  X_BUF \K1/processor/stack_pop_data<6>/DIG_MUX  (
    .I(\K1/address [6]),
    .O(\K1/processor/stack_pop_data<6>/DIG_MUX_226 )
  );
  defparam \K1/processor/stack_pop_data<6>/SRINV .LOC = "SLICE_X52Y14";
  X_INV \K1/processor/stack_pop_data<6>/SRINV  (
    .I(\K1/processor/t_state ),
    .O(\K1/processor/stack_pop_data<6>/SRINVNOT )
  );
  defparam \K1/processor/stack_pop_data<6>/CLKINV .LOC = "SLICE_X52Y14";
  X_BUF \K1/processor/stack_pop_data<6>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/stack_pop_data<6>/CLKINV_227 )
  );
  defparam \K1/processor/stack_pop_data<6>/SLICEWE0USED .LOC = "SLICE_X52Y14";
  X_BUF \K1/processor/stack_pop_data<6>/SLICEWE0USED  (
    .I(\K1/processor/stack_pop_data<6>/BXINV_229 ),
    .O(\K1/processor/stack_pop_data<6>/SLICEWE0USED_228 )
  );
  defparam \K1/processor/stack_pop_data<5>/DXMUX .LOC = "SLICE_X64Y15";
  X_BUF \K1/processor/stack_pop_data<5>/DXMUX  (
    .I(\K1/processor/stack_pop_data<5>/F5MUX_231 ),
    .O(\K1/processor/stack_pop_data<5>/DXMUX_230 )
  );
  defparam \K1/processor/stack_pop_data<5>/F5MUX .LOC = "SLICE_X64Y15";
  X_MUX2 \K1/processor/stack_pop_data<5>/F5MUX  (
    .IA(\K1/processor/stack_ram_loop[5].stack_bit/G_234 ),
    .IB(\K1/processor/stack_ram_loop[5].stack_bit/F_232 ),
    .SEL(\K1/processor/stack_pop_data<5>/BXINV_238 ),
    .O(\K1/processor/stack_pop_data<5>/F5MUX_231 )
  );
  defparam \K1/processor/stack_pop_data<5>/DIF_MUX .LOC = "SLICE_X64Y15";
  X_BUF \K1/processor/stack_pop_data<5>/DIF_MUX  (
    .I(\K1/processor/stack_pop_data<5>/DIG_MUX_235 ),
    .O(\K1/processor/stack_pop_data<5>/DIF_MUX_233 )
  );
  defparam \K1/processor/stack_pop_data<5>/BXINV .LOC = "SLICE_X64Y15";
  X_BUF \K1/processor/stack_pop_data<5>/BXINV  (
    .I(\K1/processor/stack_address [4]),
    .O(\K1/processor/stack_pop_data<5>/BXINV_238 )
  );
  defparam \K1/processor/stack_pop_data<5>/DIG_MUX .LOC = "SLICE_X64Y15";
  X_BUF \K1/processor/stack_pop_data<5>/DIG_MUX  (
    .I(\K1/address [5]),
    .O(\K1/processor/stack_pop_data<5>/DIG_MUX_235 )
  );
  defparam \K1/processor/stack_pop_data<5>/SRINV .LOC = "SLICE_X64Y15";
  X_INV \K1/processor/stack_pop_data<5>/SRINV  (
    .I(\K1/processor/t_state ),
    .O(\K1/processor/stack_pop_data<5>/SRINVNOT )
  );
  defparam \K1/processor/stack_pop_data<5>/CLKINV .LOC = "SLICE_X64Y15";
  X_BUF \K1/processor/stack_pop_data<5>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/stack_pop_data<5>/CLKINV_236 )
  );
  defparam \K1/processor/stack_pop_data<5>/SLICEWE0USED .LOC = "SLICE_X64Y15";
  X_BUF \K1/processor/stack_pop_data<5>/SLICEWE0USED  (
    .I(\K1/processor/stack_pop_data<5>/BXINV_238 ),
    .O(\K1/processor/stack_pop_data<5>/SLICEWE0USED_237 )
  );
  defparam \K1/processor/stack_pop_data<4>/DXMUX .LOC = "SLICE_X54Y17";
  X_BUF \K1/processor/stack_pop_data<4>/DXMUX  (
    .I(\K1/processor/stack_pop_data<4>/F5MUX_240 ),
    .O(\K1/processor/stack_pop_data<4>/DXMUX_239 )
  );
  defparam \K1/processor/stack_pop_data<4>/F5MUX .LOC = "SLICE_X54Y17";
  X_MUX2 \K1/processor/stack_pop_data<4>/F5MUX  (
    .IA(\K1/processor/stack_ram_loop[4].stack_bit/G_243 ),
    .IB(\K1/processor/stack_ram_loop[4].stack_bit/F_241 ),
    .SEL(\K1/processor/stack_pop_data<4>/BXINV_247 ),
    .O(\K1/processor/stack_pop_data<4>/F5MUX_240 )
  );
  defparam \K1/processor/stack_pop_data<4>/DIF_MUX .LOC = "SLICE_X54Y17";
  X_BUF \K1/processor/stack_pop_data<4>/DIF_MUX  (
    .I(\K1/processor/stack_pop_data<4>/DIG_MUX_244 ),
    .O(\K1/processor/stack_pop_data<4>/DIF_MUX_242 )
  );
  defparam \K1/processor/stack_pop_data<4>/BXINV .LOC = "SLICE_X54Y17";
  X_BUF \K1/processor/stack_pop_data<4>/BXINV  (
    .I(\K1/processor/stack_address [4]),
    .O(\K1/processor/stack_pop_data<4>/BXINV_247 )
  );
  defparam \K1/processor/stack_pop_data<4>/DIG_MUX .LOC = "SLICE_X54Y17";
  X_BUF \K1/processor/stack_pop_data<4>/DIG_MUX  (
    .I(\K1/address [4]),
    .O(\K1/processor/stack_pop_data<4>/DIG_MUX_244 )
  );
  defparam \K1/processor/stack_pop_data<4>/SRINV .LOC = "SLICE_X54Y17";
  X_INV \K1/processor/stack_pop_data<4>/SRINV  (
    .I(\K1/processor/t_state ),
    .O(\K1/processor/stack_pop_data<4>/SRINVNOT )
  );
  defparam \K1/processor/stack_pop_data<4>/CLKINV .LOC = "SLICE_X54Y17";
  X_BUF \K1/processor/stack_pop_data<4>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/stack_pop_data<4>/CLKINV_245 )
  );
  defparam \K1/processor/stack_pop_data<4>/SLICEWE0USED .LOC = "SLICE_X54Y17";
  X_BUF \K1/processor/stack_pop_data<4>/SLICEWE0USED  (
    .I(\K1/processor/stack_pop_data<4>/BXINV_247 ),
    .O(\K1/processor/stack_pop_data<4>/SLICEWE0USED_246 )
  );
  defparam \K1/processor/stack_pop_data<3>/DXMUX .LOC = "SLICE_X52Y12";
  X_BUF \K1/processor/stack_pop_data<3>/DXMUX  (
    .I(\K1/processor/stack_pop_data<3>/F5MUX_249 ),
    .O(\K1/processor/stack_pop_data<3>/DXMUX_248 )
  );
  defparam \K1/processor/stack_pop_data<3>/F5MUX .LOC = "SLICE_X52Y12";
  X_MUX2 \K1/processor/stack_pop_data<3>/F5MUX  (
    .IA(\K1/processor/stack_ram_loop[3].stack_bit/G_252 ),
    .IB(\K1/processor/stack_ram_loop[3].stack_bit/F_250 ),
    .SEL(\K1/processor/stack_pop_data<3>/BXINV_256 ),
    .O(\K1/processor/stack_pop_data<3>/F5MUX_249 )
  );
  defparam \K1/processor/stack_pop_data<3>/DIF_MUX .LOC = "SLICE_X52Y12";
  X_BUF \K1/processor/stack_pop_data<3>/DIF_MUX  (
    .I(\K1/processor/stack_pop_data<3>/DIG_MUX_253 ),
    .O(\K1/processor/stack_pop_data<3>/DIF_MUX_251 )
  );
  defparam \K1/processor/stack_pop_data<3>/BXINV .LOC = "SLICE_X52Y12";
  X_BUF \K1/processor/stack_pop_data<3>/BXINV  (
    .I(\K1/processor/stack_address [4]),
    .O(\K1/processor/stack_pop_data<3>/BXINV_256 )
  );
  defparam \K1/processor/stack_pop_data<3>/DIG_MUX .LOC = "SLICE_X52Y12";
  X_BUF \K1/processor/stack_pop_data<3>/DIG_MUX  (
    .I(\K1/address [3]),
    .O(\K1/processor/stack_pop_data<3>/DIG_MUX_253 )
  );
  defparam \K1/processor/stack_pop_data<3>/SRINV .LOC = "SLICE_X52Y12";
  X_INV \K1/processor/stack_pop_data<3>/SRINV  (
    .I(\K1/processor/t_state ),
    .O(\K1/processor/stack_pop_data<3>/SRINVNOT )
  );
  defparam \K1/processor/stack_pop_data<3>/CLKINV .LOC = "SLICE_X52Y12";
  X_BUF \K1/processor/stack_pop_data<3>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/stack_pop_data<3>/CLKINV_254 )
  );
  defparam \K1/processor/stack_pop_data<3>/SLICEWE0USED .LOC = "SLICE_X52Y12";
  X_BUF \K1/processor/stack_pop_data<3>/SLICEWE0USED  (
    .I(\K1/processor/stack_pop_data<3>/BXINV_256 ),
    .O(\K1/processor/stack_pop_data<3>/SLICEWE0USED_255 )
  );
  defparam \K1/processor/store_data<4>/F5USED .LOC = "SLICE_X52Y50";
  X_BUF \K1/processor/store_data<4>/F5USED  (
    .I(\K1/processor/store_data<4>/F5MUX_257 ),
    .O(\K1/processor/store_loop[4].memory_bit/F5.S0 )
  );
  defparam \K1/processor/store_data<4>/F5MUX .LOC = "SLICE_X52Y50";
  X_MUX2 \K1/processor/store_data<4>/F5MUX  (
    .IA(\K1/processor/store_loop[4].memory_bit/G.S0_262 ),
    .IB(\K1/processor/store_loop[4].memory_bit/F.S0_258 ),
    .SEL(\K1/processor/store_data<4>/BXINV_268 ),
    .O(\K1/processor/store_data<4>/F5MUX_257 )
  );
  defparam \K1/processor/store_data<4>/DIF_MUX .LOC = "SLICE_X52Y50";
  X_BUF \K1/processor/store_data<4>/DIF_MUX  (
    .I(\K1/processor/store_data<4>/DIG_MUX_263 ),
    .O(\K1/processor/store_data<4>/DIF_MUX_259 )
  );
  defparam \K1/processor/store_data<4>/BXINV .LOC = "SLICE_X52Y50";
  X_BUF \K1/processor/store_data<4>/BXINV  (
    .I(port_id[4]),
    .O(\K1/processor/store_data<4>/BXINV_268 )
  );
  defparam \K1/processor/store_data<4>/DYMUX .LOC = "SLICE_X52Y50";
  X_BUF \K1/processor/store_data<4>/DYMUX  (
    .I(\K1/processor/store_data<4>/F6MUX_261 ),
    .O(\K1/processor/store_data<4>/DYMUX_260 )
  );
  defparam \K1/processor/store_data<4>/F6MUX .LOC = "SLICE_X52Y50";
  X_MUX2 \K1/processor/store_data<4>/F6MUX  (
    .IA(\K1/processor/store_loop[4].memory_bit/F5.S1 ),
    .IB(\K1/processor/store_loop[4].memory_bit/F5.S0 ),
    .SEL(\K1/processor/store_data<4>/BYINV_264 ),
    .O(\K1/processor/store_data<4>/F6MUX_261 )
  );
  defparam \K1/processor/store_data<4>/DIG_MUX .LOC = "SLICE_X52Y50";
  X_BUF \K1/processor/store_data<4>/DIG_MUX  (
    .I(\K1/processor/store_loop[4].memory_bit/F5.S1/DIG_MUX_274 ),
    .O(\K1/processor/store_data<4>/DIG_MUX_263 )
  );
  defparam \K1/processor/store_data<4>/BYINV .LOC = "SLICE_X52Y50";
  X_BUF \K1/processor/store_data<4>/BYINV  (
    .I(port_id[5]),
    .O(\K1/processor/store_data<4>/BYINV_264 )
  );
  defparam \K1/processor/store_data<4>/SRINV .LOC = "SLICE_X52Y50";
  X_BUF \K1/processor/store_data<4>/SRINV  (
    .I(\K1/processor/memory_enable_0 ),
    .O(\K1/processor/store_data<4>/SRINV_266 )
  );
  defparam \K1/processor/store_data<4>/CLKINV .LOC = "SLICE_X52Y50";
  X_BUF \K1/processor/store_data<4>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/store_data<4>/CLKINV_265 )
  );
  defparam \K1/processor/store_data<4>/SLICEWE0USED .LOC = "SLICE_X52Y50";
  X_BUF \K1/processor/store_data<4>/SLICEWE0USED  (
    .I(\K1/processor/store_data<4>/BXINV_268 ),
    .O(\K1/processor/store_data<4>/SLICEWE0USED_267 )
  );
  defparam \K1/processor/store_data<4>/SLICEWE1USED .LOC = "SLICE_X52Y50";
  X_BUF \K1/processor/store_data<4>/SLICEWE1USED  (
    .I(\K1/processor/store_data<4>/BYINV_264 ),
    .O(\K1/processor/store_data<4>/SLICEWE1USED_269 )
  );
  defparam \K1/processor/store_loop[4].memory_bit/F5.S1/F5USED .LOC = "SLICE_X52Y51";
  X_BUF \K1/processor/store_loop[4].memory_bit/F5.S1/F5USED  (
    .I(\K1/processor/store_loop[4].memory_bit/F5.S1/F5MUX_270 ),
    .O(\K1/processor/store_loop[4].memory_bit/F5.S1 )
  );
  defparam \K1/processor/store_loop[4].memory_bit/F5.S1/F5MUX .LOC = "SLICE_X52Y51";
  X_MUX2 \K1/processor/store_loop[4].memory_bit/F5.S1/F5MUX  (
    .IA(\K1/processor/store_loop[4].memory_bit/G.S1_273 ),
    .IB(\K1/processor/store_loop[4].memory_bit/F.S1_271 ),
    .SEL(\K1/processor/store_loop[4].memory_bit/F5.S1/BXINV_278 ),
    .O(\K1/processor/store_loop[4].memory_bit/F5.S1/F5MUX_270 )
  );
  defparam \K1/processor/store_loop[4].memory_bit/F5.S1/DIF_MUX .LOC = "SLICE_X52Y51";
  X_BUF \K1/processor/store_loop[4].memory_bit/F5.S1/DIF_MUX  (
    .I(\K1/processor/store_loop[4].memory_bit/F5.S1/DIG_MUX_274 ),
    .O(\K1/processor/store_loop[4].memory_bit/F5.S1/DIF_MUX_272 )
  );
  defparam \K1/processor/store_loop[4].memory_bit/F5.S1/BXINV .LOC = "SLICE_X52Y51";
  X_BUF \K1/processor/store_loop[4].memory_bit/F5.S1/BXINV  (
    .I(port_id[4]),
    .O(\K1/processor/store_loop[4].memory_bit/F5.S1/BXINV_278 )
  );
  defparam \K1/processor/store_loop[4].memory_bit/F5.S1/DIG_MUX .LOC = "SLICE_X52Y51";
  X_BUF \K1/processor/store_loop[4].memory_bit/F5.S1/DIG_MUX  (
    .I(\out_port<4>_0 ),
    .O(\K1/processor/store_loop[4].memory_bit/F5.S1/DIG_MUX_274 )
  );
  defparam \K1/processor/store_loop[4].memory_bit/F5.S1/SRINV .LOC = "SLICE_X52Y51";
  X_BUF \K1/processor/store_loop[4].memory_bit/F5.S1/SRINV  (
    .I(\K1/processor/memory_enable_0 ),
    .O(\K1/processor/store_loop[4].memory_bit/F5.S1/SRINV_276 )
  );
  defparam \K1/processor/store_loop[4].memory_bit/F5.S1/CLKINV .LOC = "SLICE_X52Y51";
  X_BUF \K1/processor/store_loop[4].memory_bit/F5.S1/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/store_loop[4].memory_bit/F5.S1/CLKINV_275 )
  );
  defparam \K1/processor/store_loop[4].memory_bit/F5.S1/SLICEWE0USED .LOC = "SLICE_X52Y51";
  X_BUF \K1/processor/store_loop[4].memory_bit/F5.S1/SLICEWE0USED  (
    .I(\K1/processor/store_loop[4].memory_bit/F5.S1/BXINV_278 ),
    .O(\K1/processor/store_loop[4].memory_bit/F5.S1/SLICEWE0USED_277 )
  );
  defparam \K1/processor/store_loop[4].memory_bit/F5.S1/SLICEWE1USED .LOC = "SLICE_X52Y51";
  X_INV \K1/processor/store_loop[4].memory_bit/F5.S1/SLICEWE1USED  (
    .I(\K1/processor/store_data<4>/BYINV_264 ),
    .O(\K1/processor/store_loop[4].memory_bit/F5.S1/SLICEWE1USED_279 )
  );
  defparam \K1/processor/store_data<3>/F5USED .LOC = "SLICE_X66Y44";
  X_BUF \K1/processor/store_data<3>/F5USED  (
    .I(\K1/processor/store_data<3>/F5MUX_280 ),
    .O(\K1/processor/store_loop[3].memory_bit/F5.S0 )
  );
  defparam \K1/processor/store_data<3>/F5MUX .LOC = "SLICE_X66Y44";
  X_MUX2 \K1/processor/store_data<3>/F5MUX  (
    .IA(\K1/processor/store_loop[3].memory_bit/G.S0_285 ),
    .IB(\K1/processor/store_loop[3].memory_bit/F.S0_281 ),
    .SEL(\K1/processor/store_data<3>/BXINV_291 ),
    .O(\K1/processor/store_data<3>/F5MUX_280 )
  );
  defparam \K1/processor/store_data<3>/DIF_MUX .LOC = "SLICE_X66Y44";
  X_BUF \K1/processor/store_data<3>/DIF_MUX  (
    .I(\K1/processor/store_data<3>/DIG_MUX_286 ),
    .O(\K1/processor/store_data<3>/DIF_MUX_282 )
  );
  defparam \K1/processor/store_data<3>/BXINV .LOC = "SLICE_X66Y44";
  X_BUF \K1/processor/store_data<3>/BXINV  (
    .I(port_id[4]),
    .O(\K1/processor/store_data<3>/BXINV_291 )
  );
  defparam \K1/processor/store_data<3>/DYMUX .LOC = "SLICE_X66Y44";
  X_BUF \K1/processor/store_data<3>/DYMUX  (
    .I(\K1/processor/store_data<3>/F6MUX_284 ),
    .O(\K1/processor/store_data<3>/DYMUX_283 )
  );
  defparam \K1/processor/store_data<3>/F6MUX .LOC = "SLICE_X66Y44";
  X_MUX2 \K1/processor/store_data<3>/F6MUX  (
    .IA(\K1/processor/store_loop[3].memory_bit/F5.S1 ),
    .IB(\K1/processor/store_loop[3].memory_bit/F5.S0 ),
    .SEL(\K1/processor/store_data<3>/BYINV_287 ),
    .O(\K1/processor/store_data<3>/F6MUX_284 )
  );
  defparam \K1/processor/store_data<3>/DIG_MUX .LOC = "SLICE_X66Y44";
  X_BUF \K1/processor/store_data<3>/DIG_MUX  (
    .I(\K1/processor/store_loop[3].memory_bit/F5.S1/DIG_MUX_109 ),
    .O(\K1/processor/store_data<3>/DIG_MUX_286 )
  );
  defparam \K1/processor/store_data<3>/BYINV .LOC = "SLICE_X66Y44";
  X_BUF \K1/processor/store_data<3>/BYINV  (
    .I(port_id[5]),
    .O(\K1/processor/store_data<3>/BYINV_287 )
  );
  defparam \K1/processor/store_data<3>/SRINV .LOC = "SLICE_X66Y44";
  X_BUF \K1/processor/store_data<3>/SRINV  (
    .I(\K1/processor/memory_enable_0 ),
    .O(\K1/processor/store_data<3>/SRINV_289 )
  );
  defparam \K1/processor/store_data<3>/CLKINV .LOC = "SLICE_X66Y44";
  X_BUF \K1/processor/store_data<3>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/store_data<3>/CLKINV_288 )
  );
  defparam \K1/processor/store_data<3>/SLICEWE0USED .LOC = "SLICE_X66Y44";
  X_BUF \K1/processor/store_data<3>/SLICEWE0USED  (
    .I(\K1/processor/store_data<3>/BXINV_291 ),
    .O(\K1/processor/store_data<3>/SLICEWE0USED_290 )
  );
  defparam \K1/processor/store_data<3>/SLICEWE1USED .LOC = "SLICE_X66Y44";
  X_BUF \K1/processor/store_data<3>/SLICEWE1USED  (
    .I(\K1/processor/store_data<3>/BYINV_287 ),
    .O(\K1/processor/store_data<3>/SLICEWE1USED_292 )
  );
  defparam \K1/processor/store_data<6>/F5USED .LOC = "SLICE_X52Y44";
  X_BUF \K1/processor/store_data<6>/F5USED  (
    .I(\K1/processor/store_data<6>/F5MUX_293 ),
    .O(\K1/processor/store_loop[6].memory_bit/F5.S0 )
  );
  defparam \K1/processor/store_data<6>/F5MUX .LOC = "SLICE_X52Y44";
  X_MUX2 \K1/processor/store_data<6>/F5MUX  (
    .IA(\K1/processor/store_loop[6].memory_bit/G.S0_298 ),
    .IB(\K1/processor/store_loop[6].memory_bit/F.S0_294 ),
    .SEL(\K1/processor/store_data<6>/BXINV_304 ),
    .O(\K1/processor/store_data<6>/F5MUX_293 )
  );
  defparam \K1/processor/store_data<6>/DIF_MUX .LOC = "SLICE_X52Y44";
  X_BUF \K1/processor/store_data<6>/DIF_MUX  (
    .I(\K1/processor/store_data<6>/DIG_MUX_299 ),
    .O(\K1/processor/store_data<6>/DIF_MUX_295 )
  );
  defparam \K1/processor/store_data<6>/BXINV .LOC = "SLICE_X52Y44";
  X_BUF \K1/processor/store_data<6>/BXINV  (
    .I(port_id[4]),
    .O(\K1/processor/store_data<6>/BXINV_304 )
  );
  defparam \K1/processor/store_data<6>/DYMUX .LOC = "SLICE_X52Y44";
  X_BUF \K1/processor/store_data<6>/DYMUX  (
    .I(\K1/processor/store_data<6>/F6MUX_297 ),
    .O(\K1/processor/store_data<6>/DYMUX_296 )
  );
  defparam \K1/processor/store_data<6>/F6MUX .LOC = "SLICE_X52Y44";
  X_MUX2 \K1/processor/store_data<6>/F6MUX  (
    .IA(\K1/processor/store_loop[6].memory_bit/F5.S1 ),
    .IB(\K1/processor/store_loop[6].memory_bit/F5.S0 ),
    .SEL(\K1/processor/store_data<6>/BYINV_300 ),
    .O(\K1/processor/store_data<6>/F6MUX_297 )
  );
  defparam \K1/processor/store_data<6>/DIG_MUX .LOC = "SLICE_X52Y44";
  X_BUF \K1/processor/store_data<6>/DIG_MUX  (
    .I(\K1/processor/store_loop[6].memory_bit/F5.S1/DIG_MUX_310 ),
    .O(\K1/processor/store_data<6>/DIG_MUX_299 )
  );
  defparam \K1/processor/store_data<6>/BYINV .LOC = "SLICE_X52Y44";
  X_BUF \K1/processor/store_data<6>/BYINV  (
    .I(port_id[5]),
    .O(\K1/processor/store_data<6>/BYINV_300 )
  );
  defparam \K1/processor/store_data<6>/SRINV .LOC = "SLICE_X52Y44";
  X_BUF \K1/processor/store_data<6>/SRINV  (
    .I(\K1/processor/memory_enable_0 ),
    .O(\K1/processor/store_data<6>/SRINV_302 )
  );
  defparam \K1/processor/store_data<6>/CLKINV .LOC = "SLICE_X52Y44";
  X_BUF \K1/processor/store_data<6>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/store_data<6>/CLKINV_301 )
  );
  defparam \K1/processor/store_data<6>/SLICEWE0USED .LOC = "SLICE_X52Y44";
  X_BUF \K1/processor/store_data<6>/SLICEWE0USED  (
    .I(\K1/processor/store_data<6>/BXINV_304 ),
    .O(\K1/processor/store_data<6>/SLICEWE0USED_303 )
  );
  defparam \K1/processor/store_data<6>/SLICEWE1USED .LOC = "SLICE_X52Y44";
  X_BUF \K1/processor/store_data<6>/SLICEWE1USED  (
    .I(\K1/processor/store_data<6>/BYINV_300 ),
    .O(\K1/processor/store_data<6>/SLICEWE1USED_305 )
  );
  defparam \K1/processor/store_loop[6].memory_bit/F5.S1/F5USED .LOC = "SLICE_X52Y45";
  X_BUF \K1/processor/store_loop[6].memory_bit/F5.S1/F5USED  (
    .I(\K1/processor/store_loop[6].memory_bit/F5.S1/F5MUX_306 ),
    .O(\K1/processor/store_loop[6].memory_bit/F5.S1 )
  );
  defparam \K1/processor/store_loop[6].memory_bit/F5.S1/F5MUX .LOC = "SLICE_X52Y45";
  X_MUX2 \K1/processor/store_loop[6].memory_bit/F5.S1/F5MUX  (
    .IA(\K1/processor/store_loop[6].memory_bit/G.S1_309 ),
    .IB(\K1/processor/store_loop[6].memory_bit/F.S1_307 ),
    .SEL(\K1/processor/store_loop[6].memory_bit/F5.S1/BXINV_314 ),
    .O(\K1/processor/store_loop[6].memory_bit/F5.S1/F5MUX_306 )
  );
  defparam \K1/processor/store_loop[6].memory_bit/F5.S1/DIF_MUX .LOC = "SLICE_X52Y45";
  X_BUF \K1/processor/store_loop[6].memory_bit/F5.S1/DIF_MUX  (
    .I(\K1/processor/store_loop[6].memory_bit/F5.S1/DIG_MUX_310 ),
    .O(\K1/processor/store_loop[6].memory_bit/F5.S1/DIF_MUX_308 )
  );
  defparam \K1/processor/store_loop[6].memory_bit/F5.S1/BXINV .LOC = "SLICE_X52Y45";
  X_BUF \K1/processor/store_loop[6].memory_bit/F5.S1/BXINV  (
    .I(port_id[4]),
    .O(\K1/processor/store_loop[6].memory_bit/F5.S1/BXINV_314 )
  );
  defparam \K1/processor/store_loop[6].memory_bit/F5.S1/DIG_MUX .LOC = "SLICE_X52Y45";
  X_BUF \K1/processor/store_loop[6].memory_bit/F5.S1/DIG_MUX  (
    .I(\out_port<6>_0 ),
    .O(\K1/processor/store_loop[6].memory_bit/F5.S1/DIG_MUX_310 )
  );
  defparam \K1/processor/store_loop[6].memory_bit/F5.S1/SRINV .LOC = "SLICE_X52Y45";
  X_BUF \K1/processor/store_loop[6].memory_bit/F5.S1/SRINV  (
    .I(\K1/processor/memory_enable_0 ),
    .O(\K1/processor/store_loop[6].memory_bit/F5.S1/SRINV_312 )
  );
  defparam \K1/processor/store_loop[6].memory_bit/F5.S1/CLKINV .LOC = "SLICE_X52Y45";
  X_BUF \K1/processor/store_loop[6].memory_bit/F5.S1/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/store_loop[6].memory_bit/F5.S1/CLKINV_311 )
  );
  defparam \K1/processor/store_loop[6].memory_bit/F5.S1/SLICEWE0USED .LOC = "SLICE_X52Y45";
  X_BUF \K1/processor/store_loop[6].memory_bit/F5.S1/SLICEWE0USED  (
    .I(\K1/processor/store_loop[6].memory_bit/F5.S1/BXINV_314 ),
    .O(\K1/processor/store_loop[6].memory_bit/F5.S1/SLICEWE0USED_313 )
  );
  defparam \K1/processor/store_loop[6].memory_bit/F5.S1/SLICEWE1USED .LOC = "SLICE_X52Y45";
  X_INV \K1/processor/store_loop[6].memory_bit/F5.S1/SLICEWE1USED  (
    .I(\K1/processor/store_data<6>/BYINV_300 ),
    .O(\K1/processor/store_loop[6].memory_bit/F5.S1/SLICEWE1USED_315 )
  );
  defparam \K1/processor/stack_pop_data<2>/DXMUX .LOC = "SLICE_X52Y13";
  X_BUF \K1/processor/stack_pop_data<2>/DXMUX  (
    .I(\K1/processor/stack_pop_data<2>/F5MUX_317 ),
    .O(\K1/processor/stack_pop_data<2>/DXMUX_316 )
  );
  defparam \K1/processor/stack_pop_data<2>/F5MUX .LOC = "SLICE_X52Y13";
  X_MUX2 \K1/processor/stack_pop_data<2>/F5MUX  (
    .IA(\K1/processor/stack_ram_loop[2].stack_bit/G_320 ),
    .IB(\K1/processor/stack_ram_loop[2].stack_bit/F_318 ),
    .SEL(\K1/processor/stack_pop_data<2>/BXINV_324 ),
    .O(\K1/processor/stack_pop_data<2>/F5MUX_317 )
  );
  defparam \K1/processor/stack_pop_data<2>/DIF_MUX .LOC = "SLICE_X52Y13";
  X_BUF \K1/processor/stack_pop_data<2>/DIF_MUX  (
    .I(\K1/processor/stack_pop_data<2>/DIG_MUX_321 ),
    .O(\K1/processor/stack_pop_data<2>/DIF_MUX_319 )
  );
  defparam \K1/processor/stack_pop_data<2>/BXINV .LOC = "SLICE_X52Y13";
  X_BUF \K1/processor/stack_pop_data<2>/BXINV  (
    .I(\K1/processor/stack_address [4]),
    .O(\K1/processor/stack_pop_data<2>/BXINV_324 )
  );
  defparam \K1/processor/stack_pop_data<2>/DIG_MUX .LOC = "SLICE_X52Y13";
  X_BUF \K1/processor/stack_pop_data<2>/DIG_MUX  (
    .I(\K1/address [2]),
    .O(\K1/processor/stack_pop_data<2>/DIG_MUX_321 )
  );
  defparam \K1/processor/stack_pop_data<2>/SRINV .LOC = "SLICE_X52Y13";
  X_INV \K1/processor/stack_pop_data<2>/SRINV  (
    .I(\K1/processor/t_state ),
    .O(\K1/processor/stack_pop_data<2>/SRINVNOT )
  );
  defparam \K1/processor/stack_pop_data<2>/CLKINV .LOC = "SLICE_X52Y13";
  X_BUF \K1/processor/stack_pop_data<2>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/stack_pop_data<2>/CLKINV_322 )
  );
  defparam \K1/processor/stack_pop_data<2>/SLICEWE0USED .LOC = "SLICE_X52Y13";
  X_BUF \K1/processor/stack_pop_data<2>/SLICEWE0USED  (
    .I(\K1/processor/stack_pop_data<2>/BXINV_324 ),
    .O(\K1/processor/stack_pop_data<2>/SLICEWE0USED_323 )
  );
  defparam \K1/processor/stack_pop_data<1>/DXMUX .LOC = "SLICE_X54Y10";
  X_BUF \K1/processor/stack_pop_data<1>/DXMUX  (
    .I(\K1/processor/stack_pop_data<1>/F5MUX_326 ),
    .O(\K1/processor/stack_pop_data<1>/DXMUX_325 )
  );
  defparam \K1/processor/stack_pop_data<1>/F5MUX .LOC = "SLICE_X54Y10";
  X_MUX2 \K1/processor/stack_pop_data<1>/F5MUX  (
    .IA(\K1/processor/stack_ram_loop[1].stack_bit/G_329 ),
    .IB(\K1/processor/stack_ram_loop[1].stack_bit/F_327 ),
    .SEL(\K1/processor/stack_pop_data<1>/BXINV_333 ),
    .O(\K1/processor/stack_pop_data<1>/F5MUX_326 )
  );
  defparam \K1/processor/stack_pop_data<1>/DIF_MUX .LOC = "SLICE_X54Y10";
  X_BUF \K1/processor/stack_pop_data<1>/DIF_MUX  (
    .I(\K1/processor/stack_pop_data<1>/DIG_MUX_330 ),
    .O(\K1/processor/stack_pop_data<1>/DIF_MUX_328 )
  );
  defparam \K1/processor/stack_pop_data<1>/BXINV .LOC = "SLICE_X54Y10";
  X_BUF \K1/processor/stack_pop_data<1>/BXINV  (
    .I(\K1/processor/stack_address [4]),
    .O(\K1/processor/stack_pop_data<1>/BXINV_333 )
  );
  defparam \K1/processor/stack_pop_data<1>/DIG_MUX .LOC = "SLICE_X54Y10";
  X_BUF \K1/processor/stack_pop_data<1>/DIG_MUX  (
    .I(\K1/address [1]),
    .O(\K1/processor/stack_pop_data<1>/DIG_MUX_330 )
  );
  defparam \K1/processor/stack_pop_data<1>/SRINV .LOC = "SLICE_X54Y10";
  X_INV \K1/processor/stack_pop_data<1>/SRINV  (
    .I(\K1/processor/t_state ),
    .O(\K1/processor/stack_pop_data<1>/SRINVNOT )
  );
  defparam \K1/processor/stack_pop_data<1>/CLKINV .LOC = "SLICE_X54Y10";
  X_BUF \K1/processor/stack_pop_data<1>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/stack_pop_data<1>/CLKINV_331 )
  );
  defparam \K1/processor/stack_pop_data<1>/SLICEWE0USED .LOC = "SLICE_X54Y10";
  X_BUF \K1/processor/stack_pop_data<1>/SLICEWE0USED  (
    .I(\K1/processor/stack_pop_data<1>/BXINV_333 ),
    .O(\K1/processor/stack_pop_data<1>/SLICEWE0USED_332 )
  );
  defparam \K1/processor/stack_pop_data<9>/DXMUX .LOC = "SLICE_X64Y17";
  X_BUF \K1/processor/stack_pop_data<9>/DXMUX  (
    .I(\K1/processor/stack_pop_data<9>/F5MUX_335 ),
    .O(\K1/processor/stack_pop_data<9>/DXMUX_334 )
  );
  defparam \K1/processor/stack_pop_data<9>/F5MUX .LOC = "SLICE_X64Y17";
  X_MUX2 \K1/processor/stack_pop_data<9>/F5MUX  (
    .IA(\K1/processor/stack_ram_loop[9].stack_bit/G_338 ),
    .IB(\K1/processor/stack_ram_loop[9].stack_bit/F_336 ),
    .SEL(\K1/processor/stack_pop_data<9>/BXINV_342 ),
    .O(\K1/processor/stack_pop_data<9>/F5MUX_335 )
  );
  defparam \K1/processor/stack_pop_data<9>/DIF_MUX .LOC = "SLICE_X64Y17";
  X_BUF \K1/processor/stack_pop_data<9>/DIF_MUX  (
    .I(\K1/processor/stack_pop_data<9>/DIG_MUX_339 ),
    .O(\K1/processor/stack_pop_data<9>/DIF_MUX_337 )
  );
  defparam \K1/processor/stack_pop_data<9>/BXINV .LOC = "SLICE_X64Y17";
  X_BUF \K1/processor/stack_pop_data<9>/BXINV  (
    .I(\K1/processor/stack_address [4]),
    .O(\K1/processor/stack_pop_data<9>/BXINV_342 )
  );
  defparam \K1/processor/stack_pop_data<9>/DIG_MUX .LOC = "SLICE_X64Y17";
  X_BUF \K1/processor/stack_pop_data<9>/DIG_MUX  (
    .I(\K1/address [9]),
    .O(\K1/processor/stack_pop_data<9>/DIG_MUX_339 )
  );
  defparam \K1/processor/stack_pop_data<9>/SRINV .LOC = "SLICE_X64Y17";
  X_INV \K1/processor/stack_pop_data<9>/SRINV  (
    .I(\K1/processor/t_state ),
    .O(\K1/processor/stack_pop_data<9>/SRINVNOT )
  );
  defparam \K1/processor/stack_pop_data<9>/CLKINV .LOC = "SLICE_X64Y17";
  X_BUF \K1/processor/stack_pop_data<9>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/stack_pop_data<9>/CLKINV_340 )
  );
  defparam \K1/processor/stack_pop_data<9>/SLICEWE0USED .LOC = "SLICE_X64Y17";
  X_BUF \K1/processor/stack_pop_data<9>/SLICEWE0USED  (
    .I(\K1/processor/stack_pop_data<9>/BXINV_342 ),
    .O(\K1/processor/stack_pop_data<9>/SLICEWE0USED_341 )
  );
  defparam \K1/processor/stack_pop_data<0>/DXMUX .LOC = "SLICE_X54Y11";
  X_BUF \K1/processor/stack_pop_data<0>/DXMUX  (
    .I(\K1/processor/stack_pop_data<0>/F5MUX_344 ),
    .O(\K1/processor/stack_pop_data<0>/DXMUX_343 )
  );
  defparam \K1/processor/stack_pop_data<0>/F5MUX .LOC = "SLICE_X54Y11";
  X_MUX2 \K1/processor/stack_pop_data<0>/F5MUX  (
    .IA(\K1/processor/stack_ram_loop[0].stack_bit/G_347 ),
    .IB(\K1/processor/stack_ram_loop[0].stack_bit/F_345 ),
    .SEL(\K1/processor/stack_pop_data<0>/BXINV_351 ),
    .O(\K1/processor/stack_pop_data<0>/F5MUX_344 )
  );
  defparam \K1/processor/stack_pop_data<0>/DIF_MUX .LOC = "SLICE_X54Y11";
  X_BUF \K1/processor/stack_pop_data<0>/DIF_MUX  (
    .I(\K1/processor/stack_pop_data<0>/DIG_MUX_348 ),
    .O(\K1/processor/stack_pop_data<0>/DIF_MUX_346 )
  );
  defparam \K1/processor/stack_pop_data<0>/BXINV .LOC = "SLICE_X54Y11";
  X_BUF \K1/processor/stack_pop_data<0>/BXINV  (
    .I(\K1/processor/stack_address [4]),
    .O(\K1/processor/stack_pop_data<0>/BXINV_351 )
  );
  defparam \K1/processor/stack_pop_data<0>/DIG_MUX .LOC = "SLICE_X54Y11";
  X_BUF \K1/processor/stack_pop_data<0>/DIG_MUX  (
    .I(\K1/address [0]),
    .O(\K1/processor/stack_pop_data<0>/DIG_MUX_348 )
  );
  defparam \K1/processor/stack_pop_data<0>/SRINV .LOC = "SLICE_X54Y11";
  X_INV \K1/processor/stack_pop_data<0>/SRINV  (
    .I(\K1/processor/t_state ),
    .O(\K1/processor/stack_pop_data<0>/SRINVNOT )
  );
  defparam \K1/processor/stack_pop_data<0>/CLKINV .LOC = "SLICE_X54Y11";
  X_BUF \K1/processor/stack_pop_data<0>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/stack_pop_data<0>/CLKINV_349 )
  );
  defparam \K1/processor/stack_pop_data<0>/SLICEWE0USED .LOC = "SLICE_X54Y11";
  X_BUF \K1/processor/stack_pop_data<0>/SLICEWE0USED  (
    .I(\K1/processor/stack_pop_data<0>/BXINV_351 ),
    .O(\K1/processor/stack_pop_data<0>/SLICEWE0USED_350 )
  );
  defparam \K1/processor/store_data<5>/F5USED .LOC = "SLICE_X66Y46";
  X_BUF \K1/processor/store_data<5>/F5USED  (
    .I(\K1/processor/store_data<5>/F5MUX_352 ),
    .O(\K1/processor/store_loop[5].memory_bit/F5.S0 )
  );
  defparam \K1/processor/store_data<5>/F5MUX .LOC = "SLICE_X66Y46";
  X_MUX2 \K1/processor/store_data<5>/F5MUX  (
    .IA(\K1/processor/store_loop[5].memory_bit/G.S0_357 ),
    .IB(\K1/processor/store_loop[5].memory_bit/F.S0_353 ),
    .SEL(\K1/processor/store_data<5>/BXINV_363 ),
    .O(\K1/processor/store_data<5>/F5MUX_352 )
  );
  defparam \K1/processor/store_data<5>/DIF_MUX .LOC = "SLICE_X66Y46";
  X_BUF \K1/processor/store_data<5>/DIF_MUX  (
    .I(\K1/processor/store_data<5>/DIG_MUX_358 ),
    .O(\K1/processor/store_data<5>/DIF_MUX_354 )
  );
  defparam \K1/processor/store_data<5>/BXINV .LOC = "SLICE_X66Y46";
  X_BUF \K1/processor/store_data<5>/BXINV  (
    .I(port_id[4]),
    .O(\K1/processor/store_data<5>/BXINV_363 )
  );
  defparam \K1/processor/store_data<5>/DYMUX .LOC = "SLICE_X66Y46";
  X_BUF \K1/processor/store_data<5>/DYMUX  (
    .I(\K1/processor/store_data<5>/F6MUX_356 ),
    .O(\K1/processor/store_data<5>/DYMUX_355 )
  );
  defparam \K1/processor/store_data<5>/F6MUX .LOC = "SLICE_X66Y46";
  X_MUX2 \K1/processor/store_data<5>/F6MUX  (
    .IA(\K1/processor/store_loop[5].memory_bit/F5.S1 ),
    .IB(\K1/processor/store_loop[5].memory_bit/F5.S0 ),
    .SEL(\K1/processor/store_data<5>/BYINV_359 ),
    .O(\K1/processor/store_data<5>/F6MUX_356 )
  );
  defparam \K1/processor/store_data<5>/DIG_MUX .LOC = "SLICE_X66Y46";
  X_BUF \K1/processor/store_data<5>/DIG_MUX  (
    .I(\K1/processor/store_loop[5].memory_bit/F5.S1/DIG_MUX_206 ),
    .O(\K1/processor/store_data<5>/DIG_MUX_358 )
  );
  defparam \K1/processor/store_data<5>/BYINV .LOC = "SLICE_X66Y46";
  X_BUF \K1/processor/store_data<5>/BYINV  (
    .I(port_id[5]),
    .O(\K1/processor/store_data<5>/BYINV_359 )
  );
  defparam \K1/processor/store_data<5>/SRINV .LOC = "SLICE_X66Y46";
  X_BUF \K1/processor/store_data<5>/SRINV  (
    .I(\K1/processor/memory_enable_0 ),
    .O(\K1/processor/store_data<5>/SRINV_361 )
  );
  defparam \K1/processor/store_data<5>/CLKINV .LOC = "SLICE_X66Y46";
  X_BUF \K1/processor/store_data<5>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/store_data<5>/CLKINV_360 )
  );
  defparam \K1/processor/store_data<5>/SLICEWE0USED .LOC = "SLICE_X66Y46";
  X_BUF \K1/processor/store_data<5>/SLICEWE0USED  (
    .I(\K1/processor/store_data<5>/BXINV_363 ),
    .O(\K1/processor/store_data<5>/SLICEWE0USED_362 )
  );
  defparam \K1/processor/store_data<5>/SLICEWE1USED .LOC = "SLICE_X66Y46";
  X_BUF \K1/processor/store_data<5>/SLICEWE1USED  (
    .I(\K1/processor/store_data<5>/BYINV_359 ),
    .O(\K1/processor/store_data<5>/SLICEWE1USED_364 )
  );
  defparam \K1/processor/stack_pop_data<8>/DXMUX .LOC = "SLICE_X64Y16";
  X_BUF \K1/processor/stack_pop_data<8>/DXMUX  (
    .I(\K1/processor/stack_pop_data<8>/F5MUX_366 ),
    .O(\K1/processor/stack_pop_data<8>/DXMUX_365 )
  );
  defparam \K1/processor/stack_pop_data<8>/F5MUX .LOC = "SLICE_X64Y16";
  X_MUX2 \K1/processor/stack_pop_data<8>/F5MUX  (
    .IA(\K1/processor/stack_ram_loop[8].stack_bit/G_369 ),
    .IB(\K1/processor/stack_ram_loop[8].stack_bit/F_367 ),
    .SEL(\K1/processor/stack_pop_data<8>/BXINV_373 ),
    .O(\K1/processor/stack_pop_data<8>/F5MUX_366 )
  );
  defparam \K1/processor/stack_pop_data<8>/DIF_MUX .LOC = "SLICE_X64Y16";
  X_BUF \K1/processor/stack_pop_data<8>/DIF_MUX  (
    .I(\K1/processor/stack_pop_data<8>/DIG_MUX_370 ),
    .O(\K1/processor/stack_pop_data<8>/DIF_MUX_368 )
  );
  defparam \K1/processor/stack_pop_data<8>/BXINV .LOC = "SLICE_X64Y16";
  X_BUF \K1/processor/stack_pop_data<8>/BXINV  (
    .I(\K1/processor/stack_address [4]),
    .O(\K1/processor/stack_pop_data<8>/BXINV_373 )
  );
  defparam \K1/processor/stack_pop_data<8>/DIG_MUX .LOC = "SLICE_X64Y16";
  X_BUF \K1/processor/stack_pop_data<8>/DIG_MUX  (
    .I(\K1/address [8]),
    .O(\K1/processor/stack_pop_data<8>/DIG_MUX_370 )
  );
  defparam \K1/processor/stack_pop_data<8>/SRINV .LOC = "SLICE_X64Y16";
  X_INV \K1/processor/stack_pop_data<8>/SRINV  (
    .I(\K1/processor/t_state ),
    .O(\K1/processor/stack_pop_data<8>/SRINVNOT )
  );
  defparam \K1/processor/stack_pop_data<8>/CLKINV .LOC = "SLICE_X64Y16";
  X_BUF \K1/processor/stack_pop_data<8>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/stack_pop_data<8>/CLKINV_371 )
  );
  defparam \K1/processor/stack_pop_data<8>/SLICEWE0USED .LOC = "SLICE_X64Y16";
  X_BUF \K1/processor/stack_pop_data<8>/SLICEWE0USED  (
    .I(\K1/processor/stack_pop_data<8>/BXINV_373 ),
    .O(\K1/processor/stack_pop_data<8>/SLICEWE0USED_372 )
  );
  defparam \K1/processor/zero_flag/LOGIC_ZERO .LOC = "SLICE_X64Y41";
  X_ZERO \K1/processor/zero_flag/LOGIC_ZERO  (
    .O(\K1/processor/zero_flag/LOGIC_ZERO_374 )
  );
  defparam \K1/processor/zero_flag/CYMUXF .LOC = "SLICE_X64Y41";
  X_MUX2 \K1/processor/zero_flag/CYMUXF  (
    .IA(\K1/processor/zero_flag/LOGIC_ZERO_374 ),
    .IB(\K1/processor/zero_flag/CYINIT_375 ),
    .SEL(\K1/processor/zero_flag/CYSELF_376 ),
    .O(\K1/processor/zero_carry )
  );
  defparam \K1/processor/zero_flag/CYINIT .LOC = "SLICE_X64Y41";
  X_BUF \K1/processor/zero_flag/CYINIT  (
    .I(\K1/processor/high_zero_carry/CYMUXG_509 ),
    .O(\K1/processor/zero_flag/CYINIT_375 )
  );
  defparam \K1/processor/zero_flag/CYSELF .LOC = "SLICE_X64Y41";
  X_BUF \K1/processor/zero_flag/CYSELF  (
    .I(\K1/processor/sel_shadow_zero ),
    .O(\K1/processor/zero_flag/CYSELF_376 )
  );
  defparam \K1/processor/zero_flag/DYMUX .LOC = "SLICE_X64Y41";
  X_BUF \K1/processor/zero_flag/DYMUX  (
    .I(\K1/processor/zero_flag/XORG_378 ),
    .O(\K1/processor/zero_flag/DYMUX_377 )
  );
  defparam \K1/processor/zero_flag/XORG .LOC = "SLICE_X64Y41";
  X_XOR2 \K1/processor/zero_flag/XORG  (
    .I0(\K1/processor/zero_carry ),
    .I1(\K1/processor/zero_flag/G ),
    .O(\K1/processor/zero_flag/XORG_378 )
  );
  defparam \K1/processor/zero_flag/SRINV .LOC = "SLICE_X64Y41";
  X_BUF \K1/processor/zero_flag/SRINV  (
    .I(\K1/processor/internal_reset ),
    .O(\K1/processor/zero_flag/SRINV_379 )
  );
  defparam \K1/processor/zero_flag/CLKINV .LOC = "SLICE_X64Y41";
  X_BUF \K1/processor/zero_flag/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/zero_flag/CLKINV_380 )
  );
  defparam \K1/processor/zero_flag/CEINV .LOC = "SLICE_X64Y41";
  X_BUF \K1/processor/zero_flag/CEINV  (
    .I(\K1/processor/flag_enable_0 ),
    .O(\K1/processor/zero_flag/CEINV_381 )
  );
  defparam \K1/processor/parity/LOGIC_ZERO .LOC = "SLICE_X54Y44";
  X_ZERO \K1/processor/parity/LOGIC_ZERO  (
    .O(\K1/processor/parity/LOGIC_ZERO_382 )
  );
  defparam \K1/processor/parity/CYMUXF .LOC = "SLICE_X54Y44";
  X_MUX2 \K1/processor/parity/CYMUXF  (
    .IA(\K1/processor/parity/LOGIC_ZERO_382 ),
    .IB(\K1/processor/parity/CYINIT_383 ),
    .SEL(\K1/processor/parity/CYSELF_384 ),
    .O(\K1/processor/parity_carry )
  );
  defparam \K1/processor/parity/CYINIT .LOC = "SLICE_X54Y44";
  X_BUF \K1/processor/parity/CYINIT  (
    .I(GLOBAL_LOGIC1),
    .O(\K1/processor/parity/CYINIT_383 )
  );
  defparam \K1/processor/parity/CYSELF .LOC = "SLICE_X54Y44";
  X_BUF \K1/processor/parity/CYSELF  (
    .I(\K1/processor/low_parity ),
    .O(\K1/processor/parity/CYSELF_384 )
  );
  defparam \K1/processor/parity/YUSED .LOC = "SLICE_X54Y44";
  X_BUF \K1/processor/parity/YUSED  (
    .I(\K1/processor/parity/XORG_385 ),
    .O(\K1/processor/parity )
  );
  defparam \K1/processor/parity/XORG .LOC = "SLICE_X54Y44";
  X_XOR2 \K1/processor/parity/XORG  (
    .I0(\K1/processor/parity_carry ),
    .I1(\K1/processor/high_parity ),
    .O(\K1/processor/parity/XORG_385 )
  );
  defparam \led<0>/PAD .LOC = "PAD84";
  X_OPAD \led<0>/PAD  (
    .PAD(led[0])
  );
  defparam led_0_OBUF.LOC = "PAD84";
  X_OBUF led_0_OBUF (
    .I(\led<0>/O ),
    .O(led[0])
  );
  defparam \led<0>/OUTPUT/OTCLK1INV .LOC = "PAD84";
  X_BUF \led<0>/OUTPUT/OTCLK1INV  (
    .I(clk_BUFGP),
    .O(\led<0>/OUTPUT/OTCLK1INV_386 )
  );
  defparam \led<0>/OUTPUT/OFF/OMUX .LOC = "PAD84";
  X_BUF \led<0>/OUTPUT/OFF/OMUX  (
    .I(led_0_388),
    .O(\led<0>/O )
  );
  defparam \led<0>/OUTPUT/OFF/OCEINV .LOC = "PAD84";
  X_BUF \led<0>/OUTPUT/OFF/OCEINV  (
    .I(led_and0000_0),
    .O(\led<0>/OUTPUT/OFF/OCEINV_387 )
  );
  defparam \led<0>/OUTPUT/OFF/O1_DDRMUX .LOC = "PAD84";
  X_BUF \led<0>/OUTPUT/OFF/O1_DDRMUX  (
    .I(\out_port<0>_0 ),
    .O(\led<0>/OUTPUT/OFF/ODDRIN1_MUX )
  );
  defparam \led<1>/PAD .LOC = "PAD85";
  X_OPAD \led<1>/PAD  (
    .PAD(led[1])
  );
  defparam led_1_OBUF.LOC = "PAD85";
  X_OBUF led_1_OBUF (
    .I(\led<1>/O ),
    .O(led[1])
  );
  defparam \led<1>/OUTPUT/OTCLK1INV .LOC = "PAD85";
  X_BUF \led<1>/OUTPUT/OTCLK1INV  (
    .I(clk_BUFGP),
    .O(\led<1>/OUTPUT/OTCLK1INV_389 )
  );
  defparam \led<1>/OUTPUT/OFF/OMUX .LOC = "PAD85";
  X_BUF \led<1>/OUTPUT/OFF/OMUX  (
    .I(led_1_391),
    .O(\led<1>/O )
  );
  defparam \led<1>/OUTPUT/OFF/OCEINV .LOC = "PAD85";
  X_BUF \led<1>/OUTPUT/OFF/OCEINV  (
    .I(led_and0000_0),
    .O(\led<1>/OUTPUT/OFF/OCEINV_390 )
  );
  defparam \led<1>/OUTPUT/OFF/O1_DDRMUX .LOC = "PAD85";
  X_BUF \led<1>/OUTPUT/OFF/O1_DDRMUX  (
    .I(\out_port<1>_0 ),
    .O(\led<1>/OUTPUT/OFF/ODDRIN1_MUX )
  );
  defparam \led<2>/PAD .LOC = "PAD90";
  X_OPAD \led<2>/PAD  (
    .PAD(led[2])
  );
  defparam led_2_OBUF.LOC = "PAD90";
  X_OBUF led_2_OBUF (
    .I(\led<2>/O ),
    .O(led[2])
  );
  defparam \led<2>/OUTPUT/OTCLK1INV .LOC = "PAD90";
  X_BUF \led<2>/OUTPUT/OTCLK1INV  (
    .I(clk_BUFGP),
    .O(\led<2>/OUTPUT/OTCLK1INV_392 )
  );
  defparam \led<2>/OUTPUT/OFF/OMUX .LOC = "PAD90";
  X_BUF \led<2>/OUTPUT/OFF/OMUX  (
    .I(led_2_394),
    .O(\led<2>/O )
  );
  defparam \led<2>/OUTPUT/OFF/OCEINV .LOC = "PAD90";
  X_BUF \led<2>/OUTPUT/OFF/OCEINV  (
    .I(led_and0000_0),
    .O(\led<2>/OUTPUT/OFF/OCEINV_393 )
  );
  defparam \led<2>/OUTPUT/OFF/O1_DDRMUX .LOC = "PAD90";
  X_BUF \led<2>/OUTPUT/OFF/O1_DDRMUX  (
    .I(\out_port<2>_0 ),
    .O(\led<2>/OUTPUT/OFF/ODDRIN1_MUX )
  );
  defparam \clk/PAD .LOC = "IPAD29";
  X_IPAD \clk/PAD  (
    .PAD(clk)
  );
  defparam \clk_BUFGP/IBUFG .LOC = "IPAD29";
  X_BUF \clk_BUFGP/IBUFG  (
    .I(clk),
    .O(\clk/INBUF )
  );
  defparam \led<3>/PAD .LOC = "PAD89";
  X_OPAD \led<3>/PAD  (
    .PAD(led[3])
  );
  defparam led_3_OBUF.LOC = "PAD89";
  X_OBUF led_3_OBUF (
    .I(\led<3>/O ),
    .O(led[3])
  );
  defparam \led<3>/OUTPUT/OTCLK1INV .LOC = "PAD89";
  X_BUF \led<3>/OUTPUT/OTCLK1INV  (
    .I(clk_BUFGP),
    .O(\led<3>/OUTPUT/OTCLK1INV_395 )
  );
  defparam \led<3>/OUTPUT/OFF/OMUX .LOC = "PAD89";
  X_BUF \led<3>/OUTPUT/OFF/OMUX  (
    .I(led_3_397),
    .O(\led<3>/O )
  );
  defparam \led<3>/OUTPUT/OFF/OCEINV .LOC = "PAD89";
  X_BUF \led<3>/OUTPUT/OFF/OCEINV  (
    .I(led_and0000_0),
    .O(\led<3>/OUTPUT/OFF/OCEINV_396 )
  );
  defparam \led<3>/OUTPUT/OFF/O1_DDRMUX .LOC = "PAD89";
  X_BUF \led<3>/OUTPUT/OFF/O1_DDRMUX  (
    .I(\out_port<3>_0 ),
    .O(\led<3>/OUTPUT/OFF/ODDRIN1_MUX )
  );
  defparam \led<4>/PAD .LOC = "PAD65";
  X_OPAD \led<4>/PAD  (
    .PAD(led[4])
  );
  defparam led_4_OBUF.LOC = "PAD65";
  X_OBUF led_4_OBUF (
    .I(\led<4>/O ),
    .O(led[4])
  );
  defparam \led<4>/OUTPUT/OTCLK1INV .LOC = "PAD65";
  X_BUF \led<4>/OUTPUT/OTCLK1INV  (
    .I(clk_BUFGP),
    .O(\led<4>/OUTPUT/OTCLK1INV_398 )
  );
  defparam \led<4>/OUTPUT/OFF/OMUX .LOC = "PAD65";
  X_BUF \led<4>/OUTPUT/OFF/OMUX  (
    .I(led_4_400),
    .O(\led<4>/O )
  );
  defparam \led<4>/OUTPUT/OFF/OCEINV .LOC = "PAD65";
  X_BUF \led<4>/OUTPUT/OFF/OCEINV  (
    .I(led_and0000_0),
    .O(\led<4>/OUTPUT/OFF/OCEINV_399 )
  );
  defparam \led<4>/OUTPUT/OFF/O1_DDRMUX .LOC = "PAD65";
  X_BUF \led<4>/OUTPUT/OFF/O1_DDRMUX  (
    .I(\out_port<4>_0 ),
    .O(\led<4>/OUTPUT/OFF/ODDRIN1_MUX )
  );
  defparam \led<5>/PAD .LOC = "PAD109";
  X_OPAD \led<5>/PAD  (
    .PAD(led[5])
  );
  defparam led_5_OBUF.LOC = "PAD109";
  X_OBUF led_5_OBUF (
    .I(\led<5>/O ),
    .O(led[5])
  );
  defparam \led<5>/OUTPUT/OTCLK1INV .LOC = "PAD109";
  X_BUF \led<5>/OUTPUT/OTCLK1INV  (
    .I(clk_BUFGP),
    .O(\led<5>/OUTPUT/OTCLK1INV_401 )
  );
  defparam \led<5>/OUTPUT/OFF/OMUX .LOC = "PAD109";
  X_BUF \led<5>/OUTPUT/OFF/OMUX  (
    .I(led_5_403),
    .O(\led<5>/O )
  );
  defparam \led<5>/OUTPUT/OFF/OCEINV .LOC = "PAD109";
  X_BUF \led<5>/OUTPUT/OFF/OCEINV  (
    .I(led_and0000_0),
    .O(\led<5>/OUTPUT/OFF/OCEINV_402 )
  );
  defparam \led<5>/OUTPUT/OFF/O1_DDRMUX .LOC = "PAD109";
  X_BUF \led<5>/OUTPUT/OFF/O1_DDRMUX  (
    .I(\out_port<5>_0 ),
    .O(\led<5>/OUTPUT/OFF/ODDRIN1_MUX )
  );
  defparam \led<6>/PAD .LOC = "PAD225";
  X_OPAD \led<6>/PAD  (
    .PAD(led[6])
  );
  defparam led_6_OBUF.LOC = "PAD225";
  X_OBUF led_6_OBUF (
    .I(\led<6>/O ),
    .O(led[6])
  );
  defparam \led<6>/OUTPUT/OTCLK1INV .LOC = "PAD225";
  X_BUF \led<6>/OUTPUT/OTCLK1INV  (
    .I(clk_BUFGP),
    .O(\led<6>/OUTPUT/OTCLK1INV_404 )
  );
  defparam \led<6>/OUTPUT/OFF/OMUX .LOC = "PAD225";
  X_BUF \led<6>/OUTPUT/OFF/OMUX  (
    .I(led_6_406),
    .O(\led<6>/O )
  );
  defparam \led<6>/OUTPUT/OFF/OCEINV .LOC = "PAD225";
  X_BUF \led<6>/OUTPUT/OFF/OCEINV  (
    .I(led_and0000_0),
    .O(\led<6>/OUTPUT/OFF/OCEINV_405 )
  );
  defparam \led<6>/OUTPUT/OFF/O1_DDRMUX .LOC = "PAD225";
  X_BUF \led<6>/OUTPUT/OFF/O1_DDRMUX  (
    .I(\out_port<6>_0 ),
    .O(\led<6>/OUTPUT/OFF/ODDRIN1_MUX )
  );
  defparam \led<7>/PAD .LOC = "PAD181";
  X_OPAD \led<7>/PAD  (
    .PAD(led[7])
  );
  defparam led_7_OBUF.LOC = "PAD181";
  X_OBUF led_7_OBUF (
    .I(\led<7>/O ),
    .O(led[7])
  );
  defparam \led<7>/OUTPUT/OTCLK1INV .LOC = "PAD181";
  X_BUF \led<7>/OUTPUT/OTCLK1INV  (
    .I(clk_BUFGP),
    .O(\led<7>/OUTPUT/OTCLK1INV_407 )
  );
  defparam \led<7>/OUTPUT/OFF/OMUX .LOC = "PAD181";
  X_BUF \led<7>/OUTPUT/OFF/OMUX  (
    .I(led_7_409),
    .O(\led<7>/O )
  );
  defparam \led<7>/OUTPUT/OFF/OCEINV .LOC = "PAD181";
  X_BUF \led<7>/OUTPUT/OFF/OCEINV  (
    .I(led_and0000_0),
    .O(\led<7>/OUTPUT/OFF/OCEINV_408 )
  );
  defparam \led<7>/OUTPUT/OFF/O1_DDRMUX .LOC = "PAD181";
  X_BUF \led<7>/OUTPUT/OFF/O1_DDRMUX  (
    .I(\out_port<7>_0 ),
    .O(\led<7>/OUTPUT/OFF/ODDRIN1_MUX )
  );
  defparam \sw<0>/PAD .LOC = "IPAD78";
  X_IPAD \sw<0>/PAD  (
    .PAD(sw[0])
  );
  defparam sw_0_IBUF.LOC = "IPAD78";
  X_BUF sw_0_IBUF (
    .I(sw[0]),
    .O(\sw<0>/INBUF )
  );
  defparam \sw<1>/PAD .LOC = "IPAD83";
  X_IPAD \sw<1>/PAD  (
    .PAD(sw[1])
  );
  defparam sw_1_IBUF.LOC = "IPAD83";
  X_BUF sw_1_IBUF (
    .I(sw[1]),
    .O(\sw<1>/INBUF )
  );
  defparam \sw<2>/PAD .LOC = "IPAD88";
  X_IPAD \sw<2>/PAD  (
    .PAD(sw[2])
  );
  defparam sw_2_IBUF.LOC = "IPAD88";
  X_BUF sw_2_IBUF (
    .I(sw[2]),
    .O(\sw<2>/INBUF )
  );
  defparam \sw<3>/PAD .LOC = "IPAD93";
  X_IPAD \sw<3>/PAD  (
    .PAD(sw[3])
  );
  defparam sw_3_IBUF.LOC = "IPAD93";
  X_BUF sw_3_IBUF (
    .I(sw[3]),
    .O(\sw<3>/INBUF )
  );
  defparam \sw<4>/PAD .LOC = "IPAD103";
  X_IPAD \sw<4>/PAD  (
    .PAD(sw[4])
  );
  defparam sw_4_IBUF.LOC = "IPAD103";
  X_BUF sw_4_IBUF (
    .I(sw[4]),
    .O(\sw<4>/INBUF )
  );
  defparam \K1/address<2>/LOGIC_ZERO .LOC = "SLICE_X55Y15";
  X_ZERO \K1/address<2>/LOGIC_ZERO  (
    .O(\K1/address<2>/LOGIC_ZERO_421 )
  );
  defparam \K1/address<2>/DXMUX .LOC = "SLICE_X55Y15";
  X_BUF \K1/address<2>/DXMUX  (
    .I(\K1/address<2>/XORF_411 ),
    .O(\K1/address<2>/DXMUX_410 )
  );
  defparam \K1/address<2>/XORF .LOC = "SLICE_X55Y15";
  X_XOR2 \K1/address<2>/XORF  (
    .I0(\K1/address<2>/CYINIT_412 ),
    .I1(\K1/processor/pc_value [2]),
    .O(\K1/address<2>/XORF_411 )
  );
  defparam \K1/address<2>/CYMUXF .LOC = "SLICE_X55Y15";
  X_MUX2 \K1/address<2>/CYMUXF  (
    .IA(\K1/address<2>/LOGIC_ZERO_421 ),
    .IB(\K1/address<2>/CYINIT_412 ),
    .SEL(\K1/address<2>/CYSELF_415 ),
    .O(\K1/processor/pc_value_carry[2] )
  );
  defparam \K1/address<2>/CYMUXF2 .LOC = "SLICE_X55Y15";
  X_MUX2 \K1/address<2>/CYMUXF2  (
    .IA(\K1/address<2>/LOGIC_ZERO_421 ),
    .IB(\K1/address<2>/LOGIC_ZERO_421 ),
    .SEL(\K1/address<2>/CYSELF_415 ),
    .O(\K1/address<2>/CYMUXF2_420 )
  );
  defparam \K1/address<2>/CYINIT .LOC = "SLICE_X55Y15";
  X_BUF \K1/address<2>/CYINIT  (
    .I(\K1/processor/pc_value_carry[1] ),
    .O(\K1/address<2>/CYINIT_412 )
  );
  defparam \K1/address<2>/CYSELF .LOC = "SLICE_X55Y15";
  X_BUF \K1/address<2>/CYSELF  (
    .I(\K1/processor/pc_value [2]),
    .O(\K1/address<2>/CYSELF_415 )
  );
  defparam \K1/address<2>/DYMUX .LOC = "SLICE_X55Y15";
  X_BUF \K1/address<2>/DYMUX  (
    .I(\K1/address<2>/XORG_414 ),
    .O(\K1/address<2>/DYMUX_413 )
  );
  defparam \K1/address<2>/XORG .LOC = "SLICE_X55Y15";
  X_XOR2 \K1/address<2>/XORG  (
    .I0(\K1/processor/pc_value_carry[2] ),
    .I1(\K1/processor/pc_value [3]),
    .O(\K1/address<2>/XORG_414 )
  );
  defparam \K1/address<2>/COUTUSED .LOC = "SLICE_X55Y15";
  X_BUF \K1/address<2>/COUTUSED  (
    .I(\K1/address<2>/CYMUXFAST_416 ),
    .O(\K1/processor/pc_value_carry[3] )
  );
  defparam \K1/address<2>/FASTCARRY .LOC = "SLICE_X55Y15";
  X_BUF \K1/address<2>/FASTCARRY  (
    .I(\K1/processor/pc_value_carry[1] ),
    .O(\K1/address<2>/FASTCARRY_418 )
  );
  defparam \K1/address<2>/CYAND .LOC = "SLICE_X55Y15";
  X_AND2 \K1/address<2>/CYAND  (
    .I0(\K1/address<2>/CYSELG_422 ),
    .I1(\K1/address<2>/CYSELF_415 ),
    .O(\K1/address<2>/CYAND_417 )
  );
  defparam \K1/address<2>/CYMUXFAST .LOC = "SLICE_X55Y15";
  X_MUX2 \K1/address<2>/CYMUXFAST  (
    .IA(\K1/address<2>/CYMUXG2_419 ),
    .IB(\K1/address<2>/FASTCARRY_418 ),
    .SEL(\K1/address<2>/CYAND_417 ),
    .O(\K1/address<2>/CYMUXFAST_416 )
  );
  defparam \K1/address<2>/CYMUXG2 .LOC = "SLICE_X55Y15";
  X_MUX2 \K1/address<2>/CYMUXG2  (
    .IA(\K1/address<2>/LOGIC_ZERO_421 ),
    .IB(\K1/address<2>/CYMUXF2_420 ),
    .SEL(\K1/address<2>/CYSELG_422 ),
    .O(\K1/address<2>/CYMUXG2_419 )
  );
  defparam \K1/address<2>/CYSELG .LOC = "SLICE_X55Y15";
  X_BUF \K1/address<2>/CYSELG  (
    .I(\K1/processor/pc_value [3]),
    .O(\K1/address<2>/CYSELG_422 )
  );
  defparam \K1/address<2>/SRINV .LOC = "SLICE_X55Y15";
  X_BUF \K1/address<2>/SRINV  (
    .I(\K1/processor/internal_reset ),
    .O(\K1/address<2>/SRINV_423 )
  );
  defparam \K1/address<2>/CLKINV .LOC = "SLICE_X55Y15";
  X_BUF \K1/address<2>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/address<2>/CLKINV_424 )
  );
  defparam \K1/address<2>/CEINV .LOC = "SLICE_X55Y15";
  X_INV \K1/address<2>/CEINV  (
    .I(\K1/processor/t_state ),
    .O(\K1/address<2>/CEINVNOT )
  );
  defparam \K1/processor/pc_loop[3].value_select_mux .INIT = 16'hFC30;
  defparam \K1/processor/pc_loop[3].value_select_mux .LOC = "SLICE_X55Y15";
  X_LUT4 \K1/processor/pc_loop[3].value_select_mux  (
    .ADR0(VCC),
    .ADR1(\K1/processor/normal_count_0 ),
    .ADR2(\K1/processor/inc_pc_vector [3]),
    .ADR3(\K1/address [3]),
    .O(\K1/processor/pc_value [3])
  );
  defparam \K1/address<4>/LOGIC_ZERO .LOC = "SLICE_X55Y16";
  X_ZERO \K1/address<4>/LOGIC_ZERO  (
    .O(\K1/address<4>/LOGIC_ZERO_436 )
  );
  defparam \K1/address<4>/DXMUX .LOC = "SLICE_X55Y16";
  X_BUF \K1/address<4>/DXMUX  (
    .I(\K1/address<4>/XORF_426 ),
    .O(\K1/address<4>/DXMUX_425 )
  );
  defparam \K1/address<4>/XORF .LOC = "SLICE_X55Y16";
  X_XOR2 \K1/address<4>/XORF  (
    .I0(\K1/address<4>/CYINIT_427 ),
    .I1(\K1/processor/pc_value [4]),
    .O(\K1/address<4>/XORF_426 )
  );
  defparam \K1/address<4>/CYMUXF .LOC = "SLICE_X55Y16";
  X_MUX2 \K1/address<4>/CYMUXF  (
    .IA(\K1/address<4>/LOGIC_ZERO_436 ),
    .IB(\K1/address<4>/CYINIT_427 ),
    .SEL(\K1/address<4>/CYSELF_430 ),
    .O(\K1/processor/pc_value_carry[4] )
  );
  defparam \K1/address<4>/CYMUXF2 .LOC = "SLICE_X55Y16";
  X_MUX2 \K1/address<4>/CYMUXF2  (
    .IA(\K1/address<4>/LOGIC_ZERO_436 ),
    .IB(\K1/address<4>/LOGIC_ZERO_436 ),
    .SEL(\K1/address<4>/CYSELF_430 ),
    .O(\K1/address<4>/CYMUXF2_435 )
  );
  defparam \K1/address<4>/CYINIT .LOC = "SLICE_X55Y16";
  X_BUF \K1/address<4>/CYINIT  (
    .I(\K1/processor/pc_value_carry[3] ),
    .O(\K1/address<4>/CYINIT_427 )
  );
  defparam \K1/address<4>/CYSELF .LOC = "SLICE_X55Y16";
  X_BUF \K1/address<4>/CYSELF  (
    .I(\K1/processor/pc_value [4]),
    .O(\K1/address<4>/CYSELF_430 )
  );
  defparam \K1/address<4>/DYMUX .LOC = "SLICE_X55Y16";
  X_BUF \K1/address<4>/DYMUX  (
    .I(\K1/address<4>/XORG_429 ),
    .O(\K1/address<4>/DYMUX_428 )
  );
  defparam \K1/address<4>/XORG .LOC = "SLICE_X55Y16";
  X_XOR2 \K1/address<4>/XORG  (
    .I0(\K1/processor/pc_value_carry[4] ),
    .I1(\K1/processor/pc_value [5]),
    .O(\K1/address<4>/XORG_429 )
  );
  defparam \K1/address<4>/COUTUSED .LOC = "SLICE_X55Y16";
  X_BUF \K1/address<4>/COUTUSED  (
    .I(\K1/address<4>/CYMUXFAST_431 ),
    .O(\K1/processor/pc_value_carry[5] )
  );
  defparam \K1/address<4>/FASTCARRY .LOC = "SLICE_X55Y16";
  X_BUF \K1/address<4>/FASTCARRY  (
    .I(\K1/processor/pc_value_carry[3] ),
    .O(\K1/address<4>/FASTCARRY_433 )
  );
  defparam \K1/address<4>/CYAND .LOC = "SLICE_X55Y16";
  X_AND2 \K1/address<4>/CYAND  (
    .I0(\K1/address<4>/CYSELG_437 ),
    .I1(\K1/address<4>/CYSELF_430 ),
    .O(\K1/address<4>/CYAND_432 )
  );
  defparam \K1/address<4>/CYMUXFAST .LOC = "SLICE_X55Y16";
  X_MUX2 \K1/address<4>/CYMUXFAST  (
    .IA(\K1/address<4>/CYMUXG2_434 ),
    .IB(\K1/address<4>/FASTCARRY_433 ),
    .SEL(\K1/address<4>/CYAND_432 ),
    .O(\K1/address<4>/CYMUXFAST_431 )
  );
  defparam \K1/address<4>/CYMUXG2 .LOC = "SLICE_X55Y16";
  X_MUX2 \K1/address<4>/CYMUXG2  (
    .IA(\K1/address<4>/LOGIC_ZERO_436 ),
    .IB(\K1/address<4>/CYMUXF2_435 ),
    .SEL(\K1/address<4>/CYSELG_437 ),
    .O(\K1/address<4>/CYMUXG2_434 )
  );
  defparam \K1/address<4>/CYSELG .LOC = "SLICE_X55Y16";
  X_BUF \K1/address<4>/CYSELG  (
    .I(\K1/processor/pc_value [5]),
    .O(\K1/address<4>/CYSELG_437 )
  );
  defparam \K1/address<4>/SRINV .LOC = "SLICE_X55Y16";
  X_BUF \K1/address<4>/SRINV  (
    .I(\K1/processor/internal_reset ),
    .O(\K1/address<4>/SRINV_438 )
  );
  defparam \K1/address<4>/CLKINV .LOC = "SLICE_X55Y16";
  X_BUF \K1/address<4>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/address<4>/CLKINV_439 )
  );
  defparam \K1/address<4>/CEINV .LOC = "SLICE_X55Y16";
  X_INV \K1/address<4>/CEINV  (
    .I(\K1/processor/t_state ),
    .O(\K1/address<4>/CEINVNOT )
  );
  defparam \K1/address<6>/LOGIC_ZERO .LOC = "SLICE_X55Y17";
  X_ZERO \K1/address<6>/LOGIC_ZERO  (
    .O(\K1/address<6>/LOGIC_ZERO_451 )
  );
  defparam \K1/address<6>/DXMUX .LOC = "SLICE_X55Y17";
  X_BUF \K1/address<6>/DXMUX  (
    .I(\K1/address<6>/XORF_441 ),
    .O(\K1/address<6>/DXMUX_440 )
  );
  defparam \K1/address<6>/XORF .LOC = "SLICE_X55Y17";
  X_XOR2 \K1/address<6>/XORF  (
    .I0(\K1/address<6>/CYINIT_442 ),
    .I1(\K1/processor/pc_value [6]),
    .O(\K1/address<6>/XORF_441 )
  );
  defparam \K1/address<6>/CYMUXF .LOC = "SLICE_X55Y17";
  X_MUX2 \K1/address<6>/CYMUXF  (
    .IA(\K1/address<6>/LOGIC_ZERO_451 ),
    .IB(\K1/address<6>/CYINIT_442 ),
    .SEL(\K1/address<6>/CYSELF_445 ),
    .O(\K1/processor/pc_value_carry[6] )
  );
  defparam \K1/address<6>/CYMUXF2 .LOC = "SLICE_X55Y17";
  X_MUX2 \K1/address<6>/CYMUXF2  (
    .IA(\K1/address<6>/LOGIC_ZERO_451 ),
    .IB(\K1/address<6>/LOGIC_ZERO_451 ),
    .SEL(\K1/address<6>/CYSELF_445 ),
    .O(\K1/address<6>/CYMUXF2_450 )
  );
  defparam \K1/address<6>/CYINIT .LOC = "SLICE_X55Y17";
  X_BUF \K1/address<6>/CYINIT  (
    .I(\K1/processor/pc_value_carry[5] ),
    .O(\K1/address<6>/CYINIT_442 )
  );
  defparam \K1/address<6>/CYSELF .LOC = "SLICE_X55Y17";
  X_BUF \K1/address<6>/CYSELF  (
    .I(\K1/processor/pc_value [6]),
    .O(\K1/address<6>/CYSELF_445 )
  );
  defparam \K1/address<6>/DYMUX .LOC = "SLICE_X55Y17";
  X_BUF \K1/address<6>/DYMUX  (
    .I(\K1/address<6>/XORG_444 ),
    .O(\K1/address<6>/DYMUX_443 )
  );
  defparam \K1/address<6>/XORG .LOC = "SLICE_X55Y17";
  X_XOR2 \K1/address<6>/XORG  (
    .I0(\K1/processor/pc_value_carry[6] ),
    .I1(\K1/processor/pc_value [7]),
    .O(\K1/address<6>/XORG_444 )
  );
  defparam \K1/address<6>/FASTCARRY .LOC = "SLICE_X55Y17";
  X_BUF \K1/address<6>/FASTCARRY  (
    .I(\K1/processor/pc_value_carry[5] ),
    .O(\K1/address<6>/FASTCARRY_448 )
  );
  defparam \K1/address<6>/CYAND .LOC = "SLICE_X55Y17";
  X_AND2 \K1/address<6>/CYAND  (
    .I0(\K1/address<6>/CYSELG_452 ),
    .I1(\K1/address<6>/CYSELF_445 ),
    .O(\K1/address<6>/CYAND_447 )
  );
  defparam \K1/address<6>/CYMUXFAST .LOC = "SLICE_X55Y17";
  X_MUX2 \K1/address<6>/CYMUXFAST  (
    .IA(\K1/address<6>/CYMUXG2_449 ),
    .IB(\K1/address<6>/FASTCARRY_448 ),
    .SEL(\K1/address<6>/CYAND_447 ),
    .O(\K1/address<6>/CYMUXFAST_446 )
  );
  defparam \K1/address<6>/CYMUXG2 .LOC = "SLICE_X55Y17";
  X_MUX2 \K1/address<6>/CYMUXG2  (
    .IA(\K1/address<6>/LOGIC_ZERO_451 ),
    .IB(\K1/address<6>/CYMUXF2_450 ),
    .SEL(\K1/address<6>/CYSELG_452 ),
    .O(\K1/address<6>/CYMUXG2_449 )
  );
  defparam \K1/address<6>/CYSELG .LOC = "SLICE_X55Y17";
  X_BUF \K1/address<6>/CYSELG  (
    .I(\K1/processor/pc_value [7]),
    .O(\K1/address<6>/CYSELG_452 )
  );
  defparam \K1/address<6>/SRINV .LOC = "SLICE_X55Y17";
  X_BUF \K1/address<6>/SRINV  (
    .I(\K1/processor/internal_reset ),
    .O(\K1/address<6>/SRINV_453 )
  );
  defparam \K1/address<6>/CLKINV .LOC = "SLICE_X55Y17";
  X_BUF \K1/address<6>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/address<6>/CLKINV_454 )
  );
  defparam \K1/address<6>/CEINV .LOC = "SLICE_X55Y17";
  X_INV \K1/address<6>/CEINV  (
    .I(\K1/processor/t_state ),
    .O(\K1/address<6>/CEINVNOT )
  );
  defparam \K1/processor/pc_loop[7].value_select_mux .INIT = 16'hFC0C;
  defparam \K1/processor/pc_loop[7].value_select_mux .LOC = "SLICE_X55Y17";
  X_LUT4 \K1/processor/pc_loop[7].value_select_mux  (
    .ADR0(VCC),
    .ADR1(\K1/processor/inc_pc_vector [7]),
    .ADR2(\K1/processor/normal_count_0 ),
    .ADR3(\K1/address [7]),
    .O(\K1/processor/pc_value [7])
  );
  defparam \K1/address<8>/LOGIC_ZERO .LOC = "SLICE_X55Y18";
  X_ZERO \K1/address<8>/LOGIC_ZERO  (
    .O(\K1/address<8>/LOGIC_ZERO_457 )
  );
  defparam \K1/address<8>/DXMUX .LOC = "SLICE_X55Y18";
  X_BUF \K1/address<8>/DXMUX  (
    .I(\K1/address<8>/XORF_456 ),
    .O(\K1/address<8>/DXMUX_455 )
  );
  defparam \K1/address<8>/XORF .LOC = "SLICE_X55Y18";
  X_XOR2 \K1/address<8>/XORF  (
    .I0(\K1/address<8>/CYINIT_458 ),
    .I1(\K1/processor/pc_value [8]),
    .O(\K1/address<8>/XORF_456 )
  );
  defparam \K1/address<8>/CYMUXF .LOC = "SLICE_X55Y18";
  X_MUX2 \K1/address<8>/CYMUXF  (
    .IA(\K1/address<8>/LOGIC_ZERO_457 ),
    .IB(\K1/address<8>/CYINIT_458 ),
    .SEL(\K1/address<8>/CYSELF_459 ),
    .O(\K1/processor/pc_value_carry[8] )
  );
  defparam \K1/address<8>/CYINIT .LOC = "SLICE_X55Y18";
  X_BUF \K1/address<8>/CYINIT  (
    .I(\K1/address<6>/CYMUXFAST_446 ),
    .O(\K1/address<8>/CYINIT_458 )
  );
  defparam \K1/address<8>/CYSELF .LOC = "SLICE_X55Y18";
  X_BUF \K1/address<8>/CYSELF  (
    .I(\K1/processor/pc_value [8]),
    .O(\K1/address<8>/CYSELF_459 )
  );
  defparam \K1/address<8>/DYMUX .LOC = "SLICE_X55Y18";
  X_BUF \K1/address<8>/DYMUX  (
    .I(\K1/address<8>/XORG_461 ),
    .O(\K1/address<8>/DYMUX_460 )
  );
  defparam \K1/address<8>/XORG .LOC = "SLICE_X55Y18";
  X_XOR2 \K1/address<8>/XORG  (
    .I0(\K1/processor/pc_value_carry[8] ),
    .I1(\K1/processor/pc_value [9]),
    .O(\K1/address<8>/XORG_461 )
  );
  defparam \K1/address<8>/SRINV .LOC = "SLICE_X55Y18";
  X_BUF \K1/address<8>/SRINV  (
    .I(\K1/processor/internal_reset ),
    .O(\K1/address<8>/SRINV_462 )
  );
  defparam \K1/address<8>/CLKINV .LOC = "SLICE_X55Y18";
  X_BUF \K1/address<8>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/address<8>/CLKINV_463 )
  );
  defparam \K1/address<8>/CEINV .LOC = "SLICE_X55Y18";
  X_INV \K1/address<8>/CEINV  (
    .I(\K1/processor/t_state ),
    .O(\K1/address<8>/CEINVNOT )
  );
  defparam \K1/processor/pc_loop[9].value_select_mux .INIT = 16'hAACC;
  defparam \K1/processor/pc_loop[9].value_select_mux .LOC = "SLICE_X55Y18";
  X_LUT4 \K1/processor/pc_loop[9].value_select_mux  (
    .ADR0(\K1/address [9]),
    .ADR1(\K1/processor/inc_pc_vector [9]),
    .ADR2(VCC),
    .ADR3(\K1/processor/normal_count_0 ),
    .O(\K1/processor/pc_value [9])
  );
  defparam \K1/processor/sel_carry<2>/CYMUXF .LOC = "SLICE_X55Y40";
  X_MUX2 \K1/processor/sel_carry<2>/CYMUXF  (
    .IA(\K1/processor/sel_carry<2>/CY0F_465 ),
    .IB(\K1/processor/sel_carry<2>/CYINIT_464 ),
    .SEL(\K1/processor/sel_carry<2>/CYSELF_466 ),
    .O(\K1/processor/sel_carry[1] )
  );
  defparam \K1/processor/sel_carry<2>/CYINIT .LOC = "SLICE_X55Y40";
  X_BUF \K1/processor/sel_carry<2>/CYINIT  (
    .I(GLOBAL_LOGIC0),
    .O(\K1/processor/sel_carry<2>/CYINIT_464 )
  );
  defparam \K1/processor/sel_carry<2>/CY0F .LOC = "SLICE_X55Y40";
  X_BUF \K1/processor/sel_carry<2>/CY0F  (
    .I(\K1/processor/shift_carry ),
    .O(\K1/processor/sel_carry<2>/CY0F_465 )
  );
  defparam \K1/processor/sel_carry<2>/CYSELF .LOC = "SLICE_X55Y40";
  X_BUF \K1/processor/sel_carry<2>/CYSELF  (
    .I(\K1/instruction<15>_rt_467 ),
    .O(\K1/processor/sel_carry<2>/CYSELF_466 )
  );
  defparam \K1/processor/sel_carry<2>/CYMUXG .LOC = "SLICE_X55Y40";
  X_MUX2 \K1/processor/sel_carry<2>/CYMUXG  (
    .IA(\K1/processor/sel_carry<2>/CY0G_469 ),
    .IB(\K1/processor/sel_carry[1] ),
    .SEL(\K1/processor/sel_carry<2>/CYSELG_470 ),
    .O(\K1/processor/sel_carry<2>/CYMUXG_468 )
  );
  defparam \K1/processor/sel_carry<2>/CY0G .LOC = "SLICE_X55Y40";
  X_BUF \K1/processor/sel_carry<2>/CY0G  (
    .I(\K1/processor/arith_carry ),
    .O(\K1/processor/sel_carry<2>/CY0G_469 )
  );
  defparam \K1/processor/sel_carry<2>/CYSELG .LOC = "SLICE_X55Y40";
  X_BUF \K1/processor/sel_carry<2>/CYSELG  (
    .I(\K1/processor/sel_arith_carry ),
    .O(\K1/processor/sel_carry<2>/CYSELG_470 )
  );
  defparam \K1/processor/sel_arith_carry_lut .INIT = 16'hF5F5;
  defparam \K1/processor/sel_arith_carry_lut .LOC = "SLICE_X55Y40";
  X_LUT4 \K1/processor/sel_arith_carry_lut  (
    .ADR0(\K1/instruction [16]),
    .ADR1(\K1/processor/arith_carry ),
    .ADR2(\K1/instruction [17]),
    .ADR3(VCC),
    .O(\K1/processor/sel_arith_carry )
  );
  defparam \K1/processor/carry_flag/CYMUXF .LOC = "SLICE_X55Y41";
  X_MUX2 \K1/processor/carry_flag/CYMUXF  (
    .IA(\K1/processor/carry_flag/CY0F_472 ),
    .IB(\K1/processor/carry_flag/CYINIT_471 ),
    .SEL(\K1/processor/carry_flag/CYSELF_473 ),
    .O(\K1/processor/sel_carry[3] )
  );
  defparam \K1/processor/carry_flag/CYINIT .LOC = "SLICE_X55Y41";
  X_BUF \K1/processor/carry_flag/CYINIT  (
    .I(\K1/processor/sel_carry<2>/CYMUXG_468 ),
    .O(\K1/processor/carry_flag/CYINIT_471 )
  );
  defparam \K1/processor/carry_flag/CY0F .LOC = "SLICE_X55Y41";
  X_BUF \K1/processor/carry_flag/CY0F  (
    .I(\K1/processor/parity ),
    .O(\K1/processor/carry_flag/CY0F_472 )
  );
  defparam \K1/processor/carry_flag/CYSELF .LOC = "SLICE_X55Y41";
  X_BUF \K1/processor/carry_flag/CYSELF  (
    .I(\K1/processor/sel_parity ),
    .O(\K1/processor/carry_flag/CYSELF_473 )
  );
  defparam \K1/processor/carry_flag/DYMUX .LOC = "SLICE_X55Y41";
  X_BUF \K1/processor/carry_flag/DYMUX  (
    .I(\K1/processor/carry_flag/XORG_475 ),
    .O(\K1/processor/carry_flag/DYMUX_474 )
  );
  defparam \K1/processor/carry_flag/XORG .LOC = "SLICE_X55Y41";
  X_XOR2 \K1/processor/carry_flag/XORG  (
    .I0(\K1/processor/sel_carry[3] ),
    .I1(\K1/processor/carry_flag/G ),
    .O(\K1/processor/carry_flag/XORG_475 )
  );
  defparam \K1/processor/carry_flag/SRINV .LOC = "SLICE_X55Y41";
  X_BUF \K1/processor/carry_flag/SRINV  (
    .I(\K1/processor/internal_reset ),
    .O(\K1/processor/carry_flag/SRINV_476 )
  );
  defparam \K1/processor/carry_flag/CLKINV .LOC = "SLICE_X55Y41";
  X_BUF \K1/processor/carry_flag/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/carry_flag/CLKINV_477 )
  );
  defparam \K1/processor/carry_flag/CEINV .LOC = "SLICE_X55Y41";
  X_BUF \K1/processor/carry_flag/CEINV  (
    .I(\K1/processor/flag_enable_0 ),
    .O(\K1/processor/carry_flag/CEINV_478 )
  );
  defparam \K1/processor/stack_address<0>/DXMUX .LOC = "SLICE_X54Y20";
  X_BUF \K1/processor/stack_address<0>/DXMUX  (
    .I(\K1/processor/stack_address<0>/XORF_480 ),
    .O(\K1/processor/stack_address<0>/DXMUX_479 )
  );
  defparam \K1/processor/stack_address<0>/XORF .LOC = "SLICE_X54Y20";
  X_XOR2 \K1/processor/stack_address<0>/XORF  (
    .I0(\K1/processor/stack_address<0>/CYINIT_481 ),
    .I1(\K1/processor/half_stack_address [0]),
    .O(\K1/processor/stack_address<0>/XORF_480 )
  );
  defparam \K1/processor/stack_address<0>/CYMUXF .LOC = "SLICE_X54Y20";
  X_MUX2 \K1/processor/stack_address<0>/CYMUXF  (
    .IA(\K1/processor/stack_address<0>/CY0F_482 ),
    .IB(\K1/processor/stack_address<0>/CYINIT_481 ),
    .SEL(\K1/processor/stack_address<0>/CYSELF_483 ),
    .O(\K1/processor/stack_address_carry [0])
  );
  defparam \K1/processor/stack_address<0>/CYINIT .LOC = "SLICE_X54Y20";
  X_BUF \K1/processor/stack_address<0>/CYINIT  (
    .I(GLOBAL_LOGIC0),
    .O(\K1/processor/stack_address<0>/CYINIT_481 )
  );
  defparam \K1/processor/stack_address<0>/CY0F .LOC = "SLICE_X54Y20";
  X_BUF \K1/processor/stack_address<0>/CY0F  (
    .I(\K1/processor/stack_address [0]),
    .O(\K1/processor/stack_address<0>/CY0F_482 )
  );
  defparam \K1/processor/stack_address<0>/CYSELF .LOC = "SLICE_X54Y20";
  X_BUF \K1/processor/stack_address<0>/CYSELF  (
    .I(\K1/processor/half_stack_address [0]),
    .O(\K1/processor/stack_address<0>/CYSELF_483 )
  );
  defparam \K1/processor/stack_address<0>/DYMUX .LOC = "SLICE_X54Y20";
  X_BUF \K1/processor/stack_address<0>/DYMUX  (
    .I(\K1/processor/stack_address<0>/XORG_485 ),
    .O(\K1/processor/stack_address<0>/DYMUX_484 )
  );
  defparam \K1/processor/stack_address<0>/XORG .LOC = "SLICE_X54Y20";
  X_XOR2 \K1/processor/stack_address<0>/XORG  (
    .I0(\K1/processor/stack_address_carry [0]),
    .I1(\K1/processor/half_stack_address [1]),
    .O(\K1/processor/stack_address<0>/XORG_485 )
  );
  defparam \K1/processor/stack_address<0>/COUTUSED .LOC = "SLICE_X54Y20";
  X_BUF \K1/processor/stack_address<0>/COUTUSED  (
    .I(\K1/processor/stack_address<0>/CYMUXG_486 ),
    .O(\K1/processor/stack_address_carry [1])
  );
  defparam \K1/processor/stack_address<0>/CYMUXG .LOC = "SLICE_X54Y20";
  X_MUX2 \K1/processor/stack_address<0>/CYMUXG  (
    .IA(\K1/processor/stack_address<0>/CY0G_487 ),
    .IB(\K1/processor/stack_address_carry [0]),
    .SEL(\K1/processor/stack_address<0>/CYSELG_488 ),
    .O(\K1/processor/stack_address<0>/CYMUXG_486 )
  );
  defparam \K1/processor/stack_address<0>/CY0G .LOC = "SLICE_X54Y20";
  X_BUF \K1/processor/stack_address<0>/CY0G  (
    .I(\K1/processor/stack_address [1]),
    .O(\K1/processor/stack_address<0>/CY0G_487 )
  );
  defparam \K1/processor/stack_address<0>/CYSELG .LOC = "SLICE_X54Y20";
  X_BUF \K1/processor/stack_address<0>/CYSELG  (
    .I(\K1/processor/half_stack_address [1]),
    .O(\K1/processor/stack_address<0>/CYSELG_488 )
  );
  defparam \K1/processor/stack_address<0>/SRINV .LOC = "SLICE_X54Y20";
  X_BUF \K1/processor/stack_address<0>/SRINV  (
    .I(\K1/processor/internal_reset ),
    .O(\K1/processor/stack_address<0>/SRINV_489 )
  );
  defparam \K1/processor/stack_address<0>/CLKINV .LOC = "SLICE_X54Y20";
  X_BUF \K1/processor/stack_address<0>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/stack_address<0>/CLKINV_490 )
  );
  defparam \K1/processor/stack_count_loop[1].mid_stack_count.count_lut .INIT = 16'hA999;
  defparam \K1/processor/stack_count_loop[1].mid_stack_count.count_lut .LOC = "SLICE_X54Y20";
  X_LUT4 \K1/processor/stack_count_loop[1].mid_stack_count.count_lut  (
    .ADR0(\K1/processor/stack_address [1]),
    .ADR1(\K1/processor/t_state ),
    .ADR2(\K1/processor/call_type ),
    .ADR3(\K1/processor/valid_to_move_0 ),
    .O(\K1/processor/half_stack_address [1])
  );
  defparam \K1/processor/stack_address<2>/DXMUX .LOC = "SLICE_X54Y21";
  X_BUF \K1/processor/stack_address<2>/DXMUX  (
    .I(\K1/processor/stack_address<2>/XORF_492 ),
    .O(\K1/processor/stack_address<2>/DXMUX_491 )
  );
  defparam \K1/processor/stack_address<2>/XORF .LOC = "SLICE_X54Y21";
  X_XOR2 \K1/processor/stack_address<2>/XORF  (
    .I0(\K1/processor/stack_address<2>/CYINIT_493 ),
    .I1(\K1/processor/half_stack_address [2]),
    .O(\K1/processor/stack_address<2>/XORF_492 )
  );
  defparam \K1/processor/stack_address<2>/CYMUXF .LOC = "SLICE_X54Y21";
  X_MUX2 \K1/processor/stack_address<2>/CYMUXF  (
    .IA(\K1/processor/stack_address<2>/CY0F_494 ),
    .IB(\K1/processor/stack_address<2>/CYINIT_493 ),
    .SEL(\K1/processor/stack_address<2>/CYSELF_497 ),
    .O(\K1/processor/stack_address_carry [2])
  );
  defparam \K1/processor/stack_address<2>/CYMUXF2 .LOC = "SLICE_X54Y21";
  X_MUX2 \K1/processor/stack_address<2>/CYMUXF2  (
    .IA(\K1/processor/stack_address<2>/CY0F_494 ),
    .IB(\K1/processor/stack_address<2>/CY0F_494 ),
    .SEL(\K1/processor/stack_address<2>/CYSELF_497 ),
    .O(\K1/processor/stack_address<2>/CYMUXF2_502 )
  );
  defparam \K1/processor/stack_address<2>/CYINIT .LOC = "SLICE_X54Y21";
  X_BUF \K1/processor/stack_address<2>/CYINIT  (
    .I(\K1/processor/stack_address_carry [1]),
    .O(\K1/processor/stack_address<2>/CYINIT_493 )
  );
  defparam \K1/processor/stack_address<2>/CY0F .LOC = "SLICE_X54Y21";
  X_BUF \K1/processor/stack_address<2>/CY0F  (
    .I(\K1/processor/stack_address [2]),
    .O(\K1/processor/stack_address<2>/CY0F_494 )
  );
  defparam \K1/processor/stack_address<2>/CYSELF .LOC = "SLICE_X54Y21";
  X_BUF \K1/processor/stack_address<2>/CYSELF  (
    .I(\K1/processor/half_stack_address [2]),
    .O(\K1/processor/stack_address<2>/CYSELF_497 )
  );
  defparam \K1/processor/stack_address<2>/DYMUX .LOC = "SLICE_X54Y21";
  X_BUF \K1/processor/stack_address<2>/DYMUX  (
    .I(\K1/processor/stack_address<2>/XORG_496 ),
    .O(\K1/processor/stack_address<2>/DYMUX_495 )
  );
  defparam \K1/processor/stack_address<2>/XORG .LOC = "SLICE_X54Y21";
  X_XOR2 \K1/processor/stack_address<2>/XORG  (
    .I0(\K1/processor/stack_address_carry [2]),
    .I1(\K1/processor/half_stack_address [3]),
    .O(\K1/processor/stack_address<2>/XORG_496 )
  );
  defparam \K1/processor/stack_address<2>/FASTCARRY .LOC = "SLICE_X54Y21";
  X_BUF \K1/processor/stack_address<2>/FASTCARRY  (
    .I(\K1/processor/stack_address_carry [1]),
    .O(\K1/processor/stack_address<2>/FASTCARRY_500 )
  );
  defparam \K1/processor/stack_address<2>/CYAND .LOC = "SLICE_X54Y21";
  X_AND2 \K1/processor/stack_address<2>/CYAND  (
    .I0(\K1/processor/stack_address<2>/CYSELG_504 ),
    .I1(\K1/processor/stack_address<2>/CYSELF_497 ),
    .O(\K1/processor/stack_address<2>/CYAND_499 )
  );
  defparam \K1/processor/stack_address<2>/CYMUXFAST .LOC = "SLICE_X54Y21";
  X_MUX2 \K1/processor/stack_address<2>/CYMUXFAST  (
    .IA(\K1/processor/stack_address<2>/CYMUXG2_501 ),
    .IB(\K1/processor/stack_address<2>/FASTCARRY_500 ),
    .SEL(\K1/processor/stack_address<2>/CYAND_499 ),
    .O(\K1/processor/stack_address<2>/CYMUXFAST_498 )
  );
  defparam \K1/processor/stack_address<2>/CYMUXG2 .LOC = "SLICE_X54Y21";
  X_MUX2 \K1/processor/stack_address<2>/CYMUXG2  (
    .IA(\K1/processor/stack_address<2>/CY0G_503 ),
    .IB(\K1/processor/stack_address<2>/CYMUXF2_502 ),
    .SEL(\K1/processor/stack_address<2>/CYSELG_504 ),
    .O(\K1/processor/stack_address<2>/CYMUXG2_501 )
  );
  defparam \K1/processor/stack_address<2>/CY0G .LOC = "SLICE_X54Y21";
  X_BUF \K1/processor/stack_address<2>/CY0G  (
    .I(\K1/processor/stack_address [3]),
    .O(\K1/processor/stack_address<2>/CY0G_503 )
  );
  defparam \K1/processor/stack_address<2>/CYSELG .LOC = "SLICE_X54Y21";
  X_BUF \K1/processor/stack_address<2>/CYSELG  (
    .I(\K1/processor/half_stack_address [3]),
    .O(\K1/processor/stack_address<2>/CYSELG_504 )
  );
  defparam \K1/processor/stack_address<2>/SRINV .LOC = "SLICE_X54Y21";
  X_BUF \K1/processor/stack_address<2>/SRINV  (
    .I(\K1/processor/internal_reset ),
    .O(\K1/processor/stack_address<2>/SRINV_505 )
  );
  defparam \K1/processor/stack_address<2>/CLKINV .LOC = "SLICE_X54Y21";
  X_BUF \K1/processor/stack_address<2>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/stack_address<2>/CLKINV_506 )
  );
  defparam \K1/processor/stack_count_loop[3].mid_stack_count.count_lut .INIT = 16'hA999;
  defparam \K1/processor/stack_count_loop[3].mid_stack_count.count_lut .LOC = "SLICE_X54Y21";
  X_LUT4 \K1/processor/stack_count_loop[3].mid_stack_count.count_lut  (
    .ADR0(\K1/processor/stack_address [3]),
    .ADR1(\K1/processor/t_state ),
    .ADR2(\K1/processor/call_type ),
    .ADR3(\K1/processor/valid_to_move_0 ),
    .O(\K1/processor/half_stack_address [3])
  );
  defparam \K1/processor/high_zero_carry/LOGIC_ZERO .LOC = "SLICE_X64Y40";
  X_ZERO \K1/processor/high_zero_carry/LOGIC_ZERO  (
    .O(\K1/processor/high_zero_carry/LOGIC_ZERO_510 )
  );
  defparam \K1/processor/high_zero_carry/CYMUXF .LOC = "SLICE_X64Y40";
  X_MUX2 \K1/processor/high_zero_carry/CYMUXF  (
    .IA(\K1/processor/high_zero_carry/LOGIC_ZERO_510 ),
    .IB(\K1/processor/high_zero_carry/CYINIT_507 ),
    .SEL(\K1/processor/high_zero_carry/CYSELF_508 ),
    .O(\K1/processor/low_zero_carry )
  );
  defparam \K1/processor/high_zero_carry/CYINIT .LOC = "SLICE_X64Y40";
  X_BUF \K1/processor/high_zero_carry/CYINIT  (
    .I(GLOBAL_LOGIC1),
    .O(\K1/processor/high_zero_carry/CYINIT_507 )
  );
  defparam \K1/processor/high_zero_carry/CYSELF .LOC = "SLICE_X64Y40";
  X_BUF \K1/processor/high_zero_carry/CYSELF  (
    .I(\K1/processor/low_zero ),
    .O(\K1/processor/high_zero_carry/CYSELF_508 )
  );
  defparam \K1/processor/high_zero_carry/CYMUXG .LOC = "SLICE_X64Y40";
  X_MUX2 \K1/processor/high_zero_carry/CYMUXG  (
    .IA(\K1/processor/high_zero_carry/LOGIC_ZERO_510 ),
    .IB(\K1/processor/low_zero_carry ),
    .SEL(\K1/processor/high_zero_carry/CYSELG_511 ),
    .O(\K1/processor/high_zero_carry/CYMUXG_509 )
  );
  defparam \K1/processor/high_zero_carry/CYSELG .LOC = "SLICE_X64Y40";
  X_BUF \K1/processor/high_zero_carry/CYSELG  (
    .I(\K1/processor/high_zero ),
    .O(\K1/processor/high_zero_carry/CYSELG_511 )
  );
  defparam \sw<5>/PAD .LOC = "IPAD98";
  X_IPAD \sw<5>/PAD  (
    .PAD(sw[5])
  );
  defparam sw_5_IBUF.LOC = "IPAD98";
  X_BUF sw_5_IBUF (
    .I(sw[5]),
    .O(\sw<5>/INBUF )
  );
  defparam \sw<6>/PAD .LOC = "IPAD108";
  X_IPAD \sw<6>/PAD  (
    .PAD(sw[6])
  );
  defparam sw_6_IBUF.LOC = "IPAD108";
  X_BUF sw_6_IBUF (
    .I(sw[6]),
    .O(\sw<6>/INBUF )
  );
  defparam \sw<7>/PAD .LOC = "IPAD112";
  X_IPAD \sw<7>/PAD  (
    .PAD(sw[7])
  );
  defparam sw_7_IBUF.LOC = "IPAD112";
  X_BUF sw_7_IBUF (
    .I(sw[7]),
    .O(\sw<7>/INBUF )
  );
  defparam \clk_BUFGP/BUFG .LOC = "BUFGMUX_X2Y11";
  X_BUFGMUX \clk_BUFGP/BUFG  (
    .I0(\clk_BUFGP/BUFG/I0_INV ),
    .I1(GND),
    .S(\clk_BUFGP/BUFG/S_INVNOT ),
    .O(clk_BUFGP)
  );
  defparam \clk_BUFGP/BUFG/SINV .LOC = "BUFGMUX_X2Y11";
  X_INV \clk_BUFGP/BUFG/SINV  (
    .I(GLOBAL_LOGIC1),
    .O(\clk_BUFGP/BUFG/S_INVNOT )
  );
  defparam \clk_BUFGP/BUFG/I0_USED .LOC = "BUFGMUX_X2Y11";
  X_BUF \clk_BUFGP/BUFG/I0_USED  (
    .I(\clk/INBUF ),
    .O(\clk_BUFGP/BUFG/I0_INV )
  );
  defparam \K1/program/ram_1024_x_18 .INIT_00 = 256'h0000000000000000000000004000C20182019210020601060106112012004000;
  defparam \K1/program/ram_1024_x_18 .INIT_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_14 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_15 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_16 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_17 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_18 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_19 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_1A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_1B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_1C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_1D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_1E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_1F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_20 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_21 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_22 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_23 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_24 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_25 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_26 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_27 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_28 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_29 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_2A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_2B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_2C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_2D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_2E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_2F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_30 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_31 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_32 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_33 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_34 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_35 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_36 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_37 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_38 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_39 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_3A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_3B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_3C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_3D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_3E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INIT_3F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INITP_00 = 256'h00000000000000000000000000000000000000000000000000000000000E5A80;
  defparam \K1/program/ram_1024_x_18 .INITP_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INITP_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INITP_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INITP_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INITP_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INITP_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .INITP_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \K1/program/ram_1024_x_18 .SRVAL = 20'h00000;
  defparam \K1/program/ram_1024_x_18 .INIT = 20'h00000;
  defparam \K1/program/ram_1024_x_18 .WRITE_MODE = "WRITE_FIRST";
  defparam \K1/program/ram_1024_x_18 .LOC = "RAMB16_X1Y2";
  X_RAMB16_S18 \K1/program/ram_1024_x_18  (
    .CLK(clk_BUFGP),
    .EN(GLOBAL_LOGIC1),
    .SSR(GLOBAL_LOGIC0),
    .WE(GLOBAL_LOGIC0),
    .ADDR({\K1/address [9], \K1/address [8], \K1/address [7], \K1/address [6], \K1/address [5], \K1/address [4], \K1/address [3], \K1/address [2], 
\K1/address [1], \K1/address [0]}),
    .DI({\K1/program/ram_1024_x_18/DIA15 , \K1/program/ram_1024_x_18/DIA14 , \K1/program/ram_1024_x_18/DIA13 , \K1/program/ram_1024_x_18/DIA12 , 
\K1/program/ram_1024_x_18/DIA11 , \K1/program/ram_1024_x_18/DIA10 , \K1/program/ram_1024_x_18/DIA9 , \K1/program/ram_1024_x_18/DIA8 , 
\K1/program/ram_1024_x_18/DIA7 , \K1/program/ram_1024_x_18/DIA6 , \K1/program/ram_1024_x_18/DIA5 , \K1/program/ram_1024_x_18/DIA4 , 
\K1/program/ram_1024_x_18/DIA3 , \K1/program/ram_1024_x_18/DIA2 , \K1/program/ram_1024_x_18/DIA1 , \K1/program/ram_1024_x_18/DIA0 }),
    .DIP({\K1/program/ram_1024_x_18/DIPA1 , \K1/program/ram_1024_x_18/DIPA0 }),
    .DO({\K1/instruction [15], \K1/instruction [14], \K1/instruction [13], \K1/instruction [12], \K1/instruction [11], \K1/instruction [10], 
\K1/instruction [9], \K1/instruction [8], \K1/instruction [7], \K1/instruction [6], \K1/instruction [5], \K1/instruction [4], \K1/instruction [3], 
\K1/instruction [2], \K1/instruction [1], \K1/instruction [0]}),
    .DOP({\K1/instruction [17], \K1/instruction [16]})
  );
  defparam \K1/processor/shift_in/XUSED .LOC = "SLICE_X55Y38";
  X_BUF \K1/processor/shift_in/XUSED  (
    .I(\K1/processor/shift_in/F5MUX_512 ),
    .O(\K1/processor/shift_in )
  );
  defparam \K1/processor/shift_in/F5MUX .LOC = "SLICE_X55Y38";
  X_MUX2 \K1/processor/shift_in/F5MUX  (
    .IA(\K1/processor/low_shift_in ),
    .IB(\K1/processor/high_shift_in ),
    .SEL(\K1/processor/shift_in/BXINV_513 ),
    .O(\K1/processor/shift_in/F5MUX_512 )
  );
  defparam \K1/processor/shift_in/BXINV .LOC = "SLICE_X55Y38";
  X_BUF \K1/processor/shift_in/BXINV  (
    .I(\K1/instruction [2]),
    .O(\K1/processor/shift_in/BXINV_513 )
  );
  defparam \K1/processor/alu_result<6>/XUSED .LOC = "SLICE_X55Y47";
  X_BUF \K1/processor/alu_result<6>/XUSED  (
    .I(\K1/processor/alu_result<6>/F5MUX_514 ),
    .O(\K1/processor/alu_result [6])
  );
  defparam \K1/processor/alu_result<6>/F5MUX .LOC = "SLICE_X55Y47";
  X_MUX2 \K1/processor/alu_result<6>/F5MUX  (
    .IA(\K1/processor/alu_group [6]),
    .IB(\K1/processor/input_group [6]),
    .SEL(\K1/processor/alu_result<6>/BXINV_515 ),
    .O(\K1/processor/alu_result<6>/F5MUX_514 )
  );
  defparam \K1/processor/alu_result<6>/BXINV .LOC = "SLICE_X55Y47";
  X_BUF \K1/processor/alu_result<6>/BXINV  (
    .I(\K1/processor/sel_group ),
    .O(\K1/processor/alu_result<6>/BXINV_515 )
  );
  defparam \K1/processor/alu_result<5>/XUSED .LOC = "SLICE_X65Y46";
  X_BUF \K1/processor/alu_result<5>/XUSED  (
    .I(\K1/processor/alu_result<5>/F5MUX_516 ),
    .O(\K1/processor/alu_result [5])
  );
  defparam \K1/processor/alu_result<5>/F5MUX .LOC = "SLICE_X65Y46";
  X_MUX2 \K1/processor/alu_result<5>/F5MUX  (
    .IA(\K1/processor/alu_group [5]),
    .IB(\K1/processor/input_group [5]),
    .SEL(\K1/processor/alu_result<5>/BXINV_517 ),
    .O(\K1/processor/alu_result<5>/F5MUX_516 )
  );
  defparam \K1/processor/alu_result<5>/BXINV .LOC = "SLICE_X65Y46";
  X_BUF \K1/processor/alu_result<5>/BXINV  (
    .I(\K1/processor/sel_group ),
    .O(\K1/processor/alu_result<5>/BXINV_517 )
  );
  defparam \K1/processor/alu_result<4>/XUSED .LOC = "SLICE_X65Y47";
  X_BUF \K1/processor/alu_result<4>/XUSED  (
    .I(\K1/processor/alu_result<4>/F5MUX_518 ),
    .O(\K1/processor/alu_result [4])
  );
  defparam \K1/processor/alu_result<4>/F5MUX .LOC = "SLICE_X65Y47";
  X_MUX2 \K1/processor/alu_result<4>/F5MUX  (
    .IA(\K1/processor/alu_group [4]),
    .IB(\K1/processor/input_group [4]),
    .SEL(\K1/processor/alu_result<4>/BXINV_519 ),
    .O(\K1/processor/alu_result<4>/F5MUX_518 )
  );
  defparam \K1/processor/alu_result<4>/BXINV .LOC = "SLICE_X65Y47";
  X_BUF \K1/processor/alu_result<4>/BXINV  (
    .I(\K1/processor/sel_group ),
    .O(\K1/processor/alu_result<4>/BXINV_519 )
  );
  defparam \K1/processor/alu_result<3>/XUSED .LOC = "SLICE_X64Y44";
  X_BUF \K1/processor/alu_result<3>/XUSED  (
    .I(\K1/processor/alu_result<3>/F5MUX_520 ),
    .O(\K1/processor/alu_result [3])
  );
  defparam \K1/processor/alu_result<3>/F5MUX .LOC = "SLICE_X64Y44";
  X_MUX2 \K1/processor/alu_result<3>/F5MUX  (
    .IA(\K1/processor/alu_group [3]),
    .IB(\K1/processor/input_group [3]),
    .SEL(\K1/processor/alu_result<3>/BXINV_521 ),
    .O(\K1/processor/alu_result<3>/F5MUX_520 )
  );
  defparam \K1/processor/alu_result<3>/BXINV .LOC = "SLICE_X64Y44";
  X_BUF \K1/processor/alu_result<3>/BXINV  (
    .I(\K1/processor/sel_group ),
    .O(\K1/processor/alu_result<3>/BXINV_521 )
  );
  defparam \K1/processor/alu_result<2>/XUSED .LOC = "SLICE_X64Y46";
  X_BUF \K1/processor/alu_result<2>/XUSED  (
    .I(\K1/processor/alu_result<2>/F5MUX_522 ),
    .O(\K1/processor/alu_result [2])
  );
  defparam \K1/processor/alu_result<2>/F5MUX .LOC = "SLICE_X64Y46";
  X_MUX2 \K1/processor/alu_result<2>/F5MUX  (
    .IA(\K1/processor/alu_group [2]),
    .IB(\K1/processor/input_group [2]),
    .SEL(\K1/processor/alu_result<2>/BXINV_523 ),
    .O(\K1/processor/alu_result<2>/F5MUX_522 )
  );
  defparam \K1/processor/alu_result<2>/BXINV .LOC = "SLICE_X64Y46";
  X_BUF \K1/processor/alu_result<2>/BXINV  (
    .I(\K1/processor/sel_group ),
    .O(\K1/processor/alu_result<2>/BXINV_523 )
  );
  defparam \K1/processor/alu_result<1>/XUSED .LOC = "SLICE_X65Y49";
  X_BUF \K1/processor/alu_result<1>/XUSED  (
    .I(\K1/processor/alu_result<1>/F5MUX_524 ),
    .O(\K1/processor/alu_result [1])
  );
  defparam \K1/processor/alu_result<1>/F5MUX .LOC = "SLICE_X65Y49";
  X_MUX2 \K1/processor/alu_result<1>/F5MUX  (
    .IA(\K1/processor/alu_group [1]),
    .IB(\K1/processor/input_group [1]),
    .SEL(\K1/processor/alu_result<1>/BXINV_525 ),
    .O(\K1/processor/alu_result<1>/F5MUX_524 )
  );
  defparam \K1/processor/alu_result<1>/BXINV .LOC = "SLICE_X65Y49";
  X_BUF \K1/processor/alu_result<1>/BXINV  (
    .I(\K1/processor/sel_group ),
    .O(\K1/processor/alu_result<1>/BXINV_525 )
  );
  defparam \K1/processor/alu_result<0>/XUSED .LOC = "SLICE_X64Y47";
  X_BUF \K1/processor/alu_result<0>/XUSED  (
    .I(\K1/processor/alu_result<0>/F5MUX_526 ),
    .O(\K1/processor/alu_result [0])
  );
  defparam \K1/processor/alu_result<0>/F5MUX .LOC = "SLICE_X64Y47";
  X_MUX2 \K1/processor/alu_result<0>/F5MUX  (
    .IA(\K1/processor/alu_group [0]),
    .IB(\K1/processor/input_group [0]),
    .SEL(\K1/processor/alu_result<0>/BXINV_527 ),
    .O(\K1/processor/alu_result<0>/F5MUX_526 )
  );
  defparam \K1/processor/alu_result<0>/BXINV .LOC = "SLICE_X64Y47";
  X_BUF \K1/processor/alu_result<0>/BXINV  (
    .I(\K1/processor/sel_group ),
    .O(\K1/processor/alu_result<0>/BXINV_527 )
  );
  defparam \K1/processor/alu_result<7>/XUSED .LOC = "SLICE_X65Y44";
  X_BUF \K1/processor/alu_result<7>/XUSED  (
    .I(\K1/processor/alu_result<7>/F5MUX_528 ),
    .O(\K1/processor/alu_result [7])
  );
  defparam \K1/processor/alu_result<7>/F5MUX .LOC = "SLICE_X65Y44";
  X_MUX2 \K1/processor/alu_result<7>/F5MUX  (
    .IA(\K1/processor/alu_group [7]),
    .IB(\K1/processor/input_group [7]),
    .SEL(\K1/processor/alu_result<7>/BXINV_529 ),
    .O(\K1/processor/alu_result<7>/F5MUX_528 )
  );
  defparam \K1/processor/alu_result<7>/BXINV .LOC = "SLICE_X65Y44";
  X_BUF \K1/processor/alu_result<7>/BXINV  (
    .I(\K1/processor/sel_group ),
    .O(\K1/processor/alu_result<7>/BXINV_529 )
  );
  defparam \led_and0000/XUSED .LOC = "SLICE_X55Y50";
  X_BUF \led_and0000/XUSED  (
    .I(led_and0000),
    .O(led_and0000_0)
  );
  defparam \led_and0000/YUSED .LOC = "SLICE_X55Y50";
  X_BUF \led_and0000/YUSED  (
    .I(\led_and000027/O_pack_1 ),
    .O(\led_and000027/O )
  );
  defparam led_and000027.INIT = 16'h0001;
  defparam led_and000027.LOC = "SLICE_X55Y50";
  X_LUT4 led_and000027 (
    .ADR0(port_id[1]),
    .ADR1(port_id[4]),
    .ADR2(port_id[2]),
    .ADR3(port_id[3]),
    .O(\led_and000027/O_pack_1 )
  );
  defparam \K1/processor/shift_result<7>/DXMUX .LOC = "SLICE_X55Y46";
  X_BUF \K1/processor/shift_result<7>/DXMUX  (
    .I(\K1/processor/shift_value [7]),
    .O(\K1/processor/shift_result<7>/DXMUX_530 )
  );
  defparam \K1/processor/shift_result<7>/DYMUX .LOC = "SLICE_X55Y46";
  X_BUF \K1/processor/shift_result<7>/DYMUX  (
    .I(\K1/processor/shift_value [6]),
    .O(\K1/processor/shift_result<7>/DYMUX_531 )
  );
  defparam \K1/processor/shift_result<7>/SRINV .LOC = "SLICE_X55Y46";
  X_INV \K1/processor/shift_result<7>/SRINV  (
    .I(\K1/instruction [17]),
    .O(\K1/processor/shift_result<7>/SRINVNOT )
  );
  defparam \K1/processor/shift_result<7>/CLKINV .LOC = "SLICE_X55Y46";
  X_BUF \K1/processor/shift_result<7>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/shift_result<7>/CLKINV_532 )
  );
  defparam \K1/processor/shift_loop[6].mid_shift.shift_mux_lut .INIT = 16'hFC0C;
  defparam \K1/processor/shift_loop[6].mid_shift.shift_mux_lut .LOC = "SLICE_X55Y46";
  X_LUT4 \K1/processor/shift_loop[6].mid_shift.shift_mux_lut  (
    .ADR0(VCC),
    .ADR1(\out_port<5>_0 ),
    .ADR2(\K1/instruction [3]),
    .ADR3(\out_port<7>_0 ),
    .O(\K1/processor/shift_value [6])
  );
  defparam \K1/processor/shift_carry/DYMUX .LOC = "SLICE_X55Y39";
  X_BUF \K1/processor/shift_carry/DYMUX  (
    .I(\K1/processor/shift_carry_value ),
    .O(\K1/processor/shift_carry/DYMUX_533 )
  );
  defparam \K1/processor/shift_carry/CLKINV .LOC = "SLICE_X55Y39";
  X_BUF \K1/processor/shift_carry/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/shift_carry/CLKINV_534 )
  );
  defparam \K1/processor/shift_carry_lut .INIT = 16'hFC0C;
  defparam \K1/processor/shift_carry_lut .LOC = "SLICE_X55Y39";
  X_LUT4 \K1/processor/shift_carry_lut  (
    .ADR0(VCC),
    .ADR1(\out_port<7>_0 ),
    .ADR2(\K1/instruction [3]),
    .ADR3(\out_port<0>_0 ),
    .O(\K1/processor/shift_carry_value )
  );
  defparam \K1/processor/flag_write/XUSED .LOC = "SLICE_X55Y26";
  X_BUF \K1/processor/flag_write/XUSED  (
    .I(\K1/processor/push_or_pop_type ),
    .O(\K1/processor/push_or_pop_type_0 )
  );
  defparam \K1/processor/flag_write/DYMUX .LOC = "SLICE_X55Y26";
  X_BUF \K1/processor/flag_write/DYMUX  (
    .I(\K1/processor/flag_type ),
    .O(\K1/processor/flag_write/DYMUX_535 )
  );
  defparam \K1/processor/flag_write/CLKINV .LOC = "SLICE_X55Y26";
  X_BUF \K1/processor/flag_write/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/flag_write/CLKINV_536 )
  );
  defparam \K1/processor/flag_type_lut .INIT = 16'h54D6;
  defparam \K1/processor/flag_type_lut .LOC = "SLICE_X55Y26";
  X_LUT4 \K1/processor/flag_type_lut  (
    .ADR0(\K1/instruction [17]),
    .ADR1(\K1/instruction [16]),
    .ADR2(\K1/instruction [15]),
    .ADR3(\K1/instruction [14]),
    .O(\K1/processor/flag_type )
  );
  defparam \K1/processor/logical_result<0>/XUSED .LOC = "SLICE_X54Y36";
  X_BUF \K1/processor/logical_result<0>/XUSED  (
    .I(\K1/processor/memory_enable ),
    .O(\K1/processor/memory_enable_0 )
  );
  defparam \K1/processor/logical_result<0>/DYMUX .LOC = "SLICE_X54Y36";
  X_BUF \K1/processor/logical_result<0>/DYMUX  (
    .I(\K1/processor/logical_value [0]),
    .O(\K1/processor/logical_result<0>/DYMUX_537 )
  );
  defparam \K1/processor/logical_result<0>/SRINV .LOC = "SLICE_X54Y36";
  X_BUF \K1/processor/logical_result<0>/SRINV  (
    .I(\K1/processor/sel_logical_0 ),
    .O(\K1/processor/logical_result<0>/SRINV_538 )
  );
  defparam \K1/processor/logical_result<0>/CLKINV .LOC = "SLICE_X54Y36";
  X_BUF \K1/processor/logical_result<0>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/logical_result<0>/CLKINV_539 )
  );
  defparam \K1/processor/register_write/DXMUX .LOC = "SLICE_X55Y34";
  X_BUF \K1/processor/register_write/DXMUX  (
    .I(\K1/processor/register_type ),
    .O(\K1/processor/register_write/DXMUX_540 )
  );
  defparam \K1/processor/register_write/DYMUX .LOC = "SLICE_X55Y34";
  X_BUF \K1/processor/register_write/DYMUX  (
    .I(\K1/processor/memory_type ),
    .O(\K1/processor/register_write/DYMUX_541 )
  );
  defparam \K1/processor/register_write/CLKINV .LOC = "SLICE_X55Y34";
  X_BUF \K1/processor/register_write/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/register_write/CLKINV_542 )
  );
  defparam \K1/processor/memory_type_lut .INIT = 16'h2020;
  defparam \K1/processor/memory_type_lut .LOC = "SLICE_X55Y34";
  X_LUT4 \K1/processor/memory_type_lut  (
    .ADR0(\K1/instruction [17]),
    .ADR1(\K1/instruction [16]),
    .ADR2(\K1/instruction [15]),
    .ADR3(VCC),
    .O(\K1/processor/memory_type )
  );
  defparam \K1/processor/t_state/XUSED .LOC = "SLICE_X64Y26";
  X_BUF \K1/processor/t_state/XUSED  (
    .I(\K1/processor/flag_enable ),
    .O(\K1/processor/flag_enable_0 )
  );
  defparam \K1/processor/t_state/DYMUX .LOC = "SLICE_X64Y26";
  X_BUF \K1/processor/t_state/DYMUX  (
    .I(\K1/processor/not_t_state ),
    .O(\K1/processor/t_state/DYMUX_543 )
  );
  defparam \K1/processor/t_state/CLKINV .LOC = "SLICE_X64Y26";
  X_BUF \K1/processor/t_state/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/t_state/CLKINV_544 )
  );
  defparam \K1/processor/t_state_lut .INIT = 16'h000F;
  defparam \K1/processor/t_state_lut .LOC = "SLICE_X64Y26";
  X_LUT4 \K1/processor/t_state_lut  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(\K1/processor/t_state ),
    .ADR3(\K1/processor/internal_reset ),
    .O(\K1/processor/not_t_state )
  );
  defparam \K1/processor/shift_result<1>/DXMUX .LOC = "SLICE_X55Y48";
  X_BUF \K1/processor/shift_result<1>/DXMUX  (
    .I(\K1/processor/shift_value [1]),
    .O(\K1/processor/shift_result<1>/DXMUX_545 )
  );
  defparam \K1/processor/shift_result<1>/DYMUX .LOC = "SLICE_X55Y48";
  X_BUF \K1/processor/shift_result<1>/DYMUX  (
    .I(\K1/processor/shift_value [0]),
    .O(\K1/processor/shift_result<1>/DYMUX_546 )
  );
  defparam \K1/processor/shift_result<1>/SRINV .LOC = "SLICE_X55Y48";
  X_INV \K1/processor/shift_result<1>/SRINV  (
    .I(\K1/instruction [17]),
    .O(\K1/processor/shift_result<1>/SRINVNOT )
  );
  defparam \K1/processor/shift_result<1>/CLKINV .LOC = "SLICE_X55Y48";
  X_BUF \K1/processor/shift_result<1>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/shift_result<1>/CLKINV_547 )
  );
  defparam \K1/processor/shift_loop[0].lsb_shift.shift_mux_lut .INIT = 16'hB8B8;
  defparam \K1/processor/shift_loop[0].lsb_shift.shift_mux_lut .LOC = "SLICE_X55Y48";
  X_LUT4 \K1/processor/shift_loop[0].lsb_shift.shift_mux_lut  (
    .ADR0(\out_port<1>_0 ),
    .ADR1(\K1/instruction [3]),
    .ADR2(\K1/processor/shift_in ),
    .ADR3(VCC),
    .O(\K1/processor/shift_value [0])
  );
  defparam \K1/processor/shift_result<3>/DXMUX .LOC = "SLICE_X54Y46";
  X_BUF \K1/processor/shift_result<3>/DXMUX  (
    .I(\K1/processor/shift_value [3]),
    .O(\K1/processor/shift_result<3>/DXMUX_548 )
  );
  defparam \K1/processor/shift_result<3>/DYMUX .LOC = "SLICE_X54Y46";
  X_BUF \K1/processor/shift_result<3>/DYMUX  (
    .I(\K1/processor/shift_value [2]),
    .O(\K1/processor/shift_result<3>/DYMUX_549 )
  );
  defparam \K1/processor/shift_result<3>/SRINV .LOC = "SLICE_X54Y46";
  X_INV \K1/processor/shift_result<3>/SRINV  (
    .I(\K1/instruction [17]),
    .O(\K1/processor/shift_result<3>/SRINVNOT )
  );
  defparam \K1/processor/shift_result<3>/CLKINV .LOC = "SLICE_X54Y46";
  X_BUF \K1/processor/shift_result<3>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/shift_result<3>/CLKINV_550 )
  );
  defparam \K1/processor/shift_loop[2].mid_shift.shift_mux_lut .INIT = 16'hFC30;
  defparam \K1/processor/shift_loop[2].mid_shift.shift_mux_lut .LOC = "SLICE_X54Y46";
  X_LUT4 \K1/processor/shift_loop[2].mid_shift.shift_mux_lut  (
    .ADR0(VCC),
    .ADR1(\K1/instruction [3]),
    .ADR2(\out_port<1>_0 ),
    .ADR3(\out_port<3>_0 ),
    .O(\K1/processor/shift_value [2])
  );
  defparam \K1/processor/sel_group/XUSED .LOC = "SLICE_X55Y36";
  X_BUF \K1/processor/sel_group/XUSED  (
    .I(\K1/processor/sel_logical ),
    .O(\K1/processor/sel_logical_0 )
  );
  defparam \K1/processor/sel_group/DYMUX .LOC = "SLICE_X55Y36";
  X_BUF \K1/processor/sel_group/DYMUX  (
    .I(\K1/processor/input_fetch_type ),
    .O(\K1/processor/sel_group/DYMUX_551 )
  );
  defparam \K1/processor/sel_group/CLKINV .LOC = "SLICE_X55Y36";
  X_BUF \K1/processor/sel_group/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/sel_group/CLKINV_552 )
  );
  defparam \K1/processor/input_fetch_type_lut .INIT = 16'h0100;
  defparam \K1/processor/input_fetch_type_lut .LOC = "SLICE_X55Y36";
  X_LUT4 \K1/processor/input_fetch_type_lut  (
    .ADR0(\K1/instruction [16]),
    .ADR1(\K1/instruction [17]),
    .ADR2(\K1/instruction [15]),
    .ADR3(\K1/instruction [14]),
    .O(\K1/processor/input_fetch_type )
  );
  defparam \K1/processor/shift_result<5>/DXMUX .LOC = "SLICE_X55Y49";
  X_BUF \K1/processor/shift_result<5>/DXMUX  (
    .I(\K1/processor/shift_value [5]),
    .O(\K1/processor/shift_result<5>/DXMUX_553 )
  );
  defparam \K1/processor/shift_result<5>/DYMUX .LOC = "SLICE_X55Y49";
  X_BUF \K1/processor/shift_result<5>/DYMUX  (
    .I(\K1/processor/shift_value [4]),
    .O(\K1/processor/shift_result<5>/DYMUX_554 )
  );
  defparam \K1/processor/shift_result<5>/SRINV .LOC = "SLICE_X55Y49";
  X_INV \K1/processor/shift_result<5>/SRINV  (
    .I(\K1/instruction [17]),
    .O(\K1/processor/shift_result<5>/SRINVNOT )
  );
  defparam \K1/processor/shift_result<5>/CLKINV .LOC = "SLICE_X55Y49";
  X_BUF \K1/processor/shift_result<5>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/shift_result<5>/CLKINV_555 )
  );
  defparam \K1/processor/shift_loop[4].mid_shift.shift_mux_lut .INIT = 16'hD8D8;
  defparam \K1/processor/shift_loop[4].mid_shift.shift_mux_lut .LOC = "SLICE_X55Y49";
  X_LUT4 \K1/processor/shift_loop[4].mid_shift.shift_mux_lut  (
    .ADR0(\K1/instruction [3]),
    .ADR1(\out_port<5>_0 ),
    .ADR2(\out_port<3>_0 ),
    .ADR3(VCC),
    .O(\K1/processor/shift_value [4])
  );
  defparam \K1/processor/sy<0>/XUSED .LOC = "SLICE_X54Y41";
  X_BUF \K1/processor/sy<0>/XUSED  (
    .I(\K1/processor/sy [0]),
    .O(\K1/processor/sy<0>_0 )
  );
  defparam \K1/processor/sy<0>/DIF_MUX .LOC = "SLICE_X54Y41";
  X_BUF \K1/processor/sy<0>/DIF_MUX  (
    .I(\K1/processor/sy<0>/DIG_MUX_557 ),
    .O(\K1/processor/sy<0>/DIF_MUX_556 )
  );
  defparam \K1/processor/sy<0>/YUSED .LOC = "SLICE_X54Y41";
  X_BUF \K1/processor/sy<0>/YUSED  (
    .I(out_port[0]),
    .O(\out_port<0>_0 )
  );
  defparam \K1/processor/sy<0>/DIG_MUX .LOC = "SLICE_X54Y41";
  X_BUF \K1/processor/sy<0>/DIG_MUX  (
    .I(\K1/processor/alu_result [0]),
    .O(\K1/processor/sy<0>/DIG_MUX_557 )
  );
  defparam \K1/processor/sy<0>/SRINV .LOC = "SLICE_X54Y41";
  X_BUF \K1/processor/sy<0>/SRINV  (
    .I(\K1/processor/register_enable_0 ),
    .O(\K1/processor/sy<0>/SRINV_559 )
  );
  defparam \K1/processor/sy<0>/CLKINV .LOC = "SLICE_X54Y41";
  X_BUF \K1/processor/sy<0>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/sy<0>/CLKINV_558 )
  );
  defparam \K1/processor/logical_result<7>/DXMUX .LOC = "SLICE_X53Y42";
  X_BUF \K1/processor/logical_result<7>/DXMUX  (
    .I(\K1/processor/logical_value [7]),
    .O(\K1/processor/logical_result<7>/DXMUX_560 )
  );
  defparam \K1/processor/logical_result<7>/YUSED .LOC = "SLICE_X53Y42";
  X_BUF \K1/processor/logical_result<7>/YUSED  (
    .I(\port_id<7>_pack_1 ),
    .O(port_id[7])
  );
  defparam \K1/processor/logical_result<7>/SRINV .LOC = "SLICE_X53Y42";
  X_BUF \K1/processor/logical_result<7>/SRINV  (
    .I(\K1/processor/sel_logical_0 ),
    .O(\K1/processor/logical_result<7>/SRINV_561 )
  );
  defparam \K1/processor/logical_result<7>/CLKINV .LOC = "SLICE_X53Y42";
  X_BUF \K1/processor/logical_result<7>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/logical_result<7>/CLKINV_562 )
  );
  defparam \K1/processor/logical_result<6>/DXMUX .LOC = "SLICE_X53Y44";
  X_BUF \K1/processor/logical_result<6>/DXMUX  (
    .I(\K1/processor/logical_value [6]),
    .O(\K1/processor/logical_result<6>/DXMUX_563 )
  );
  defparam \K1/processor/logical_result<6>/YUSED .LOC = "SLICE_X53Y44";
  X_BUF \K1/processor/logical_result<6>/YUSED  (
    .I(\port_id<6>_pack_1 ),
    .O(port_id[6])
  );
  defparam \K1/processor/logical_result<6>/SRINV .LOC = "SLICE_X53Y44";
  X_BUF \K1/processor/logical_result<6>/SRINV  (
    .I(\K1/processor/sel_logical_0 ),
    .O(\K1/processor/logical_result<6>/SRINV_564 )
  );
  defparam \K1/processor/logical_result<6>/CLKINV .LOC = "SLICE_X53Y44";
  X_BUF \K1/processor/logical_result<6>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/logical_result<6>/CLKINV_565 )
  );
  defparam \K1/processor/valid_to_move/XUSED .LOC = "SLICE_X55Y33";
  X_BUF \K1/processor/valid_to_move/XUSED  (
    .I(\K1/processor/valid_to_move ),
    .O(\K1/processor/valid_to_move_0 )
  );
  defparam \K1/processor/valid_to_move/YUSED .LOC = "SLICE_X55Y33";
  X_BUF \K1/processor/valid_to_move/YUSED  (
    .I(\K1/processor/condition_met_pack_1 ),
    .O(\K1/processor/condition_met )
  );
  defparam \K1/processor/condition_met_lut .INIT = 16'h4B78;
  defparam \K1/processor/condition_met_lut .LOC = "SLICE_X55Y33";
  X_LUT4 \K1/processor/condition_met_lut  (
    .ADR0(\K1/processor/carry_flag ),
    .ADR1(\K1/instruction [11]),
    .ADR2(\K1/instruction [10]),
    .ADR3(\K1/processor/zero_flag ),
    .O(\K1/processor/condition_met_pack_1 )
  );
  defparam \K1/processor/sy<5>/XUSED .LOC = "SLICE_X54Y42";
  X_BUF \K1/processor/sy<5>/XUSED  (
    .I(\K1/processor/sy [5]),
    .O(\K1/processor/sy<5>_0 )
  );
  defparam \K1/processor/sy<5>/DIF_MUX .LOC = "SLICE_X54Y42";
  X_BUF \K1/processor/sy<5>/DIF_MUX  (
    .I(\K1/processor/sy<5>/DIG_MUX_567 ),
    .O(\K1/processor/sy<5>/DIF_MUX_566 )
  );
  defparam \K1/processor/sy<5>/YUSED .LOC = "SLICE_X54Y42";
  X_BUF \K1/processor/sy<5>/YUSED  (
    .I(out_port[5]),
    .O(\out_port<5>_0 )
  );
  defparam \K1/processor/sy<5>/DIG_MUX .LOC = "SLICE_X54Y42";
  X_BUF \K1/processor/sy<5>/DIG_MUX  (
    .I(\K1/processor/alu_result [5]),
    .O(\K1/processor/sy<5>/DIG_MUX_567 )
  );
  defparam \K1/processor/sy<5>/SRINV .LOC = "SLICE_X54Y42";
  X_BUF \K1/processor/sy<5>/SRINV  (
    .I(\K1/processor/register_enable_0 ),
    .O(\K1/processor/sy<5>/SRINV_569 )
  );
  defparam \K1/processor/sy<5>/CLKINV .LOC = "SLICE_X54Y42";
  X_BUF \K1/processor/sy<5>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/sy<5>/CLKINV_568 )
  );
  defparam \K1/processor/logical_result<5>/DXMUX .LOC = "SLICE_X55Y44";
  X_BUF \K1/processor/logical_result<5>/DXMUX  (
    .I(\K1/processor/logical_value [5]),
    .O(\K1/processor/logical_result<5>/DXMUX_570 )
  );
  defparam \K1/processor/logical_result<5>/YUSED .LOC = "SLICE_X55Y44";
  X_BUF \K1/processor/logical_result<5>/YUSED  (
    .I(\port_id<5>_pack_1 ),
    .O(port_id[5])
  );
  defparam \K1/processor/logical_result<5>/SRINV .LOC = "SLICE_X55Y44";
  X_BUF \K1/processor/logical_result<5>/SRINV  (
    .I(\K1/processor/sel_logical_0 ),
    .O(\K1/processor/logical_result<5>/SRINV_571 )
  );
  defparam \K1/processor/logical_result<5>/CLKINV .LOC = "SLICE_X55Y44";
  X_BUF \K1/processor/logical_result<5>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/logical_result<5>/CLKINV_572 )
  );
  defparam \K1/processor/logical_result<4>/DXMUX .LOC = "SLICE_X54Y45";
  X_BUF \K1/processor/logical_result<4>/DXMUX  (
    .I(\K1/processor/logical_value [4]),
    .O(\K1/processor/logical_result<4>/DXMUX_573 )
  );
  defparam \K1/processor/logical_result<4>/YUSED .LOC = "SLICE_X54Y45";
  X_BUF \K1/processor/logical_result<4>/YUSED  (
    .I(\port_id<4>_pack_1 ),
    .O(port_id[4])
  );
  defparam \K1/processor/logical_result<4>/SRINV .LOC = "SLICE_X54Y45";
  X_BUF \K1/processor/logical_result<4>/SRINV  (
    .I(\K1/processor/sel_logical_0 ),
    .O(\K1/processor/logical_result<4>/SRINV_574 )
  );
  defparam \K1/processor/logical_result<4>/CLKINV .LOC = "SLICE_X54Y45";
  X_BUF \K1/processor/logical_result<4>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/logical_result<4>/CLKINV_575 )
  );
  defparam \K1/processor/sy<1>/XUSED .LOC = "SLICE_X52Y43";
  X_BUF \K1/processor/sy<1>/XUSED  (
    .I(\K1/processor/sy [1]),
    .O(\K1/processor/sy<1>_0 )
  );
  defparam \K1/processor/sy<1>/DIF_MUX .LOC = "SLICE_X52Y43";
  X_BUF \K1/processor/sy<1>/DIF_MUX  (
    .I(\K1/processor/sy<1>/DIG_MUX_577 ),
    .O(\K1/processor/sy<1>/DIF_MUX_576 )
  );
  defparam \K1/processor/sy<1>/YUSED .LOC = "SLICE_X52Y43";
  X_BUF \K1/processor/sy<1>/YUSED  (
    .I(out_port[1]),
    .O(\out_port<1>_0 )
  );
  defparam \K1/processor/sy<1>/DIG_MUX .LOC = "SLICE_X52Y43";
  X_BUF \K1/processor/sy<1>/DIG_MUX  (
    .I(\K1/processor/alu_result [1]),
    .O(\K1/processor/sy<1>/DIG_MUX_577 )
  );
  defparam \K1/processor/sy<1>/SRINV .LOC = "SLICE_X52Y43";
  X_BUF \K1/processor/sy<1>/SRINV  (
    .I(\K1/processor/register_enable_0 ),
    .O(\K1/processor/sy<1>/SRINV_579 )
  );
  defparam \K1/processor/sy<1>/CLKINV .LOC = "SLICE_X52Y43";
  X_BUF \K1/processor/sy<1>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/sy<1>/CLKINV_578 )
  );
  defparam \K1/processor/logical_result<3>/DXMUX .LOC = "SLICE_X55Y45";
  X_BUF \K1/processor/logical_result<3>/DXMUX  (
    .I(\K1/processor/logical_value [3]),
    .O(\K1/processor/logical_result<3>/DXMUX_580 )
  );
  defparam \K1/processor/logical_result<3>/YUSED .LOC = "SLICE_X55Y45";
  X_BUF \K1/processor/logical_result<3>/YUSED  (
    .I(\port_id<3>_pack_1 ),
    .O(port_id[3])
  );
  defparam \K1/processor/logical_result<3>/SRINV .LOC = "SLICE_X55Y45";
  X_BUF \K1/processor/logical_result<3>/SRINV  (
    .I(\K1/processor/sel_logical_0 ),
    .O(\K1/processor/logical_result<3>/SRINV_581 )
  );
  defparam \K1/processor/logical_result<3>/CLKINV .LOC = "SLICE_X55Y45";
  X_BUF \K1/processor/logical_result<3>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/logical_result<3>/CLKINV_582 )
  );
  defparam \K1/processor/logical_result<2>/DXMUX .LOC = "SLICE_X54Y38";
  X_BUF \K1/processor/logical_result<2>/DXMUX  (
    .I(\K1/processor/logical_value [2]),
    .O(\K1/processor/logical_result<2>/DXMUX_583 )
  );
  defparam \K1/processor/logical_result<2>/YUSED .LOC = "SLICE_X54Y38";
  X_BUF \K1/processor/logical_result<2>/YUSED  (
    .I(\port_id<2>_pack_1 ),
    .O(port_id[2])
  );
  defparam \K1/processor/logical_result<2>/SRINV .LOC = "SLICE_X54Y38";
  X_BUF \K1/processor/logical_result<2>/SRINV  (
    .I(\K1/processor/sel_logical_0 ),
    .O(\K1/processor/logical_result<2>/SRINV_584 )
  );
  defparam \K1/processor/logical_result<2>/CLKINV .LOC = "SLICE_X54Y38";
  X_BUF \K1/processor/logical_result<2>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/logical_result<2>/CLKINV_585 )
  );
  defparam \K1/processor/sy<6>/XUSED .LOC = "SLICE_X52Y42";
  X_BUF \K1/processor/sy<6>/XUSED  (
    .I(\K1/processor/sy [6]),
    .O(\K1/processor/sy<6>_0 )
  );
  defparam \K1/processor/sy<6>/DIF_MUX .LOC = "SLICE_X52Y42";
  X_BUF \K1/processor/sy<6>/DIF_MUX  (
    .I(\K1/processor/sy<6>/DIG_MUX_587 ),
    .O(\K1/processor/sy<6>/DIF_MUX_586 )
  );
  defparam \K1/processor/sy<6>/YUSED .LOC = "SLICE_X52Y42";
  X_BUF \K1/processor/sy<6>/YUSED  (
    .I(out_port[6]),
    .O(\out_port<6>_0 )
  );
  defparam \K1/processor/sy<6>/DIG_MUX .LOC = "SLICE_X52Y42";
  X_BUF \K1/processor/sy<6>/DIG_MUX  (
    .I(\K1/processor/alu_result [6]),
    .O(\K1/processor/sy<6>/DIG_MUX_587 )
  );
  defparam \K1/processor/sy<6>/SRINV .LOC = "SLICE_X52Y42";
  X_BUF \K1/processor/sy<6>/SRINV  (
    .I(\K1/processor/register_enable_0 ),
    .O(\K1/processor/sy<6>/SRINV_589 )
  );
  defparam \K1/processor/sy<6>/CLKINV .LOC = "SLICE_X52Y42";
  X_BUF \K1/processor/sy<6>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/sy<6>/CLKINV_588 )
  );
  defparam \K1/processor/register_enable/XUSED .LOC = "SLICE_X54Y34";
  X_BUF \K1/processor/register_enable/XUSED  (
    .I(\K1/processor/register_enable ),
    .O(\K1/processor/register_enable_0 )
  );
  defparam \K1/processor/register_enable_lut .INIT = 16'hCC00;
  defparam \K1/processor/register_enable_lut .LOC = "SLICE_X54Y34";
  X_LUT4 \K1/processor/register_enable_lut  (
    .ADR0(VCC),
    .ADR1(\K1/processor/t_state ),
    .ADR2(VCC),
    .ADR3(\K1/processor/register_write ),
    .O(\K1/processor/register_enable )
  );
  defparam \K1/processor/logical_result<1>/DXMUX .LOC = "SLICE_X55Y42";
  X_BUF \K1/processor/logical_result<1>/DXMUX  (
    .I(\K1/processor/logical_value [1]),
    .O(\K1/processor/logical_result<1>/DXMUX_590 )
  );
  defparam \K1/processor/logical_result<1>/YUSED .LOC = "SLICE_X55Y42";
  X_BUF \K1/processor/logical_result<1>/YUSED  (
    .I(\port_id<1>_pack_1 ),
    .O(port_id[1])
  );
  defparam \K1/processor/logical_result<1>/SRINV .LOC = "SLICE_X55Y42";
  X_BUF \K1/processor/logical_result<1>/SRINV  (
    .I(\K1/processor/sel_logical_0 ),
    .O(\K1/processor/logical_result<1>/SRINV_591 )
  );
  defparam \K1/processor/logical_result<1>/CLKINV .LOC = "SLICE_X55Y42";
  X_BUF \K1/processor/logical_result<1>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/logical_result<1>/CLKINV_592 )
  );
  defparam \led_and0000_map2/XUSED .LOC = "SLICE_X55Y43";
  X_BUF \led_and0000_map2/XUSED  (
    .I(led_and0000_map2),
    .O(led_and0000_map2_0)
  );
  defparam \led_and0000_map2/YUSED .LOC = "SLICE_X55Y43";
  X_BUF \led_and0000_map2/YUSED  (
    .I(\port_id<0>_pack_1 ),
    .O(port_id[0])
  );
  defparam \K1/processor/reg_loop[0].operand_select_mux .INIT = 16'hFC30;
  defparam \K1/processor/reg_loop[0].operand_select_mux .LOC = "SLICE_X55Y43";
  X_LUT4 \K1/processor/reg_loop[0].operand_select_mux  (
    .ADR0(VCC),
    .ADR1(\K1/instruction [12]),
    .ADR2(\K1/instruction [0]),
    .ADR3(\K1/processor/sy<0>_0 ),
    .O(\port_id<0>_pack_1 )
  );
  defparam \K1/processor/sy<2>/XUSED .LOC = "SLICE_X54Y39";
  X_BUF \K1/processor/sy<2>/XUSED  (
    .I(\K1/processor/sy [2]),
    .O(\K1/processor/sy<2>_0 )
  );
  defparam \K1/processor/sy<2>/DIF_MUX .LOC = "SLICE_X54Y39";
  X_BUF \K1/processor/sy<2>/DIF_MUX  (
    .I(\K1/processor/sy<2>/DIG_MUX_594 ),
    .O(\K1/processor/sy<2>/DIF_MUX_593 )
  );
  defparam \K1/processor/sy<2>/YUSED .LOC = "SLICE_X54Y39";
  X_BUF \K1/processor/sy<2>/YUSED  (
    .I(out_port[2]),
    .O(\out_port<2>_0 )
  );
  defparam \K1/processor/sy<2>/DIG_MUX .LOC = "SLICE_X54Y39";
  X_BUF \K1/processor/sy<2>/DIG_MUX  (
    .I(\K1/processor/alu_result [2]),
    .O(\K1/processor/sy<2>/DIG_MUX_594 )
  );
  defparam \K1/processor/sy<2>/SRINV .LOC = "SLICE_X54Y39";
  X_BUF \K1/processor/sy<2>/SRINV  (
    .I(\K1/processor/register_enable_0 ),
    .O(\K1/processor/sy<2>/SRINV_596 )
  );
  defparam \K1/processor/sy<2>/CLKINV .LOC = "SLICE_X54Y39";
  X_BUF \K1/processor/sy<2>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/sy<2>/CLKINV_595 )
  );
  defparam \K1/processor/stack_address<4>/DXMUX .LOC = "SLICE_X54Y22";
  X_BUF \K1/processor/stack_address<4>/DXMUX  (
    .I(\K1/processor/stack_address<4>/XORF_598 ),
    .O(\K1/processor/stack_address<4>/DXMUX_597 )
  );
  defparam \K1/processor/stack_address<4>/XORF .LOC = "SLICE_X54Y22";
  X_XOR2 \K1/processor/stack_address<4>/XORF  (
    .I0(\K1/processor/stack_address<4>/CYINIT_599 ),
    .I1(\K1/processor/half_stack_address [4]),
    .O(\K1/processor/stack_address<4>/XORF_598 )
  );
  defparam \K1/processor/stack_address<4>/CYINIT .LOC = "SLICE_X54Y22";
  X_BUF \K1/processor/stack_address<4>/CYINIT  (
    .I(\K1/processor/stack_address<2>/CYMUXFAST_498 ),
    .O(\K1/processor/stack_address<4>/CYINIT_599 )
  );
  defparam \K1/processor/stack_address<4>/YUSED .LOC = "SLICE_X54Y22";
  X_BUF \K1/processor/stack_address<4>/YUSED  (
    .I(\K1/processor/call_type_pack_1 ),
    .O(\K1/processor/call_type )
  );
  defparam \K1/processor/stack_address<4>/SRINV .LOC = "SLICE_X54Y22";
  X_BUF \K1/processor/stack_address<4>/SRINV  (
    .I(\K1/processor/internal_reset ),
    .O(\K1/processor/stack_address<4>/SRINV_600 )
  );
  defparam \K1/processor/stack_address<4>/CLKINV .LOC = "SLICE_X54Y22";
  X_BUF \K1/processor/stack_address<4>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/stack_address<4>/CLKINV_601 )
  );
  defparam \K1/processor/call_type_lut .INIT = 16'h0200;
  defparam \K1/processor/call_type_lut .LOC = "SLICE_X54Y22";
  X_LUT4 \K1/processor/call_type_lut  (
    .ADR0(\K1/instruction [17]),
    .ADR1(\K1/instruction [15]),
    .ADR2(\K1/instruction [14]),
    .ADR3(\K1/instruction [16]),
    .O(\K1/processor/call_type_pack_1 )
  );
  defparam \K1/processor/sy<7>/XUSED .LOC = "SLICE_X52Y41";
  X_BUF \K1/processor/sy<7>/XUSED  (
    .I(\K1/processor/sy [7]),
    .O(\K1/processor/sy<7>_0 )
  );
  defparam \K1/processor/sy<7>/DIF_MUX .LOC = "SLICE_X52Y41";
  X_BUF \K1/processor/sy<7>/DIF_MUX  (
    .I(\K1/processor/sy<7>/DIG_MUX_603 ),
    .O(\K1/processor/sy<7>/DIF_MUX_602 )
  );
  defparam \K1/processor/sy<7>/YUSED .LOC = "SLICE_X52Y41";
  X_BUF \K1/processor/sy<7>/YUSED  (
    .I(out_port[7]),
    .O(\out_port<7>_0 )
  );
  defparam \K1/processor/sy<7>/DIG_MUX .LOC = "SLICE_X52Y41";
  X_BUF \K1/processor/sy<7>/DIG_MUX  (
    .I(\K1/processor/alu_result [7]),
    .O(\K1/processor/sy<7>/DIG_MUX_603 )
  );
  defparam \K1/processor/sy<7>/SRINV .LOC = "SLICE_X52Y41";
  X_BUF \K1/processor/sy<7>/SRINV  (
    .I(\K1/processor/register_enable_0 ),
    .O(\K1/processor/sy<7>/SRINV_605 )
  );
  defparam \K1/processor/sy<7>/CLKINV .LOC = "SLICE_X52Y41";
  X_BUF \K1/processor/sy<7>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/sy<7>/CLKINV_604 )
  );
  defparam \K1/processor/reset_delay/DYMUX .LOC = "SLICE_X55Y13";
  X_BUF \K1/processor/reset_delay/DYMUX  (
    .I(GLOBAL_LOGIC0),
    .O(\K1/processor/reset_delay/DYMUX_606 )
  );
  defparam \K1/processor/reset_delay/CLKINV .LOC = "SLICE_X55Y13";
  X_BUF \K1/processor/reset_delay/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/reset_delay/CLKINV_607 )
  );
  defparam \K1/processor/internal_reset/DYMUX .LOC = "SLICE_X55Y12";
  X_BUF \K1/processor/internal_reset/DYMUX  (
    .I(\K1/processor/reset_delay ),
    .O(\K1/processor/internal_reset/DYMUX_608 )
  );
  defparam \K1/processor/internal_reset/CLKINV .LOC = "SLICE_X55Y12";
  X_BUF \K1/processor/internal_reset/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/internal_reset/CLKINV_609 )
  );
  defparam \K1/processor/sy<3>/XUSED .LOC = "SLICE_X54Y43";
  X_BUF \K1/processor/sy<3>/XUSED  (
    .I(\K1/processor/sy [3]),
    .O(\K1/processor/sy<3>_0 )
  );
  defparam \K1/processor/sy<3>/DIF_MUX .LOC = "SLICE_X54Y43";
  X_BUF \K1/processor/sy<3>/DIF_MUX  (
    .I(\K1/processor/sy<3>/DIG_MUX_611 ),
    .O(\K1/processor/sy<3>/DIF_MUX_610 )
  );
  defparam \K1/processor/sy<3>/YUSED .LOC = "SLICE_X54Y43";
  X_BUF \K1/processor/sy<3>/YUSED  (
    .I(out_port[3]),
    .O(\out_port<3>_0 )
  );
  defparam \K1/processor/sy<3>/DIG_MUX .LOC = "SLICE_X54Y43";
  X_BUF \K1/processor/sy<3>/DIG_MUX  (
    .I(\K1/processor/alu_result [3]),
    .O(\K1/processor/sy<3>/DIG_MUX_611 )
  );
  defparam \K1/processor/sy<3>/SRINV .LOC = "SLICE_X54Y43";
  X_BUF \K1/processor/sy<3>/SRINV  (
    .I(\K1/processor/register_enable_0 ),
    .O(\K1/processor/sy<3>/SRINV_613 )
  );
  defparam \K1/processor/sy<3>/CLKINV .LOC = "SLICE_X54Y43";
  X_BUF \K1/processor/sy<3>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/sy<3>/CLKINV_612 )
  );
  defparam \K1/processor/sel_arith/YUSED .LOC = "SLICE_X55Y37";
  X_BUF \K1/processor/sel_arith/YUSED  (
    .I(\K1/processor/sel_arith ),
    .O(\K1/processor/sel_arith_0 )
  );
  defparam \K1/processor/sel_arith_lut .INIT = 16'h555F;
  defparam \K1/processor/sel_arith_lut .LOC = "SLICE_X55Y37";
  X_LUT4 \K1/processor/sel_arith_lut  (
    .ADR0(\K1/instruction [16]),
    .ADR1(VCC),
    .ADR2(\K1/instruction [15]),
    .ADR3(\K1/instruction [14]),
    .O(\K1/processor/sel_arith )
  );
  defparam \K1/processor/normal_count/XUSED .LOC = "SLICE_X54Y32";
  X_BUF \K1/processor/normal_count/XUSED  (
    .I(\K1/processor/normal_count ),
    .O(\K1/processor/normal_count_0 )
  );
  defparam \K1/processor/normal_count/YUSED .LOC = "SLICE_X54Y32";
  X_BUF \K1/processor/normal_count/YUSED  (
    .I(\K1/processor/move_group_pack_1 ),
    .O(\K1/processor/move_group )
  );
  defparam \K1/processor/move_group_lut .INIT = 16'h7040;
  defparam \K1/processor/move_group_lut .LOC = "SLICE_X54Y32";
  X_LUT4 \K1/processor/move_group_lut  (
    .ADR0(\K1/instruction [14]),
    .ADR1(\K1/instruction [15]),
    .ADR2(\K1/instruction [17]),
    .ADR3(\K1/instruction [16]),
    .O(\K1/processor/move_group_pack_1 )
  );
  defparam \write_strobe/DXMUX .LOC = "SLICE_X54Y37";
  X_BUF \write_strobe/DXMUX  (
    .I(\K1/processor/write_active ),
    .O(\write_strobe/DXMUX_614 )
  );
  defparam \write_strobe/YUSED .LOC = "SLICE_X54Y37";
  X_BUF \write_strobe/YUSED  (
    .I(\K1/processor/io_initial_decode_pack_1 ),
    .O(\K1/processor/io_initial_decode )
  );
  defparam \write_strobe/SRINV .LOC = "SLICE_X54Y37";
  X_BUF \write_strobe/SRINV  (
    .I(\K1/processor/internal_reset ),
    .O(\write_strobe/SRINV_615 )
  );
  defparam \write_strobe/CLKINV .LOC = "SLICE_X54Y37";
  X_BUF \write_strobe/CLKINV  (
    .I(clk_BUFGP),
    .O(\write_strobe/CLKINV_616 )
  );
  defparam \K1/processor/sy<4>/XUSED .LOC = "SLICE_X54Y40";
  X_BUF \K1/processor/sy<4>/XUSED  (
    .I(\K1/processor/sy [4]),
    .O(\K1/processor/sy<4>_0 )
  );
  defparam \K1/processor/sy<4>/DIF_MUX .LOC = "SLICE_X54Y40";
  X_BUF \K1/processor/sy<4>/DIF_MUX  (
    .I(\K1/processor/sy<4>/DIG_MUX_618 ),
    .O(\K1/processor/sy<4>/DIF_MUX_617 )
  );
  defparam \K1/processor/sy<4>/YUSED .LOC = "SLICE_X54Y40";
  X_BUF \K1/processor/sy<4>/YUSED  (
    .I(out_port[4]),
    .O(\out_port<4>_0 )
  );
  defparam \K1/processor/sy<4>/DIG_MUX .LOC = "SLICE_X54Y40";
  X_BUF \K1/processor/sy<4>/DIG_MUX  (
    .I(\K1/processor/alu_result [4]),
    .O(\K1/processor/sy<4>/DIG_MUX_618 )
  );
  defparam \K1/processor/sy<4>/SRINV .LOC = "SLICE_X54Y40";
  X_BUF \K1/processor/sy<4>/SRINV  (
    .I(\K1/processor/register_enable_0 ),
    .O(\K1/processor/sy<4>/SRINV_620 )
  );
  defparam \K1/processor/sy<4>/CLKINV .LOC = "SLICE_X54Y40";
  X_BUF \K1/processor/sy<4>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/sy<4>/CLKINV_619 )
  );
  defparam \K1/processor/store_data<7>/F5USED .LOC = "SLICE_X52Y46";
  X_BUF \K1/processor/store_data<7>/F5USED  (
    .I(\K1/processor/store_data<7>/F5MUX_621 ),
    .O(\K1/processor/store_loop[7].memory_bit/F5.S0 )
  );
  defparam \K1/processor/store_data<7>/F5MUX .LOC = "SLICE_X52Y46";
  X_MUX2 \K1/processor/store_data<7>/F5MUX  (
    .IA(\K1/processor/store_loop[7].memory_bit/G.S0_626 ),
    .IB(\K1/processor/store_loop[7].memory_bit/F.S0_622 ),
    .SEL(\K1/processor/store_data<7>/BXINV_632 ),
    .O(\K1/processor/store_data<7>/F5MUX_621 )
  );
  defparam \K1/processor/store_data<7>/DIF_MUX .LOC = "SLICE_X52Y46";
  X_BUF \K1/processor/store_data<7>/DIF_MUX  (
    .I(\K1/processor/store_data<7>/DIG_MUX_627 ),
    .O(\K1/processor/store_data<7>/DIF_MUX_623 )
  );
  defparam \K1/processor/store_data<7>/BXINV .LOC = "SLICE_X52Y46";
  X_BUF \K1/processor/store_data<7>/BXINV  (
    .I(port_id[4]),
    .O(\K1/processor/store_data<7>/BXINV_632 )
  );
  defparam \K1/processor/store_data<7>/DYMUX .LOC = "SLICE_X52Y46";
  X_BUF \K1/processor/store_data<7>/DYMUX  (
    .I(\K1/processor/store_data<7>/F6MUX_625 ),
    .O(\K1/processor/store_data<7>/DYMUX_624 )
  );
  defparam \K1/processor/store_data<7>/F6MUX .LOC = "SLICE_X52Y46";
  X_MUX2 \K1/processor/store_data<7>/F6MUX  (
    .IA(\K1/processor/store_loop[7].memory_bit/F5.S1 ),
    .IB(\K1/processor/store_loop[7].memory_bit/F5.S0 ),
    .SEL(\K1/processor/store_data<7>/BYINV_628 ),
    .O(\K1/processor/store_data<7>/F6MUX_625 )
  );
  defparam \K1/processor/store_data<7>/DIG_MUX .LOC = "SLICE_X52Y46";
  X_BUF \K1/processor/store_data<7>/DIG_MUX  (
    .I(\K1/processor/store_loop[7].memory_bit/F5.S1/DIG_MUX_638 ),
    .O(\K1/processor/store_data<7>/DIG_MUX_627 )
  );
  defparam \K1/processor/store_data<7>/BYINV .LOC = "SLICE_X52Y46";
  X_BUF \K1/processor/store_data<7>/BYINV  (
    .I(port_id[5]),
    .O(\K1/processor/store_data<7>/BYINV_628 )
  );
  defparam \K1/processor/store_data<7>/SRINV .LOC = "SLICE_X52Y46";
  X_BUF \K1/processor/store_data<7>/SRINV  (
    .I(\K1/processor/memory_enable_0 ),
    .O(\K1/processor/store_data<7>/SRINV_630 )
  );
  defparam \K1/processor/store_data<7>/CLKINV .LOC = "SLICE_X52Y46";
  X_BUF \K1/processor/store_data<7>/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/store_data<7>/CLKINV_629 )
  );
  defparam \K1/processor/store_data<7>/SLICEWE0USED .LOC = "SLICE_X52Y46";
  X_BUF \K1/processor/store_data<7>/SLICEWE0USED  (
    .I(\K1/processor/store_data<7>/BXINV_632 ),
    .O(\K1/processor/store_data<7>/SLICEWE0USED_631 )
  );
  defparam \K1/processor/store_data<7>/SLICEWE1USED .LOC = "SLICE_X52Y46";
  X_BUF \K1/processor/store_data<7>/SLICEWE1USED  (
    .I(\K1/processor/store_data<7>/BYINV_628 ),
    .O(\K1/processor/store_data<7>/SLICEWE1USED_633 )
  );
  defparam \K1/processor/store_loop[7].memory_bit/F5.S1/F5USED .LOC = "SLICE_X52Y47";
  X_BUF \K1/processor/store_loop[7].memory_bit/F5.S1/F5USED  (
    .I(\K1/processor/store_loop[7].memory_bit/F5.S1/F5MUX_634 ),
    .O(\K1/processor/store_loop[7].memory_bit/F5.S1 )
  );
  defparam \K1/processor/store_loop[7].memory_bit/F5.S1/F5MUX .LOC = "SLICE_X52Y47";
  X_MUX2 \K1/processor/store_loop[7].memory_bit/F5.S1/F5MUX  (
    .IA(\K1/processor/store_loop[7].memory_bit/G.S1_637 ),
    .IB(\K1/processor/store_loop[7].memory_bit/F.S1_635 ),
    .SEL(\K1/processor/store_loop[7].memory_bit/F5.S1/BXINV_642 ),
    .O(\K1/processor/store_loop[7].memory_bit/F5.S1/F5MUX_634 )
  );
  defparam \K1/processor/store_loop[7].memory_bit/F5.S1/DIF_MUX .LOC = "SLICE_X52Y47";
  X_BUF \K1/processor/store_loop[7].memory_bit/F5.S1/DIF_MUX  (
    .I(\K1/processor/store_loop[7].memory_bit/F5.S1/DIG_MUX_638 ),
    .O(\K1/processor/store_loop[7].memory_bit/F5.S1/DIF_MUX_636 )
  );
  defparam \K1/processor/store_loop[7].memory_bit/F5.S1/BXINV .LOC = "SLICE_X52Y47";
  X_BUF \K1/processor/store_loop[7].memory_bit/F5.S1/BXINV  (
    .I(port_id[4]),
    .O(\K1/processor/store_loop[7].memory_bit/F5.S1/BXINV_642 )
  );
  defparam \K1/processor/store_loop[7].memory_bit/F5.S1/DIG_MUX .LOC = "SLICE_X52Y47";
  X_BUF \K1/processor/store_loop[7].memory_bit/F5.S1/DIG_MUX  (
    .I(\out_port<7>_0 ),
    .O(\K1/processor/store_loop[7].memory_bit/F5.S1/DIG_MUX_638 )
  );
  defparam \K1/processor/store_loop[7].memory_bit/F5.S1/SRINV .LOC = "SLICE_X52Y47";
  X_BUF \K1/processor/store_loop[7].memory_bit/F5.S1/SRINV  (
    .I(\K1/processor/memory_enable_0 ),
    .O(\K1/processor/store_loop[7].memory_bit/F5.S1/SRINV_640 )
  );
  defparam \K1/processor/store_loop[7].memory_bit/F5.S1/CLKINV .LOC = "SLICE_X52Y47";
  X_BUF \K1/processor/store_loop[7].memory_bit/F5.S1/CLKINV  (
    .I(clk_BUFGP),
    .O(\K1/processor/store_loop[7].memory_bit/F5.S1/CLKINV_639 )
  );
  defparam \K1/processor/store_loop[7].memory_bit/F5.S1/SLICEWE0USED .LOC = "SLICE_X52Y47";
  X_BUF \K1/processor/store_loop[7].memory_bit/F5.S1/SLICEWE0USED  (
    .I(\K1/processor/store_loop[7].memory_bit/F5.S1/BXINV_642 ),
    .O(\K1/processor/store_loop[7].memory_bit/F5.S1/SLICEWE0USED_641 )
  );
  defparam \K1/processor/store_loop[7].memory_bit/F5.S1/SLICEWE1USED .LOC = "SLICE_X52Y47";
  X_INV \K1/processor/store_loop[7].memory_bit/F5.S1/SLICEWE1USED  (
    .I(\K1/processor/store_data<7>/BYINV_628 ),
    .O(\K1/processor/store_loop[7].memory_bit/F5.S1/SLICEWE1USED_643 )
  );
  defparam \K1/processor/store_loop[6].memory_bit/G.S0 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[6].memory_bit/G.S0 .LOC = "SLICE_X52Y44";
  X_RAMD16 \K1/processor/store_loop[6].memory_bit/G.S0  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_data<6>/DIG_MUX_299 ),
    .CLK(\K1/processor/store_data<6>/CLKINV_301 ),
    .WE(\K1/processor/store_data<6>/WSG ),
    .O(\K1/processor/store_loop[6].memory_bit/G.S0_298 )
  );
  defparam \K1/processor/store_loop[5].memory_bit/G.S0 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[5].memory_bit/G.S0 .LOC = "SLICE_X66Y46";
  X_RAMD16 \K1/processor/store_loop[5].memory_bit/G.S0  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_data<5>/DIG_MUX_358 ),
    .CLK(\K1/processor/store_data<5>/CLKINV_360 ),
    .WE(\K1/processor/store_data<5>/WSG ),
    .O(\K1/processor/store_loop[5].memory_bit/G.S0_357 )
  );
  defparam \K1/processor/high_zero_lut .INIT = 16'h0001;
  defparam \K1/processor/high_zero_lut .LOC = "SLICE_X64Y40";
  X_LUT4 \K1/processor/high_zero_lut  (
    .ADR0(\K1/processor/alu_result [4]),
    .ADR1(\K1/processor/alu_result [5]),
    .ADR2(\K1/processor/alu_result [7]),
    .ADR3(\K1/processor/alu_result [6]),
    .O(\K1/processor/high_zero )
  );
  defparam \K1/processor/high_parity_lut .INIT = 16'h6996;
  defparam \K1/processor/high_parity_lut .LOC = "SLICE_X54Y44";
  X_LUT4 \K1/processor/high_parity_lut  (
    .ADR0(\K1/processor/logical_result [5]),
    .ADR1(\K1/processor/logical_result [7]),
    .ADR2(\K1/processor/logical_result [6]),
    .ADR3(\K1/processor/logical_result [4]),
    .O(\K1/processor/high_parity )
  );
  defparam in_port_0.LOC = "IPAD78";
  defparam in_port_0.INIT = 1'b0;
  X_FF in_port_0 (
    .I(\sw<0>/IFF/IDDRIN_MUX_645 ),
    .CE(VCC),
    .CLK(\sw<0>/IFF/ICLK1INV_644 ),
    .SET(GND),
    .RST(GND),
    .O(in_port[0])
  );
  defparam \sw<0>/IFF/IDDRIN_MUX .LOC = "IPAD78";
  X_BUF \sw<0>/IFF/IDDRIN_MUX  (
    .I(\sw<0>/INBUF ),
    .O(\sw<0>/IFF/IDDRIN_MUX_645 )
  );
  defparam \sw<0>/IFF/ICLK1INV .LOC = "IPAD78";
  X_BUF \sw<0>/IFF/ICLK1INV  (
    .I(clk_BUFGP),
    .O(\sw<0>/IFF/ICLK1INV_644 )
  );
  defparam in_port_1.LOC = "IPAD83";
  defparam in_port_1.INIT = 1'b0;
  X_FF in_port_1 (
    .I(\sw<1>/IFF/IDDRIN_MUX_647 ),
    .CE(VCC),
    .CLK(\sw<1>/IFF/ICLK1INV_646 ),
    .SET(GND),
    .RST(GND),
    .O(in_port[1])
  );
  defparam \sw<1>/IFF/IDDRIN_MUX .LOC = "IPAD83";
  X_BUF \sw<1>/IFF/IDDRIN_MUX  (
    .I(\sw<1>/INBUF ),
    .O(\sw<1>/IFF/IDDRIN_MUX_647 )
  );
  defparam \sw<1>/IFF/ICLK1INV .LOC = "IPAD83";
  X_BUF \sw<1>/IFF/ICLK1INV  (
    .I(clk_BUFGP),
    .O(\sw<1>/IFF/ICLK1INV_646 )
  );
  defparam in_port_2.LOC = "IPAD88";
  defparam in_port_2.INIT = 1'b0;
  X_FF in_port_2 (
    .I(\sw<2>/IFF/IDDRIN_MUX_649 ),
    .CE(VCC),
    .CLK(\sw<2>/IFF/ICLK1INV_648 ),
    .SET(GND),
    .RST(GND),
    .O(in_port[2])
  );
  defparam \sw<2>/IFF/IDDRIN_MUX .LOC = "IPAD88";
  X_BUF \sw<2>/IFF/IDDRIN_MUX  (
    .I(\sw<2>/INBUF ),
    .O(\sw<2>/IFF/IDDRIN_MUX_649 )
  );
  defparam \sw<2>/IFF/ICLK1INV .LOC = "IPAD88";
  X_BUF \sw<2>/IFF/ICLK1INV  (
    .I(clk_BUFGP),
    .O(\sw<2>/IFF/ICLK1INV_648 )
  );
  defparam in_port_3.LOC = "IPAD93";
  defparam in_port_3.INIT = 1'b0;
  X_FF in_port_3 (
    .I(\sw<3>/IFF/IDDRIN_MUX_651 ),
    .CE(VCC),
    .CLK(\sw<3>/IFF/ICLK1INV_650 ),
    .SET(GND),
    .RST(GND),
    .O(in_port[3])
  );
  defparam \sw<3>/IFF/IDDRIN_MUX .LOC = "IPAD93";
  X_BUF \sw<3>/IFF/IDDRIN_MUX  (
    .I(\sw<3>/INBUF ),
    .O(\sw<3>/IFF/IDDRIN_MUX_651 )
  );
  defparam \sw<3>/IFF/ICLK1INV .LOC = "IPAD93";
  X_BUF \sw<3>/IFF/ICLK1INV  (
    .I(clk_BUFGP),
    .O(\sw<3>/IFF/ICLK1INV_650 )
  );
  defparam in_port_4.LOC = "IPAD103";
  defparam in_port_4.INIT = 1'b0;
  X_FF in_port_4 (
    .I(\sw<4>/IFF/IDDRIN_MUX_653 ),
    .CE(VCC),
    .CLK(\sw<4>/IFF/ICLK1INV_652 ),
    .SET(GND),
    .RST(GND),
    .O(in_port[4])
  );
  defparam \sw<4>/IFF/IDDRIN_MUX .LOC = "IPAD103";
  X_BUF \sw<4>/IFF/IDDRIN_MUX  (
    .I(\sw<4>/INBUF ),
    .O(\sw<4>/IFF/IDDRIN_MUX_653 )
  );
  defparam \sw<4>/IFF/ICLK1INV .LOC = "IPAD103";
  X_BUF \sw<4>/IFF/ICLK1INV  (
    .I(clk_BUFGP),
    .O(\sw<4>/IFF/ICLK1INV_652 )
  );
  defparam in_port_5.LOC = "IPAD98";
  defparam in_port_5.INIT = 1'b0;
  X_FF in_port_5 (
    .I(\sw<5>/IFF/IDDRIN_MUX_655 ),
    .CE(VCC),
    .CLK(\sw<5>/IFF/ICLK1INV_654 ),
    .SET(GND),
    .RST(GND),
    .O(in_port[5])
  );
  defparam \sw<5>/IFF/IDDRIN_MUX .LOC = "IPAD98";
  X_BUF \sw<5>/IFF/IDDRIN_MUX  (
    .I(\sw<5>/INBUF ),
    .O(\sw<5>/IFF/IDDRIN_MUX_655 )
  );
  defparam \sw<5>/IFF/ICLK1INV .LOC = "IPAD98";
  X_BUF \sw<5>/IFF/ICLK1INV  (
    .I(clk_BUFGP),
    .O(\sw<5>/IFF/ICLK1INV_654 )
  );
  defparam in_port_6.LOC = "IPAD108";
  defparam in_port_6.INIT = 1'b0;
  X_FF in_port_6 (
    .I(\sw<6>/IFF/IDDRIN_MUX_657 ),
    .CE(VCC),
    .CLK(\sw<6>/IFF/ICLK1INV_656 ),
    .SET(GND),
    .RST(GND),
    .O(in_port[6])
  );
  defparam \sw<6>/IFF/IDDRIN_MUX .LOC = "IPAD108";
  X_BUF \sw<6>/IFF/IDDRIN_MUX  (
    .I(\sw<6>/INBUF ),
    .O(\sw<6>/IFF/IDDRIN_MUX_657 )
  );
  defparam \sw<6>/IFF/ICLK1INV .LOC = "IPAD108";
  X_BUF \sw<6>/IFF/ICLK1INV  (
    .I(clk_BUFGP),
    .O(\sw<6>/IFF/ICLK1INV_656 )
  );
  defparam in_port_7.LOC = "IPAD112";
  defparam in_port_7.INIT = 1'b0;
  X_FF in_port_7 (
    .I(\sw<7>/IFF/IDDRIN_MUX_659 ),
    .CE(VCC),
    .CLK(\sw<7>/IFF/ICLK1INV_658 ),
    .SET(GND),
    .RST(GND),
    .O(in_port[7])
  );
  defparam \sw<7>/IFF/IDDRIN_MUX .LOC = "IPAD112";
  X_BUF \sw<7>/IFF/IDDRIN_MUX  (
    .I(\sw<7>/INBUF ),
    .O(\sw<7>/IFF/IDDRIN_MUX_659 )
  );
  defparam \sw<7>/IFF/ICLK1INV .LOC = "IPAD112";
  X_BUF \sw<7>/IFF/ICLK1INV  (
    .I(clk_BUFGP),
    .O(\sw<7>/IFF/ICLK1INV_658 )
  );
  defparam \K1/processor/low_shift_in_lut .INIT = 16'hCCAA;
  defparam \K1/processor/low_shift_in_lut .LOC = "SLICE_X55Y38";
  X_LUT4 \K1/processor/low_shift_in_lut  (
    .ADR0(\K1/processor/carry_flag ),
    .ADR1(\out_port<7>_0 ),
    .ADR2(VCC),
    .ADR3(\K1/instruction [1]),
    .O(\K1/processor/low_shift_in )
  );
  defparam \K1/processor/alu_mux_loop[6].or_lut .INIT = 16'hFFFC;
  defparam \K1/processor/alu_mux_loop[6].or_lut .LOC = "SLICE_X55Y47";
  X_LUT4 \K1/processor/alu_mux_loop[6].or_lut  (
    .ADR0(VCC),
    .ADR1(\K1/processor/logical_result [6]),
    .ADR2(\K1/processor/arith_result [6]),
    .ADR3(\K1/processor/shift_result [6]),
    .O(\K1/processor/alu_group [6])
  );
  defparam \K1/processor/alu_mux_loop[5].or_lut .INIT = 16'hFEFE;
  defparam \K1/processor/alu_mux_loop[5].or_lut .LOC = "SLICE_X65Y46";
  X_LUT4 \K1/processor/alu_mux_loop[5].or_lut  (
    .ADR0(\K1/processor/shift_result [5]),
    .ADR1(\K1/processor/logical_result [5]),
    .ADR2(\K1/processor/arith_result [5]),
    .ADR3(VCC),
    .O(\K1/processor/alu_group [5])
  );
  defparam \K1/processor/alu_mux_loop[4].or_lut .INIT = 16'hFFFA;
  defparam \K1/processor/alu_mux_loop[4].or_lut .LOC = "SLICE_X65Y47";
  X_LUT4 \K1/processor/alu_mux_loop[4].or_lut  (
    .ADR0(\K1/processor/shift_result [4]),
    .ADR1(VCC),
    .ADR2(\K1/processor/logical_result [4]),
    .ADR3(\K1/processor/arith_result [4]),
    .O(\K1/processor/alu_group [4])
  );
  defparam \K1/processor/alu_mux_loop[3].or_lut .INIT = 16'hFFFC;
  defparam \K1/processor/alu_mux_loop[3].or_lut .LOC = "SLICE_X64Y44";
  X_LUT4 \K1/processor/alu_mux_loop[3].or_lut  (
    .ADR0(VCC),
    .ADR1(\K1/processor/shift_result [3]),
    .ADR2(\K1/processor/arith_result [3]),
    .ADR3(\K1/processor/logical_result [3]),
    .O(\K1/processor/alu_group [3])
  );
  defparam \K1/processor/alu_mux_loop[2].or_lut .INIT = 16'hFEFE;
  defparam \K1/processor/alu_mux_loop[2].or_lut .LOC = "SLICE_X64Y46";
  X_LUT4 \K1/processor/alu_mux_loop[2].or_lut  (
    .ADR0(\K1/processor/shift_result [2]),
    .ADR1(\K1/processor/logical_result [2]),
    .ADR2(\K1/processor/arith_result [2]),
    .ADR3(VCC),
    .O(\K1/processor/alu_group [2])
  );
  defparam \K1/processor/alu_mux_loop[1].or_lut .INIT = 16'hFFFC;
  defparam \K1/processor/alu_mux_loop[1].or_lut .LOC = "SLICE_X65Y49";
  X_LUT4 \K1/processor/alu_mux_loop[1].or_lut  (
    .ADR0(VCC),
    .ADR1(\K1/processor/shift_result [1]),
    .ADR2(\K1/processor/logical_result [1]),
    .ADR3(\K1/processor/arith_result [1]),
    .O(\K1/processor/alu_group [1])
  );
  defparam \K1/processor/alu_mux_loop[0].or_lut .INIT = 16'hFEFE;
  defparam \K1/processor/alu_mux_loop[0].or_lut .LOC = "SLICE_X64Y47";
  X_LUT4 \K1/processor/alu_mux_loop[0].or_lut  (
    .ADR0(\K1/processor/logical_result [0]),
    .ADR1(\K1/processor/shift_result [0]),
    .ADR2(\K1/processor/arith_result [0]),
    .ADR3(VCC),
    .O(\K1/processor/alu_group [0])
  );
  defparam \K1/processor/alu_mux_loop[7].or_lut .INIT = 16'hFFFC;
  defparam \K1/processor/alu_mux_loop[7].or_lut .LOC = "SLICE_X65Y44";
  X_LUT4 \K1/processor/alu_mux_loop[7].or_lut  (
    .ADR0(VCC),
    .ADR1(\K1/processor/logical_result [7]),
    .ADR2(\K1/processor/arith_result [7]),
    .ADR3(\K1/processor/shift_result [7]),
    .O(\K1/processor/alu_group [7])
  );
  defparam \K1/processor/pc_loop[1].vector_select_mux .INIT = 16'hD8D8;
  defparam \K1/processor/pc_loop[1].vector_select_mux .LOC = "SLICE_X54Y12";
  X_LUT4 \K1/processor/pc_loop[1].vector_select_mux  (
    .ADR0(\K1/instruction [15]),
    .ADR1(\K1/processor/stack_pop_data [1]),
    .ADR2(\K1/instruction [1]),
    .ADR3(VCC),
    .O(\K1/processor/pc_vector [1])
  );
  defparam \K1/processor/pc_loop[3].vector_select_mux .INIT = 16'hCCAA;
  defparam \K1/processor/pc_loop[3].vector_select_mux .LOC = "SLICE_X54Y13";
  X_LUT4 \K1/processor/pc_loop[3].vector_select_mux  (
    .ADR0(\K1/instruction [3]),
    .ADR1(\K1/processor/stack_pop_data [3]),
    .ADR2(VCC),
    .ADR3(\K1/instruction [15]),
    .O(\K1/processor/pc_vector [3])
  );
  defparam \K1/processor/pc_loop[5].vector_select_mux .INIT = 16'hFA50;
  defparam \K1/processor/pc_loop[5].vector_select_mux .LOC = "SLICE_X54Y14";
  X_LUT4 \K1/processor/pc_loop[5].vector_select_mux  (
    .ADR0(\K1/instruction [15]),
    .ADR1(VCC),
    .ADR2(\K1/instruction [5]),
    .ADR3(\K1/processor/stack_pop_data [5]),
    .O(\K1/processor/pc_vector [5])
  );
  defparam \K1/processor/pc_loop[7].vector_select_mux .INIT = 16'hD8D8;
  defparam \K1/processor/pc_loop[7].vector_select_mux .LOC = "SLICE_X54Y15";
  X_LUT4 \K1/processor/pc_loop[7].vector_select_mux  (
    .ADR0(\K1/instruction [15]),
    .ADR1(\K1/processor/stack_pop_data [7]),
    .ADR2(\K1/instruction [7]),
    .ADR3(VCC),
    .O(\K1/processor/pc_vector [7])
  );
  defparam \K1/processor/pc_loop[9].vector_select_mux .INIT = 16'hD8D8;
  defparam \K1/processor/pc_loop[9].vector_select_mux .LOC = "SLICE_X54Y16";
  X_LUT4 \K1/processor/pc_loop[9].vector_select_mux  (
    .ADR0(\K1/instruction [15]),
    .ADR1(\K1/processor/stack_pop_data [9]),
    .ADR2(\K1/instruction [9]),
    .ADR3(VCC),
    .O(\K1/processor/pc_vector [9])
  );
  defparam \K1/processor/pc_loop[8].vector_select_mux .INIT = 16'hFA50;
  defparam \K1/processor/pc_loop[8].vector_select_mux .LOC = "SLICE_X54Y16";
  X_LUT4 \K1/processor/pc_loop[8].vector_select_mux  (
    .ADR0(\K1/instruction [15]),
    .ADR1(VCC),
    .ADR2(\K1/instruction [8]),
    .ADR3(\K1/processor/stack_pop_data [8]),
    .O(\K1/processor/pc_vector [8])
  );
  defparam \K1/processor/arith_loop[7].msb_arith.arith_carry_flop .LOC = "SLICE_X54Y51";
  defparam \K1/processor/arith_loop[7].msb_arith.arith_carry_flop .INIT = 1'b0;
  X_SFF \K1/processor/arith_loop[7].msb_arith.arith_carry_flop  (
    .I(\K1/processor/arith_result<7>/DYMUX_90 ),
    .CE(VCC),
    .CLK(\K1/processor/arith_result<7>/CLKINV_93 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/arith_result<7>/SRINV_92 ),
    .O(\K1/processor/arith_carry )
  );
  defparam \K1/processor/pc_loop[1].register_bit .LOC = "SLICE_X55Y14";
  defparam \K1/processor/pc_loop[1].register_bit .INIT = 1'b0;
  X_SFF \K1/processor/pc_loop[1].register_bit  (
    .I(\K1/address<0>/DYMUX_98 ),
    .CE(\K1/address<0>/CEINVNOT ),
    .CLK(\K1/address<0>/CLKINV_104 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/address<0>/SRINV_103 ),
    .O(\K1/address [1])
  );
  defparam \K1/processor/pc_loop[5].value_select_mux .INIT = 16'hAACC;
  defparam \K1/processor/pc_loop[5].value_select_mux .LOC = "SLICE_X55Y16";
  X_LUT4 \K1/processor/pc_loop[5].value_select_mux  (
    .ADR0(\K1/address [5]),
    .ADR1(\K1/processor/inc_pc_vector [5]),
    .ADR2(VCC),
    .ADR3(\K1/processor/normal_count_0 ),
    .O(\K1/processor/pc_value [5])
  );
  defparam \K1/processor/store_loop[4].memory_bit/G.S0 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[4].memory_bit/G.S0 .LOC = "SLICE_X52Y50";
  X_RAMD16 \K1/processor/store_loop[4].memory_bit/G.S0  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_data<4>/DIG_MUX_263 ),
    .CLK(\K1/processor/store_data<4>/CLKINV_265 ),
    .WE(\K1/processor/store_data<4>/WSG ),
    .O(\K1/processor/store_loop[4].memory_bit/G.S0_262 )
  );
  defparam \K1/processor/store_loop[3].memory_bit/G.S0 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[3].memory_bit/G.S0 .LOC = "SLICE_X66Y44";
  X_RAMD16 \K1/processor/store_loop[3].memory_bit/G.S0  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_data<3>/DIG_MUX_286 ),
    .CLK(\K1/processor/store_data<3>/CLKINV_288 ),
    .WE(\K1/processor/store_data<3>/WSG ),
    .O(\K1/processor/store_loop[3].memory_bit/G.S0_285 )
  );
  defparam \K1/processor/store_loop[2].memory_bit/G.S0 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[2].memory_bit/G.S0 .LOC = "SLICE_X64Y48";
  X_RAMD16 \K1/processor/store_loop[2].memory_bit/G.S0  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_data<2>/DIG_MUX_121 ),
    .CLK(\K1/processor/store_data<2>/CLKINV_123 ),
    .WE(\K1/processor/store_data<2>/WSG ),
    .O(\K1/processor/store_loop[2].memory_bit/G.S0_120 )
  );
  defparam \K1/processor/store_loop[1].memory_bit/G.S0 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[1].memory_bit/G.S0 .LOC = "SLICE_X52Y48";
  X_RAMD16 \K1/processor/store_loop[1].memory_bit/G.S0  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_data<1>/DIG_MUX_144 ),
    .CLK(\K1/processor/store_data<1>/CLKINV_146 ),
    .WE(\K1/processor/store_data<1>/WSG ),
    .O(\K1/processor/store_loop[1].memory_bit/G.S0_143 )
  );
  defparam \K1/processor/store_loop[0].memory_bit/G.S0 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[0].memory_bit/G.S0 .LOC = "SLICE_X66Y48";
  X_RAMD16 \K1/processor/store_loop[0].memory_bit/G.S0  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_data<0>/DIG_MUX_167 ),
    .CLK(\K1/processor/store_data<0>/CLKINV_169 ),
    .WE(\K1/processor/store_data<0>/WSG ),
    .O(\K1/processor/store_loop[0].memory_bit/G.S0_166 )
  );
  defparam \K1/processor/reg_loop[7].operand_select_mux .INIT = 16'hFC0C;
  defparam \K1/processor/reg_loop[7].operand_select_mux .LOC = "SLICE_X53Y42";
  X_LUT4 \K1/processor/reg_loop[7].operand_select_mux  (
    .ADR0(VCC),
    .ADR1(\K1/instruction [7]),
    .ADR2(\K1/instruction [12]),
    .ADR3(\K1/processor/sy<7>_0 ),
    .O(\port_id<7>_pack_1 )
  );
  defparam \K1/processor/reg_loop[6].operand_select_mux .INIT = 16'hEE44;
  defparam \K1/processor/reg_loop[6].operand_select_mux .LOC = "SLICE_X53Y44";
  X_LUT4 \K1/processor/reg_loop[6].operand_select_mux  (
    .ADR0(\K1/instruction [12]),
    .ADR1(\K1/instruction [6]),
    .ADR2(VCC),
    .ADR3(\K1/processor/sy<6>_0 ),
    .O(\port_id<6>_pack_1 )
  );
  defparam \K1/processor/reg_loop[5].operand_select_mux .INIT = 16'hFA0A;
  defparam \K1/processor/reg_loop[5].operand_select_mux .LOC = "SLICE_X55Y44";
  X_LUT4 \K1/processor/reg_loop[5].operand_select_mux  (
    .ADR0(\K1/instruction [5]),
    .ADR1(VCC),
    .ADR2(\K1/instruction [12]),
    .ADR3(\K1/processor/sy<5>_0 ),
    .O(\port_id<5>_pack_1 )
  );
  defparam \K1/processor/reg_loop[4].operand_select_mux .INIT = 16'hBB88;
  defparam \K1/processor/reg_loop[4].operand_select_mux .LOC = "SLICE_X54Y45";
  X_LUT4 \K1/processor/reg_loop[4].operand_select_mux  (
    .ADR0(\K1/processor/sy<4>_0 ),
    .ADR1(\K1/instruction [12]),
    .ADR2(VCC),
    .ADR3(\K1/instruction [4]),
    .O(\port_id<4>_pack_1 )
  );
  defparam \K1/processor/reg_loop[3].operand_select_mux .INIT = 16'hCCF0;
  defparam \K1/processor/reg_loop[3].operand_select_mux .LOC = "SLICE_X55Y45";
  X_LUT4 \K1/processor/reg_loop[3].operand_select_mux  (
    .ADR0(VCC),
    .ADR1(\K1/processor/sy<3>_0 ),
    .ADR2(\K1/instruction [3]),
    .ADR3(\K1/instruction [12]),
    .O(\port_id<3>_pack_1 )
  );
  defparam \K1/processor/reg_loop[2].operand_select_mux .INIT = 16'hD8D8;
  defparam \K1/processor/reg_loop[2].operand_select_mux .LOC = "SLICE_X54Y38";
  X_LUT4 \K1/processor/reg_loop[2].operand_select_mux  (
    .ADR0(\K1/instruction [12]),
    .ADR1(\K1/processor/sy<2>_0 ),
    .ADR2(\K1/instruction [2]),
    .ADR3(VCC),
    .O(\port_id<2>_pack_1 )
  );
  defparam \K1/processor/reg_loop[1].operand_select_mux .INIT = 16'hCCF0;
  defparam \K1/processor/reg_loop[1].operand_select_mux .LOC = "SLICE_X55Y42";
  X_LUT4 \K1/processor/reg_loop[1].operand_select_mux  (
    .ADR0(VCC),
    .ADR1(\K1/processor/sy<1>_0 ),
    .ADR2(\K1/instruction [1]),
    .ADR3(\K1/instruction [12]),
    .O(\port_id<1>_pack_1 )
  );
  defparam \K1/processor/io_decode_lut .INIT = 16'h000C;
  defparam \K1/processor/io_decode_lut .LOC = "SLICE_X54Y37";
  X_LUT4 \K1/processor/io_decode_lut  (
    .ADR0(VCC),
    .ADR1(\K1/instruction [14]),
    .ADR2(\K1/instruction [13]),
    .ADR3(\K1/instruction [16]),
    .O(\K1/processor/io_initial_decode_pack_1 )
  );
  defparam \K1/processor/store_loop[7].memory_bit/G.S0 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[7].memory_bit/G.S0 .LOC = "SLICE_X52Y46";
  X_RAMD16 \K1/processor/store_loop[7].memory_bit/G.S0  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_data<7>/DIG_MUX_627 ),
    .CLK(\K1/processor/store_data<7>/CLKINV_629 ),
    .WE(\K1/processor/store_data<7>/WSG ),
    .O(\K1/processor/store_loop[7].memory_bit/G.S0_626 )
  );
  defparam \K1/processor/high_shift_in_lut .INIT = 16'hAACC;
  defparam \K1/processor/high_shift_in_lut .LOC = "SLICE_X55Y38";
  X_LUT4 \K1/processor/high_shift_in_lut  (
    .ADR0(\K1/instruction [0]),
    .ADR1(\out_port<0>_0 ),
    .ADR2(VCC),
    .ADR3(\K1/instruction [1]),
    .O(\K1/processor/high_shift_in )
  );
  defparam \K1/processor/alu_mux_loop[6].mux_lut .INIT = 16'hF0CC;
  defparam \K1/processor/alu_mux_loop[6].mux_lut .LOC = "SLICE_X55Y47";
  X_LUT4 \K1/processor/alu_mux_loop[6].mux_lut  (
    .ADR0(VCC),
    .ADR1(in_port[6]),
    .ADR2(\K1/processor/store_data [6]),
    .ADR3(\K1/instruction [13]),
    .O(\K1/processor/input_group [6])
  );
  defparam \K1/processor/alu_mux_loop[5].mux_lut .INIT = 16'hCCF0;
  defparam \K1/processor/alu_mux_loop[5].mux_lut .LOC = "SLICE_X65Y46";
  X_LUT4 \K1/processor/alu_mux_loop[5].mux_lut  (
    .ADR0(VCC),
    .ADR1(\K1/processor/store_data [5]),
    .ADR2(in_port[5]),
    .ADR3(\K1/instruction [13]),
    .O(\K1/processor/input_group [5])
  );
  defparam \K1/processor/alu_mux_loop[4].mux_lut .INIT = 16'hF0CC;
  defparam \K1/processor/alu_mux_loop[4].mux_lut .LOC = "SLICE_X65Y47";
  X_LUT4 \K1/processor/alu_mux_loop[4].mux_lut  (
    .ADR0(VCC),
    .ADR1(in_port[4]),
    .ADR2(\K1/processor/store_data [4]),
    .ADR3(\K1/instruction [13]),
    .O(\K1/processor/input_group [4])
  );
  defparam \K1/processor/alu_mux_loop[3].mux_lut .INIT = 16'hDD88;
  defparam \K1/processor/alu_mux_loop[3].mux_lut .LOC = "SLICE_X64Y44";
  X_LUT4 \K1/processor/alu_mux_loop[3].mux_lut  (
    .ADR0(\K1/instruction [13]),
    .ADR1(\K1/processor/store_data [3]),
    .ADR2(VCC),
    .ADR3(in_port[3]),
    .O(\K1/processor/input_group [3])
  );
  defparam \K1/processor/alu_mux_loop[2].mux_lut .INIT = 16'hD8D8;
  defparam \K1/processor/alu_mux_loop[2].mux_lut .LOC = "SLICE_X64Y46";
  X_LUT4 \K1/processor/alu_mux_loop[2].mux_lut  (
    .ADR0(\K1/instruction [13]),
    .ADR1(\K1/processor/store_data [2]),
    .ADR2(in_port[2]),
    .ADR3(VCC),
    .O(\K1/processor/input_group [2])
  );
  defparam \K1/processor/alu_mux_loop[1].mux_lut .INIT = 16'hCCAA;
  defparam \K1/processor/alu_mux_loop[1].mux_lut .LOC = "SLICE_X65Y49";
  X_LUT4 \K1/processor/alu_mux_loop[1].mux_lut  (
    .ADR0(in_port[1]),
    .ADR1(\K1/processor/store_data [1]),
    .ADR2(VCC),
    .ADR3(\K1/instruction [13]),
    .O(\K1/processor/input_group [1])
  );
  defparam \K1/processor/alu_mux_loop[0].mux_lut .INIT = 16'hFA50;
  defparam \K1/processor/alu_mux_loop[0].mux_lut .LOC = "SLICE_X64Y47";
  X_LUT4 \K1/processor/alu_mux_loop[0].mux_lut  (
    .ADR0(\K1/instruction [13]),
    .ADR1(VCC),
    .ADR2(in_port[0]),
    .ADR3(\K1/processor/store_data [0]),
    .O(\K1/processor/input_group [0])
  );
  defparam \K1/processor/alu_mux_loop[7].mux_lut .INIT = 16'hACAC;
  defparam \K1/processor/alu_mux_loop[7].mux_lut .LOC = "SLICE_X65Y44";
  X_LUT4 \K1/processor/alu_mux_loop[7].mux_lut  (
    .ADR0(\K1/processor/store_data [7]),
    .ADR1(in_port[7]),
    .ADR2(\K1/instruction [13]),
    .ADR3(VCC),
    .O(\K1/processor/input_group [7])
  );
  defparam \K1/processor/logical_loop[0].logical_lut .INIT = 16'h7AA2;
  defparam \K1/processor/logical_loop[0].logical_lut .LOC = "SLICE_X54Y36";
  X_LUT4 \K1/processor/logical_loop[0].logical_lut  (
    .ADR0(port_id[0]),
    .ADR1(\K1/instruction [13]),
    .ADR2(\out_port<0>_0 ),
    .ADR3(\K1/instruction [14]),
    .O(\K1/processor/logical_value [0])
  );
  defparam \K1/processor/pc_loop[9].register_bit .LOC = "SLICE_X55Y18";
  defparam \K1/processor/pc_loop[9].register_bit .INIT = 1'b0;
  X_SFF \K1/processor/pc_loop[9].register_bit  (
    .I(\K1/address<8>/DYMUX_460 ),
    .CE(\K1/address<8>/CEINVNOT ),
    .CLK(\K1/address<8>/CLKINV_463 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/address<8>/SRINV_462 ),
    .O(\K1/address [9])
  );
  defparam \K1/processor/low_zero_lut .INIT = 16'h0001;
  defparam \K1/processor/low_zero_lut .LOC = "SLICE_X64Y40";
  X_LUT4 \K1/processor/low_zero_lut  (
    .ADR0(\K1/processor/alu_result [3]),
    .ADR1(\K1/processor/alu_result [2]),
    .ADR2(\K1/processor/alu_result [1]),
    .ADR3(\K1/processor/alu_result [0]),
    .O(\K1/processor/low_zero )
  );
  defparam led_0.LOC = "PAD84";
  defparam led_0.INIT = 1'b0;
  X_FF led_0 (
    .I(\led<0>/OUTPUT/OFF/ODDRIN1_MUX ),
    .CE(\led<0>/OUTPUT/OFF/OCEINV_387 ),
    .CLK(\led<0>/OUTPUT/OTCLK1INV_386 ),
    .SET(GND),
    .RST(GND),
    .O(led_0_388)
  );
  defparam led_1.LOC = "PAD85";
  defparam led_1.INIT = 1'b0;
  X_FF led_1 (
    .I(\led<1>/OUTPUT/OFF/ODDRIN1_MUX ),
    .CE(\led<1>/OUTPUT/OFF/OCEINV_390 ),
    .CLK(\led<1>/OUTPUT/OTCLK1INV_389 ),
    .SET(GND),
    .RST(GND),
    .O(led_1_391)
  );
  defparam led_2.LOC = "PAD90";
  defparam led_2.INIT = 1'b0;
  X_FF led_2 (
    .I(\led<2>/OUTPUT/OFF/ODDRIN1_MUX ),
    .CE(\led<2>/OUTPUT/OFF/OCEINV_393 ),
    .CLK(\led<2>/OUTPUT/OTCLK1INV_392 ),
    .SET(GND),
    .RST(GND),
    .O(led_2_394)
  );
  defparam led_3.LOC = "PAD89";
  defparam led_3.INIT = 1'b0;
  X_FF led_3 (
    .I(\led<3>/OUTPUT/OFF/ODDRIN1_MUX ),
    .CE(\led<3>/OUTPUT/OFF/OCEINV_396 ),
    .CLK(\led<3>/OUTPUT/OTCLK1INV_395 ),
    .SET(GND),
    .RST(GND),
    .O(led_3_397)
  );
  defparam led_4.LOC = "PAD65";
  defparam led_4.INIT = 1'b0;
  X_FF led_4 (
    .I(\led<4>/OUTPUT/OFF/ODDRIN1_MUX ),
    .CE(\led<4>/OUTPUT/OFF/OCEINV_399 ),
    .CLK(\led<4>/OUTPUT/OTCLK1INV_398 ),
    .SET(GND),
    .RST(GND),
    .O(led_4_400)
  );
  defparam led_5.LOC = "PAD109";
  defparam led_5.INIT = 1'b0;
  X_FF led_5 (
    .I(\led<5>/OUTPUT/OFF/ODDRIN1_MUX ),
    .CE(\led<5>/OUTPUT/OFF/OCEINV_402 ),
    .CLK(\led<5>/OUTPUT/OTCLK1INV_401 ),
    .SET(GND),
    .RST(GND),
    .O(led_5_403)
  );
  defparam led_6.LOC = "PAD225";
  defparam led_6.INIT = 1'b0;
  X_FF led_6 (
    .I(\led<6>/OUTPUT/OFF/ODDRIN1_MUX ),
    .CE(\led<6>/OUTPUT/OFF/OCEINV_405 ),
    .CLK(\led<6>/OUTPUT/OTCLK1INV_404 ),
    .SET(GND),
    .RST(GND),
    .O(led_6_406)
  );
  defparam led_7.LOC = "PAD181";
  defparam led_7.INIT = 1'b0;
  X_FF led_7 (
    .I(\led<7>/OUTPUT/OFF/ODDRIN1_MUX ),
    .CE(\led<7>/OUTPUT/OFF/OCEINV_408 ),
    .CLK(\led<7>/OUTPUT/OTCLK1INV_407 ),
    .SET(GND),
    .RST(GND),
    .O(led_7_409)
  );
  defparam \K1/processor/stack_ram_loop[7].stack_flop .LOC = "SLICE_X64Y14";
  defparam \K1/processor/stack_ram_loop[7].stack_flop .INIT = 1'b0;
  X_FF \K1/processor/stack_ram_loop[7].stack_flop  (
    .I(\K1/processor/stack_pop_data<7>/DXMUX_212 ),
    .CE(VCC),
    .CLK(\K1/processor/stack_pop_data<7>/CLKINV_218 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/stack_pop_data [7])
  );
  defparam \K1/processor/stack_ram_loop[6].stack_bit/G .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[6].stack_bit/G .LOC = "SLICE_X52Y14";
  X_RAMD16 \K1/processor/stack_ram_loop[6].stack_bit/G  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<6>/DIG_MUX_226 ),
    .CLK(\K1/processor/stack_pop_data<6>/CLKINV_227 ),
    .WE(\K1/processor/stack_pop_data<6>/WSG ),
    .O(\K1/processor/stack_ram_loop[6].stack_bit/G_225 )
  );
  defparam \K1/processor/stack_ram_loop[6].stack_bit/F .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[6].stack_bit/F .LOC = "SLICE_X52Y14";
  X_RAMD16 \K1/processor/stack_ram_loop[6].stack_bit/F  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<6>/DIF_MUX_224 ),
    .CLK(\K1/processor/stack_pop_data<6>/CLKINV_227 ),
    .WE(\K1/processor/stack_pop_data<6>/WSF ),
    .O(\K1/processor/stack_ram_loop[6].stack_bit/F_223 )
  );
  defparam \K1/processor/stack_ram_loop[6].stack_flop .LOC = "SLICE_X52Y14";
  defparam \K1/processor/stack_ram_loop[6].stack_flop .INIT = 1'b0;
  X_FF \K1/processor/stack_ram_loop[6].stack_flop  (
    .I(\K1/processor/stack_pop_data<6>/DXMUX_221 ),
    .CE(VCC),
    .CLK(\K1/processor/stack_pop_data<6>/CLKINV_227 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/stack_pop_data [6])
  );
  defparam \K1/processor/stack_ram_loop[5].stack_bit/G .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[5].stack_bit/G .LOC = "SLICE_X64Y15";
  X_RAMD16 \K1/processor/stack_ram_loop[5].stack_bit/G  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<5>/DIG_MUX_235 ),
    .CLK(\K1/processor/stack_pop_data<5>/CLKINV_236 ),
    .WE(\K1/processor/stack_pop_data<5>/WSG ),
    .O(\K1/processor/stack_ram_loop[5].stack_bit/G_234 )
  );
  defparam \K1/processor/stack_ram_loop[5].stack_bit/F .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[5].stack_bit/F .LOC = "SLICE_X64Y15";
  X_RAMD16 \K1/processor/stack_ram_loop[5].stack_bit/F  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<5>/DIF_MUX_233 ),
    .CLK(\K1/processor/stack_pop_data<5>/CLKINV_236 ),
    .WE(\K1/processor/stack_pop_data<5>/WSF ),
    .O(\K1/processor/stack_ram_loop[5].stack_bit/F_232 )
  );
  defparam \K1/processor/stack_ram_loop[5].stack_flop .LOC = "SLICE_X64Y15";
  defparam \K1/processor/stack_ram_loop[5].stack_flop .INIT = 1'b0;
  X_FF \K1/processor/stack_ram_loop[5].stack_flop  (
    .I(\K1/processor/stack_pop_data<5>/DXMUX_230 ),
    .CE(VCC),
    .CLK(\K1/processor/stack_pop_data<5>/CLKINV_236 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/stack_pop_data [5])
  );
  defparam \K1/processor/stack_ram_loop[4].stack_bit/G .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[4].stack_bit/G .LOC = "SLICE_X54Y17";
  X_RAMD16 \K1/processor/stack_ram_loop[4].stack_bit/G  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<4>/DIG_MUX_244 ),
    .CLK(\K1/processor/stack_pop_data<4>/CLKINV_245 ),
    .WE(\K1/processor/stack_pop_data<4>/WSG ),
    .O(\K1/processor/stack_ram_loop[4].stack_bit/G_243 )
  );
  defparam \K1/processor/stack_ram_loop[4].stack_bit/F .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[4].stack_bit/F .LOC = "SLICE_X54Y17";
  X_RAMD16 \K1/processor/stack_ram_loop[4].stack_bit/F  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<4>/DIF_MUX_242 ),
    .CLK(\K1/processor/stack_pop_data<4>/CLKINV_245 ),
    .WE(\K1/processor/stack_pop_data<4>/WSF ),
    .O(\K1/processor/stack_ram_loop[4].stack_bit/F_241 )
  );
  defparam \K1/processor/stack_ram_loop[4].stack_flop .LOC = "SLICE_X54Y17";
  defparam \K1/processor/stack_ram_loop[4].stack_flop .INIT = 1'b0;
  X_FF \K1/processor/stack_ram_loop[4].stack_flop  (
    .I(\K1/processor/stack_pop_data<4>/DXMUX_239 ),
    .CE(VCC),
    .CLK(\K1/processor/stack_pop_data<4>/CLKINV_245 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/stack_pop_data [4])
  );
  defparam \K1/processor/stack_ram_loop[3].stack_bit/G .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[3].stack_bit/G .LOC = "SLICE_X52Y12";
  X_RAMD16 \K1/processor/stack_ram_loop[3].stack_bit/G  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<3>/DIG_MUX_253 ),
    .CLK(\K1/processor/stack_pop_data<3>/CLKINV_254 ),
    .WE(\K1/processor/stack_pop_data<3>/WSG ),
    .O(\K1/processor/stack_ram_loop[3].stack_bit/G_252 )
  );
  defparam \K1/processor/stack_ram_loop[3].stack_bit/F .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[3].stack_bit/F .LOC = "SLICE_X52Y12";
  X_RAMD16 \K1/processor/stack_ram_loop[3].stack_bit/F  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<3>/DIF_MUX_251 ),
    .CLK(\K1/processor/stack_pop_data<3>/CLKINV_254 ),
    .WE(\K1/processor/stack_pop_data<3>/WSF ),
    .O(\K1/processor/stack_ram_loop[3].stack_bit/F_250 )
  );
  defparam \K1/processor/stack_ram_loop[3].stack_flop .LOC = "SLICE_X52Y12";
  defparam \K1/processor/stack_ram_loop[3].stack_flop .INIT = 1'b0;
  X_FF \K1/processor/stack_ram_loop[3].stack_flop  (
    .I(\K1/processor/stack_pop_data<3>/DXMUX_248 ),
    .CE(VCC),
    .CLK(\K1/processor/stack_pop_data<3>/CLKINV_254 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/stack_pop_data [3])
  );
  defparam \K1/processor/store_loop[6].store_flop .LOC = "SLICE_X52Y44";
  defparam \K1/processor/store_loop[6].store_flop .INIT = 1'b0;
  X_FF \K1/processor/store_loop[6].store_flop  (
    .I(\K1/processor/store_data<6>/DYMUX_296 ),
    .CE(VCC),
    .CLK(\K1/processor/store_data<6>/CLKINV_301 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/store_data [6])
  );
  defparam \K1/processor/store_loop[6].memory_bit/F.S0 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[6].memory_bit/F.S0 .LOC = "SLICE_X52Y44";
  X_RAMD16 \K1/processor/store_loop[6].memory_bit/F.S0  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_data<6>/DIF_MUX_295 ),
    .CLK(\K1/processor/store_data<6>/CLKINV_301 ),
    .WE(\K1/processor/store_data<6>/WSF ),
    .O(\K1/processor/store_loop[6].memory_bit/F.S0_294 )
  );
  defparam \K1/processor/store_loop[6].memory_bit/G.S1 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[6].memory_bit/G.S1 .LOC = "SLICE_X52Y45";
  X_RAMD16 \K1/processor/store_loop[6].memory_bit/G.S1  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_loop[6].memory_bit/F5.S1/DIG_MUX_310 ),
    .CLK(\K1/processor/store_loop[6].memory_bit/F5.S1/CLKINV_311 ),
    .WE(\K1/processor/store_loop[6].memory_bit/F5.S1/WSG ),
    .O(\K1/processor/store_loop[6].memory_bit/G.S1_309 )
  );
  defparam \K1/processor/store_loop[6].memory_bit/F.S1 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[6].memory_bit/F.S1 .LOC = "SLICE_X52Y45";
  X_RAMD16 \K1/processor/store_loop[6].memory_bit/F.S1  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_loop[6].memory_bit/F5.S1/DIF_MUX_308 ),
    .CLK(\K1/processor/store_loop[6].memory_bit/F5.S1/CLKINV_311 ),
    .WE(\K1/processor/store_loop[6].memory_bit/F5.S1/WSF ),
    .O(\K1/processor/store_loop[6].memory_bit/F.S1_307 )
  );
  defparam \K1/processor/stack_ram_loop[2].stack_bit/G .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[2].stack_bit/G .LOC = "SLICE_X52Y13";
  X_RAMD16 \K1/processor/stack_ram_loop[2].stack_bit/G  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<2>/DIG_MUX_321 ),
    .CLK(\K1/processor/stack_pop_data<2>/CLKINV_322 ),
    .WE(\K1/processor/stack_pop_data<2>/WSG ),
    .O(\K1/processor/stack_ram_loop[2].stack_bit/G_320 )
  );
  defparam \K1/processor/stack_ram_loop[2].stack_bit/F .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[2].stack_bit/F .LOC = "SLICE_X52Y13";
  X_RAMD16 \K1/processor/stack_ram_loop[2].stack_bit/F  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<2>/DIF_MUX_319 ),
    .CLK(\K1/processor/stack_pop_data<2>/CLKINV_322 ),
    .WE(\K1/processor/stack_pop_data<2>/WSF ),
    .O(\K1/processor/stack_ram_loop[2].stack_bit/F_318 )
  );
  defparam \K1/processor/stack_ram_loop[2].stack_flop .LOC = "SLICE_X52Y13";
  defparam \K1/processor/stack_ram_loop[2].stack_flop .INIT = 1'b0;
  X_FF \K1/processor/stack_ram_loop[2].stack_flop  (
    .I(\K1/processor/stack_pop_data<2>/DXMUX_316 ),
    .CE(VCC),
    .CLK(\K1/processor/stack_pop_data<2>/CLKINV_322 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/stack_pop_data [2])
  );
  defparam \K1/processor/stack_ram_loop[1].stack_bit/G .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[1].stack_bit/G .LOC = "SLICE_X54Y10";
  X_RAMD16 \K1/processor/stack_ram_loop[1].stack_bit/G  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<1>/DIG_MUX_330 ),
    .CLK(\K1/processor/stack_pop_data<1>/CLKINV_331 ),
    .WE(\K1/processor/stack_pop_data<1>/WSG ),
    .O(\K1/processor/stack_ram_loop[1].stack_bit/G_329 )
  );
  defparam \K1/processor/stack_ram_loop[1].stack_bit/F .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[1].stack_bit/F .LOC = "SLICE_X54Y10";
  X_RAMD16 \K1/processor/stack_ram_loop[1].stack_bit/F  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<1>/DIF_MUX_328 ),
    .CLK(\K1/processor/stack_pop_data<1>/CLKINV_331 ),
    .WE(\K1/processor/stack_pop_data<1>/WSF ),
    .O(\K1/processor/stack_ram_loop[1].stack_bit/F_327 )
  );
  defparam \K1/processor/stack_ram_loop[1].stack_flop .LOC = "SLICE_X54Y10";
  defparam \K1/processor/stack_ram_loop[1].stack_flop .INIT = 1'b0;
  X_FF \K1/processor/stack_ram_loop[1].stack_flop  (
    .I(\K1/processor/stack_pop_data<1>/DXMUX_325 ),
    .CE(VCC),
    .CLK(\K1/processor/stack_pop_data<1>/CLKINV_331 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/stack_pop_data [1])
  );
  defparam \K1/processor/stack_ram_loop[9].stack_bit/G .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[9].stack_bit/G .LOC = "SLICE_X64Y17";
  X_RAMD16 \K1/processor/stack_ram_loop[9].stack_bit/G  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<9>/DIG_MUX_339 ),
    .CLK(\K1/processor/stack_pop_data<9>/CLKINV_340 ),
    .WE(\K1/processor/stack_pop_data<9>/WSG ),
    .O(\K1/processor/stack_ram_loop[9].stack_bit/G_338 )
  );
  defparam \K1/processor/stack_ram_loop[9].stack_bit/F .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[9].stack_bit/F .LOC = "SLICE_X64Y17";
  X_RAMD16 \K1/processor/stack_ram_loop[9].stack_bit/F  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<9>/DIF_MUX_337 ),
    .CLK(\K1/processor/stack_pop_data<9>/CLKINV_340 ),
    .WE(\K1/processor/stack_pop_data<9>/WSF ),
    .O(\K1/processor/stack_ram_loop[9].stack_bit/F_336 )
  );
  defparam \K1/processor/stack_ram_loop[9].stack_flop .LOC = "SLICE_X64Y17";
  defparam \K1/processor/stack_ram_loop[9].stack_flop .INIT = 1'b0;
  X_FF \K1/processor/stack_ram_loop[9].stack_flop  (
    .I(\K1/processor/stack_pop_data<9>/DXMUX_334 ),
    .CE(VCC),
    .CLK(\K1/processor/stack_pop_data<9>/CLKINV_340 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/stack_pop_data [9])
  );
  defparam \K1/processor/stack_ram_loop[0].stack_bit/G .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[0].stack_bit/G .LOC = "SLICE_X54Y11";
  X_RAMD16 \K1/processor/stack_ram_loop[0].stack_bit/G  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<0>/DIG_MUX_348 ),
    .CLK(\K1/processor/stack_pop_data<0>/CLKINV_349 ),
    .WE(\K1/processor/stack_pop_data<0>/WSG ),
    .O(\K1/processor/stack_ram_loop[0].stack_bit/G_347 )
  );
  defparam \K1/processor/stack_ram_loop[0].stack_bit/F .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[0].stack_bit/F .LOC = "SLICE_X54Y11";
  X_RAMD16 \K1/processor/stack_ram_loop[0].stack_bit/F  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<0>/DIF_MUX_346 ),
    .CLK(\K1/processor/stack_pop_data<0>/CLKINV_349 ),
    .WE(\K1/processor/stack_pop_data<0>/WSF ),
    .O(\K1/processor/stack_ram_loop[0].stack_bit/F_345 )
  );
  defparam \K1/processor/stack_ram_loop[0].stack_flop .LOC = "SLICE_X54Y11";
  defparam \K1/processor/stack_ram_loop[0].stack_flop .INIT = 1'b0;
  X_FF \K1/processor/stack_ram_loop[0].stack_flop  (
    .I(\K1/processor/stack_pop_data<0>/DXMUX_343 ),
    .CE(VCC),
    .CLK(\K1/processor/stack_pop_data<0>/CLKINV_349 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/stack_pop_data [0])
  );
  defparam \K1/processor/store_loop[5].store_flop .LOC = "SLICE_X66Y46";
  defparam \K1/processor/store_loop[5].store_flop .INIT = 1'b0;
  X_FF \K1/processor/store_loop[5].store_flop  (
    .I(\K1/processor/store_data<5>/DYMUX_355 ),
    .CE(VCC),
    .CLK(\K1/processor/store_data<5>/CLKINV_360 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/store_data [5])
  );
  defparam \K1/processor/store_loop[5].memory_bit/F.S0 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[5].memory_bit/F.S0 .LOC = "SLICE_X66Y46";
  X_RAMD16 \K1/processor/store_loop[5].memory_bit/F.S0  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_data<5>/DIF_MUX_354 ),
    .CLK(\K1/processor/store_data<5>/CLKINV_360 ),
    .WE(\K1/processor/store_data<5>/WSF ),
    .O(\K1/processor/store_loop[5].memory_bit/F.S0_353 )
  );
  defparam \K1/processor/stack_ram_loop[8].stack_bit/G .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[8].stack_bit/G .LOC = "SLICE_X64Y16";
  X_RAMD16 \K1/processor/stack_ram_loop[8].stack_bit/G  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<8>/DIG_MUX_370 ),
    .CLK(\K1/processor/stack_pop_data<8>/CLKINV_371 ),
    .WE(\K1/processor/stack_pop_data<8>/WSG ),
    .O(\K1/processor/stack_ram_loop[8].stack_bit/G_369 )
  );
  defparam \K1/processor/stack_ram_loop[8].stack_bit/F .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[8].stack_bit/F .LOC = "SLICE_X64Y16";
  X_RAMD16 \K1/processor/stack_ram_loop[8].stack_bit/F  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<8>/DIF_MUX_368 ),
    .CLK(\K1/processor/stack_pop_data<8>/CLKINV_371 ),
    .WE(\K1/processor/stack_pop_data<8>/WSF ),
    .O(\K1/processor/stack_ram_loop[8].stack_bit/F_367 )
  );
  defparam \K1/processor/stack_ram_loop[8].stack_flop .LOC = "SLICE_X64Y16";
  defparam \K1/processor/stack_ram_loop[8].stack_flop .INIT = 1'b0;
  X_FF \K1/processor/stack_ram_loop[8].stack_flop  (
    .I(\K1/processor/stack_pop_data<8>/DXMUX_365 ),
    .CE(VCC),
    .CLK(\K1/processor/stack_pop_data<8>/CLKINV_371 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/stack_pop_data [8])
  );
  defparam \K1/processor/store_loop[5].memory_bit/G.S1 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[5].memory_bit/G.S1 .LOC = "SLICE_X66Y47";
  X_RAMD16 \K1/processor/store_loop[5].memory_bit/G.S1  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_loop[5].memory_bit/F5.S1/DIG_MUX_206 ),
    .CLK(\K1/processor/store_loop[5].memory_bit/F5.S1/CLKINV_207 ),
    .WE(\K1/processor/store_loop[5].memory_bit/F5.S1/WSG ),
    .O(\K1/processor/store_loop[5].memory_bit/G.S1_205 )
  );
  defparam \K1/processor/store_loop[5].memory_bit/F.S1 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[5].memory_bit/F.S1 .LOC = "SLICE_X66Y47";
  X_RAMD16 \K1/processor/store_loop[5].memory_bit/F.S1  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_loop[5].memory_bit/F5.S1/DIF_MUX_204 ),
    .CLK(\K1/processor/store_loop[5].memory_bit/F5.S1/CLKINV_207 ),
    .WE(\K1/processor/store_loop[5].memory_bit/F5.S1/WSF ),
    .O(\K1/processor/store_loop[5].memory_bit/F.S1_203 )
  );
  defparam \K1/processor/stack_ram_loop[7].stack_bit/G .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[7].stack_bit/G .LOC = "SLICE_X64Y14";
  X_RAMD16 \K1/processor/stack_ram_loop[7].stack_bit/G  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<7>/DIG_MUX_217 ),
    .CLK(\K1/processor/stack_pop_data<7>/CLKINV_218 ),
    .WE(\K1/processor/stack_pop_data<7>/WSG ),
    .O(\K1/processor/stack_ram_loop[7].stack_bit/G_216 )
  );
  defparam \K1/processor/stack_ram_loop[7].stack_bit/F .INIT = 16'h0000;
  defparam \K1/processor/stack_ram_loop[7].stack_bit/F .LOC = "SLICE_X64Y14";
  X_RAMD16 \K1/processor/stack_ram_loop[7].stack_bit/F  (
    .RADR0(\K1/processor/stack_address [0]),
    .RADR1(\K1/processor/stack_address [1]),
    .RADR2(\K1/processor/stack_address [2]),
    .RADR3(\K1/processor/stack_address [3]),
    .WADR0(\K1/processor/stack_address [0]),
    .WADR1(\K1/processor/stack_address [1]),
    .WADR2(\K1/processor/stack_address [2]),
    .WADR3(\K1/processor/stack_address [3]),
    .I(\K1/processor/stack_pop_data<7>/DIF_MUX_215 ),
    .CLK(\K1/processor/stack_pop_data<7>/CLKINV_218 ),
    .WE(\K1/processor/stack_pop_data<7>/WSF ),
    .O(\K1/processor/stack_ram_loop[7].stack_bit/F_214 )
  );
  defparam \K1/processor/store_loop[0].memory_bit/G.S1 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[0].memory_bit/G.S1 .LOC = "SLICE_X66Y49";
  X_RAMD16 \K1/processor/store_loop[0].memory_bit/G.S1  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_loop[0].memory_bit/F5.S1/DIG_MUX_178 ),
    .CLK(\K1/processor/store_loop[0].memory_bit/F5.S1/CLKINV_179 ),
    .WE(\K1/processor/store_loop[0].memory_bit/F5.S1/WSG ),
    .O(\K1/processor/store_loop[0].memory_bit/G.S1_177 )
  );
  defparam \K1/processor/store_loop[0].memory_bit/F.S1 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[0].memory_bit/F.S1 .LOC = "SLICE_X66Y49";
  X_RAMD16 \K1/processor/store_loop[0].memory_bit/F.S1  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_loop[0].memory_bit/F5.S1/DIF_MUX_176 ),
    .CLK(\K1/processor/store_loop[0].memory_bit/F5.S1/CLKINV_179 ),
    .WE(\K1/processor/store_loop[0].memory_bit/F5.S1/WSF ),
    .O(\K1/processor/store_loop[0].memory_bit/F.S1_175 )
  );
  defparam \K1/processor/pc_loop[0].vector_select_mux .INIT = 16'hE2E2;
  defparam \K1/processor/pc_loop[0].vector_select_mux .LOC = "SLICE_X54Y12";
  X_LUT4 \K1/processor/pc_loop[0].vector_select_mux  (
    .ADR0(\K1/instruction [0]),
    .ADR1(\K1/instruction [15]),
    .ADR2(\K1/processor/stack_pop_data [0]),
    .ADR3(VCC),
    .O(\K1/processor/pc_vector [0])
  );
  defparam \K1/processor/pc_loop[2].vector_select_mux .INIT = 16'hEE44;
  defparam \K1/processor/pc_loop[2].vector_select_mux .LOC = "SLICE_X54Y13";
  X_LUT4 \K1/processor/pc_loop[2].vector_select_mux  (
    .ADR0(\K1/instruction [15]),
    .ADR1(\K1/instruction [2]),
    .ADR2(VCC),
    .ADR3(\K1/processor/stack_pop_data [2]),
    .O(\K1/processor/pc_vector [2])
  );
  defparam \K1/processor/pc_loop[4].vector_select_mux .INIT = 16'hCCAA;
  defparam \K1/processor/pc_loop[4].vector_select_mux .LOC = "SLICE_X54Y14";
  X_LUT4 \K1/processor/pc_loop[4].vector_select_mux  (
    .ADR0(\K1/instruction [4]),
    .ADR1(\K1/processor/stack_pop_data [4]),
    .ADR2(VCC),
    .ADR3(\K1/instruction [15]),
    .O(\K1/processor/pc_vector [4])
  );
  defparam \K1/processor/pc_loop[6].vector_select_mux .INIT = 16'hDD88;
  defparam \K1/processor/pc_loop[6].vector_select_mux .LOC = "SLICE_X54Y15";
  X_LUT4 \K1/processor/pc_loop[6].vector_select_mux  (
    .ADR0(\K1/instruction [15]),
    .ADR1(\K1/processor/stack_pop_data [6]),
    .ADR2(VCC),
    .ADR3(\K1/instruction [6]),
    .O(\K1/processor/pc_vector [6])
  );
  defparam led_and000029.INIT = 16'h0200;
  defparam led_and000029.LOC = "SLICE_X55Y50";
  X_LUT4 led_and000029 (
    .ADR0(led_and0000_map2_0),
    .ADR1(port_id[5]),
    .ADR2(port_id[6]),
    .ADR3(\led_and000027/O ),
    .O(led_and0000)
  );
  defparam \K1/processor/shift_loop[6].shift_flop .LOC = "SLICE_X55Y46";
  defparam \K1/processor/shift_loop[6].shift_flop .INIT = 1'b0;
  X_SFF \K1/processor/shift_loop[6].shift_flop  (
    .I(\K1/processor/shift_result<7>/DYMUX_531 ),
    .CE(VCC),
    .CLK(\K1/processor/shift_result<7>/CLKINV_532 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/shift_result<7>/SRINVNOT ),
    .O(\K1/processor/shift_result [6])
  );
  defparam \K1/processor/shift_loop[7].msb_shift.shift_mux_lut .INIT = 16'hCFC0;
  defparam \K1/processor/shift_loop[7].msb_shift.shift_mux_lut .LOC = "SLICE_X55Y46";
  X_LUT4 \K1/processor/shift_loop[7].msb_shift.shift_mux_lut  (
    .ADR0(VCC),
    .ADR1(\K1/processor/shift_in ),
    .ADR2(\K1/instruction [3]),
    .ADR3(\out_port<6>_0 ),
    .O(\K1/processor/shift_value [7])
  );
  defparam \K1/processor/shift_loop[7].shift_flop .LOC = "SLICE_X55Y46";
  defparam \K1/processor/shift_loop[7].shift_flop .INIT = 1'b0;
  X_SFF \K1/processor/shift_loop[7].shift_flop  (
    .I(\K1/processor/shift_result<7>/DXMUX_530 ),
    .CE(VCC),
    .CLK(\K1/processor/shift_result<7>/CLKINV_532 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/shift_result<7>/SRINVNOT ),
    .O(\K1/processor/shift_result [7])
  );
  defparam \K1/processor/pipeline_bit .LOC = "SLICE_X55Y39";
  defparam \K1/processor/pipeline_bit .INIT = 1'b0;
  X_FF \K1/processor/pipeline_bit  (
    .I(\K1/processor/shift_carry/DYMUX_533 ),
    .CE(VCC),
    .CLK(\K1/processor/shift_carry/CLKINV_534 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/shift_carry )
  );
  defparam \K1/processor/flag_write_flop .LOC = "SLICE_X55Y26";
  defparam \K1/processor/flag_write_flop .INIT = 1'b0;
  X_FF \K1/processor/flag_write_flop  (
    .I(\K1/processor/flag_write/DYMUX_535 ),
    .CE(VCC),
    .CLK(\K1/processor/flag_write/CLKINV_536 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/flag_write )
  );
  defparam \K1/processor/push_pop_lut .INIT = 16'h00A8;
  defparam \K1/processor/push_pop_lut .LOC = "SLICE_X55Y26";
  X_LUT4 \K1/processor/push_pop_lut  (
    .ADR0(\K1/instruction [17]),
    .ADR1(\K1/instruction [16]),
    .ADR2(\K1/instruction [15]),
    .ADR3(\K1/instruction [14]),
    .O(\K1/processor/push_or_pop_type )
  );
  defparam \K1/processor/logical_loop[0].logical_flop .LOC = "SLICE_X54Y36";
  defparam \K1/processor/logical_loop[0].logical_flop .INIT = 1'b0;
  X_SFF \K1/processor/logical_loop[0].logical_flop  (
    .I(\K1/processor/logical_result<0>/DYMUX_537 ),
    .CE(VCC),
    .CLK(\K1/processor/logical_result<0>/CLKINV_539 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/logical_result<0>/SRINV_538 ),
    .O(\K1/processor/logical_result [0])
  );
  defparam \K1/processor/memory_enable_lut .INIT = 16'h8000;
  defparam \K1/processor/memory_enable_lut .LOC = "SLICE_X54Y36";
  X_LUT4 \K1/processor/memory_enable_lut  (
    .ADR0(\K1/processor/memory_write ),
    .ADR1(\K1/instruction [13]),
    .ADR2(\K1/processor/t_state ),
    .ADR3(\K1/instruction [14]),
    .O(\K1/processor/memory_enable )
  );
  defparam \K1/processor/memory_write_flop .LOC = "SLICE_X55Y34";
  defparam \K1/processor/memory_write_flop .INIT = 1'b0;
  X_FF \K1/processor/memory_write_flop  (
    .I(\K1/processor/register_write/DYMUX_541 ),
    .CE(VCC),
    .CLK(\K1/processor/register_write/CLKINV_542 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/memory_write )
  );
  defparam \K1/processor/register_type_lut .INIT = 16'h5353;
  defparam \K1/processor/register_type_lut .LOC = "SLICE_X55Y34";
  X_LUT4 \K1/processor/register_type_lut  (
    .ADR0(\K1/instruction [17]),
    .ADR1(\K1/instruction [16]),
    .ADR2(\K1/instruction [15]),
    .ADR3(VCC),
    .O(\K1/processor/register_type )
  );
  defparam \K1/processor/register_write_flop .LOC = "SLICE_X55Y34";
  defparam \K1/processor/register_write_flop .INIT = 1'b0;
  X_FF \K1/processor/register_write_flop  (
    .I(\K1/processor/register_write/DXMUX_540 ),
    .CE(VCC),
    .CLK(\K1/processor/register_write/CLKINV_542 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/register_write )
  );
  defparam \K1/processor/toggle_flop .LOC = "SLICE_X64Y26";
  defparam \K1/processor/toggle_flop .INIT = 1'b0;
  X_FF \K1/processor/toggle_flop  (
    .I(\K1/processor/t_state/DYMUX_543 ),
    .CE(VCC),
    .CLK(\K1/processor/t_state/CLKINV_544 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/t_state )
  );
  defparam \K1/processor/arith_loop[4].arith_flop .LOC = "SLICE_X54Y49";
  defparam \K1/processor/arith_loop[4].arith_flop .INIT = 1'b0;
  X_SFF \K1/processor/arith_loop[4].arith_flop  (
    .I(\K1/processor/arith_result<3>/DYMUX_57 ),
    .CE(VCC),
    .CLK(\K1/processor/arith_result<3>/CLKINV_68 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/arith_result<3>/SRINV_67 ),
    .O(\K1/processor/arith_result [4])
  );
  defparam \K1/processor/arith_loop[3].arith_lut .INIT = 16'h9966;
  defparam \K1/processor/arith_loop[3].arith_lut .LOC = "SLICE_X54Y49";
  X_LUT4 \K1/processor/arith_loop[3].arith_lut  (
    .ADR0(port_id[3]),
    .ADR1(\out_port<3>_0 ),
    .ADR2(VCC),
    .ADR3(\K1/instruction [14]),
    .O(\K1/processor/half_arith [3])
  );
  defparam \K1/processor/arith_loop[3].arith_flop .LOC = "SLICE_X54Y49";
  defparam \K1/processor/arith_loop[3].arith_flop .INIT = 1'b0;
  X_SFF \K1/processor/arith_loop[3].arith_flop  (
    .I(\K1/processor/arith_result<3>/DXMUX_53 ),
    .CE(VCC),
    .CLK(\K1/processor/arith_result<3>/CLKINV_68 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/arith_result<3>/SRINV_67 ),
    .O(\K1/processor/arith_result [3])
  );
  defparam \K1/processor/arith_loop[6].arith_flop .LOC = "SLICE_X54Y50";
  defparam \K1/processor/arith_loop[6].arith_flop .INIT = 1'b0;
  X_SFF \K1/processor/arith_loop[6].arith_flop  (
    .I(\K1/processor/arith_result<5>/DYMUX_73 ),
    .CE(VCC),
    .CLK(\K1/processor/arith_result<5>/CLKINV_84 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/arith_result<5>/SRINV_83 ),
    .O(\K1/processor/arith_result [6])
  );
  defparam \K1/processor/arith_loop[5].arith_lut .INIT = 16'h9696;
  defparam \K1/processor/arith_loop[5].arith_lut .LOC = "SLICE_X54Y50";
  X_LUT4 \K1/processor/arith_loop[5].arith_lut  (
    .ADR0(\out_port<5>_0 ),
    .ADR1(port_id[5]),
    .ADR2(\K1/instruction [14]),
    .ADR3(VCC),
    .O(\K1/processor/half_arith [5])
  );
  defparam \K1/processor/arith_loop[5].arith_flop .LOC = "SLICE_X54Y50";
  defparam \K1/processor/arith_loop[5].arith_flop .INIT = 1'b0;
  X_SFF \K1/processor/arith_loop[5].arith_flop  (
    .I(\K1/processor/arith_result<5>/DXMUX_69 ),
    .CE(VCC),
    .CLK(\K1/processor/arith_result<5>/CLKINV_84 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/arith_result<5>/SRINV_83 ),
    .O(\K1/processor/arith_result [5])
  );
  defparam \K1/processor/arith_loop[7].arith_lut .INIT = 16'h9696;
  defparam \K1/processor/arith_loop[7].arith_lut .LOC = "SLICE_X54Y51";
  X_LUT4 \K1/processor/arith_loop[7].arith_lut  (
    .ADR0(\out_port<7>_0 ),
    .ADR1(port_id[7]),
    .ADR2(\K1/instruction [14]),
    .ADR3(VCC),
    .O(\K1/processor/half_arith [7])
  );
  defparam \K1/processor/arith_loop[7].arith_flop .LOC = "SLICE_X54Y51";
  defparam \K1/processor/arith_loop[7].arith_flop .INIT = 1'b0;
  X_SFF \K1/processor/arith_loop[7].arith_flop  (
    .I(\K1/processor/arith_result<7>/DXMUX_85 ),
    .CE(VCC),
    .CLK(\K1/processor/arith_result<7>/CLKINV_93 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/arith_result<7>/SRINV_92 ),
    .O(\K1/processor/arith_result [7])
  );
  defparam \K1/processor/pc_loop[0].value_select_mux .INIT = 16'hBB88;
  defparam \K1/processor/pc_loop[0].value_select_mux .LOC = "SLICE_X55Y14";
  X_LUT4 \K1/processor/pc_loop[0].value_select_mux  (
    .ADR0(\K1/address [0]),
    .ADR1(\K1/processor/normal_count_0 ),
    .ADR2(VCC),
    .ADR3(\K1/processor/inc_pc_vector [0]),
    .O(\K1/processor/pc_value [0])
  );
  defparam \K1/processor/store_loop[4].store_flop .LOC = "SLICE_X52Y50";
  defparam \K1/processor/store_loop[4].store_flop .INIT = 1'b0;
  X_FF \K1/processor/store_loop[4].store_flop  (
    .I(\K1/processor/store_data<4>/DYMUX_260 ),
    .CE(VCC),
    .CLK(\K1/processor/store_data<4>/CLKINV_265 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/store_data [4])
  );
  defparam \K1/processor/store_loop[4].memory_bit/F.S0 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[4].memory_bit/F.S0 .LOC = "SLICE_X52Y50";
  X_RAMD16 \K1/processor/store_loop[4].memory_bit/F.S0  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_data<4>/DIF_MUX_259 ),
    .CLK(\K1/processor/store_data<4>/CLKINV_265 ),
    .WE(\K1/processor/store_data<4>/WSF ),
    .O(\K1/processor/store_loop[4].memory_bit/F.S0_258 )
  );
  defparam \K1/processor/store_loop[4].memory_bit/G.S1 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[4].memory_bit/G.S1 .LOC = "SLICE_X52Y51";
  X_RAMD16 \K1/processor/store_loop[4].memory_bit/G.S1  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_loop[4].memory_bit/F5.S1/DIG_MUX_274 ),
    .CLK(\K1/processor/store_loop[4].memory_bit/F5.S1/CLKINV_275 ),
    .WE(\K1/processor/store_loop[4].memory_bit/F5.S1/WSG ),
    .O(\K1/processor/store_loop[4].memory_bit/G.S1_273 )
  );
  defparam \K1/processor/store_loop[4].memory_bit/F.S1 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[4].memory_bit/F.S1 .LOC = "SLICE_X52Y51";
  X_RAMD16 \K1/processor/store_loop[4].memory_bit/F.S1  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_loop[4].memory_bit/F5.S1/DIF_MUX_272 ),
    .CLK(\K1/processor/store_loop[4].memory_bit/F5.S1/CLKINV_275 ),
    .WE(\K1/processor/store_loop[4].memory_bit/F5.S1/WSF ),
    .O(\K1/processor/store_loop[4].memory_bit/F.S1_271 )
  );
  defparam \K1/processor/store_loop[3].store_flop .LOC = "SLICE_X66Y44";
  defparam \K1/processor/store_loop[3].store_flop .INIT = 1'b0;
  X_FF \K1/processor/store_loop[3].store_flop  (
    .I(\K1/processor/store_data<3>/DYMUX_283 ),
    .CE(VCC),
    .CLK(\K1/processor/store_data<3>/CLKINV_288 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/store_data [3])
  );
  defparam \K1/processor/store_loop[3].memory_bit/F.S0 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[3].memory_bit/F.S0 .LOC = "SLICE_X66Y44";
  X_RAMD16 \K1/processor/store_loop[3].memory_bit/F.S0  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_data<3>/DIF_MUX_282 ),
    .CLK(\K1/processor/store_data<3>/CLKINV_288 ),
    .WE(\K1/processor/store_data<3>/WSF ),
    .O(\K1/processor/store_loop[3].memory_bit/F.S0_281 )
  );
  defparam \K1/processor/store_loop[3].memory_bit/G.S1 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[3].memory_bit/G.S1 .LOC = "SLICE_X66Y45";
  X_RAMD16 \K1/processor/store_loop[3].memory_bit/G.S1  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_loop[3].memory_bit/F5.S1/DIG_MUX_109 ),
    .CLK(\K1/processor/store_loop[3].memory_bit/F5.S1/CLKINV_110 ),
    .WE(\K1/processor/store_loop[3].memory_bit/F5.S1/WSG ),
    .O(\K1/processor/store_loop[3].memory_bit/G.S1_108 )
  );
  defparam \K1/processor/store_loop[3].memory_bit/F.S1 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[3].memory_bit/F.S1 .LOC = "SLICE_X66Y45";
  X_RAMD16 \K1/processor/store_loop[3].memory_bit/F.S1  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_loop[3].memory_bit/F5.S1/DIF_MUX_107 ),
    .CLK(\K1/processor/store_loop[3].memory_bit/F5.S1/CLKINV_110 ),
    .WE(\K1/processor/store_loop[3].memory_bit/F5.S1/WSF ),
    .O(\K1/processor/store_loop[3].memory_bit/F.S1_106 )
  );
  defparam \K1/processor/store_loop[2].store_flop .LOC = "SLICE_X64Y48";
  defparam \K1/processor/store_loop[2].store_flop .INIT = 1'b0;
  X_FF \K1/processor/store_loop[2].store_flop  (
    .I(\K1/processor/store_data<2>/DYMUX_118 ),
    .CE(VCC),
    .CLK(\K1/processor/store_data<2>/CLKINV_123 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/store_data [2])
  );
  defparam \K1/processor/store_loop[2].memory_bit/F.S0 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[2].memory_bit/F.S0 .LOC = "SLICE_X64Y48";
  X_RAMD16 \K1/processor/store_loop[2].memory_bit/F.S0  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_data<2>/DIF_MUX_117 ),
    .CLK(\K1/processor/store_data<2>/CLKINV_123 ),
    .WE(\K1/processor/store_data<2>/WSF ),
    .O(\K1/processor/store_loop[2].memory_bit/F.S0_116 )
  );
  defparam \K1/processor/store_loop[2].memory_bit/G.S1 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[2].memory_bit/G.S1 .LOC = "SLICE_X64Y49";
  X_RAMD16 \K1/processor/store_loop[2].memory_bit/G.S1  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_loop[2].memory_bit/F5.S1/DIG_MUX_132 ),
    .CLK(\K1/processor/store_loop[2].memory_bit/F5.S1/CLKINV_133 ),
    .WE(\K1/processor/store_loop[2].memory_bit/F5.S1/WSG ),
    .O(\K1/processor/store_loop[2].memory_bit/G.S1_131 )
  );
  defparam \K1/processor/store_loop[2].memory_bit/F.S1 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[2].memory_bit/F.S1 .LOC = "SLICE_X64Y49";
  X_RAMD16 \K1/processor/store_loop[2].memory_bit/F.S1  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_loop[2].memory_bit/F5.S1/DIF_MUX_130 ),
    .CLK(\K1/processor/store_loop[2].memory_bit/F5.S1/CLKINV_133 ),
    .WE(\K1/processor/store_loop[2].memory_bit/F5.S1/WSF ),
    .O(\K1/processor/store_loop[2].memory_bit/F.S1_129 )
  );
  defparam \K1/processor/store_loop[1].store_flop .LOC = "SLICE_X52Y48";
  defparam \K1/processor/store_loop[1].store_flop .INIT = 1'b0;
  X_FF \K1/processor/store_loop[1].store_flop  (
    .I(\K1/processor/store_data<1>/DYMUX_141 ),
    .CE(VCC),
    .CLK(\K1/processor/store_data<1>/CLKINV_146 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/store_data [1])
  );
  defparam \K1/processor/store_loop[1].memory_bit/F.S0 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[1].memory_bit/F.S0 .LOC = "SLICE_X52Y48";
  X_RAMD16 \K1/processor/store_loop[1].memory_bit/F.S0  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_data<1>/DIF_MUX_140 ),
    .CLK(\K1/processor/store_data<1>/CLKINV_146 ),
    .WE(\K1/processor/store_data<1>/WSF ),
    .O(\K1/processor/store_loop[1].memory_bit/F.S0_139 )
  );
  defparam \K1/processor/store_loop[1].memory_bit/G.S1 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[1].memory_bit/G.S1 .LOC = "SLICE_X52Y49";
  X_RAMD16 \K1/processor/store_loop[1].memory_bit/G.S1  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_loop[1].memory_bit/F5.S1/DIG_MUX_155 ),
    .CLK(\K1/processor/store_loop[1].memory_bit/F5.S1/CLKINV_156 ),
    .WE(\K1/processor/store_loop[1].memory_bit/F5.S1/WSG ),
    .O(\K1/processor/store_loop[1].memory_bit/G.S1_154 )
  );
  defparam \K1/processor/store_loop[1].memory_bit/F.S1 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[1].memory_bit/F.S1 .LOC = "SLICE_X52Y49";
  X_RAMD16 \K1/processor/store_loop[1].memory_bit/F.S1  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_loop[1].memory_bit/F5.S1/DIF_MUX_153 ),
    .CLK(\K1/processor/store_loop[1].memory_bit/F5.S1/CLKINV_156 ),
    .WE(\K1/processor/store_loop[1].memory_bit/F5.S1/WSF ),
    .O(\K1/processor/store_loop[1].memory_bit/F.S1_152 )
  );
  defparam \K1/processor/store_loop[0].store_flop .LOC = "SLICE_X66Y48";
  defparam \K1/processor/store_loop[0].store_flop .INIT = 1'b0;
  X_FF \K1/processor/store_loop[0].store_flop  (
    .I(\K1/processor/store_data<0>/DYMUX_164 ),
    .CE(VCC),
    .CLK(\K1/processor/store_data<0>/CLKINV_169 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/store_data [0])
  );
  defparam \K1/processor/store_loop[0].memory_bit/F.S0 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[0].memory_bit/F.S0 .LOC = "SLICE_X66Y48";
  X_RAMD16 \K1/processor/store_loop[0].memory_bit/F.S0  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_data<0>/DIF_MUX_163 ),
    .CLK(\K1/processor/store_data<0>/CLKINV_169 ),
    .WE(\K1/processor/store_data<0>/WSF ),
    .O(\K1/processor/store_loop[0].memory_bit/F.S0_162 )
  );
  defparam \K1/processor/arith_loop[0].arith_flop .LOC = "SLICE_X54Y47";
  defparam \K1/processor/arith_loop[0].arith_flop .INIT = 1'b0;
  X_SFF \K1/processor/arith_loop[0].arith_flop  (
    .I(\K1/processor/arith_result<0>/DYMUX_30 ),
    .CE(VCC),
    .CLK(\K1/processor/arith_result<0>/CLKINV_36 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/arith_result<0>/SRINV_35 ),
    .O(\K1/processor/arith_result [0])
  );
  defparam \K1/processor/arith_loop[0].lsb_arith.arith_carry_in_lut .INIT = 16'h66CC;
  defparam \K1/processor/arith_loop[0].lsb_arith.arith_carry_in_lut .LOC = "SLICE_X54Y47";
  X_LUT4 \K1/processor/arith_loop[0].lsb_arith.arith_carry_in_lut  (
    .ADR0(\K1/instruction [13]),
    .ADR1(\K1/instruction [14]),
    .ADR2(VCC),
    .ADR3(\K1/processor/carry_flag ),
    .O(\K1/processor/sel_arith_carry_in )
  );
  defparam \K1/processor/arith_loop[2].arith_flop .LOC = "SLICE_X54Y48";
  defparam \K1/processor/arith_loop[2].arith_flop .INIT = 1'b0;
  X_SFF \K1/processor/arith_loop[2].arith_flop  (
    .I(\K1/processor/arith_result<1>/DYMUX_41 ),
    .CE(VCC),
    .CLK(\K1/processor/arith_result<1>/CLKINV_52 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/arith_result<1>/SRINV_51 ),
    .O(\K1/processor/arith_result [2])
  );
  defparam \K1/processor/arith_loop[1].arith_lut .INIT = 16'h9966;
  defparam \K1/processor/arith_loop[1].arith_lut .LOC = "SLICE_X54Y48";
  X_LUT4 \K1/processor/arith_loop[1].arith_lut  (
    .ADR0(\out_port<1>_0 ),
    .ADR1(port_id[1]),
    .ADR2(VCC),
    .ADR3(\K1/instruction [14]),
    .O(\K1/processor/half_arith [1])
  );
  defparam \K1/processor/arith_loop[1].arith_flop .LOC = "SLICE_X54Y48";
  defparam \K1/processor/arith_loop[1].arith_flop .INIT = 1'b0;
  X_SFF \K1/processor/arith_loop[1].arith_flop  (
    .I(\K1/processor/arith_result<1>/DXMUX_37 ),
    .CE(VCC),
    .CLK(\K1/processor/arith_result<1>/CLKINV_52 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/arith_result<1>/SRINV_51 ),
    .O(\K1/processor/arith_result [1])
  );
  defparam \K1/processor/pc_loop[0].register_bit .LOC = "SLICE_X55Y14";
  defparam \K1/processor/pc_loop[0].register_bit .INIT = 1'b0;
  X_SFF \K1/processor/pc_loop[0].register_bit  (
    .I(\K1/address<0>/DXMUX_94 ),
    .CE(\K1/address<0>/CEINVNOT ),
    .CLK(\K1/address<0>/CLKINV_104 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/address<0>/SRINV_103 ),
    .O(\K1/address [0])
  );
  defparam \K1/processor/pc_loop[3].register_bit .LOC = "SLICE_X55Y15";
  defparam \K1/processor/pc_loop[3].register_bit .INIT = 1'b0;
  X_SFF \K1/processor/pc_loop[3].register_bit  (
    .I(\K1/address<2>/DYMUX_413 ),
    .CE(\K1/address<2>/CEINVNOT ),
    .CLK(\K1/address<2>/CLKINV_424 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/address<2>/SRINV_423 ),
    .O(\K1/address [3])
  );
  defparam \K1/processor/pc_loop[2].value_select_mux .INIT = 16'hFC30;
  defparam \K1/processor/pc_loop[2].value_select_mux .LOC = "SLICE_X55Y15";
  X_LUT4 \K1/processor/pc_loop[2].value_select_mux  (
    .ADR0(VCC),
    .ADR1(\K1/processor/normal_count_0 ),
    .ADR2(\K1/processor/inc_pc_vector [2]),
    .ADR3(\K1/address [2]),
    .O(\K1/processor/pc_value [2])
  );
  defparam \K1/processor/pc_loop[2].register_bit .LOC = "SLICE_X55Y15";
  defparam \K1/processor/pc_loop[2].register_bit .INIT = 1'b0;
  X_SFF \K1/processor/pc_loop[2].register_bit  (
    .I(\K1/address<2>/DXMUX_410 ),
    .CE(\K1/address<2>/CEINVNOT ),
    .CLK(\K1/address<2>/CLKINV_424 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/address<2>/SRINV_423 ),
    .O(\K1/address [2])
  );
  defparam \K1/processor/pc_loop[5].register_bit .LOC = "SLICE_X55Y16";
  defparam \K1/processor/pc_loop[5].register_bit .INIT = 1'b0;
  X_SFF \K1/processor/pc_loop[5].register_bit  (
    .I(\K1/address<4>/DYMUX_428 ),
    .CE(\K1/address<4>/CEINVNOT ),
    .CLK(\K1/address<4>/CLKINV_439 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/address<4>/SRINV_438 ),
    .O(\K1/address [5])
  );
  defparam \K1/processor/pc_loop[4].value_select_mux .INIT = 16'hF3C0;
  defparam \K1/processor/pc_loop[4].value_select_mux .LOC = "SLICE_X55Y16";
  X_LUT4 \K1/processor/pc_loop[4].value_select_mux  (
    .ADR0(VCC),
    .ADR1(\K1/processor/normal_count_0 ),
    .ADR2(\K1/address [4]),
    .ADR3(\K1/processor/inc_pc_vector [4]),
    .O(\K1/processor/pc_value [4])
  );
  defparam \K1/processor/pc_loop[4].register_bit .LOC = "SLICE_X55Y16";
  defparam \K1/processor/pc_loop[4].register_bit .INIT = 1'b0;
  X_SFF \K1/processor/pc_loop[4].register_bit  (
    .I(\K1/address<4>/DXMUX_425 ),
    .CE(\K1/address<4>/CEINVNOT ),
    .CLK(\K1/address<4>/CLKINV_439 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/address<4>/SRINV_438 ),
    .O(\K1/address [4])
  );
  defparam \K1/processor/pc_loop[7].register_bit .LOC = "SLICE_X55Y17";
  defparam \K1/processor/pc_loop[7].register_bit .INIT = 1'b0;
  X_SFF \K1/processor/pc_loop[7].register_bit  (
    .I(\K1/address<6>/DYMUX_443 ),
    .CE(\K1/address<6>/CEINVNOT ),
    .CLK(\K1/address<6>/CLKINV_454 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/address<6>/SRINV_453 ),
    .O(\K1/address [7])
  );
  defparam \K1/processor/pc_loop[6].value_select_mux .INIT = 16'hCCF0;
  defparam \K1/processor/pc_loop[6].value_select_mux .LOC = "SLICE_X55Y17";
  X_LUT4 \K1/processor/pc_loop[6].value_select_mux  (
    .ADR0(VCC),
    .ADR1(\K1/address [6]),
    .ADR2(\K1/processor/inc_pc_vector [6]),
    .ADR3(\K1/processor/normal_count_0 ),
    .O(\K1/processor/pc_value [6])
  );
  defparam \K1/processor/pc_loop[6].register_bit .LOC = "SLICE_X55Y17";
  defparam \K1/processor/pc_loop[6].register_bit .INIT = 1'b0;
  X_SFF \K1/processor/pc_loop[6].register_bit  (
    .I(\K1/address<6>/DXMUX_440 ),
    .CE(\K1/address<6>/CEINVNOT ),
    .CLK(\K1/address<6>/CLKINV_454 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/address<6>/SRINV_453 ),
    .O(\K1/address [6])
  );
  defparam \K1/processor/pc_loop[8].value_select_mux .INIT = 16'hCFC0;
  defparam \K1/processor/pc_loop[8].value_select_mux .LOC = "SLICE_X55Y18";
  X_LUT4 \K1/processor/pc_loop[8].value_select_mux  (
    .ADR0(VCC),
    .ADR1(\K1/address [8]),
    .ADR2(\K1/processor/normal_count_0 ),
    .ADR3(\K1/processor/inc_pc_vector [8]),
    .O(\K1/processor/pc_value [8])
  );
  defparam \K1/processor/pc_loop[8].register_bit .LOC = "SLICE_X55Y18";
  defparam \K1/processor/pc_loop[8].register_bit .INIT = 1'b0;
  X_SFF \K1/processor/pc_loop[8].register_bit  (
    .I(\K1/address<8>/DXMUX_455 ),
    .CE(\K1/address<8>/CEINVNOT ),
    .CLK(\K1/address<8>/CLKINV_463 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/address<8>/SRINV_462 ),
    .O(\K1/address [8])
  );
  defparam \K1/instruction<15>_rt .INIT = 16'hF0F0;
  defparam \K1/instruction<15>_rt .LOC = "SLICE_X55Y40";
  X_LUT4 \K1/instruction<15>_rt  (
    .ADR0(VCC),
    .ADR1(\K1/processor/shift_carry ),
    .ADR2(\K1/instruction [15]),
    .ADR3(VCC),
    .O(\K1/instruction<15>_rt_467 )
  );
  defparam \K1/processor/carry_flag_flop .LOC = "SLICE_X55Y41";
  defparam \K1/processor/carry_flag_flop .INIT = 1'b0;
  X_SFF \K1/processor/carry_flag_flop  (
    .I(\K1/processor/carry_flag/DYMUX_474 ),
    .CE(\K1/processor/carry_flag/CEINV_478 ),
    .CLK(\K1/processor/carry_flag/CLKINV_477 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/carry_flag/SRINV_476 ),
    .O(\K1/processor/carry_flag )
  );
  defparam \K1/processor/sel_parity_lut .INIT = 16'hFF3F;
  defparam \K1/processor/sel_parity_lut .LOC = "SLICE_X55Y41";
  X_LUT4 \K1/processor/sel_parity_lut  (
    .ADR0(\K1/processor/parity ),
    .ADR1(\K1/instruction [13]),
    .ADR2(\K1/instruction [16]),
    .ADR3(\K1/instruction [15]),
    .O(\K1/processor/sel_parity )
  );
  defparam \K1/processor/stack_count_loop[1].register_bit .LOC = "SLICE_X54Y20";
  defparam \K1/processor/stack_count_loop[1].register_bit .INIT = 1'b0;
  X_SFF \K1/processor/stack_count_loop[1].register_bit  (
    .I(\K1/processor/stack_address<0>/DYMUX_484 ),
    .CE(VCC),
    .CLK(\K1/processor/stack_address<0>/CLKINV_490 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/stack_address<0>/SRINV_489 ),
    .O(\K1/processor/stack_address [1])
  );
  defparam \K1/processor/stack_count_loop[0].lsb_stack_count.count_lut .INIT = 16'h6333;
  defparam \K1/processor/stack_count_loop[0].lsb_stack_count.count_lut .LOC = "SLICE_X54Y20";
  X_LUT4 \K1/processor/stack_count_loop[0].lsb_stack_count.count_lut  (
    .ADR0(\K1/processor/t_state ),
    .ADR1(\K1/processor/stack_address [0]),
    .ADR2(\K1/processor/push_or_pop_type_0 ),
    .ADR3(\K1/processor/valid_to_move_0 ),
    .O(\K1/processor/half_stack_address [0])
  );
  defparam \K1/processor/stack_count_loop[0].register_bit .LOC = "SLICE_X54Y20";
  defparam \K1/processor/stack_count_loop[0].register_bit .INIT = 1'b0;
  X_SFF \K1/processor/stack_count_loop[0].register_bit  (
    .I(\K1/processor/stack_address<0>/DXMUX_479 ),
    .CE(VCC),
    .CLK(\K1/processor/stack_address<0>/CLKINV_490 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/stack_address<0>/SRINV_489 ),
    .O(\K1/processor/stack_address [0])
  );
  defparam \K1/processor/logical_loop[1].logical_lut .INIT = 16'h68F8;
  defparam \K1/processor/logical_loop[1].logical_lut .LOC = "SLICE_X55Y42";
  X_LUT4 \K1/processor/logical_loop[1].logical_lut  (
    .ADR0(\K1/instruction [14]),
    .ADR1(\out_port<1>_0 ),
    .ADR2(port_id[1]),
    .ADR3(\K1/instruction [13]),
    .O(\K1/processor/logical_value [1])
  );
  defparam \K1/processor/logical_loop[1].logical_flop .LOC = "SLICE_X55Y42";
  defparam \K1/processor/logical_loop[1].logical_flop .INIT = 1'b0;
  X_SFF \K1/processor/logical_loop[1].logical_flop  (
    .I(\K1/processor/logical_result<1>/DXMUX_590 ),
    .CE(VCC),
    .CLK(\K1/processor/logical_result<1>/CLKINV_592 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/logical_result<1>/SRINV_591 ),
    .O(\K1/processor/logical_result [1])
  );
  defparam led_and00004.INIT = 16'h5000;
  defparam led_and00004.LOC = "SLICE_X55Y43";
  X_LUT4 led_and00004 (
    .ADR0(port_id[7]),
    .ADR1(VCC),
    .ADR2(write_strobe),
    .ADR3(port_id[0]),
    .O(led_and0000_map2)
  );
  defparam \K1/processor/reg_loop[2].register_bit.SLICEM_G .INIT = 16'h0000;
  defparam \K1/processor/reg_loop[2].register_bit.SLICEM_G .LOC = "SLICE_X54Y39";
  X_RAMD16 \K1/processor/reg_loop[2].register_bit.SLICEM_G  (
    .RADR0(\K1/instruction [8]),
    .RADR1(\K1/instruction [9]),
    .RADR2(\K1/instruction [10]),
    .RADR3(\K1/instruction [11]),
    .WADR0(\K1/instruction [8]),
    .WADR1(\K1/instruction [9]),
    .WADR2(\K1/instruction [10]),
    .WADR3(\K1/instruction [11]),
    .I(\K1/processor/sy<2>/DIG_MUX_594 ),
    .CLK(\K1/processor/sy<2>/CLKINV_595 ),
    .WE(\K1/processor/sy<2>/SRINV_596 ),
    .O(out_port[2])
  );
  defparam \K1/processor/reg_loop[2].register_bit.SLICEM_F .INIT = 16'h0000;
  defparam \K1/processor/reg_loop[2].register_bit.SLICEM_F .LOC = "SLICE_X54Y39";
  X_RAMD16 \K1/processor/reg_loop[2].register_bit.SLICEM_F  (
    .RADR0(\K1/instruction [4]),
    .RADR1(\K1/instruction [5]),
    .RADR2(\K1/instruction [6]),
    .RADR3(\K1/instruction [7]),
    .WADR0(\K1/instruction [8]),
    .WADR1(\K1/instruction [9]),
    .WADR2(\K1/instruction [10]),
    .WADR3(\K1/instruction [11]),
    .I(\K1/processor/sy<2>/DIF_MUX_593 ),
    .CLK(\K1/processor/sy<2>/CLKINV_595 ),
    .WE(\K1/processor/sy<2>/SRINV_596 ),
    .O(\K1/processor/sy [2])
  );
  defparam \K1/processor/stack_count_loop[4].msb_stack_count.count_lut .INIT = 16'hC999;
  defparam \K1/processor/stack_count_loop[4].msb_stack_count.count_lut .LOC = "SLICE_X54Y22";
  X_LUT4 \K1/processor/stack_count_loop[4].msb_stack_count.count_lut  (
    .ADR0(\K1/processor/t_state ),
    .ADR1(\K1/processor/stack_address [4]),
    .ADR2(\K1/processor/valid_to_move_0 ),
    .ADR3(\K1/processor/call_type ),
    .O(\K1/processor/half_stack_address [4])
  );
  defparam \K1/processor/stack_count_loop[4].register_bit .LOC = "SLICE_X54Y22";
  defparam \K1/processor/stack_count_loop[4].register_bit .INIT = 1'b0;
  X_SFF \K1/processor/stack_count_loop[4].register_bit  (
    .I(\K1/processor/stack_address<4>/DXMUX_597 ),
    .CE(VCC),
    .CLK(\K1/processor/stack_address<4>/CLKINV_601 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/stack_address<4>/SRINV_600 ),
    .O(\K1/processor/stack_address [4])
  );
  defparam \K1/processor/reg_loop[7].register_bit.SLICEM_G .INIT = 16'h0000;
  defparam \K1/processor/reg_loop[7].register_bit.SLICEM_G .LOC = "SLICE_X52Y41";
  X_RAMD16 \K1/processor/reg_loop[7].register_bit.SLICEM_G  (
    .RADR0(\K1/instruction [8]),
    .RADR1(\K1/instruction [9]),
    .RADR2(\K1/instruction [10]),
    .RADR3(\K1/instruction [11]),
    .WADR0(\K1/instruction [8]),
    .WADR1(\K1/instruction [9]),
    .WADR2(\K1/instruction [10]),
    .WADR3(\K1/instruction [11]),
    .I(\K1/processor/sy<7>/DIG_MUX_603 ),
    .CLK(\K1/processor/sy<7>/CLKINV_604 ),
    .WE(\K1/processor/sy<7>/SRINV_605 ),
    .O(out_port[7])
  );
  defparam \K1/processor/reg_loop[7].register_bit.SLICEM_F .INIT = 16'h0000;
  defparam \K1/processor/reg_loop[7].register_bit.SLICEM_F .LOC = "SLICE_X52Y41";
  X_RAMD16 \K1/processor/reg_loop[7].register_bit.SLICEM_F  (
    .RADR0(\K1/instruction [4]),
    .RADR1(\K1/instruction [5]),
    .RADR2(\K1/instruction [6]),
    .RADR3(\K1/instruction [7]),
    .WADR0(\K1/instruction [8]),
    .WADR1(\K1/instruction [9]),
    .WADR2(\K1/instruction [10]),
    .WADR3(\K1/instruction [11]),
    .I(\K1/processor/sy<7>/DIF_MUX_602 ),
    .CLK(\K1/processor/sy<7>/CLKINV_604 ),
    .WE(\K1/processor/sy<7>/SRINV_605 ),
    .O(\K1/processor/sy [7])
  );
  defparam \K1/processor/stack_count_loop[3].register_bit .LOC = "SLICE_X54Y21";
  defparam \K1/processor/stack_count_loop[3].register_bit .INIT = 1'b0;
  X_SFF \K1/processor/stack_count_loop[3].register_bit  (
    .I(\K1/processor/stack_address<2>/DYMUX_495 ),
    .CE(VCC),
    .CLK(\K1/processor/stack_address<2>/CLKINV_506 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/stack_address<2>/SRINV_505 ),
    .O(\K1/processor/stack_address [3])
  );
  defparam \K1/processor/stack_count_loop[2].mid_stack_count.count_lut .INIT = 16'hC999;
  defparam \K1/processor/stack_count_loop[2].mid_stack_count.count_lut .LOC = "SLICE_X54Y21";
  X_LUT4 \K1/processor/stack_count_loop[2].mid_stack_count.count_lut  (
    .ADR0(\K1/processor/t_state ),
    .ADR1(\K1/processor/stack_address [2]),
    .ADR2(\K1/processor/call_type ),
    .ADR3(\K1/processor/valid_to_move_0 ),
    .O(\K1/processor/half_stack_address [2])
  );
  defparam \K1/processor/stack_count_loop[2].register_bit .LOC = "SLICE_X54Y21";
  defparam \K1/processor/stack_count_loop[2].register_bit .INIT = 1'b0;
  X_SFF \K1/processor/stack_count_loop[2].register_bit  (
    .I(\K1/processor/stack_address<2>/DXMUX_491 ),
    .CE(VCC),
    .CLK(\K1/processor/stack_address<2>/CLKINV_506 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/stack_address<2>/SRINV_505 ),
    .O(\K1/processor/stack_address [2])
  );
  defparam \K1/processor/zero_flag_flop .LOC = "SLICE_X64Y41";
  defparam \K1/processor/zero_flag_flop .INIT = 1'b0;
  X_SFF \K1/processor/zero_flag_flop  (
    .I(\K1/processor/zero_flag/DYMUX_377 ),
    .CE(\K1/processor/zero_flag/CEINV_381 ),
    .CLK(\K1/processor/zero_flag/CLKINV_380 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/zero_flag/SRINV_379 ),
    .O(\K1/processor/zero_flag )
  );
  defparam \K1/processor/sel_shadow_zero_lut .INIT = 16'h33FF;
  defparam \K1/processor/sel_shadow_zero_lut .LOC = "SLICE_X64Y41";
  X_LUT4 \K1/processor/sel_shadow_zero_lut  (
    .ADR0(VCC),
    .ADR1(\K1/instruction [16]),
    .ADR2(VCC),
    .ADR3(\K1/instruction [17]),
    .O(\K1/processor/sel_shadow_zero )
  );
  defparam \K1/processor/low_parity_lut .INIT = 16'h6996;
  defparam \K1/processor/low_parity_lut .LOC = "SLICE_X54Y44";
  X_LUT4 \K1/processor/low_parity_lut  (
    .ADR0(\K1/processor/logical_result [3]),
    .ADR1(\K1/processor/logical_result [1]),
    .ADR2(\K1/processor/logical_result [0]),
    .ADR3(\K1/processor/logical_result [2]),
    .O(\K1/processor/low_parity )
  );
  defparam \K1/processor/reset_flop1 .LOC = "SLICE_X55Y13";
  defparam \K1/processor/reset_flop1 .INIT = 1'b1;
  X_SFF \K1/processor/reset_flop1  (
    .I(\K1/processor/reset_delay/DYMUX_606 ),
    .CE(VCC),
    .CLK(\K1/processor/reset_delay/CLKINV_607 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(GND),
    .O(\K1/processor/reset_delay )
  );
  defparam \K1/processor/reset_flop2 .LOC = "SLICE_X55Y12";
  defparam \K1/processor/reset_flop2 .INIT = 1'b1;
  X_SFF \K1/processor/reset_flop2  (
    .I(\K1/processor/internal_reset/DYMUX_608 ),
    .CE(VCC),
    .CLK(\K1/processor/internal_reset/CLKINV_609 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(GND),
    .O(\K1/processor/internal_reset )
  );
  defparam \K1/processor/reg_loop[3].register_bit.SLICEM_G .INIT = 16'h0000;
  defparam \K1/processor/reg_loop[3].register_bit.SLICEM_G .LOC = "SLICE_X54Y43";
  X_RAMD16 \K1/processor/reg_loop[3].register_bit.SLICEM_G  (
    .RADR0(\K1/instruction [8]),
    .RADR1(\K1/instruction [9]),
    .RADR2(\K1/instruction [10]),
    .RADR3(\K1/instruction [11]),
    .WADR0(\K1/instruction [8]),
    .WADR1(\K1/instruction [9]),
    .WADR2(\K1/instruction [10]),
    .WADR3(\K1/instruction [11]),
    .I(\K1/processor/sy<3>/DIG_MUX_611 ),
    .CLK(\K1/processor/sy<3>/CLKINV_612 ),
    .WE(\K1/processor/sy<3>/SRINV_613 ),
    .O(out_port[3])
  );
  defparam \K1/processor/reg_loop[3].register_bit.SLICEM_F .INIT = 16'h0000;
  defparam \K1/processor/reg_loop[3].register_bit.SLICEM_F .LOC = "SLICE_X54Y43";
  X_RAMD16 \K1/processor/reg_loop[3].register_bit.SLICEM_F  (
    .RADR0(\K1/instruction [4]),
    .RADR1(\K1/instruction [5]),
    .RADR2(\K1/instruction [6]),
    .RADR3(\K1/instruction [7]),
    .WADR0(\K1/instruction [8]),
    .WADR1(\K1/instruction [9]),
    .WADR2(\K1/instruction [10]),
    .WADR3(\K1/instruction [11]),
    .I(\K1/processor/sy<3>/DIF_MUX_610 ),
    .CLK(\K1/processor/sy<3>/CLKINV_612 ),
    .WE(\K1/processor/sy<3>/SRINV_613 ),
    .O(\K1/processor/sy [3])
  );
  defparam \K1/processor/normal_count_lut .INIT = 16'h50FF;
  defparam \K1/processor/normal_count_lut .LOC = "SLICE_X54Y32";
  X_LUT4 \K1/processor/normal_count_lut  (
    .ADR0(\K1/processor/condition_met ),
    .ADR1(VCC),
    .ADR2(\K1/instruction [12]),
    .ADR3(\K1/processor/move_group ),
    .O(\K1/processor/normal_count )
  );
  defparam \K1/processor/write_active_lut .INIT = 16'h4000;
  defparam \K1/processor/write_active_lut .LOC = "SLICE_X54Y37";
  X_LUT4 \K1/processor/write_active_lut  (
    .ADR0(\K1/processor/t_state ),
    .ADR1(\K1/instruction [15]),
    .ADR2(\K1/processor/io_initial_decode ),
    .ADR3(\K1/instruction [17]),
    .O(\K1/processor/write_active )
  );
  defparam \K1/processor/write_strobe_flop .LOC = "SLICE_X54Y37";
  defparam \K1/processor/write_strobe_flop .INIT = 1'b0;
  X_SFF \K1/processor/write_strobe_flop  (
    .I(\write_strobe/DXMUX_614 ),
    .CE(VCC),
    .CLK(\write_strobe/CLKINV_616 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\write_strobe/SRINV_615 ),
    .O(write_strobe)
  );
  defparam \K1/processor/reg_loop[4].register_bit.SLICEM_G .INIT = 16'h0000;
  defparam \K1/processor/reg_loop[4].register_bit.SLICEM_G .LOC = "SLICE_X54Y40";
  X_RAMD16 \K1/processor/reg_loop[4].register_bit.SLICEM_G  (
    .RADR0(\K1/instruction [8]),
    .RADR1(\K1/instruction [9]),
    .RADR2(\K1/instruction [10]),
    .RADR3(\K1/instruction [11]),
    .WADR0(\K1/instruction [8]),
    .WADR1(\K1/instruction [9]),
    .WADR2(\K1/instruction [10]),
    .WADR3(\K1/instruction [11]),
    .I(\K1/processor/sy<4>/DIG_MUX_618 ),
    .CLK(\K1/processor/sy<4>/CLKINV_619 ),
    .WE(\K1/processor/sy<4>/SRINV_620 ),
    .O(out_port[4])
  );
  defparam \K1/processor/reg_loop[4].register_bit.SLICEM_F .INIT = 16'h0000;
  defparam \K1/processor/reg_loop[4].register_bit.SLICEM_F .LOC = "SLICE_X54Y40";
  X_RAMD16 \K1/processor/reg_loop[4].register_bit.SLICEM_F  (
    .RADR0(\K1/instruction [4]),
    .RADR1(\K1/instruction [5]),
    .RADR2(\K1/instruction [6]),
    .RADR3(\K1/instruction [7]),
    .WADR0(\K1/instruction [8]),
    .WADR1(\K1/instruction [9]),
    .WADR2(\K1/instruction [10]),
    .WADR3(\K1/instruction [11]),
    .I(\K1/processor/sy<4>/DIF_MUX_617 ),
    .CLK(\K1/processor/sy<4>/CLKINV_619 ),
    .WE(\K1/processor/sy<4>/SRINV_620 ),
    .O(\K1/processor/sy [4])
  );
  defparam \K1/processor/store_loop[7].store_flop .LOC = "SLICE_X52Y46";
  defparam \K1/processor/store_loop[7].store_flop .INIT = 1'b0;
  X_FF \K1/processor/store_loop[7].store_flop  (
    .I(\K1/processor/store_data<7>/DYMUX_624 ),
    .CE(VCC),
    .CLK(\K1/processor/store_data<7>/CLKINV_629 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/store_data [7])
  );
  defparam \K1/processor/flag_enable_lut .INIT = 16'hF000;
  defparam \K1/processor/flag_enable_lut .LOC = "SLICE_X64Y26";
  X_LUT4 \K1/processor/flag_enable_lut  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(\K1/processor/flag_write ),
    .ADR3(\K1/processor/t_state ),
    .O(\K1/processor/flag_enable )
  );
  defparam \K1/processor/shift_loop[0].shift_flop .LOC = "SLICE_X55Y48";
  defparam \K1/processor/shift_loop[0].shift_flop .INIT = 1'b0;
  X_SFF \K1/processor/shift_loop[0].shift_flop  (
    .I(\K1/processor/shift_result<1>/DYMUX_546 ),
    .CE(VCC),
    .CLK(\K1/processor/shift_result<1>/CLKINV_547 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/shift_result<1>/SRINVNOT ),
    .O(\K1/processor/shift_result [0])
  );
  defparam \K1/processor/shift_loop[1].mid_shift.shift_mux_lut .INIT = 16'hEE44;
  defparam \K1/processor/shift_loop[1].mid_shift.shift_mux_lut .LOC = "SLICE_X55Y48";
  X_LUT4 \K1/processor/shift_loop[1].mid_shift.shift_mux_lut  (
    .ADR0(\K1/instruction [3]),
    .ADR1(\out_port<0>_0 ),
    .ADR2(VCC),
    .ADR3(\out_port<2>_0 ),
    .O(\K1/processor/shift_value [1])
  );
  defparam \K1/processor/shift_loop[1].shift_flop .LOC = "SLICE_X55Y48";
  defparam \K1/processor/shift_loop[1].shift_flop .INIT = 1'b0;
  X_SFF \K1/processor/shift_loop[1].shift_flop  (
    .I(\K1/processor/shift_result<1>/DXMUX_545 ),
    .CE(VCC),
    .CLK(\K1/processor/shift_result<1>/CLKINV_547 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/shift_result<1>/SRINVNOT ),
    .O(\K1/processor/shift_result [1])
  );
  defparam \K1/processor/shift_loop[2].shift_flop .LOC = "SLICE_X54Y46";
  defparam \K1/processor/shift_loop[2].shift_flop .INIT = 1'b0;
  X_SFF \K1/processor/shift_loop[2].shift_flop  (
    .I(\K1/processor/shift_result<3>/DYMUX_549 ),
    .CE(VCC),
    .CLK(\K1/processor/shift_result<3>/CLKINV_550 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/shift_result<3>/SRINVNOT ),
    .O(\K1/processor/shift_result [2])
  );
  defparam \K1/processor/shift_loop[3].mid_shift.shift_mux_lut .INIT = 16'hEE22;
  defparam \K1/processor/shift_loop[3].mid_shift.shift_mux_lut .LOC = "SLICE_X54Y46";
  X_LUT4 \K1/processor/shift_loop[3].mid_shift.shift_mux_lut  (
    .ADR0(\out_port<2>_0 ),
    .ADR1(\K1/instruction [3]),
    .ADR2(VCC),
    .ADR3(\out_port<4>_0 ),
    .O(\K1/processor/shift_value [3])
  );
  defparam \K1/processor/shift_loop[3].shift_flop .LOC = "SLICE_X54Y46";
  defparam \K1/processor/shift_loop[3].shift_flop .INIT = 1'b0;
  X_SFF \K1/processor/shift_loop[3].shift_flop  (
    .I(\K1/processor/shift_result<3>/DXMUX_548 ),
    .CE(VCC),
    .CLK(\K1/processor/shift_result<3>/CLKINV_550 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/shift_result<3>/SRINVNOT ),
    .O(\K1/processor/shift_result [3])
  );
  defparam \K1/processor/sel_group_flop .LOC = "SLICE_X55Y36";
  defparam \K1/processor/sel_group_flop .INIT = 1'b0;
  X_FF \K1/processor/sel_group_flop  (
    .I(\K1/processor/sel_group/DYMUX_551 ),
    .CE(VCC),
    .CLK(\K1/processor/sel_group/CLKINV_552 ),
    .SET(GND),
    .RST(GND),
    .O(\K1/processor/sel_group )
  );
  defparam \K1/processor/sel_logical_lut .INIT = 16'hEFEC;
  defparam \K1/processor/sel_logical_lut .LOC = "SLICE_X55Y36";
  X_LUT4 \K1/processor/sel_logical_lut  (
    .ADR0(\K1/instruction [16]),
    .ADR1(\K1/instruction [17]),
    .ADR2(\K1/instruction [15]),
    .ADR3(\K1/instruction [14]),
    .O(\K1/processor/sel_logical )
  );
  defparam \K1/processor/shift_loop[4].shift_flop .LOC = "SLICE_X55Y49";
  defparam \K1/processor/shift_loop[4].shift_flop .INIT = 1'b0;
  X_SFF \K1/processor/shift_loop[4].shift_flop  (
    .I(\K1/processor/shift_result<5>/DYMUX_554 ),
    .CE(VCC),
    .CLK(\K1/processor/shift_result<5>/CLKINV_555 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/shift_result<5>/SRINVNOT ),
    .O(\K1/processor/shift_result [4])
  );
  defparam \K1/processor/shift_loop[5].mid_shift.shift_mux_lut .INIT = 16'hE2E2;
  defparam \K1/processor/shift_loop[5].mid_shift.shift_mux_lut .LOC = "SLICE_X55Y49";
  X_LUT4 \K1/processor/shift_loop[5].mid_shift.shift_mux_lut  (
    .ADR0(\out_port<4>_0 ),
    .ADR1(\K1/instruction [3]),
    .ADR2(\out_port<6>_0 ),
    .ADR3(VCC),
    .O(\K1/processor/shift_value [5])
  );
  defparam \K1/processor/shift_loop[5].shift_flop .LOC = "SLICE_X55Y49";
  defparam \K1/processor/shift_loop[5].shift_flop .INIT = 1'b0;
  X_SFF \K1/processor/shift_loop[5].shift_flop  (
    .I(\K1/processor/shift_result<5>/DXMUX_553 ),
    .CE(VCC),
    .CLK(\K1/processor/shift_result<5>/CLKINV_555 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/shift_result<5>/SRINVNOT ),
    .O(\K1/processor/shift_result [5])
  );
  defparam \K1/processor/reg_loop[0].register_bit.SLICEM_G .INIT = 16'h0000;
  defparam \K1/processor/reg_loop[0].register_bit.SLICEM_G .LOC = "SLICE_X54Y41";
  X_RAMD16 \K1/processor/reg_loop[0].register_bit.SLICEM_G  (
    .RADR0(\K1/instruction [8]),
    .RADR1(\K1/instruction [9]),
    .RADR2(\K1/instruction [10]),
    .RADR3(\K1/instruction [11]),
    .WADR0(\K1/instruction [8]),
    .WADR1(\K1/instruction [9]),
    .WADR2(\K1/instruction [10]),
    .WADR3(\K1/instruction [11]),
    .I(\K1/processor/sy<0>/DIG_MUX_557 ),
    .CLK(\K1/processor/sy<0>/CLKINV_558 ),
    .WE(\K1/processor/sy<0>/SRINV_559 ),
    .O(out_port[0])
  );
  defparam \K1/processor/logical_loop[4].logical_lut .INIT = 16'h7CD0;
  defparam \K1/processor/logical_loop[4].logical_lut .LOC = "SLICE_X54Y45";
  X_LUT4 \K1/processor/logical_loop[4].logical_lut  (
    .ADR0(\K1/instruction [13]),
    .ADR1(\K1/instruction [14]),
    .ADR2(port_id[4]),
    .ADR3(\out_port<4>_0 ),
    .O(\K1/processor/logical_value [4])
  );
  defparam \K1/processor/logical_loop[4].logical_flop .LOC = "SLICE_X54Y45";
  defparam \K1/processor/logical_loop[4].logical_flop .INIT = 1'b0;
  X_SFF \K1/processor/logical_loop[4].logical_flop  (
    .I(\K1/processor/logical_result<4>/DXMUX_573 ),
    .CE(VCC),
    .CLK(\K1/processor/logical_result<4>/CLKINV_575 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/logical_result<4>/SRINV_574 ),
    .O(\K1/processor/logical_result [4])
  );
  defparam \K1/processor/reg_loop[1].register_bit.SLICEM_G .INIT = 16'h0000;
  defparam \K1/processor/reg_loop[1].register_bit.SLICEM_G .LOC = "SLICE_X52Y43";
  X_RAMD16 \K1/processor/reg_loop[1].register_bit.SLICEM_G  (
    .RADR0(\K1/instruction [8]),
    .RADR1(\K1/instruction [9]),
    .RADR2(\K1/instruction [10]),
    .RADR3(\K1/instruction [11]),
    .WADR0(\K1/instruction [8]),
    .WADR1(\K1/instruction [9]),
    .WADR2(\K1/instruction [10]),
    .WADR3(\K1/instruction [11]),
    .I(\K1/processor/sy<1>/DIG_MUX_577 ),
    .CLK(\K1/processor/sy<1>/CLKINV_578 ),
    .WE(\K1/processor/sy<1>/SRINV_579 ),
    .O(out_port[1])
  );
  defparam \K1/processor/reg_loop[1].register_bit.SLICEM_F .INIT = 16'h0000;
  defparam \K1/processor/reg_loop[1].register_bit.SLICEM_F .LOC = "SLICE_X52Y43";
  X_RAMD16 \K1/processor/reg_loop[1].register_bit.SLICEM_F  (
    .RADR0(\K1/instruction [4]),
    .RADR1(\K1/instruction [5]),
    .RADR2(\K1/instruction [6]),
    .RADR3(\K1/instruction [7]),
    .WADR0(\K1/instruction [8]),
    .WADR1(\K1/instruction [9]),
    .WADR2(\K1/instruction [10]),
    .WADR3(\K1/instruction [11]),
    .I(\K1/processor/sy<1>/DIF_MUX_576 ),
    .CLK(\K1/processor/sy<1>/CLKINV_578 ),
    .WE(\K1/processor/sy<1>/SRINV_579 ),
    .O(\K1/processor/sy [1])
  );
  defparam \K1/processor/logical_loop[3].logical_lut .INIT = 16'h7BA0;
  defparam \K1/processor/logical_loop[3].logical_lut .LOC = "SLICE_X55Y45";
  X_LUT4 \K1/processor/logical_loop[3].logical_lut  (
    .ADR0(\out_port<3>_0 ),
    .ADR1(\K1/instruction [13]),
    .ADR2(\K1/instruction [14]),
    .ADR3(port_id[3]),
    .O(\K1/processor/logical_value [3])
  );
  defparam \K1/processor/logical_loop[3].logical_flop .LOC = "SLICE_X55Y45";
  defparam \K1/processor/logical_loop[3].logical_flop .INIT = 1'b0;
  X_SFF \K1/processor/logical_loop[3].logical_flop  (
    .I(\K1/processor/logical_result<3>/DXMUX_580 ),
    .CE(VCC),
    .CLK(\K1/processor/logical_result<3>/CLKINV_582 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/logical_result<3>/SRINV_581 ),
    .O(\K1/processor/logical_result [3])
  );
  defparam \K1/processor/logical_loop[2].logical_lut .INIT = 16'h7AA2;
  defparam \K1/processor/logical_loop[2].logical_lut .LOC = "SLICE_X54Y38";
  X_LUT4 \K1/processor/logical_loop[2].logical_lut  (
    .ADR0(port_id[2]),
    .ADR1(\K1/instruction [13]),
    .ADR2(\out_port<2>_0 ),
    .ADR3(\K1/instruction [14]),
    .O(\K1/processor/logical_value [2])
  );
  defparam \K1/processor/logical_loop[2].logical_flop .LOC = "SLICE_X54Y38";
  defparam \K1/processor/logical_loop[2].logical_flop .INIT = 1'b0;
  X_SFF \K1/processor/logical_loop[2].logical_flop  (
    .I(\K1/processor/logical_result<2>/DXMUX_583 ),
    .CE(VCC),
    .CLK(\K1/processor/logical_result<2>/CLKINV_585 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/logical_result<2>/SRINV_584 ),
    .O(\K1/processor/logical_result [2])
  );
  defparam \K1/processor/reg_loop[6].register_bit.SLICEM_G .INIT = 16'h0000;
  defparam \K1/processor/reg_loop[6].register_bit.SLICEM_G .LOC = "SLICE_X52Y42";
  X_RAMD16 \K1/processor/reg_loop[6].register_bit.SLICEM_G  (
    .RADR0(\K1/instruction [8]),
    .RADR1(\K1/instruction [9]),
    .RADR2(\K1/instruction [10]),
    .RADR3(\K1/instruction [11]),
    .WADR0(\K1/instruction [8]),
    .WADR1(\K1/instruction [9]),
    .WADR2(\K1/instruction [10]),
    .WADR3(\K1/instruction [11]),
    .I(\K1/processor/sy<6>/DIG_MUX_587 ),
    .CLK(\K1/processor/sy<6>/CLKINV_588 ),
    .WE(\K1/processor/sy<6>/SRINV_589 ),
    .O(out_port[6])
  );
  defparam \K1/processor/reg_loop[6].register_bit.SLICEM_F .INIT = 16'h0000;
  defparam \K1/processor/reg_loop[6].register_bit.SLICEM_F .LOC = "SLICE_X52Y42";
  X_RAMD16 \K1/processor/reg_loop[6].register_bit.SLICEM_F  (
    .RADR0(\K1/instruction [4]),
    .RADR1(\K1/instruction [5]),
    .RADR2(\K1/instruction [6]),
    .RADR3(\K1/instruction [7]),
    .WADR0(\K1/instruction [8]),
    .WADR1(\K1/instruction [9]),
    .WADR2(\K1/instruction [10]),
    .WADR3(\K1/instruction [11]),
    .I(\K1/processor/sy<6>/DIF_MUX_586 ),
    .CLK(\K1/processor/sy<6>/CLKINV_588 ),
    .WE(\K1/processor/sy<6>/SRINV_589 ),
    .O(\K1/processor/sy [6])
  );
  defparam \K1/processor/reg_loop[0].register_bit.SLICEM_F .INIT = 16'h0000;
  defparam \K1/processor/reg_loop[0].register_bit.SLICEM_F .LOC = "SLICE_X54Y41";
  X_RAMD16 \K1/processor/reg_loop[0].register_bit.SLICEM_F  (
    .RADR0(\K1/instruction [4]),
    .RADR1(\K1/instruction [5]),
    .RADR2(\K1/instruction [6]),
    .RADR3(\K1/instruction [7]),
    .WADR0(\K1/instruction [8]),
    .WADR1(\K1/instruction [9]),
    .WADR2(\K1/instruction [10]),
    .WADR3(\K1/instruction [11]),
    .I(\K1/processor/sy<0>/DIF_MUX_556 ),
    .CLK(\K1/processor/sy<0>/CLKINV_558 ),
    .WE(\K1/processor/sy<0>/SRINV_559 ),
    .O(\K1/processor/sy [0])
  );
  defparam \K1/processor/logical_loop[7].logical_lut .INIT = 16'h7CD0;
  defparam \K1/processor/logical_loop[7].logical_lut .LOC = "SLICE_X53Y42";
  X_LUT4 \K1/processor/logical_loop[7].logical_lut  (
    .ADR0(\K1/instruction [13]),
    .ADR1(\out_port<7>_0 ),
    .ADR2(port_id[7]),
    .ADR3(\K1/instruction [14]),
    .O(\K1/processor/logical_value [7])
  );
  defparam \K1/processor/logical_loop[7].logical_flop .LOC = "SLICE_X53Y42";
  defparam \K1/processor/logical_loop[7].logical_flop .INIT = 1'b0;
  X_SFF \K1/processor/logical_loop[7].logical_flop  (
    .I(\K1/processor/logical_result<7>/DXMUX_560 ),
    .CE(VCC),
    .CLK(\K1/processor/logical_result<7>/CLKINV_562 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/logical_result<7>/SRINV_561 ),
    .O(\K1/processor/logical_result [7])
  );
  defparam \K1/processor/logical_loop[6].logical_lut .INIT = 16'h7CD0;
  defparam \K1/processor/logical_loop[6].logical_lut .LOC = "SLICE_X53Y44";
  X_LUT4 \K1/processor/logical_loop[6].logical_lut  (
    .ADR0(\K1/instruction [13]),
    .ADR1(\K1/instruction [14]),
    .ADR2(port_id[6]),
    .ADR3(\out_port<6>_0 ),
    .O(\K1/processor/logical_value [6])
  );
  defparam \K1/processor/logical_loop[6].logical_flop .LOC = "SLICE_X53Y44";
  defparam \K1/processor/logical_loop[6].logical_flop .INIT = 1'b0;
  X_SFF \K1/processor/logical_loop[6].logical_flop  (
    .I(\K1/processor/logical_result<6>/DXMUX_563 ),
    .CE(VCC),
    .CLK(\K1/processor/logical_result<6>/CLKINV_565 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/logical_result<6>/SRINV_564 ),
    .O(\K1/processor/logical_result [6])
  );
  defparam \K1/processor/valid_move_lut .INIT = 16'hFF33;
  defparam \K1/processor/valid_move_lut .LOC = "SLICE_X55Y33";
  X_LUT4 \K1/processor/valid_move_lut  (
    .ADR0(VCC),
    .ADR1(\K1/instruction [12]),
    .ADR2(VCC),
    .ADR3(\K1/processor/condition_met ),
    .O(\K1/processor/valid_to_move )
  );
  defparam \K1/processor/reg_loop[5].register_bit.SLICEM_G .INIT = 16'h0000;
  defparam \K1/processor/reg_loop[5].register_bit.SLICEM_G .LOC = "SLICE_X54Y42";
  X_RAMD16 \K1/processor/reg_loop[5].register_bit.SLICEM_G  (
    .RADR0(\K1/instruction [8]),
    .RADR1(\K1/instruction [9]),
    .RADR2(\K1/instruction [10]),
    .RADR3(\K1/instruction [11]),
    .WADR0(\K1/instruction [8]),
    .WADR1(\K1/instruction [9]),
    .WADR2(\K1/instruction [10]),
    .WADR3(\K1/instruction [11]),
    .I(\K1/processor/sy<5>/DIG_MUX_567 ),
    .CLK(\K1/processor/sy<5>/CLKINV_568 ),
    .WE(\K1/processor/sy<5>/SRINV_569 ),
    .O(out_port[5])
  );
  defparam \K1/processor/reg_loop[5].register_bit.SLICEM_F .INIT = 16'h0000;
  defparam \K1/processor/reg_loop[5].register_bit.SLICEM_F .LOC = "SLICE_X54Y42";
  X_RAMD16 \K1/processor/reg_loop[5].register_bit.SLICEM_F  (
    .RADR0(\K1/instruction [4]),
    .RADR1(\K1/instruction [5]),
    .RADR2(\K1/instruction [6]),
    .RADR3(\K1/instruction [7]),
    .WADR0(\K1/instruction [8]),
    .WADR1(\K1/instruction [9]),
    .WADR2(\K1/instruction [10]),
    .WADR3(\K1/instruction [11]),
    .I(\K1/processor/sy<5>/DIF_MUX_566 ),
    .CLK(\K1/processor/sy<5>/CLKINV_568 ),
    .WE(\K1/processor/sy<5>/SRINV_569 ),
    .O(\K1/processor/sy [5])
  );
  defparam \K1/processor/logical_loop[5].logical_lut .INIT = 16'h68EC;
  defparam \K1/processor/logical_loop[5].logical_lut .LOC = "SLICE_X55Y44";
  X_LUT4 \K1/processor/logical_loop[5].logical_lut  (
    .ADR0(\K1/instruction [14]),
    .ADR1(port_id[5]),
    .ADR2(\out_port<5>_0 ),
    .ADR3(\K1/instruction [13]),
    .O(\K1/processor/logical_value [5])
  );
  defparam \K1/processor/logical_loop[5].logical_flop .LOC = "SLICE_X55Y44";
  defparam \K1/processor/logical_loop[5].logical_flop .INIT = 1'b0;
  X_SFF \K1/processor/logical_loop[5].logical_flop  (
    .I(\K1/processor/logical_result<5>/DXMUX_570 ),
    .CE(VCC),
    .CLK(\K1/processor/logical_result<5>/CLKINV_572 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\K1/processor/logical_result<5>/SRINV_571 ),
    .O(\K1/processor/logical_result [5])
  );
  defparam \K1/processor/store_loop[7].memory_bit/F.S0 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[7].memory_bit/F.S0 .LOC = "SLICE_X52Y46";
  X_RAMD16 \K1/processor/store_loop[7].memory_bit/F.S0  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_data<7>/DIF_MUX_623 ),
    .CLK(\K1/processor/store_data<7>/CLKINV_629 ),
    .WE(\K1/processor/store_data<7>/WSF ),
    .O(\K1/processor/store_loop[7].memory_bit/F.S0_622 )
  );
  defparam \K1/processor/store_loop[7].memory_bit/G.S1 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[7].memory_bit/G.S1 .LOC = "SLICE_X52Y47";
  X_RAMD16 \K1/processor/store_loop[7].memory_bit/G.S1  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_loop[7].memory_bit/F5.S1/DIG_MUX_638 ),
    .CLK(\K1/processor/store_loop[7].memory_bit/F5.S1/CLKINV_639 ),
    .WE(\K1/processor/store_loop[7].memory_bit/F5.S1/WSG ),
    .O(\K1/processor/store_loop[7].memory_bit/G.S1_637 )
  );
  defparam \K1/processor/store_loop[7].memory_bit/F.S1 .INIT = 16'h0000;
  defparam \K1/processor/store_loop[7].memory_bit/F.S1 .LOC = "SLICE_X52Y47";
  X_RAMD16 \K1/processor/store_loop[7].memory_bit/F.S1  (
    .RADR0(port_id[0]),
    .RADR1(port_id[1]),
    .RADR2(port_id[2]),
    .RADR3(port_id[3]),
    .WADR0(port_id[0]),
    .WADR1(port_id[1]),
    .WADR2(port_id[2]),
    .WADR3(port_id[3]),
    .I(\K1/processor/store_loop[7].memory_bit/F5.S1/DIF_MUX_636 ),
    .CLK(\K1/processor/store_loop[7].memory_bit/F5.S1/CLKINV_639 ),
    .WE(\K1/processor/store_loop[7].memory_bit/F5.S1/WSF ),
    .O(\K1/processor/store_loop[7].memory_bit/F.S1_635 )
  );
  X_ONE GLOBAL_LOGIC1_VCC (
    .O(GLOBAL_LOGIC1)
  );
  X_ZERO GLOBAL_LOGIC0_GND (
    .O(GLOBAL_LOGIC0)
  );
  defparam \K1/processor/store_loop[3].memory_bit/F.S1.WE/WSFAND .LOC = "SLICE_X66Y45";
  X_AND3 \K1/processor/store_loop[3].memory_bit/F.S1.WE/WSFAND  (
    .I0(\K1/processor/store_loop[3].memory_bit/F5.S1/SLICEWE1USED_114 ),
    .I1(\K1/processor/store_loop[3].memory_bit/F5.S1/SLICEWE0USED_112 ),
    .I2(\K1/processor/store_loop[3].memory_bit/F5.S1/SRINV_111 ),
    .O(\K1/processor/store_loop[3].memory_bit/F5.S1/WSF )
  );
  defparam \K1/processor/store_loop[3].memory_bit/F.S1.WE/WSGAND .LOC = "SLICE_X66Y45";
  X_AND3 \K1/processor/store_loop[3].memory_bit/F.S1.WE/WSGAND  (
    .I0(\K1/processor/store_loop[3].memory_bit/F5.S1/SLICEWE1USED_114 ),
    .I1(\NlwInverterSignal_K1/processor/store_loop[3].memory_bit/F.S1.WE/WSGAND/WE0 ),
    .I2(\K1/processor/store_loop[3].memory_bit/F5.S1/SRINV_111 ),
    .O(\K1/processor/store_loop[3].memory_bit/F5.S1/WSG )
  );
  defparam \K1/processor/store_loop[2].memory_bit/F.S0.WE/WSFAND .LOC = "SLICE_X64Y48";
  X_AND3 \K1/processor/store_loop[2].memory_bit/F.S0.WE/WSFAND  (
    .I0(\K1/processor/store_data<2>/SLICEWE1USED_127 ),
    .I1(\K1/processor/store_data<2>/SLICEWE0USED_125 ),
    .I2(\K1/processor/store_data<2>/SRINV_124 ),
    .O(\K1/processor/store_data<2>/WSF )
  );
  defparam \K1/processor/store_loop[2].memory_bit/F.S0.WE/WSGAND .LOC = "SLICE_X64Y48";
  X_AND3 \K1/processor/store_loop[2].memory_bit/F.S0.WE/WSGAND  (
    .I0(\K1/processor/store_data<2>/SLICEWE1USED_127 ),
    .I1(\NlwInverterSignal_K1/processor/store_loop[2].memory_bit/F.S0.WE/WSGAND/WE0 ),
    .I2(\K1/processor/store_data<2>/SRINV_124 ),
    .O(\K1/processor/store_data<2>/WSG )
  );
  defparam \K1/processor/store_loop[2].memory_bit/F.S1.WE/WSFAND .LOC = "SLICE_X64Y49";
  X_AND3 \K1/processor/store_loop[2].memory_bit/F.S1.WE/WSFAND  (
    .I0(\K1/processor/store_loop[2].memory_bit/F5.S1/SLICEWE1USED_137 ),
    .I1(\K1/processor/store_loop[2].memory_bit/F5.S1/SLICEWE0USED_135 ),
    .I2(\K1/processor/store_loop[2].memory_bit/F5.S1/SRINV_134 ),
    .O(\K1/processor/store_loop[2].memory_bit/F5.S1/WSF )
  );
  defparam \K1/processor/store_loop[2].memory_bit/F.S1.WE/WSGAND .LOC = "SLICE_X64Y49";
  X_AND3 \K1/processor/store_loop[2].memory_bit/F.S1.WE/WSGAND  (
    .I0(\K1/processor/store_loop[2].memory_bit/F5.S1/SLICEWE1USED_137 ),
    .I1(\NlwInverterSignal_K1/processor/store_loop[2].memory_bit/F.S1.WE/WSGAND/WE0 ),
    .I2(\K1/processor/store_loop[2].memory_bit/F5.S1/SRINV_134 ),
    .O(\K1/processor/store_loop[2].memory_bit/F5.S1/WSG )
  );
  defparam \K1/processor/store_loop[1].memory_bit/F.S0.WE/WSFAND .LOC = "SLICE_X52Y48";
  X_AND3 \K1/processor/store_loop[1].memory_bit/F.S0.WE/WSFAND  (
    .I0(\K1/processor/store_data<1>/SLICEWE1USED_150 ),
    .I1(\K1/processor/store_data<1>/SLICEWE0USED_148 ),
    .I2(\K1/processor/store_data<1>/SRINV_147 ),
    .O(\K1/processor/store_data<1>/WSF )
  );
  defparam \K1/processor/store_loop[1].memory_bit/F.S0.WE/WSGAND .LOC = "SLICE_X52Y48";
  X_AND3 \K1/processor/store_loop[1].memory_bit/F.S0.WE/WSGAND  (
    .I0(\K1/processor/store_data<1>/SLICEWE1USED_150 ),
    .I1(\NlwInverterSignal_K1/processor/store_loop[1].memory_bit/F.S0.WE/WSGAND/WE0 ),
    .I2(\K1/processor/store_data<1>/SRINV_147 ),
    .O(\K1/processor/store_data<1>/WSG )
  );
  defparam \K1/processor/store_loop[1].memory_bit/F.S1.WE/WSFAND .LOC = "SLICE_X52Y49";
  X_AND3 \K1/processor/store_loop[1].memory_bit/F.S1.WE/WSFAND  (
    .I0(\K1/processor/store_loop[1].memory_bit/F5.S1/SLICEWE1USED_160 ),
    .I1(\K1/processor/store_loop[1].memory_bit/F5.S1/SLICEWE0USED_158 ),
    .I2(\K1/processor/store_loop[1].memory_bit/F5.S1/SRINV_157 ),
    .O(\K1/processor/store_loop[1].memory_bit/F5.S1/WSF )
  );
  defparam \K1/processor/store_loop[1].memory_bit/F.S1.WE/WSGAND .LOC = "SLICE_X52Y49";
  X_AND3 \K1/processor/store_loop[1].memory_bit/F.S1.WE/WSGAND  (
    .I0(\K1/processor/store_loop[1].memory_bit/F5.S1/SLICEWE1USED_160 ),
    .I1(\NlwInverterSignal_K1/processor/store_loop[1].memory_bit/F.S1.WE/WSGAND/WE0 ),
    .I2(\K1/processor/store_loop[1].memory_bit/F5.S1/SRINV_157 ),
    .O(\K1/processor/store_loop[1].memory_bit/F5.S1/WSG )
  );
  defparam \K1/processor/store_loop[0].memory_bit/F.S0.WE/WSFAND .LOC = "SLICE_X66Y48";
  X_AND3 \K1/processor/store_loop[0].memory_bit/F.S0.WE/WSFAND  (
    .I0(\K1/processor/store_data<0>/SLICEWE1USED_173 ),
    .I1(\K1/processor/store_data<0>/SLICEWE0USED_171 ),
    .I2(\K1/processor/store_data<0>/SRINV_170 ),
    .O(\K1/processor/store_data<0>/WSF )
  );
  defparam \K1/processor/store_loop[0].memory_bit/F.S0.WE/WSGAND .LOC = "SLICE_X66Y48";
  X_AND3 \K1/processor/store_loop[0].memory_bit/F.S0.WE/WSGAND  (
    .I0(\K1/processor/store_data<0>/SLICEWE1USED_173 ),
    .I1(\NlwInverterSignal_K1/processor/store_loop[0].memory_bit/F.S0.WE/WSGAND/WE0 ),
    .I2(\K1/processor/store_data<0>/SRINV_170 ),
    .O(\K1/processor/store_data<0>/WSG )
  );
  defparam \K1/processor/store_loop[0].memory_bit/F.S1.WE/WSFAND .LOC = "SLICE_X66Y49";
  X_AND3 \K1/processor/store_loop[0].memory_bit/F.S1.WE/WSFAND  (
    .I0(\K1/processor/store_loop[0].memory_bit/F5.S1/SLICEWE1USED_183 ),
    .I1(\K1/processor/store_loop[0].memory_bit/F5.S1/SLICEWE0USED_181 ),
    .I2(\K1/processor/store_loop[0].memory_bit/F5.S1/SRINV_180 ),
    .O(\K1/processor/store_loop[0].memory_bit/F5.S1/WSF )
  );
  defparam \K1/processor/store_loop[0].memory_bit/F.S1.WE/WSGAND .LOC = "SLICE_X66Y49";
  X_AND3 \K1/processor/store_loop[0].memory_bit/F.S1.WE/WSGAND  (
    .I0(\K1/processor/store_loop[0].memory_bit/F5.S1/SLICEWE1USED_183 ),
    .I1(\NlwInverterSignal_K1/processor/store_loop[0].memory_bit/F.S1.WE/WSGAND/WE0 ),
    .I2(\K1/processor/store_loop[0].memory_bit/F5.S1/SRINV_180 ),
    .O(\K1/processor/store_loop[0].memory_bit/F5.S1/WSG )
  );
  defparam \K1/processor/store_loop[5].memory_bit/F.S1.WE/WSFAND .LOC = "SLICE_X66Y47";
  X_AND3 \K1/processor/store_loop[5].memory_bit/F.S1.WE/WSFAND  (
    .I0(\K1/processor/store_loop[5].memory_bit/F5.S1/SLICEWE1USED_211 ),
    .I1(\K1/processor/store_loop[5].memory_bit/F5.S1/SLICEWE0USED_209 ),
    .I2(\K1/processor/store_loop[5].memory_bit/F5.S1/SRINV_208 ),
    .O(\K1/processor/store_loop[5].memory_bit/F5.S1/WSF )
  );
  defparam \K1/processor/store_loop[5].memory_bit/F.S1.WE/WSGAND .LOC = "SLICE_X66Y47";
  X_AND3 \K1/processor/store_loop[5].memory_bit/F.S1.WE/WSGAND  (
    .I0(\K1/processor/store_loop[5].memory_bit/F5.S1/SLICEWE1USED_211 ),
    .I1(\NlwInverterSignal_K1/processor/store_loop[5].memory_bit/F.S1.WE/WSGAND/WE0 ),
    .I2(\K1/processor/store_loop[5].memory_bit/F5.S1/SRINV_208 ),
    .O(\K1/processor/store_loop[5].memory_bit/F5.S1/WSG )
  );
  defparam \K1/processor/stack_ram_loop[7].stack_bit/F.WE/WSFAND .LOC = "SLICE_X64Y14";
  X_AND2 \K1/processor/stack_ram_loop[7].stack_bit/F.WE/WSFAND  (
    .I0(\K1/processor/stack_pop_data<7>/SLICEWE0USED_219 ),
    .I1(\K1/processor/stack_pop_data<7>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<7>/WSF )
  );
  defparam \K1/processor/stack_ram_loop[7].stack_bit/F.WE/WSGAND .LOC = "SLICE_X64Y14";
  X_AND2 \K1/processor/stack_ram_loop[7].stack_bit/F.WE/WSGAND  (
    .I0(\NlwInverterSignal_K1/processor/stack_ram_loop[7].stack_bit/F.WE/WSGAND/WE0 ),
    .I1(\K1/processor/stack_pop_data<7>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<7>/WSG )
  );
  defparam \K1/processor/stack_ram_loop[6].stack_bit/F.WE/WSFAND .LOC = "SLICE_X52Y14";
  X_AND2 \K1/processor/stack_ram_loop[6].stack_bit/F.WE/WSFAND  (
    .I0(\K1/processor/stack_pop_data<6>/SLICEWE0USED_228 ),
    .I1(\K1/processor/stack_pop_data<6>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<6>/WSF )
  );
  defparam \K1/processor/stack_ram_loop[6].stack_bit/F.WE/WSGAND .LOC = "SLICE_X52Y14";
  X_AND2 \K1/processor/stack_ram_loop[6].stack_bit/F.WE/WSGAND  (
    .I0(\NlwInverterSignal_K1/processor/stack_ram_loop[6].stack_bit/F.WE/WSGAND/WE0 ),
    .I1(\K1/processor/stack_pop_data<6>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<6>/WSG )
  );
  defparam \K1/processor/stack_ram_loop[5].stack_bit/F.WE/WSFAND .LOC = "SLICE_X64Y15";
  X_AND2 \K1/processor/stack_ram_loop[5].stack_bit/F.WE/WSFAND  (
    .I0(\K1/processor/stack_pop_data<5>/SLICEWE0USED_237 ),
    .I1(\K1/processor/stack_pop_data<5>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<5>/WSF )
  );
  defparam \K1/processor/stack_ram_loop[5].stack_bit/F.WE/WSGAND .LOC = "SLICE_X64Y15";
  X_AND2 \K1/processor/stack_ram_loop[5].stack_bit/F.WE/WSGAND  (
    .I0(\NlwInverterSignal_K1/processor/stack_ram_loop[5].stack_bit/F.WE/WSGAND/WE0 ),
    .I1(\K1/processor/stack_pop_data<5>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<5>/WSG )
  );
  defparam \K1/processor/stack_ram_loop[4].stack_bit/F.WE/WSFAND .LOC = "SLICE_X54Y17";
  X_AND2 \K1/processor/stack_ram_loop[4].stack_bit/F.WE/WSFAND  (
    .I0(\K1/processor/stack_pop_data<4>/SLICEWE0USED_246 ),
    .I1(\K1/processor/stack_pop_data<4>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<4>/WSF )
  );
  defparam \K1/processor/stack_ram_loop[4].stack_bit/F.WE/WSGAND .LOC = "SLICE_X54Y17";
  X_AND2 \K1/processor/stack_ram_loop[4].stack_bit/F.WE/WSGAND  (
    .I0(\NlwInverterSignal_K1/processor/stack_ram_loop[4].stack_bit/F.WE/WSGAND/WE0 ),
    .I1(\K1/processor/stack_pop_data<4>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<4>/WSG )
  );
  defparam \K1/processor/stack_ram_loop[3].stack_bit/F.WE/WSFAND .LOC = "SLICE_X52Y12";
  X_AND2 \K1/processor/stack_ram_loop[3].stack_bit/F.WE/WSFAND  (
    .I0(\K1/processor/stack_pop_data<3>/SLICEWE0USED_255 ),
    .I1(\K1/processor/stack_pop_data<3>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<3>/WSF )
  );
  defparam \K1/processor/stack_ram_loop[3].stack_bit/F.WE/WSGAND .LOC = "SLICE_X52Y12";
  X_AND2 \K1/processor/stack_ram_loop[3].stack_bit/F.WE/WSGAND  (
    .I0(\NlwInverterSignal_K1/processor/stack_ram_loop[3].stack_bit/F.WE/WSGAND/WE0 ),
    .I1(\K1/processor/stack_pop_data<3>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<3>/WSG )
  );
  defparam \K1/processor/store_loop[4].memory_bit/F.S0.WE/WSFAND .LOC = "SLICE_X52Y50";
  X_AND3 \K1/processor/store_loop[4].memory_bit/F.S0.WE/WSFAND  (
    .I0(\K1/processor/store_data<4>/SLICEWE1USED_269 ),
    .I1(\K1/processor/store_data<4>/SLICEWE0USED_267 ),
    .I2(\K1/processor/store_data<4>/SRINV_266 ),
    .O(\K1/processor/store_data<4>/WSF )
  );
  defparam \K1/processor/store_loop[4].memory_bit/F.S0.WE/WSGAND .LOC = "SLICE_X52Y50";
  X_AND3 \K1/processor/store_loop[4].memory_bit/F.S0.WE/WSGAND  (
    .I0(\K1/processor/store_data<4>/SLICEWE1USED_269 ),
    .I1(\NlwInverterSignal_K1/processor/store_loop[4].memory_bit/F.S0.WE/WSGAND/WE0 ),
    .I2(\K1/processor/store_data<4>/SRINV_266 ),
    .O(\K1/processor/store_data<4>/WSG )
  );
  defparam \K1/processor/store_loop[4].memory_bit/F.S1.WE/WSFAND .LOC = "SLICE_X52Y51";
  X_AND3 \K1/processor/store_loop[4].memory_bit/F.S1.WE/WSFAND  (
    .I0(\K1/processor/store_loop[4].memory_bit/F5.S1/SLICEWE1USED_279 ),
    .I1(\K1/processor/store_loop[4].memory_bit/F5.S1/SLICEWE0USED_277 ),
    .I2(\K1/processor/store_loop[4].memory_bit/F5.S1/SRINV_276 ),
    .O(\K1/processor/store_loop[4].memory_bit/F5.S1/WSF )
  );
  defparam \K1/processor/store_loop[4].memory_bit/F.S1.WE/WSGAND .LOC = "SLICE_X52Y51";
  X_AND3 \K1/processor/store_loop[4].memory_bit/F.S1.WE/WSGAND  (
    .I0(\K1/processor/store_loop[4].memory_bit/F5.S1/SLICEWE1USED_279 ),
    .I1(\NlwInverterSignal_K1/processor/store_loop[4].memory_bit/F.S1.WE/WSGAND/WE0 ),
    .I2(\K1/processor/store_loop[4].memory_bit/F5.S1/SRINV_276 ),
    .O(\K1/processor/store_loop[4].memory_bit/F5.S1/WSG )
  );
  defparam \K1/processor/store_loop[3].memory_bit/F.S0.WE/WSFAND .LOC = "SLICE_X66Y44";
  X_AND3 \K1/processor/store_loop[3].memory_bit/F.S0.WE/WSFAND  (
    .I0(\K1/processor/store_data<3>/SLICEWE1USED_292 ),
    .I1(\K1/processor/store_data<3>/SLICEWE0USED_290 ),
    .I2(\K1/processor/store_data<3>/SRINV_289 ),
    .O(\K1/processor/store_data<3>/WSF )
  );
  defparam \K1/processor/store_loop[3].memory_bit/F.S0.WE/WSGAND .LOC = "SLICE_X66Y44";
  X_AND3 \K1/processor/store_loop[3].memory_bit/F.S0.WE/WSGAND  (
    .I0(\K1/processor/store_data<3>/SLICEWE1USED_292 ),
    .I1(\NlwInverterSignal_K1/processor/store_loop[3].memory_bit/F.S0.WE/WSGAND/WE0 ),
    .I2(\K1/processor/store_data<3>/SRINV_289 ),
    .O(\K1/processor/store_data<3>/WSG )
  );
  defparam \K1/processor/store_loop[6].memory_bit/F.S0.WE/WSFAND .LOC = "SLICE_X52Y44";
  X_AND3 \K1/processor/store_loop[6].memory_bit/F.S0.WE/WSFAND  (
    .I0(\K1/processor/store_data<6>/SLICEWE1USED_305 ),
    .I1(\K1/processor/store_data<6>/SLICEWE0USED_303 ),
    .I2(\K1/processor/store_data<6>/SRINV_302 ),
    .O(\K1/processor/store_data<6>/WSF )
  );
  defparam \K1/processor/store_loop[6].memory_bit/F.S0.WE/WSGAND .LOC = "SLICE_X52Y44";
  X_AND3 \K1/processor/store_loop[6].memory_bit/F.S0.WE/WSGAND  (
    .I0(\K1/processor/store_data<6>/SLICEWE1USED_305 ),
    .I1(\NlwInverterSignal_K1/processor/store_loop[6].memory_bit/F.S0.WE/WSGAND/WE0 ),
    .I2(\K1/processor/store_data<6>/SRINV_302 ),
    .O(\K1/processor/store_data<6>/WSG )
  );
  defparam \K1/processor/store_loop[6].memory_bit/F.S1.WE/WSFAND .LOC = "SLICE_X52Y45";
  X_AND3 \K1/processor/store_loop[6].memory_bit/F.S1.WE/WSFAND  (
    .I0(\K1/processor/store_loop[6].memory_bit/F5.S1/SLICEWE1USED_315 ),
    .I1(\K1/processor/store_loop[6].memory_bit/F5.S1/SLICEWE0USED_313 ),
    .I2(\K1/processor/store_loop[6].memory_bit/F5.S1/SRINV_312 ),
    .O(\K1/processor/store_loop[6].memory_bit/F5.S1/WSF )
  );
  defparam \K1/processor/store_loop[6].memory_bit/F.S1.WE/WSGAND .LOC = "SLICE_X52Y45";
  X_AND3 \K1/processor/store_loop[6].memory_bit/F.S1.WE/WSGAND  (
    .I0(\K1/processor/store_loop[6].memory_bit/F5.S1/SLICEWE1USED_315 ),
    .I1(\NlwInverterSignal_K1/processor/store_loop[6].memory_bit/F.S1.WE/WSGAND/WE0 ),
    .I2(\K1/processor/store_loop[6].memory_bit/F5.S1/SRINV_312 ),
    .O(\K1/processor/store_loop[6].memory_bit/F5.S1/WSG )
  );
  defparam \K1/processor/stack_ram_loop[2].stack_bit/F.WE/WSFAND .LOC = "SLICE_X52Y13";
  X_AND2 \K1/processor/stack_ram_loop[2].stack_bit/F.WE/WSFAND  (
    .I0(\K1/processor/stack_pop_data<2>/SLICEWE0USED_323 ),
    .I1(\K1/processor/stack_pop_data<2>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<2>/WSF )
  );
  defparam \K1/processor/stack_ram_loop[2].stack_bit/F.WE/WSGAND .LOC = "SLICE_X52Y13";
  X_AND2 \K1/processor/stack_ram_loop[2].stack_bit/F.WE/WSGAND  (
    .I0(\NlwInverterSignal_K1/processor/stack_ram_loop[2].stack_bit/F.WE/WSGAND/WE0 ),
    .I1(\K1/processor/stack_pop_data<2>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<2>/WSG )
  );
  defparam \K1/processor/stack_ram_loop[1].stack_bit/F.WE/WSFAND .LOC = "SLICE_X54Y10";
  X_AND2 \K1/processor/stack_ram_loop[1].stack_bit/F.WE/WSFAND  (
    .I0(\K1/processor/stack_pop_data<1>/SLICEWE0USED_332 ),
    .I1(\K1/processor/stack_pop_data<1>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<1>/WSF )
  );
  defparam \K1/processor/stack_ram_loop[1].stack_bit/F.WE/WSGAND .LOC = "SLICE_X54Y10";
  X_AND2 \K1/processor/stack_ram_loop[1].stack_bit/F.WE/WSGAND  (
    .I0(\NlwInverterSignal_K1/processor/stack_ram_loop[1].stack_bit/F.WE/WSGAND/WE0 ),
    .I1(\K1/processor/stack_pop_data<1>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<1>/WSG )
  );
  defparam \K1/processor/stack_ram_loop[9].stack_bit/F.WE/WSFAND .LOC = "SLICE_X64Y17";
  X_AND2 \K1/processor/stack_ram_loop[9].stack_bit/F.WE/WSFAND  (
    .I0(\K1/processor/stack_pop_data<9>/SLICEWE0USED_341 ),
    .I1(\K1/processor/stack_pop_data<9>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<9>/WSF )
  );
  defparam \K1/processor/stack_ram_loop[9].stack_bit/F.WE/WSGAND .LOC = "SLICE_X64Y17";
  X_AND2 \K1/processor/stack_ram_loop[9].stack_bit/F.WE/WSGAND  (
    .I0(\NlwInverterSignal_K1/processor/stack_ram_loop[9].stack_bit/F.WE/WSGAND/WE0 ),
    .I1(\K1/processor/stack_pop_data<9>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<9>/WSG )
  );
  defparam \K1/processor/stack_ram_loop[0].stack_bit/F.WE/WSFAND .LOC = "SLICE_X54Y11";
  X_AND2 \K1/processor/stack_ram_loop[0].stack_bit/F.WE/WSFAND  (
    .I0(\K1/processor/stack_pop_data<0>/SLICEWE0USED_350 ),
    .I1(\K1/processor/stack_pop_data<0>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<0>/WSF )
  );
  defparam \K1/processor/stack_ram_loop[0].stack_bit/F.WE/WSGAND .LOC = "SLICE_X54Y11";
  X_AND2 \K1/processor/stack_ram_loop[0].stack_bit/F.WE/WSGAND  (
    .I0(\NlwInverterSignal_K1/processor/stack_ram_loop[0].stack_bit/F.WE/WSGAND/WE0 ),
    .I1(\K1/processor/stack_pop_data<0>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<0>/WSG )
  );
  defparam \K1/processor/store_loop[5].memory_bit/F.S0.WE/WSFAND .LOC = "SLICE_X66Y46";
  X_AND3 \K1/processor/store_loop[5].memory_bit/F.S0.WE/WSFAND  (
    .I0(\K1/processor/store_data<5>/SLICEWE1USED_364 ),
    .I1(\K1/processor/store_data<5>/SLICEWE0USED_362 ),
    .I2(\K1/processor/store_data<5>/SRINV_361 ),
    .O(\K1/processor/store_data<5>/WSF )
  );
  defparam \K1/processor/store_loop[5].memory_bit/F.S0.WE/WSGAND .LOC = "SLICE_X66Y46";
  X_AND3 \K1/processor/store_loop[5].memory_bit/F.S0.WE/WSGAND  (
    .I0(\K1/processor/store_data<5>/SLICEWE1USED_364 ),
    .I1(\NlwInverterSignal_K1/processor/store_loop[5].memory_bit/F.S0.WE/WSGAND/WE0 ),
    .I2(\K1/processor/store_data<5>/SRINV_361 ),
    .O(\K1/processor/store_data<5>/WSG )
  );
  defparam \K1/processor/stack_ram_loop[8].stack_bit/F.WE/WSFAND .LOC = "SLICE_X64Y16";
  X_AND2 \K1/processor/stack_ram_loop[8].stack_bit/F.WE/WSFAND  (
    .I0(\K1/processor/stack_pop_data<8>/SLICEWE0USED_372 ),
    .I1(\K1/processor/stack_pop_data<8>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<8>/WSF )
  );
  defparam \K1/processor/stack_ram_loop[8].stack_bit/F.WE/WSGAND .LOC = "SLICE_X64Y16";
  X_AND2 \K1/processor/stack_ram_loop[8].stack_bit/F.WE/WSGAND  (
    .I0(\NlwInverterSignal_K1/processor/stack_ram_loop[8].stack_bit/F.WE/WSGAND/WE0 ),
    .I1(\K1/processor/stack_pop_data<8>/SRINVNOT ),
    .O(\K1/processor/stack_pop_data<8>/WSG )
  );
  defparam \K1/processor/zero_flag/G/X_LUT4 .INIT = 16'h0000;
  defparam \K1/processor/zero_flag/G/X_LUT4 .LOC = "SLICE_X64Y41";
  X_LUT4 \K1/processor/zero_flag/G/X_LUT4  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\K1/processor/zero_flag/G )
  );
  defparam \K1/processor/carry_flag/G/X_LUT4 .INIT = 16'h0000;
  defparam \K1/processor/carry_flag/G/X_LUT4 .LOC = "SLICE_X55Y41";
  X_LUT4 \K1/processor/carry_flag/G/X_LUT4  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\K1/processor/carry_flag/G )
  );
  defparam \K1/processor/store_loop[7].memory_bit/F.S0.WE/WSFAND .LOC = "SLICE_X52Y46";
  X_AND3 \K1/processor/store_loop[7].memory_bit/F.S0.WE/WSFAND  (
    .I0(\K1/processor/store_data<7>/SLICEWE1USED_633 ),
    .I1(\K1/processor/store_data<7>/SLICEWE0USED_631 ),
    .I2(\K1/processor/store_data<7>/SRINV_630 ),
    .O(\K1/processor/store_data<7>/WSF )
  );
  defparam \K1/processor/store_loop[7].memory_bit/F.S0.WE/WSGAND .LOC = "SLICE_X52Y46";
  X_AND3 \K1/processor/store_loop[7].memory_bit/F.S0.WE/WSGAND  (
    .I0(\K1/processor/store_data<7>/SLICEWE1USED_633 ),
    .I1(\NlwInverterSignal_K1/processor/store_loop[7].memory_bit/F.S0.WE/WSGAND/WE0 ),
    .I2(\K1/processor/store_data<7>/SRINV_630 ),
    .O(\K1/processor/store_data<7>/WSG )
  );
  defparam \K1/processor/store_loop[7].memory_bit/F.S1.WE/WSFAND .LOC = "SLICE_X52Y47";
  X_AND3 \K1/processor/store_loop[7].memory_bit/F.S1.WE/WSFAND  (
    .I0(\K1/processor/store_loop[7].memory_bit/F5.S1/SLICEWE1USED_643 ),
    .I1(\K1/processor/store_loop[7].memory_bit/F5.S1/SLICEWE0USED_641 ),
    .I2(\K1/processor/store_loop[7].memory_bit/F5.S1/SRINV_640 ),
    .O(\K1/processor/store_loop[7].memory_bit/F5.S1/WSF )
  );
  defparam \K1/processor/store_loop[7].memory_bit/F.S1.WE/WSGAND .LOC = "SLICE_X52Y47";
  X_AND3 \K1/processor/store_loop[7].memory_bit/F.S1.WE/WSGAND  (
    .I0(\K1/processor/store_loop[7].memory_bit/F5.S1/SLICEWE1USED_643 ),
    .I1(\NlwInverterSignal_K1/processor/store_loop[7].memory_bit/F.S1.WE/WSGAND/WE0 ),
    .I2(\K1/processor/store_loop[7].memory_bit/F5.S1/SRINV_640 ),
    .O(\K1/processor/store_loop[7].memory_bit/F5.S1/WSG )
  );
  X_ONE NlwBlock_picoblaze_top_VCC (
    .O(VCC)
  );
  X_ZERO NlwBlock_picoblaze_top_GND (
    .O(GND)
  );
  X_INV \NlwInverterBlock_K1/processor/store_loop[3].memory_bit/F.S1.WE/WSGAND/WE0  (
    .I(\K1/processor/store_loop[3].memory_bit/F5.S1/SLICEWE0USED_112 ),
    .O(\NlwInverterSignal_K1/processor/store_loop[3].memory_bit/F.S1.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/store_loop[2].memory_bit/F.S0.WE/WSGAND/WE0  (
    .I(\K1/processor/store_data<2>/SLICEWE0USED_125 ),
    .O(\NlwInverterSignal_K1/processor/store_loop[2].memory_bit/F.S0.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/store_loop[2].memory_bit/F.S1.WE/WSGAND/WE0  (
    .I(\K1/processor/store_loop[2].memory_bit/F5.S1/SLICEWE0USED_135 ),
    .O(\NlwInverterSignal_K1/processor/store_loop[2].memory_bit/F.S1.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/store_loop[1].memory_bit/F.S0.WE/WSGAND/WE0  (
    .I(\K1/processor/store_data<1>/SLICEWE0USED_148 ),
    .O(\NlwInverterSignal_K1/processor/store_loop[1].memory_bit/F.S0.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/store_loop[1].memory_bit/F.S1.WE/WSGAND/WE0  (
    .I(\K1/processor/store_loop[1].memory_bit/F5.S1/SLICEWE0USED_158 ),
    .O(\NlwInverterSignal_K1/processor/store_loop[1].memory_bit/F.S1.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/store_loop[0].memory_bit/F.S0.WE/WSGAND/WE0  (
    .I(\K1/processor/store_data<0>/SLICEWE0USED_171 ),
    .O(\NlwInverterSignal_K1/processor/store_loop[0].memory_bit/F.S0.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/store_loop[0].memory_bit/F.S1.WE/WSGAND/WE0  (
    .I(\K1/processor/store_loop[0].memory_bit/F5.S1/SLICEWE0USED_181 ),
    .O(\NlwInverterSignal_K1/processor/store_loop[0].memory_bit/F.S1.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/store_loop[5].memory_bit/F.S1.WE/WSGAND/WE0  (
    .I(\K1/processor/store_loop[5].memory_bit/F5.S1/SLICEWE0USED_209 ),
    .O(\NlwInverterSignal_K1/processor/store_loop[5].memory_bit/F.S1.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/stack_ram_loop[7].stack_bit/F.WE/WSGAND/WE0  (
    .I(\K1/processor/stack_pop_data<7>/SLICEWE0USED_219 ),
    .O(\NlwInverterSignal_K1/processor/stack_ram_loop[7].stack_bit/F.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/stack_ram_loop[6].stack_bit/F.WE/WSGAND/WE0  (
    .I(\K1/processor/stack_pop_data<6>/SLICEWE0USED_228 ),
    .O(\NlwInverterSignal_K1/processor/stack_ram_loop[6].stack_bit/F.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/stack_ram_loop[5].stack_bit/F.WE/WSGAND/WE0  (
    .I(\K1/processor/stack_pop_data<5>/SLICEWE0USED_237 ),
    .O(\NlwInverterSignal_K1/processor/stack_ram_loop[5].stack_bit/F.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/stack_ram_loop[4].stack_bit/F.WE/WSGAND/WE0  (
    .I(\K1/processor/stack_pop_data<4>/SLICEWE0USED_246 ),
    .O(\NlwInverterSignal_K1/processor/stack_ram_loop[4].stack_bit/F.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/stack_ram_loop[3].stack_bit/F.WE/WSGAND/WE0  (
    .I(\K1/processor/stack_pop_data<3>/SLICEWE0USED_255 ),
    .O(\NlwInverterSignal_K1/processor/stack_ram_loop[3].stack_bit/F.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/store_loop[4].memory_bit/F.S0.WE/WSGAND/WE0  (
    .I(\K1/processor/store_data<4>/SLICEWE0USED_267 ),
    .O(\NlwInverterSignal_K1/processor/store_loop[4].memory_bit/F.S0.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/store_loop[4].memory_bit/F.S1.WE/WSGAND/WE0  (
    .I(\K1/processor/store_loop[4].memory_bit/F5.S1/SLICEWE0USED_277 ),
    .O(\NlwInverterSignal_K1/processor/store_loop[4].memory_bit/F.S1.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/store_loop[3].memory_bit/F.S0.WE/WSGAND/WE0  (
    .I(\K1/processor/store_data<3>/SLICEWE0USED_290 ),
    .O(\NlwInverterSignal_K1/processor/store_loop[3].memory_bit/F.S0.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/store_loop[6].memory_bit/F.S0.WE/WSGAND/WE0  (
    .I(\K1/processor/store_data<6>/SLICEWE0USED_303 ),
    .O(\NlwInverterSignal_K1/processor/store_loop[6].memory_bit/F.S0.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/store_loop[6].memory_bit/F.S1.WE/WSGAND/WE0  (
    .I(\K1/processor/store_loop[6].memory_bit/F5.S1/SLICEWE0USED_313 ),
    .O(\NlwInverterSignal_K1/processor/store_loop[6].memory_bit/F.S1.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/stack_ram_loop[2].stack_bit/F.WE/WSGAND/WE0  (
    .I(\K1/processor/stack_pop_data<2>/SLICEWE0USED_323 ),
    .O(\NlwInverterSignal_K1/processor/stack_ram_loop[2].stack_bit/F.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/stack_ram_loop[1].stack_bit/F.WE/WSGAND/WE0  (
    .I(\K1/processor/stack_pop_data<1>/SLICEWE0USED_332 ),
    .O(\NlwInverterSignal_K1/processor/stack_ram_loop[1].stack_bit/F.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/stack_ram_loop[9].stack_bit/F.WE/WSGAND/WE0  (
    .I(\K1/processor/stack_pop_data<9>/SLICEWE0USED_341 ),
    .O(\NlwInverterSignal_K1/processor/stack_ram_loop[9].stack_bit/F.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/stack_ram_loop[0].stack_bit/F.WE/WSGAND/WE0  (
    .I(\K1/processor/stack_pop_data<0>/SLICEWE0USED_350 ),
    .O(\NlwInverterSignal_K1/processor/stack_ram_loop[0].stack_bit/F.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/store_loop[5].memory_bit/F.S0.WE/WSGAND/WE0  (
    .I(\K1/processor/store_data<5>/SLICEWE0USED_362 ),
    .O(\NlwInverterSignal_K1/processor/store_loop[5].memory_bit/F.S0.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/stack_ram_loop[8].stack_bit/F.WE/WSGAND/WE0  (
    .I(\K1/processor/stack_pop_data<8>/SLICEWE0USED_372 ),
    .O(\NlwInverterSignal_K1/processor/stack_ram_loop[8].stack_bit/F.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/store_loop[7].memory_bit/F.S0.WE/WSGAND/WE0  (
    .I(\K1/processor/store_data<7>/SLICEWE0USED_631 ),
    .O(\NlwInverterSignal_K1/processor/store_loop[7].memory_bit/F.S0.WE/WSGAND/WE0 )
  );
  X_INV \NlwInverterBlock_K1/processor/store_loop[7].memory_bit/F.S1.WE/WSGAND/WE0  (
    .I(\K1/processor/store_loop[7].memory_bit/F5.S1/SLICEWE0USED_641 ),
    .O(\NlwInverterSignal_K1/processor/store_loop[7].memory_bit/F.S1.WE/WSGAND/WE0 )
  );
endmodule


`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire PRLD;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

