// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vhello_tb.h for the primary calling header

#ifndef VERILATED_VHELLO_TB___024ROOT_H_
#define VERILATED_VHELLO_TB___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vhello_tb__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vhello_tb___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ hello_tb__DOT__clk;
    CData/*3:0*/ hello_tb__DOT__counter;
    CData/*0:0*/ __VdlyVal__hello_tb__DOT__clk__v0;
    CData/*0:0*/ __VdlySet__hello_tb__DOT__clk__v0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__hello_tb__DOT__clk__0;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    VlDelayScheduler __VdlySched;
    VlTriggerVec<2> __VactTriggered;
    VlTriggerVec<2> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vhello_tb__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vhello_tb___024root(Vhello_tb__Syms* symsp, const char* v__name);
    ~Vhello_tb___024root();
    VL_UNCOPYABLE(Vhello_tb___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
