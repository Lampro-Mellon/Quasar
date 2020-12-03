# Quasar RISC-V Core from Lampro Mellon

This repository contains the Quasar Core design in CHISEL.

## Background

Quasar is a Chiselified version of EL2 SweRV RISC-V Core.

## Directory Structure

    ├── project                             
    │   ├── project                                
    │   └── target                            
    ├── src
    │   ├── main                            
    │       ├── resource                    
    │           └── vsrc                    #  Blackbox files
    │       └── scala                       #  Design root dir
    │           ├── dbg                     #  Debugger
    │           ├── dec                     #  Decode, Registers and Exceptions 
    │           ├── dmi                     #  DMI block
    │           ├── exu                     #  EXU (ALU/MUL/DIV)
    │           ├── ifu                     #  Fetch & Branch Prediction
    │           ├── include                 #  Bundles file
    │           ├── lib                     #  Bridges and Libraries 
    │           ├── lsu                     #  Load/Store    
    │           ├── snapshot                #  Configurations Dir
    │           ├── el2_dma_ctrl.scala      #   
    │           ├── el2_pic_ctl.scala       # 
    │           └── el2_swerv.scala         #       
    │   └── test                              
    │       └── scala                         
    │           └── lib                       
    ├── Docs                                #  Spec. document
    ├── rtl                                 #  Chisel generated verilog
    │   ├── *****                           #      
    │   └── *****                           #
    ├── target                              
    │   ├── scala-2.12                      
    │   └── streams                            
    ├── test_run_dir                        
    └── build.sbt                           #  Scala-based DSL  


## Dependencies

- Verilator **(4.030 or later)** must be installed on the system if running with verilator.
- RISCV tool chain (based on gcc version 7.3 or higher) must be
installed so that it can be used to prepare RISCV binaries to run.
- Sbt **(1.3.13 or later)** must be installed on the system.

## Quickstart guide

1. Clone the repository
2. Setup RV_ROOT to point to the path in your local filesystem
3. Determine your configuration {optional}
4. Run make with tools/Makefile

## Release Notes for this version
Please see [release notes](release-notes.md) for changes and bug fixes in this version of Quasar.

### Configurations

Quasar can be configured by running the `****************************` script:

`% ****************************` for detailed help options

For example to build with a DCCM of size 64 Kb:  

`% *******************************`  

This will update the **default** snapshot in $RV_ROOT/configs/snapshots/default/ with parameters for a 64K DCCM.  

Add `-snapshot=dccm64`, for example, if you wish to name your build snapshot *dccm64* and refer to it during the build.  

There are 4 predefined target configurations: `default`, `default_mt`, `typical_pd` and `high_perf` that can be selected via 
the `-target=name` option to swerv.config.

This script derives the following consistent set of include files :  

    $RV_ROOT/configs/snapshots/default
    ├── common_defines.vh                       # `defines for testbench or design
    ├── defines.h                               # #defines for C/assembly headers
    ├── eh2_param.vh                            # Design parameters
    ├── eh2_pdef.vh                             # Parameter structure
    ├── pd_defines.vh                           # `defines for physical design
    ├── perl_configs.pl                         # Perl %configs hash for scripting
    ├── pic_map_auto.h                          # PIC memory map based on configure size
    └── whisper.json                            # JSON file for swerv-iss

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


The  `*************************` directory contains following tests ready to simulate:
```
hello_world      - default tes to run, prints Hello World message to screen and console.log
hello_world_dccm  - the same as above, but takes the string from preloaded DCCM.
hello_world_iccm  - the same as hello_world, but loads the test code to ICCM via LSU to DMA bridge and then executes
                  it from there. Runs on EL2 with AXI4 buses only. 
cmark             - coremark benchmark running with code and data in external memories
cmark_dccm        - the same as above, running data and stack from DCCM (faster)
cmark_iccm        - the same as above with preloaded code to ICCM. 
```

