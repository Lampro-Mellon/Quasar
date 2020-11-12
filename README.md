# EL2 SweRV RISC-V Core Chiselified Version from LAMPRO MELLON

This repository contains the SweRV-EL2 Core design in CHISEL

## Background

Enter here

## Directory Structure

    ├── .idea                               #
    │   ├── codeStyles                      #   
    │   ├── libraries                       #       
    │   └── modules                         #
    ├── project                             # 
    │   ├── project/target/config-classes   #   
    │   └── target                          #   
    ├── src
    │   ├── main                            #
    │       ├── resource/vsrc               #
    │       └── scala                       #
    │           ├── dbg                     #
    │           ├── dec                     #   
    │           ├── dmi                     #   
    │           ├── exu                     #
    │           ├── ifu                     #   
    │           ├── include                 #   
    │           ├── lib                     #   
    │           ├── lsu                     #       
    │           ├── snapshot                #   
    │           ├── el2_dma_ctrl.scala      #   
    │           ├── el2_pic_ctl.scala       # 
    │           └── el2_swerv.scala         #       
    │   └── test/scala/lib                  #     
    ├── target                              #
        ├── scala-2.12                      #
        └── streams                         #    
    └── test_run_dir                        #


## Dependencies

- Verilator **(4.020 or later)** must be installed on the system if running with verilator
- If adding/removing instructions, espresso must be installed (used by *tools/coredecode*)
- RISCV tool chain (based on gcc version 7.3 or higher) must be
installed so that it can be used to prepare RISCV binaries to run.

## Quickstart guide

1. Clone the repository
2. Setup RV_ROOT to point to the path in your local filesystem
3. Determine your configuration {optional}
4. Run make with tools/Makefile

### Configurations

This script derives the following consistent set of include files :

### Building a model

while in a work directory:

1. Set the RV_ROOT environment variable to the root of the SweRV directory structure.
Example for bash shell:  
    `export RV_ROOT=/path/to/swerv`  
Example for csh or its derivatives:  
    `setenv RV_ROOT /path/to/swerv
    
2. Create your specific configuration    

Enter here

3. Running a simple Hello World program (verilator)

Enter here

The simulation produces output on the screen like:

Enter here

The simulation generates following files:

Enter here

You can re-execute simulation using: 

Enter here

The simulation run/build command has following generic form:

Enter here

where,

Enter here

If you want to compile a test only, you can run:

Enter here


The  `$RV_ROOT/testbench/asm` directory contains following tests ready to simulate:
```
hello_world      - default tes to run, prints Hello World message to screen and console.log
hello_world_dccm  - the same as above, but takes the string from preloaded DCCM.
hello_world_iccm  - the same as hello_world, but loads the test code to ICCM via LSU to DMA bridge and then executes
                  it from there. Runs on EL2 with AXI4 buses only. 
cmark             - coremark benchmark running with code and data in external memories
cmark_dccm        - the same as above, running data and stack from DCCM (faster)
cmark_iccm        - the same as above with preloaded code to ICCM. 
```




**Building an FPGA speed optimized model:**  

