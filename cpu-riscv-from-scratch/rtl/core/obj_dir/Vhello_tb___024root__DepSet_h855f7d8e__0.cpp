// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vhello_tb.h for the primary calling header

#include "Vhello_tb__pch.h"
#include "Vhello_tb__Syms.h"
#include "Vhello_tb___024root.h"

VL_INLINE_OPT VlCoroutine Vhello_tb___024root___eval_initial__TOP__Vtiming__0(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___eval_initial__TOP__Vtiming__0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlWide<3>/*95:0*/ __Vtemp_1;
    // Body
    VL_WRITEF_NX("Hello! at the time instant %t\n",0,
                 64,VL_TIME_UNITED_Q(1000),-9);
    __Vtemp_1[0U] = 0x2e766364U;
    __Vtemp_1[1U] = 0x656c6c6fU;
    __Vtemp_1[2U] = 0x68U;
    vlSymsp->_vm_contextp__->dumpfile(VL_CVT_PACK_STR_NW(3, __Vtemp_1));
    VL_PRINTF_MT("-Info: hello_tb.sv:16: $dumpvar ignored, as Verilated without --trace\n");
    co_await vlSelfRef.__VdlySched.delay(0x186a0ULL, 
                                         nullptr, "hello_tb.sv", 
                                         17);
    VL_WRITEF_NX("Now at the time instant %0t the counter value is %0#\n",0,
                 64,VL_TIME_UNITED_Q(1000),-9,4,(IData)(vlSelfRef.hello_tb__DOT__counter));
    VL_FINISH_MT("hello_tb.sv", 19, "");
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vhello_tb___024root___dump_triggers__act(Vhello_tb___024root* vlSelf);
#endif  // VL_DEBUG

void Vhello_tb___024root___eval_triggers__act(Vhello_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vhello_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhello_tb___024root___eval_triggers__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered.set(0U, ((IData)(vlSelfRef.hello_tb__DOT__clk) 
                                       & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__hello_tb__DOT__clk__0))));
    vlSelfRef.__VactTriggered.set(1U, vlSelfRef.__VdlySched.awaitingCurrentTime());
    vlSelfRef.__Vtrigprevexpr___TOP__hello_tb__DOT__clk__0 
        = vlSelfRef.hello_tb__DOT__clk;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vhello_tb___024root___dump_triggers__act(vlSelf);
    }
#endif
}
