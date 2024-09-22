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

#ifndef H_Unisim_and4b4_and4b4_v_H
#define H_Unisim_and4b4_and4b4_v_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Unisim_and4b4_and4b4_v: public HSim__s6 {
public:

    HSim__s1 SE[5];

  char t54;
  char t55;
  char t56;
  char t57;
  char t58;
  char t59;
  char t60;
    Unisim_and4b4_and4b4_v(const char * name);
    ~Unisim_and4b4_and4b4_v();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createUnisim_and4b4_and4b4_v(const char *name);

#endif
