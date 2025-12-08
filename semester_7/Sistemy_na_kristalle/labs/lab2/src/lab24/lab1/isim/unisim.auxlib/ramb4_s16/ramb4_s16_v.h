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

#ifndef H_Unisim_ramb4_s16_ramb4_s16_v_H
#define H_Unisim_ramb4_s16_ramb4_s16_v_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Unisim_ramb4_s16_ramb4_s16_v: public HSim__s6 {
public:

    HSim__s4 PE[16];
    HSim__s1 SE[7];

HSim__s4 C8;
HSim__s4 Cb;
  HSimArrayType Two_d_array_typebase;
  HSimArrayType Two_d_array_type;
/* subprogram name slv_to_two_D_array */
char *FE(const char *CB, const HSimConstraints *constrCB);
    Unisim_ramb4_s16_ramb4_s16_v(const char * name);
    ~Unisim_ramb4_s16_ramb4_s16_v();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createUnisim_ramb4_s16_ramb4_s16_v(const char *name);

#endif
