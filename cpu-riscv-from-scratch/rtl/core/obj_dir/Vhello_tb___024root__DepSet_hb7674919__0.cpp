// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vhello_tb.h for the primary calling header

#include "Vhello_tb__pch.h"
#include "Vhello_tb___024root.h"

VlCoroutine Vhello_tb___024root___eval_initial__TOP__Vtiming__0(Vhello_tb___024root* vlSelf);
VlCoroutine Vhello_tb___024root___eval_initial__TOP__Vtiming__1(Vhello_tb___024root* vlSelf);

void Vhello_tb___024root___eval_initial(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___eval_initial\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vhello_tb___024root___eval_initial__TOP__Vtiming__0(vlSelf);
    Vhello_tb___024root___eval_initial__TOP__Vtiming__1(vlSelf);
    vlSelfRef.__Vtrigprevexpr___TOP__hello_tb__DOT__clk__0 
        = vlSelfRef.hello_tb__DOT__clk;
}

VL_INLINE_OPT VlCoroutine Vhello_tb___024root___eval_initial__TOP__Vtiming__1(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___eval_initial__TOP__Vtiming__1\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    while (1U) {
        co_await vlSelfRef.__VdlySched.delay(0xfa0ULL, 
                                             nullptr, 
                                             "hello_tb.sv", 
                                             8);
        vlSelfRef.__VdlyVal__hello_tb__DOT__clk__v0 
            = (1U & (~ (IData)(vlSelfRef.hello_tb__DOT__clk)));
        vlSelfRef.__VdlySet__hello_tb__DOT__clk__v0 = 1U;
    }
}

void Vhello_tb___024root___eval_act(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___eval_act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

void Vhello_tb___024root___nba_sequent__TOP__0(Vhello_tb___024root* vlSelf);
void Vhello_tb___024root___nba_sequent__TOP__1(Vhello_tb___024root* vlSelf);

void Vhello_tb___024root___eval_nba(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___eval_nba\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vhello_tb___024root___nba_sequent__TOP__0(vlSelf);
    }
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vhello_tb___024root___nba_sequent__TOP__1(vlSelf);
    }
}

VL_INLINE_OPT void Vhello_tb___024root___nba_sequent__TOP__0(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___nba_sequent__TOP__0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.hello_tb__DOT__counter = (0xfU & ((IData)(1U) 
                                                + (IData)(vlSelfRef.hello_tb__DOT__counter)));
}

VL_INLINE_OPT void Vhello_tb___024root___nba_sequent__TOP__1(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___nba_sequent__TOP__1\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (vlSelfRef.__VdlySet__hello_tb__DOT__clk__v0) {
        vlSelfRef.__VdlySet__hello_tb__DOT__clk__v0 = 0U;
        vlSelfRef.hello_tb__DOT__clk = vlSelfRef.__VdlyVal__hello_tb__DOT__clk__v0;
    }
}

void Vhello_tb___024root___timing_resume(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___timing_resume\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((2ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VdlySched.resume();
    }
}

void Vhello_tb___024root___eval_triggers__act(Vhello_tb___024root* vlSelf);

bool Vhello_tb___024root___eval_phase__act(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___eval_phase__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<2> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vhello_tb___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        Vhello_tb___024root___timing_resume(vlSelf);
        Vhello_tb___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vhello_tb___024root___eval_phase__nba(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___eval_phase__nba\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vhello_tb___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vhello_tb___024root___dump_triggers__nba(Vhello_tb___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vhello_tb___024root___dump_triggers__act(Vhello_tb___024root* vlSelf);
#endif  // VL_DEBUG

void Vhello_tb___024root___eval(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___eval\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
            Vhello_tb___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("hello_tb.sv", 3, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelfRef.__VactIterCount))) {
#ifdef VL_DEBUG
                Vhello_tb___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("hello_tb.sv", 3, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (Vhello_tb___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (Vhello_tb___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vhello_tb___024root___eval_debug_assertions(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___eval_debug_assertions\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
