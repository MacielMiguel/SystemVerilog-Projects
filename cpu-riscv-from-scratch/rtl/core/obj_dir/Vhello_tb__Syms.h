// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VHELLO_TB__SYMS_H_
#define VERILATED_VHELLO_TB__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vhello_tb.h"

// INCLUDE MODULE CLASSES
#include "Vhello_tb___024root.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES)Vhello_tb__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vhello_tb* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vhello_tb___024root            TOP;

    // CONSTRUCTORS
    Vhello_tb__Syms(VerilatedContext* contextp, const char* namep, Vhello_tb* modelp);
    ~Vhello_tb__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
};

#endif  // guard
