// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vhello_tb__pch.h"

//============================================================
// Constructors

Vhello_tb::Vhello_tb(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vhello_tb__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vhello_tb::Vhello_tb(const char* _vcname__)
    : Vhello_tb(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vhello_tb::~Vhello_tb() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vhello_tb___024root___eval_debug_assertions(Vhello_tb___024root* vlSelf);
#endif  // VL_DEBUG
void Vhello_tb___024root___eval_static(Vhello_tb___024root* vlSelf);
void Vhello_tb___024root___eval_initial(Vhello_tb___024root* vlSelf);
void Vhello_tb___024root___eval_settle(Vhello_tb___024root* vlSelf);
void Vhello_tb___024root___eval(Vhello_tb___024root* vlSelf);

void Vhello_tb::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vhello_tb::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vhello_tb___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vhello_tb___024root___eval_static(&(vlSymsp->TOP));
        Vhello_tb___024root___eval_initial(&(vlSymsp->TOP));
        Vhello_tb___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vhello_tb___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vhello_tb::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty(); }

uint64_t Vhello_tb::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* Vhello_tb::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vhello_tb___024root___eval_final(Vhello_tb___024root* vlSelf);

VL_ATTR_COLD void Vhello_tb::final() {
    Vhello_tb___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vhello_tb::hierName() const { return vlSymsp->name(); }
const char* Vhello_tb::modelName() const { return "Vhello_tb"; }
unsigned Vhello_tb::threads() const { return 1; }
void Vhello_tb::prepareClone() const { contextp()->prepareClone(); }
void Vhello_tb::atClone() const {
    contextp()->threadPoolpOnClone();
}
