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

#ifndef H_Unisim_ram32x1s_ram32x1s_v_H
#define H_Unisim_ram32x1s_ram32x1s_v_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Unisim_ram32x1s_ram32x1s_v: public HSim__s6 {
public:

    HSim__s4 PE[1];
    HSim__s1 SE[9];

HSimConstraints *c9;
  char *t10;
HSimConstraints *c11;
  char *t12;
    HSim__s1 SA[1];
    Unisim_ram32x1s_ram32x1s_v(const char * name);
    ~Unisim_ram32x1s_ram32x1s_v();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createUnisim_ram32x1s_ram32x1s_v(const char *name);

#endif
