////////////////////////////////////////////////////////////////////////////////
//   ____  ____  
//  /   /\/   /  
// /___/  \  /   
// \   \   \/    
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /___/   /\   
// \   \  /  \  
//  \___\/\___\ 
////////////////////////////////////////////////////////////////////////////////

#ifndef H_unisim_ver_auxlibM_i_b_u_f_g_H
#define H_unisim_ver_auxlibM_i_b_u_f_g_H

#ifdef _MSC_VER
#pragma warning(disable: 4355)
#endif

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif

class unisim_ver_auxlibM_i_b_u_f_g : public HSim__s5{
public: 
    unisim_ver_auxlibM_i_b_u_f_g(const char *instname);
    ~unisim_ver_auxlibM_i_b_u_f_g();
    void setDefparam();
    void constructObject();
    void moduleInstantiate(HSimConfigDecl *cfg);
    void connectSigs();
    void reset();
    virtual void archImplement();
    HSim__s1 us[2];
    HSimVlogParam up[3];
};

#endif
