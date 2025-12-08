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

#ifndef H_Work_tb1_behavior_H
#define H_Work_tb1_behavior_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_tb1_behavior: public HSim__s6 {
public:


  char *t6;
  char *t7;
HSim__s4 C15;
    HSim__s1 SA[4];
    Work_tb1_behavior(const char * name);
    ~Work_tb1_behavior();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_tb1_behavior(const char *name);

#endif
