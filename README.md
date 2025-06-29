# RTL to GDSII Flow of a 64-bit ALU Using Cadence EDA Tools

This repository presents the complete VLSI backend flow for a 64-bit Arithmetic Logic Unit (ALU), designed using Verilog HDL and implemented through industry-standard Cadence EDA tools — from RTL simulation to GDSII generation.

The project was executed as part of my Summer Internship 2025 at the Indian Institute of Information Technology, Design and Manufacturing (IIITDM), Kancheepuram.

## 🧠 Objective

To design a fully functional 64-bit ALU and implement it through all VLSI stages:
- RTL Design  
- Functional Simulation  
- Logic Synthesis  
- Physical Design (P&R)  
- GDSII Generation

## ⚙️ ALU Features

- 64-bit Addition, Subtraction  
- Logical Operations: AND, OR, XOR, NOT  
- Shifting: Logical Left and Right  
- Set Less Than (SLT)  
- Zero, Carry, Overflow Flags  
- Modular design for synthesis  

## 🧰 Tools & Flow

| Stage                | Tool Used           | Description                                     |
|---------------------|---------------------|-------------------------------------------------|
| RTL Design          | Verilog HDL         | Functional coding of the ALU                    |
| Simulation          | Xcelium / Incisive  | Functional verification with waveform checks    |
| Synthesis           | Genus               | Logic synthesis and gate-level netlist          |
| Physical Design     | Innovus             | Floorplanning, placement, routing               |
| Layout to GDSII     | Innovus             | Final GDSII generation                          |
| Waveform Debugging  | GTKWave             | View `.vcd` simulation results                  |

## 📁 Repository Structure

/src         → Verilog RTL source code  
/tb          → Testbench files  
/sim         → Simulation outputs and .vcd waveforms  
/synth       → Genus synthesis scripts and netlists  
/pnr         → Innovus files and GDSII output  
/docs        → Report and block diagrams  
/video       → Cadence demo (schematic + simulation)  

## 🖥️ Cadence Demo Video

🎥 File: `cadence_alu_demo.mp4`  
Shows schematic entry, simulation, and waveform output using Cadence tools.  
📁 Location: `/video/cadence_alu_demo.mp4`  
*Note: Please download the video to view it in high resolution.*

## 📊 RTL to GDSII Flow Diagram

Included in: `docs/RTL_to_GDSII_Flow.png`  
This diagram illustrates the entire tool-based flow from Verilog RTL to GDSII layout.

## ✅ Verification Checklist

- [x] RTL Simulation using Xcelium / Incisive  
- [x] Waveform Verification using GTKWave  
- [x] Logic Synthesis with Genus  
- [x] Static Timing Analysis  
- [x] Floorplanning & Placement in Innovus  
- [x] Clock Tree Synthesis  
- [x] Routing and DRC/LVS Clean GDSII Export  

## 📄 Final Report

The full design documentation is available in:  
📄 `docs/IIITDM_VLSI_Report.pdf`

## 📘 Learning Outcomes

- RTL to GDSII flow using professional Cadence EDA tools  
- Hands-on understanding of synthesis and physical design  
- Debugging and validating designs at RTL and gate-level  
- Experience with hierarchical design and waveform analysis  

## 🙏 Acknowledgements

I sincerely thank:

- **Mr. Dhayal Sir** – for his continuous support, mentorship, and guidance on Cadence tools and VLSI design methodology.
- **Dr. Noor Mohamed Sir** – for his expert academic supervision, technical insights, and invaluable support throughout the internship.

Their mentorship made this project a great learning experience.

---

📌 Internship Duration: Summer 2025  
🏫 Institute: Indian Institute of Information Technology, Design and Manufacturing (IIITDM), Kancheepuram  
👨‍💻 Intern: Chandrakiran G.
