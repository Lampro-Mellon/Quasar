# SPDX-License-Identifier: Apache-2.0
# Copyright 2020 Western Digital Corporation or its affiliates.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
TEST_CFLAGS = -g -O3 -funroll-all-loops
ABI = -mabi=ilp32 -march=rv32imc

# Allow snapshot override
target = default
snapshot = $(target)

# Allow tool override
SWERV_CONFIG = ${RV_ROOT}/configs/swerv.config
VCS = vcs
VERILATOR = verilator
GCC_PREFIX = riscv64-unknown-elf
GCC_PREFIX_cpp = /home/waleedbinehsan/chipyard/riscv-tools-install/bin/riscv64-unknown-elf#riscv toolchain path
BUILD_DIR = ${RV_ROOT}/design/snapshots/${snapshot}
TBDIR = ${RV_ROOT}/testbench

# Define test name
TEST = hello_world

# Define test name
TEST_DIR = ${TBDIR}/asm
HEX_DIR = ${TBDIR}/hex

# provide specific link file
ifeq (,$(wildcard $(TEST_DIR)/$(TEST).ld))
	LINK = $(TBDIR)/link.ld
else
	LINK = $(TEST_DIR)/$(TEST).ld
endif

ifdef debug
 DEBUG_PLUS = +dumpon
 
endif

VPATH = $(TEST_DIR) $(BUILD_DIR) $(TBDIR)
TBFILES = $(TBDIR)/tb_top.sv 

defines  = $(BUILD_DIR)/common_defines.vh
defines += $(BUILD_DIR)/pdef.vh
includes = -I${BUILD_DIR}

# CFLAGS for verilator generated Makefiles. Without -std=c++11 it
# complains for `auto` variables
CFLAGS += "-std=c++11"

# Optimization for better performance; alternative is nothing for
# slower runtime (faster compiles) -O2 for faster runtime (slower
# compiles), or -O for balance.
VERILATOR_MAKE_FLAGS = OPT_FAST="-Os"
#############Targets#######################################
all:	clean conf sbt_ verilator

############ Model Builds ###############################
conf:
	BUILD_PATH=${BUILD_DIR} ${RV_ROOT}/configs/swerv.config -target=$(target) $(CONF_PARAMS)
	

sbt_:
	cd ${RV_ROOT}/design/ && exec sbt "run"
	mv ${RV_ROOT}/design/quasar_wrapper.v ${RV_ROOT}/design/io_file.sv 
	python3 ${RV_ROOT}/design/reset_script.py
	rm -rf ${RV_ROOT}/design/io_file.sv
	mv ${RV_ROOT}/design/no_io_file.sv ${RV_ROOT}/generated_rtl/quasar_wrapper.sv 


vcs-build: ${TBFILES} conf
	$(VCS) -full64 -LDFLAGS '-Wl,--no-as-needed' -assert svaext -sverilog +define+RV_OPENSOURCE \
	  +error+500 -debug_access \
	  ${BUILD_DIR}/common_defines.vh \
	  +incdir+$(BUILD_DIR)  +libext+.v $(defines) \
	  -f ${RV_ROOT}/testbench/flist ${TBFILES} -l ${RV_ROOT}/verif/sim/vcs.log


verilator-build: ${TBFILES} conf test_tb_top.cpp
	echo '`undef RV_ASSERT_ON' >> ${BUILD_DIR}/common_defines.vh
	$(VERILATOR)  --cc -CFLAGS ${CFLAGS} $(defines) \
	  $(includes) -I${RV_ROOT}/testbench -f ${RV_ROOT}/testbench/flist \
	  -Wno-WIDTH -Wno-UNOPTFLAT ${TBFILES} --top-module tb_top \
	  -exe test_tb_top.cpp --autoflush $(VERILATOR_DEBUG)
	cp ${RV_ROOT}/testbench/test_tb_top.cpp obj_dir/
	$(MAKE) -j -e -C obj_dir/ -f Vtb_top.mk $(VERILATOR_MAKE_FLAGS)


############ TEST Simulation ###############################

vcs: program.hex vcs-build
	./simv $(DEBUG_PLUS) +vcs+lic+wait  -l ${RV_ROOT}/verif/sim/vcs.log
	rm -rf program.hex data.hex
	mv csrc simv* vc_hdrs.h ucli.key console.log *.csv ${RV_ROOT}/verif/sim
	mv *.log ${RV_ROOT}/tracer_logs

verilator: program.hex verilator-build
	./obj_dir/Vtb_top
	rm -rf program.hex data.hex
	mv  console.log *.csv obj_dir ${RV_ROOT}/verif/sim
	mv *.log ${RV_ROOT}/tracer_logs

program.hex: $(TEST).o $(LINK)
	@echo Building $(TEST)
	$(GCC_PREFIX_cpp)-ld -m elf32lriscv --discard-none -T$(LINK) -o ${RV_ROOT}/verif/sim/$(TEST).exe ${RV_ROOT}/verif/sim/$(TEST).o
	$(GCC_PREFIX_cpp)-objcopy -O verilog --only-section ".data*" --change-section-lma .data*-0x10000 ${RV_ROOT}/verif/sim/$(TEST).exe ${RV_ROOT}/data.hex
	$(GCC_PREFIX_cpp)-objcopy -O verilog --only-section ".text*"  ${RV_ROOT}/verif/sim/$(TEST).exe ${RV_ROOT}/program.hex
	$(GCC_PREFIX_cpp)-objdump -S  ${RV_ROOT}/verif/sim/$(TEST).exe > ${RV_ROOT}/verif/sim/$(TEST).dis
	$(GCC_PREFIX_cpp)-nm -f posix -C ${RV_ROOT}/verif/sim/$(TEST).exe > ${RV_ROOT}/verif/sim/$(TEST).tbl
	@echo Completed building $(TEST)
	

%.o : %.s conf
	$(GCC_PREFIX_cpp)-cpp -I${BUILD_DIR}  $<  > ${RV_ROOT}/verif/sim/$(TEST).cpp.s
	$(GCC_PREFIX_cpp)-as -march=rv32gc ${RV_ROOT}/verif/sim/$(TEST).cpp.s -o ${RV_ROOT}/verif/sim/$(TEST).o



%.o : %.c conf
	$(GCC_PREFIX_cpp)-gcc -I${BUILD_DIR} ${TEST_CFLAGS} ${ABI} -nostdlib -c $< -o ${RV_ROOT}/verif/sim/$(TEST).o	

help:
	@echo Make sure the environment variable RV_ROOT is set.
	@echo Possible targets: vcs verilator help clean conf sbt_ vcs-build verilator-build program.hex


clean:
	rm -rvf ${RV_ROOT}/verif/sim/*.log 
	rm -rvf ${RV_ROOT}/verif/sim/*.s 
	rm -rvf ${RV_ROOT}/verif/sim/*.hex 
	rm -rvf ${RV_ROOT}/verif/sim/*.dis 
	rm -rvf ${RV_ROOT}/verif/sim/*.tbl 
	rm -rvf ${RV_ROOT}/verif/sim/vcs* 
	rm -rvf ${RV_ROOT}/verif/sim/simv* 
	rm -rvf ${RV_ROOT}/design/src/main/scala/lib/param.scala
	rm -rvf ${RV_ROOT}/design/snapshots
	rm -rvf ${RV_ROOT}/verif/sim/swerv*
	rm -rvf ${RV_ROOT}/verif/sim/*.exe 
	rm -rvf ${RV_ROOT}/verif/sim/obj* 
	rm -rvf ${RV_ROOT}/verif/sim/*.o 
	rm -rvf ${RV_ROOT}/verif/sim/ucli.key 
	rm -rvf ${RV_ROOT}/verif/sim/vc_hdrs.h 
	rm -rvf ${RV_ROOT}/verif/sim/csrc 
	rm -rvf ${RV_ROOT}/verif/sim/*.csv 
	rm -rvf ${RV_ROOT}/verif/sim/work
	rm -rvf ${RV_ROOT}/verif/sim/*.dump
	rm -rvf ${RV_ROOT}/verif/sim/*.fsdb
	rm -rvf *.log *.s *.hex *.dis *.tbl vcs* simv* swerv* *.exe obj* *.o ucli.key vc_hdrs.h csrc *.csv work *.dump *.fsdb
