// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vhello_tb.h for the primary calling header

#include "Vhello_tb__pch.h"
#include "Vhello_tb___024root.h"

VL_ATTR_COLD void Vhello_tb___024root___eval_static__TOP(Vhello_tb___024root* vlSelf);

VL_ATTR_COLD void Vhello_tb___024root___eval_static(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___eval_static\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vhello_tb___024root___eval_static__TOP(vlSelf);
}

VL_ATTR_COLD void Vhello_tb___024root___eval_static__TOP(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___eval_static__TOP\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.hello_tb__DOT__clk = 0U;
    vlSelfRef.hello_tb__DOT__counter = 0U;
}

VL_ATTR_COLD void Vhello_tb___024root___eval_final(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___eval_final\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vhello_tb___024root___eval_settle(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___eval_settle\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vhello_tb___024root___dump_triggers__act(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___dump_triggers__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VactTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge hello_tb.clk)\n");
    }
    if ((2ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 1 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vhello_tb___024root___dump_triggers__nba(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___dump_triggers__nba\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VnbaTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge hello_tb.clk)\n");
    }
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 1 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vhello_tb___024root___ctor_var_reset(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___ctor_var_reset\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelf->hello_tb__DOT__clk = VL_RAND_RESET_I(1);
    vlSelf->hello_tb__DOT__counter = VL_RAND_RESET_I(4);
    vlSelf->__VdlyVal__hello_tb__DOT__clk__v0 = VL_RAND_RESET_I(1);
    vlSelf->__VdlySet__hello_tb__DOT__clk__v0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__hello_tb__DOT__clk__0 = VL_RAND_RESET_I(1);
}
