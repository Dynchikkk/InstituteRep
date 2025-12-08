////////////////////////////////////////////////////////////////////////////////
//   ____  ____   
//  /   /\/   /  
// /___/  \  /   
// \   \   \/  
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /---/   /\     
// \   \  /  \  
//  \___\/\___\
////////////////////////////////////////////////////////////////////////////////

#ifndef H_Unisim_ramb16_s18_ramb16_s18_v_H
#define H_Unisim_ramb16_s18_ramb16_s18_v_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Unisim_ramb16_s18_ramb16_s18_v: public HSim__s6 {
public:

    HSim__s4 PE[75];
    HSim__s1 SE[9];

HSim__s4 C8;
HSim__s4 Cb;
HSim__s4 Ce;
  HSimArrayType Two_d_array_typebase;
  HSimArrayType Two_d_array_type;
  HSimArrayType Two_d_parity_array_typebase;
  HSimArrayType Two_d_parity_array_type;
/* subprogram name slv_to_two_D_array */
char *F16(const int CY, const int C10, const char *C13, const HSimConstraints *constrC13);
/* subprogram name slv_to_two_D_parity_array */
char *F1N(const int C1G, const int C1I, const char *C1K, const HSimConstraints *constrC1K);
    Unisim_ramb16_s18_ramb16_s18_v(const char * name);
    ~Unisim_ramb16_s18_ramb16_s18_v();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createUnisim_ramb16_s18_ramb16_s18_v(const char *name);

#endif
