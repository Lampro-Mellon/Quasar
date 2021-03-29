# SPDX-License-Identifier: Apache-2.0
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

CONF_PARAMS = -set build_axi4

TEST_CFLAGS = -g -O3 -funroll-all-loops
ABI = -mabi=ilp32 -march=rv32imc

# Check for RV_ROOT
ifeq (,$(wildcard ${RV_ROOT}/configs/quasar.config))
$(error env var RV_ROOT does not point to a valid dir! Exiting!)
endif

# Allow snapshot override
target = default
snapshot = $(target)

# Allow tool override
QUASAR_CONFIG = ${RV_ROOT}/configs/quasar.config
VCS = vcs
VERILATOR = verilator
RIVIERA = riviera
GCC_PREFIX = /home/users/cores/chipyard/riscv-tools-install/bin/riscv64-unknown-elf
BUILD_DIR = ${RV_ROOT}/design/snapshots/${snapshot}
TBDIR = ${RV_ROOT}/testbench

# Define test name
TEST = hello_world

# Define test name
ifneq (,$(wildcard $(TBDIR)/asm/$(TEST).s))
	TEST_DIR = ${TBDIR}/asm
else
ifneq (,$(wildcard $(TBDIR)/asm/$(TEST).c))
	TEST_DIR = ${TBDIR}/asm
else
ifneq (,$(wildcard $(TBDIR)/tests/$(TEST)))
	TEST_DIR = $(TBDIR)/tests/$(TEST)
else 
	TEST_DIR = ${TBDIR}/asm
endif
endif
endif
HEX_DIR = ${TBDIR}/hex

# provide specific link file
ifeq (,$(wildcard $(TEST_DIR)/$(TEST).ld))
	LINK = $(BUILD_DIR)/link.ld
else
	LINK = $(TEST_DIR)/$(TEST).ld
endif

OFILES_PATH = ${RV_ROOT}/verif/sim
OFILES = $(TEST).o

ifdef debug
 DEBUG_PLUS = +dumpon
 VCS_DEBUG = -debug_access
 VERILATOR_DEBUG = --trace
 RIVIERA_DEBUG = +access +r
endif

VPATH = $(TEST_DIR) $(BUILD_DIR) $(TBDIR)

-include $(TEST_DIR)/$(TEST).mki

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

vcs_all: clean conf sbt_ vcs
############ Model Builds ###############################
conf:
	BUILD_PATH=${BUILD_DIR} ${RV_ROOT}/configs/quasar.config -target=$(target) $(CONF_PARAMS)

sbt_:
	cd ${RV_ROOT}/design/ && exec sbt "run" 
	python3 ${RV_ROOT}/design/reset_script.py
	rm -rf ${RV_ROOT}/design/quasar_wrapper.v
	mv ${RV_ROOT}/design/quasar_wrapper.sv ${RV_ROOT}/generated_rtl/quasar_wrapper.sv 

verilator-build: ${TBFILES} conf test_tb_top.cpp
	echo '`undef RV_ASSERT_ON' >> ${BUILD_DIR}/common_defines.vh
	$(VERILATOR)  --cc -CFLAGS ${CFLAGS} $(defines) \
	  $(includes) -I${RV_ROOT}/testbench -f ${RV_ROOT}/testbench/flist \
	  -Wno-WIDTH -Wno-UNOPTFLAT ${TBFILES} --top-module tb_top \
	  -exe test_tb_top.cpp --autoflush $(VERILATOR_DEBUG)
	cp ${RV_ROOT}/testbench/test_tb_top.cpp obj_dir/
	$(MAKE) -j -e -C obj_dir/ -f Vtb_top.mk $(VERILATOR_MAKE_FLAGS)

vcs-build: ${TBFILES} conf
	$(VCS) -full64 -LDFLAGS '-Wl,--no-as-needed' -assert svaext -sverilog +define+RV_OPENSOURCE \
	  +error+500 -debug_access +lint=TFIPC-L \
	  ${BUILD_DIR}/common_defines.vh \
	  +incdir+$(BUILD_DIR)  +libext+.v $(defines) \
	  -f ${RV_ROOT}/testbench/flist ${TBFILES} -l ${RV_ROOT}/verif/sim/vcs.log


riviera-build: ${TBFILES} ${BUILD_DIR}/defines.h
	vlib work
	vlog -work work \
		-err VCP2694 W1 \
		+incdir+${RV_ROOT}/design/lib \
		+incdir+${RV_ROOT}/design/include \
		+incdir+${BUILD_DIR} \
		-y ${RV_ROOT}/design/lib +libext+.v+.vh \
		$(defines) \
		-f ${RV_ROOT}/testbench/flist \
		${TBFILES}
	touch riviera-build

############ TEST Simulation ###############################

vcs: program.hex vcs-build
	./simv $(DEBUG_PLUS) +vcs+lic+wait  -l ${RV_ROOT}/verif/sim/vcs.log
	rm -rf program.hex data.hex
	mv csrc simv* vc_hdrs.h ucli.key console.log *.csv ${RV_ROOT}/verif/sim
	mv *.log ${RV_ROOT}/tracer_logs

lec:
	rm -rf ${RV_ROOT}/verif/LEC/LEC_RTL
	git clone https://github.com/Lampro-Mellon/LEC_RTL.git
	mv LEC_RTL ${RV_ROOT}/verif/LEC
	fm_shell -f ${RV_ROOT}/verif/LEC/formality_work/run_me.fms
	@mv *.log ${RV_ROOT}/verif/LEC/formality_work/formality_log

verilator: program.hex verilator-build
	./obj_dir/Vtb_top
	rm -rf program.hex data.hex
	mv  console.log *.csv obj_dir ${RV_ROOT}/verif/sim
	mv *.log ${RV_ROOT}/tracer_logs

############ TEST build ###############################

program.hex: $(OFILES) $(LINK)
	@echo Building $(TEST)
	$(GCC_PREFIX)-gcc -Wl,-m,elf32lriscv -Wl,--discard-none -T$(LINK) -o $(OFILES_PATH)/$(TEST).exe \
	$(addprefix $(OFILES_PATH)/,$(OFILES)) \
	-nostartfiles -nostdlib $(TEST_LIBS)
	$(GCC_PREFIX)-objcopy -O verilog  $(OFILES_PATH)/$(TEST).exe program.hex
	$(GCC_PREFIX)-objdump -S  $(OFILES_PATH)/$(TEST).exe > $(OFILES_PATH)/$(TEST).dis
	@echo Completed building $(TEST)

%.o : %.s conf
	$(GCC_PREFIX)-cpp -I${BUILD_DIR}  $<  > $(OFILES_PATH)/$*.cpp.s
	$(GCC_PREFIX)-as ${ABI} $(OFILES_PATH)/$*.cpp.s -o $(OFILES_PATH)/$(@F)

%.o : %.c conf	
	$(GCC_PREFIX)-gcc ${includes} ${TEST_CFLAGS} -DCOMPILER_FLAGS="\"${TEST_CFLAGS}\"" ${ABI} -nostdlib -c $< -o $(OFILES_PATH)/$(@F)

help:
	@echo Make sure the environment variable RV_ROOT is set.
	@echo Possible targets: vcs verilator help clean conf sbt_ vcs-build verilator-build program.hex


clean:
	rm -rf ${RV_ROOT}/design/*.v
	rm -rf ${RV_ROOT}/design/*.sv
	rm -rf ${RV_ROOT}/design/*.f
	rm -rf ${RV_ROOT}/design/*.json
	rm -rf ${RV_ROOT}/design/*.fir
	rm -rf ${RV_ROOT}/generated_rtl/*.sv
	rm -rf ${RV_ROOT}/verif/sim/*.log 
	rm -rf ${RV_ROOT}/verif/sim/*.s 
	rm -rf ${RV_ROOT}/verif/sim/*.hex 
	rm -rf ${RV_ROOT}/verif/sim/*.dis 
	rm -rf ${RV_ROOT}/verif/sim/*.tbl 
	rm -rf ${RV_ROOT}/verif/sim/vcs* 
	rm -rf ${RV_ROOT}/verif/sim/simv* 
	rm -rf ${RV_ROOT}/design/src/main/scala/lib/param.scala
	rm -rf ${RV_ROOT}/design/snapshots
	rm -rf ${RV_ROOT}/verif/sim/quasar*
	rm -rf ${RV_ROOT}/verif/sim/*.exe 
	rm -rf ${RV_ROOT}/verif/sim/obj* 
	rm -rf ${RV_ROOT}/verif/sim/*.o 
	rm -rf ${RV_ROOT}/verif/sim/ucli.key 
	rm -rf ${RV_ROOT}/verif/sim/vc_hdrs.h 
	rm -rf ${RV_ROOT}/verif/sim/csrc 
	rm -rf ${RV_ROOT}/verif/sim/*.csv 
	rm -rf ${RV_ROOT}/verif/sim/work
	rm -rf ${RV_ROOT}/verif/sim/*.dump
	rm -rf ${RV_ROOT}/verif/sim/*.fsdb
	rm -rf *.log *.s *.hex *.dis *.tbl vcs* simv* quasar* *.exe obj* *.o ucli.key vc_hdrs.h csrc *.csv work *.dump *.fsdb

