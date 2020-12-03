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
4. Run make with Makefile

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
    ├── defines.h                               # defines for C/assembly headers
    ├── eh2_param.vh                            # Design parameters
    ├── eh2_pdef.vh                             # Parameter structure
    ├── pd_defines.vh                           # `defines for physical design
    ├── perl_configs.pl                         # Perl %configs hash for scripting
    ├── pic_map_auto.h                          # PIC memory map based on configure size
    └── whisper.json                            # JSON file for swerv-iss

### Building a model

while in a work directory:

##### 1. Set the RV_ROOT environment variable to the root of the Quasar directory structure.

Example for bash shell:  
    `export RV_ROOT=/path/to/quasar`  
Example for csh or its derivatives:  
    `setenv RV_ROOT /path/to/quasar`
    
##### 2. Create your specific configuration

 *(Skip if default is sufficient)*  
*(Name your snapshot to distinguish it from the default. Without an explicit name, it will update/override the __default__ snapshot)*. For example, if `mybuild` is the name for the snapshot:

set BUILD_PATH environment variable:

`setenv BUILD_PATH snapshots/mybuild`

`$RV_ROOT/configs/swerv.config [configuration options..] -snapshot=mybuild`

Snapshots are placed in `$BUILD_PATH` directory

##### 3. Running a simple Hello World program (verilator)

`make -f $RV_ROOT/Makefile`

This command will build a verilator model of Quasar with AXI bus, and
execute a short sequence of instructions that writes out "HELLO WORLD"
to the bus.

The simulation produces output on the screen like:

`***********************************************************************`


The simulation generates following files:

 `console.log` contains what the cpu writes to the console address of 0xd0580000.  
 `exec.log` shows instruction trace with GPR updates.  
 `trace_port.csv` contains a log of the trace port.  
 When `debug=1` is provided, a vcd file `sim.vcd` is created and can be browsed by gtkwave or similar waveform viewers.

You can re-execute simulation using:  
    `make -f $RV_ROOT/Makefile verilator`

The simulation run/build command has following generic form:

    make -f $RV_ROOT/tools/Makefile [<simulator>] [debug=1] [snapshot=mybuild] [target=<target>] [TEST=<test>] [TEST_DIR=<path_to_test_dir>]

where:
``` 
<simulator> -  can be 'verilator' (by default) 'irun' - Cadence xrun, 'vcs' - Synopsys VCS, 'vlog' Mentor Questa
               'riviera'- Aldec Riviera-PRO. if not provided, 'make' cleans work directory, builds verilator executable and runs a test.
debug=1     -  allows VCD generation for verilator and VCS and SHM waves for irun option.
<target>    -  predefined CPU configurations 'default' ( by default), 'default_ahb', 'typical_pd', 'high_perf' 
TEST        -  allows to run a C (<test>.c) or assembly (<test>.s) test, hello_world is run by default 
TEST_DIR    -  alternative to test source directory testbench/asm or testbench/tests
<snapshot>  -  run and build executable model of custom CPU configuration, remember to provide 'snapshot' argument 
               for runs on custom configurations.
CONF_PARAMS -  allows to provide -set options to swerv.conf script to alter predefined EL2 targets parameters
```
Example:

    make -f $RV_ROOT/Makefile verilator TEST=cmark

will build and simulate  testbench/asm/cmark.c program with verilator 


If you want to compile a test only, you can run:

    make -f $RV_ROOT/Makefile program.hex TEST=<test> [TEST_DIR=/path/to/dir]


The `$RV_ROOT/testbench/asm` directory contains following tests ready to simulate:
```
hello_world      - default tes to run, prints Hello World message to screen and console.log
hello_world_dccm  - the same as above, but takes the string from preloaded DCCM.
hello_world_iccm  - the same as hello_world, but loads the test code to ICCM via LSU to DMA bridge and then executes
                  it from there. Runs on EL2 with AXI4 buses only. 
cmark             - coremark benchmark running with code and data in external memories
cmark_dccm        - the same as above, running data and stack from DCCM (faster)
cmark_iccm        - the same as above with preloaded code to ICCM. 
```

The `$RV_ROOT/testbench/hex` directory contains precompiled hex files of the tests, ready for simulation in case RISCV SW tools are not installed.

**Note**: The testbench has a simple synthesizable bridge that allows you to load the ICCM via load/store instructions. This is only supported for AXI4 builds.


