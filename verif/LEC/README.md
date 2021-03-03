# Logical Equivalence Check of Quasar RISC-V Core 1.0 from Lampro Mellon

This repository contains the EL2 SweRV Core, Quasar Core design in RTL, and the setup files. To run logical equivalency check on the two designs follow these instructions.

## Directory Structure


    ├── verif
        ├── LEC
        │    ├── LEC_RTL
        │       ├── generated_rtl                 # Quasar wrapper Black Boxes
        │       ├── Golden_RTL
        │           ├── configs
        │           ├── design
        │               ├── dbg                     # Debugger
        │               ├── dec                     # Decode, Registers and Exceptions 
        │               ├── dmi                     # DMI block
        │               ├── exu                     # EXU (ALU/MUL/DIV)
        │               ├── ifu                     # Fetch & Branch Prediction
        │               ├── include                
        │               ├── lib                     # Bridges and Library
        │               └── lsu                     # Load/Store
        │       ├── docs
        │       └── tools
        │          ├── snapshots
        │             └── defaults
        │    └── formality_work
        │       └── formality_log               # formality log/dump files
        └── sim                                 # Simulation log/dump files

## Dependencies

- Synopsys Formality tool must be installed on the system to run logical equivalence check.

## Quickstart guide

1. Clone the repository
2. Setup RV_ROOT to point to the path in your local filesystem
3. Quasar core is LEC verified on the default configuration
4. Run "make -f $RV_ROOT/tools/Makefile lec"

## Getting design files ready for the tool
Following changes have been made in the design files to get them ready for tool, if you wants to clone the golden design from chipsalliance repository do following changes in the golden design.
The directory $RV_ROOT/verif/LEC/LEC_RTL is not available initially when the Quasar RISC-V core is clonned from repository. It will be generated when the "make -f $RV_ROOT/tools/Makefile lec" is executed. Once this command is executed, it will generated the RTL of Quasar RISC-V core and place it in the  $RV_ROOT/generated_rtl.
### Golden Design
Including el2_param.vh in the golden design (El2 SweRV core) yields syntax error as formality tool does not accept parameter in this format, for further detail please refer to FMR_VLOG-481 formality error message. To fix this issue follow following steps

1. Remove all pt. from all design files
2. Remove #(.pt(pt)) in module instantiation from all design files
3. Comment out localparam DCCM_WIDTH_BITS in $RV_ROOT/verif/LEC/LEC_RTL/Golden_RTL/design/lsu/el2_lsu_dccm_ctl.sv
4. Put all paramters from el2_param.vh file to new *.sv file, parameter should be in $RV_ROOT/verif/LEC/LEC_RTL/Golden_RTL/parameter.sv format
5. Replace el2_param.vh with the parameter.sv file.

Importing el2_pkg in all design files yields FMR_VLOG-224 formality error message which explains that a reference to the given package should be analyzed before its declaration has been analyzed. In order to ensure this, the packet file which has all the packets should be included in the quasar top.

### Implementation design 
The Quasar RISC-V core is all set to be checked and loaded directly into the formality without any changes.

## Synopsys Formality Constraints/Setup

### Constraints
There are some registers which are potentionally constants when a test pattern is applied to these signals by the tool it causes design failures. To solve this problem the potionally constant registers were identified, and a constant value is applied to the register in setup mode. The constant setup file is present in $RV_ROOT/verif/LEC/setup_files/constant.fms
### User Matched Points
The tool matches the compare points on either name based or by signal analysis, but in some cases the tools fails to identify the equivalent points. All these unmatched points were matched manually through "set_user_match" command. The unmatched point can be a flop, port, latch or a black box pins, their details are present in the following directory respectively.

1. $RV_ROOT/verif/LEC/setup_files/DFF.fms
2. $RV_ROOT/verif/LEC/setup_files/PORT.fms
3. $RV_ROOT/verif/LEC/setup_files/LAT.fms
4. $RV_ROOT/verif/LEC/setup_files/BBPIN.fms

**Note**: Quasar Core has been verified on default configuration.
