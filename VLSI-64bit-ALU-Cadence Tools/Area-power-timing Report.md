# 🧾 Synthesis & Physical Design Report – 64-bit ALU

This document summarizes the **post-synthesis** and **post-place-and-route (P&R)** reports for the 64-bit ALU designed during the RTL-to-GDSII flow using **Cadence Genus** and **Innovus** tools.

---

## ✅ Timing Summary (Post-Route)

- **Setup Slack**: +75 ps ✅  
- **Hold Slack**: 0 ps ✅ (No violations)  
- **Clock Latency**: 250 ps  
- **Start Point**: `B[0]`  
- **End Point**: `out_reg[63]/SI`

The design met timing constraints successfully, ensuring **robust performance** at the defined clock frequency with no setup or hold violations.

---

## 📐 Area Report

| Metric                     | Value              |
|---------------------------|--------------------|
| Total Leaf Cells          | 16,800             |
| Sequential Cells          | 67                 |
| Inverters                 | 3,729              |
| Buffers                  | 248                |
| Logic Cells               | 14,556             |
| Buffer/Inverter Cells     | 236 (post-CTS)     |

- The ALU core is **combinational-heavy** (96.89% logic area), typical of arithmetic datapaths.
- Clock tree synthesis added ~236 buffers/inverters to balance skew and improve signal integrity.

---

## 🔋 Power Breakdown

| Component     | Dynamic Power (W) | Leakage Power (W) | Total (%)  |
|---------------|-------------------|--------------------|------------|
| Logic         | 0.21952           | 0.01590            | 96.89%     |
| Registers     | 0.00745           | 0.00731            | 2.98%      |
| Clock Network | 0.00326           | —                  | 0.13%      |
| Total         | —                 | —                  | **100%**   |

💡 *The logic consumes the majority of dynamic power due to complex 64-bit arithmetic operations.*

---

## 🔧 Standard Cell Usage

Significant cells used:
- `XOR2X1`, `XNOR2X4`, `XNOR3XL`: Extensive usage for ALU operations
- `SDFFRHQX1`: Edge-triggered D flip-flop with active-low reset and clock enable
- Various `INVX`, `AOI`, `NAND3`, and `MUX` instances used for logic and control

---

## 🧠 Observations

- ✅ **Clean timing closure** post-routing
- ✅ **Clock tree built with minimal overhead**
- ✅ **Low register count** aligns with datapath-heavy design
- ✅ **Power and area optimized** for performance at 45nm (GPDK)

---

