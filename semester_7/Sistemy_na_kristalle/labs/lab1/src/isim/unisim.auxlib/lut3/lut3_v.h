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

#ifndef H_Unisim_lut3_lut3_v_H
#define H_Unisim_lut3_lut3_v_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Unisim_lut3_lut3_v: public HSim__s6 {
public:

    HSim__s4 PE[1];
    HSim__s1 SE[4];

/* subprogram name lut4_mux4 */
char Fk(const char *Cb, const char *Ch);
HSimConstraints *c106;
  char *t107;
HSim__s4 C2s;
    Unisim_lut3_lut3_v(const char * name);
    ~Unisim_lut3_lut3_v();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createUnisim_lut3_lut3_v(const char *name);

#endif
