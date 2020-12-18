// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtb_top.h for the primary calling header

#ifndef _VTB_TOP___024UNIT_H_
#define _VTB_TOP___024UNIT_H_  // guard

#include "verilated_heavy.h"

//==========

class Vtb_top__Syms;

//----------

VL_MODULE(Vtb_top___024unit) {
  public:
    
    // INTERNAL VARIABLES
  private:
    Vtb_top__Syms* __VlSymsp;  // Symbol table
  public:
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Vtb_top___024unit);  ///< Copying not allowed
  public:
    Vtb_top___024unit(const char* name = "TOP");
    ~Vtb_top___024unit();
    
    // INTERNAL METHODS
    void __Vconfigure(Vtb_top__Syms* symsp, bool first);
  private:
    void _ctor_var_reset() VL_ATTR_COLD;
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
