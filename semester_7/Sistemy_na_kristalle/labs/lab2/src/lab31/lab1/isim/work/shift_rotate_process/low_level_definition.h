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

#ifndef H_Work_shift_rotate_process_low_level_definition_H
#define H_Work_shift_rotate_process_low_level_definition_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_shift_rotate_process_low_level_definition: public HSim__s6 {
public:

    HSim__s1 SE[9];

    HSim__s1 SA[5];
  char t166;
    Work_shift_rotate_process_low_level_definition(const char * name);
    ~Work_shift_rotate_process_low_level_definition();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_shift_rotate_process_low_level_definition(const char *name);

#endif
