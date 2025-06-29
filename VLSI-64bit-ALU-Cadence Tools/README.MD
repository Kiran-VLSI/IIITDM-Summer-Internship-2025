## 🔍 ALU Design Overview

This project implements a **64-bit Arithmetic Logic Unit (ALU)** that supports various arithmetic, logical, comparison, and shift operations. The ALU is designed using **Verilog HDL** and synthesized for VLSI implementation as part of the **RTL to GDSII flow**.

---

## ⚙️ How the ALU Works

The `alu_64bit` module is **clocked and synchronous**, with active-low reset (`rst_n`) and an `enable` signal to control operation execution.

### ▶️ Inputs:

* `clk`: System clock
* `rst_n`: Active-low asynchronous reset
* `enable`: Executes the selected operation when high
* `A`, `B`: 64-bit input operands
* `sel`: 4-bit selector signal to choose the operation

### ◀️ Outputs:

* `out`: 64-bit result of the ALU operation
* `carryout`: Carry-out from addition or shift
* `Zero`: High if result is zero
* `Sign`: MSB of output (used for signed operations)
* `Overflow`: Indicates arithmetic overflow

---

## 🧠 Operations Supported (Based on `sel`)

| `sel`  | Operation          | Description                         |
| ------ | ------------------ | ----------------------------------- |
| `0000` | `A + B`            | 64-bit unsigned addition with carry |
| `0001` | `A - B`            | 64-bit unsigned subtraction         |
| `0010` | `A & B`            | Bitwise AND                         |
| `0011` | `A \| B`           | Bitwise OR                          |
| `0100` | `A ^ B`            | Bitwise XOR                         |
| `0101` | `~(A \| B)`        | NOR                                 |
| `0110` | `~(A & B)`         | NAND                                |
| `0111` | `~(A ^ B)`         | XNOR                                |
| `1000` | `A << 1`           | Logical shift left                  |
| `1001` | `A >> 1`           | Logical shift right                 |
| `1010` | `$signed(A) >>> 1` | Arithmetic shift right (signed)     |
| `1011` | `(A > B)`          | Set to 1 if A > B, else 0           |
| `1100` | `(A == B)`         | Set to 1 if A equals B              |
| `1101` | `A * B`            | Multiplication (lower 64 bits only) |
| `1110` | `A / B`            | Division (safe check for B ≠ 0)     |

If division by zero occurs, a constant hex pattern is returned.

---

## 🧪 Flags Handling

* **`carryout`**:

  * Set during addition (`sel=0000`) and shift operations to indicate carry or lost bit.
* **`Zero`**:

  * High when the result (`out`) is exactly 0.
* **`Sign`**:

  * Indicates the sign of the result for signed operations (`out[63]`).
* **`Overflow`**:

  * Set when signed overflow occurs during addition/subtraction.

---

## 🔄 Reset & Enable

* On **reset** (`!rst_n`): all outputs reset to 0.
* On **enable** (`enable = 1`): selected operation is performed on the rising edge of the clock.

---

## 📦 Module Instantiation (for testbench/reference)

```verilog
alu_64bit alu_inst (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .A(data_a),
    .B(data_b),
    .sel(op_sel),
    .out(result),
    .carryout(carry),
    .Zero(zero_flag),
    .Sign(sign_flag),
    .Overflow(overflow_flag)
);
```

---

✅ This ALU is synthesizable, modular, and designed to be used as a core processing block in larger digital systems.
