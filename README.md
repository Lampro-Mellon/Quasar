# Quasar RISC-V Core 1.0 from Lampro Mellon

This repository contains the Quasar Core design in CHISEL.

## License

By contributing to this project, you agree that your contribution is governed by [Apache-2.0](LICENSE).  
Files under the [tools](tools/) directory may be available under a different license. Please review individual file for details.

## Background

Quasar is a Chiselified version of EL2 SweRV RISC-V Core.

## Directory Structure

    ├── configs                                 # Configurations dir
    ├── design 
    │   ├── project 
    │       ├── project 
    │       └── target
    │   ├── snapshots 
    │       └── default                         # Where generated configuration files are created
    │   ├── src 
    │       ├── main                            
    │           ├── resources                   
    │               └── vsrc                    # Blackbox files dir
    │           └── scala                       # Design root dir
    │               ├── dbg                     # Debugger
    │               ├── dec                     # Decode, Registers and Exceptions 
    │               ├── dmi                     # DMI block
    │               ├── exu                     # EXU (ALU/MUL/DIV)
    │               ├── ifu                     # Fetch & Branch Prediction
    │               ├── include                 # Bundles file
    │               ├── lib                     # Bridges and Library
    │               └── lsu                     # Load/Store    
    │       └── test 
    │   ├── target 
    │   └── test_run_dir    
    ├── doc                                     # PPA Report
    ├── generated_rtl                           # Quasar wrapper
    ├── testbench 
    │   ├── asm                                 # Example assembly files
    │   └── hex                                 # Canned demo hex files
    ├── tools                                   # Scripts/Makefiles
    ├── tracer_logs                             # generated log files
    └── verif                                     
        ├── LEC                                  
        └── sim                                 # Simulation log/dump files

## Dependencies

- Verilator **(4.030 or later)** must be installed on the system if running with verilator.
- Vcs must be installed on the system if running with vcs.
- RISCV tool chain (based on gcc version 7.3 or higher) must be
installed so that it can be used to prepare RISCV binaries to run.
- Sbt **(1.3.13 or later)** must be installed on the system.

## Quickstart guide

1. Clone the repository
2. Setup RV_ROOT to point to the path in your local filesystem
3. Determine your configuration {optional}
4. Run make with $RV_ROOT/tools/Makefile

## Release Notes for this version
Please see [release notes](release-notes.md) for changes and bug fixes in this version of Quasar.

### Configurations

Quasar can be configured by running the script:
```
    $RV_ROOT/configs/quasar.config 
```
For detailed help options.
```
    $RV_ROOT/configs/quasar.config -h 
```
For example, to build with a DCCM of size 64Kb:  
```
    $RV_ROOT/configs/quasar.config -dccm_size=64  
```
This will update the **default** snapshot in `$RV_ROOT/design/snapshots/default/` with parameters for a 64K DCCM.  

Add `-snapshot=dccm64`, for example, if you wish to name your build snapshot *dccm64* and refer to it during the build.  

There are 4 predefined target configurations: `default`, `default_ahb`, `typical_pd` and `high_perf` that can be selected via the `-target=name` option to quasar.config.

This script derives the following consistent set of include files :  
```
$RV_ROOT/design/snapshots/default
    ├── common_defines.vh                       # `defines for testbench or design
    ├── defines.h                               # defines for C/assembly headers
    ├── param.vh                            	# Design parameters
    ├── pdef.vh                             	# Parameter structure
    ├── pd_defines.vh                           # `defines for physical design
    ├── perl_configs.pl                         # Perl %configs hash for scripting
    ├── pic_map_auto.h                          # PIC memory map based on configure size
    └── whisper.json                            # JSON file for swerv-iss
```
#### 1. Generate scala parameter  
```
    make -f $RV_ROOT/tools/Makefile conf
```
This script will run `quasar.config` and derives the include file:
```
$RV_ROOT/design/src/main/scala/lib
    └── param.scala                             # Scala design parameters
```
### Running RTL Simulation

while in a work directory:

#### 1. Set the RV_ROOT environment variable to the root of the Quasar directory structure.

Example for bash shell:  
```
    export RV_ROOT=$(pwd)  
```
Example for csh or its derivatives:  
```
    setenv RV_ROOT /path/to/QUASAR
```    
#### 2. Create your specific configuration

 *(Skip if default is sufficient)*  
*(Name your snapshot to distinguish it from the default. Without an explicit name, it will update/override the __default__ snapshot)*. For example, if `mybuild` is the name for the snapshot:

set BUILD_PATH environment variable:
```
    setenv BUILD_PATH snapshots/mybuild

    $RV_ROOT/configs/quasar.config [configuration options..] -snapshot=mybuild
```

Snapshots are placed in `$BUILD_PATH` directory.

#### 3. Run sbt
```
    make -f $RV_ROOT/tools/Makefile sbt
```
This command will generate the Quasar wrapper in system verilog in the `generated_rtl` directory and runs the `reset_script.py`
*   In the reset_script we do a post verilog-generation changes, these changes are as follows:
    
    * Replace `posedge reset` with `negedge reset`
    * Replace `if (reset)` with `if (~reset)`

#### 4. Running a simple Hello World program (verilator)
```    
    make -f $RV_ROOT/tools/Makefile
```
This command will build a verilator model of Quasar with AXI bus, and execute a short sequence of instructions that writes out "HELLO WORLD"
to the bus.

The simulation produces output on the screen like:
```

VerilatorTB: Start of sim

----------------------------------
Hello World from Quasar @LM     !!
----------------------------------
TEST_PASSED

Finished : minstret = 437, mcycle = 922
See "exec.log" for execution trace with register updates..

```

The simulation generates following files in `$RV_ROOT/verif/sim`:

 `console.log` contains what the cpu writes to the console address of 0xd0580000.  
 `exec.log` shows instruction trace with GPR updates.  
 `trace_port.csv` contains a log of the trace port.
 
 Other log files are `dec.log`, `exu.log`, `ifu.log`, `lsu.log` and `pic.log`,  generates in `$RV_ROOT/tracer_logs`.
 
 When `debug=1` is provided, a vcd file `sim.vcd` is created and can be browsed by gtkwave or similar waveform viewers.

You can re-execute simulation using:  
```    
    make -f $RV_ROOT/tools/Makefile verilator
```
The simulation run/build command has following generic form:
```
    make -f $RV_ROOT/tools/Makefile [<simulator>] [debug=1] [snapshot=mybuild] [target=<target>] [TEST=<test>] [TEST_DIR=<path_to_test_dir>]
```
where:
``` 
<simulator> -  can be 'verilator' (by default) , 'vcs' - Synopsys VCS. if not provided, 'make' cleans work directory, builds verilator executable and runs a test.
debug=1     -  allows VCD generation for verilator and VCS and SHM waves for irun option.
<target>    -  predefined CPU configurations 'default' ( by default), 'default_ahb', 'typical_pd', 'high_perf'. 
TEST        -  allows to run a C (<test>.c) or assembly (<test>.s) test, hello_world is run by default. 
TEST_DIR    -  alternative to test source directory testbench/asm or testbench/tests.
<snapshot>  -  run and build executable model of custom CPU configuration, remember to provide 'snapshot' argument for runs on custom configurations.
CONF_PARAMS -  allows to provide -set options to quasar.conf script to alter predefined targets parameters.
```
#### Default for VCS/Verilotor
If you want to run default configuration on verilator use the following command
```
make -f $RV_ROOT/tools/Makefile
``` 
For VCS use
```
make -f $RV_ROOT/tools/Makefile vcs_all
```
Example:
```
    make -f $RV_ROOT/tools/Makefile verilator TEST=cmark
```
will build and simulate  `testbench/asm/cmark.c` program with verilator. 


If you want to compile a test only, you can run:
```
    make -f $RV_ROOT/tools/Makefile program.hex TEST=<test> [TEST_DIR=/path/to/dir]
```

The Makefile uses  `snapshot/<target>/link.ld` file, generated by quasar.conf script by default to build test executable. User can provide test specific linker file in form `<test_name>.ld` to build the test executable, in the same directory with the test source.

User also can create a test specific makefile in form `<test_name>.makefile`, containing building instructions how to create `program.hex` file used by simulation. The private makefile should be in the same directory as the test source. See examples in `testbench/asm` directory.

*(`program.hex` file is loaded to instruction and LSU bus memory slaves and optionally to DCCM/ICCM at the beginning of simulation)*.

User can build `program.hex` file by any other means and then run simulation with following command:

    make -f $RV_ROOT/tools/Makefile <simulator>

Note: You may need to delete `program.hex` file from work directory, when run a new test.

The `$RV_ROOT/testbench/asm` directory contains following tests ready to simulate:
```
hello_world      - default tes to run, prints Hello World message to screen and console.log
hello_world_dccm  - the same as above, but takes the string from preloaded DCCM.
hello_world_iccm  - the same as hello_world, but loads the test code to ICCM via LSU to DMA bridge and then executes
                  it from there. Runs on QUASAR with AXI4 buses only. 
cmark             - coremark benchmark running with code and data in external memories
cmark_dccm        - the same as above, running data and stack from DCCM (faster)
cmark_iccm        - the same as above with preloaded code to ICCM. 
```

The `$RV_ROOT/testbench/hex` directory contains precompiled hex files of the tests, ready for simulation in case RISCV SW tools are not installed.

**Note**: The testbench has a simple synthesizable bridge that allows you to load the ICCM via load/store instructions. This is only supported for AXI4 builds.
