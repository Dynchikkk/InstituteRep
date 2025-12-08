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

#ifndef H_simprim_ver_auxlibM_x___r_a_m_d16_H
#define H_simprim_ver_auxlibM_x___r_a_m_d16_H

#ifdef _MSC_VER
#pragma warning(disable: 4355)
#endif

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif

class simprim_ver_auxlibM_x___r_a_m_d16 : public HSim__s5{
public: 
    simprim_ver_auxlibM_x___r_a_m_d16(const char *instname);
    ~simprim_ver_auxlibM_x___r_a_m_d16();
    void setDefparam();
    void constructObject();
    void moduleInstantiate(HSimConfigDecl *cfg);
    void connectSigs();
    void reset();
    virtual void archImplement();
    bool simprim_ver_auxlibM_x___r_a_m_d16::tc_c_01();
    bool simprim_ver_auxlibM_x___r_a_m_d16::tc_c_11();
    bool simprim_ver_auxlibM_x___r_a_m_d16::tc_c_21();
    bool simprim_ver_auxlibM_x___r_a_m_d16::tc_c_31();
    bool simprim_ver_auxlibM_x___r_a_m_d16::tc_c_41();
    bool simprim_ver_auxlibM_x___r_a_m_d16::tc_c_51();
    bool simprim_ver_auxlibM_x___r_a_m_d16::tc_c_61();
    bool simprim_ver_auxlibM_x___r_a_m_d16::tc_c_71();
    bool simprim_ver_auxlibM_x___r_a_m_d16::tc_c_81();
    bool simprim_ver_auxlibM_x___r_a_m_d16::tc_c_91();
    bool simprim_ver_auxlibM_x___r_a_m_d16::tc_c_120();
    HSim__s1 us[17];
    HSim__s3 uv[3];
    HSimVlogParam up[2];
};

#endif
