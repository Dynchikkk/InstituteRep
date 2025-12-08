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

#ifndef H_Work_embedded_kcpsm_connectivity_H
#define H_Work_embedded_kcpsm_connectivity_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_embedded_kcpsm_connectivity: public HSim__s6 {
public:

    HSim__s1 SE[8];

    HSim__s1 SA[2];
    Work_embedded_kcpsm_connectivity(const char * name);
    ~Work_embedded_kcpsm_connectivity();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_embedded_kcpsm_connectivity(const char *name);

#endif
