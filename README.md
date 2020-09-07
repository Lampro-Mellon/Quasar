# EL2 SweRV RISC-V Core Chiselified Version from <> LAMPRO MELLON

This repository contains the SweRV EL2 Core design in CHISEL

## Back ground

The project is being made for learning purpose. Copy rights to the SweRV-EL2 belongs to Wrestern Digital

## Directory Structure

    ├── configs                 # Configurations Dir
    │   └── snapshots           # Where generated configuration files are created
    ├── design                  # Design root dir
    │   ├── dbg                 #   Debugger
    │   ├── dec                 #   Decode, Registers and Exceptions
    │   ├── dmi                 #   DMI block
    │   ├── exu                 #   EXU (ALU/MUL/DIV)
    │   ├── ifu                 #   Fetch & Branch Prediction
    │   ├── include             
    │   ├── lib
    │   └── lsu                 #   Load/Store
    ├── docs
    ├── tools                   # Scripts/Makefiles
    └── testbench               # (Very) simple testbench
        ├── asm                 #   Example assembly files
        └── hex                 #   Canned demo hex files

