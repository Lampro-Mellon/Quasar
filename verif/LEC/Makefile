fm_run = fm_shell -f formality_work/run_me.fms

eda_check:
	@$(CHECK_EDA_PATH)

fm_run: eda_check
	rm -rf LEC_RTL
	git clone https://github.com/Lampro-Mellon/LEC_RTL.git
	make -f $(RV_ROOT)/tools/Makefile clean 
	make -f $(RV_ROOT)/tools/Makefile conf 
	make -f $(RV_ROOT)/tools/Makefile sbt_
	$(fm_run) 
	@mv *.log formality_work/formality_log

fm_gui: eda_check
	rm -rf LEC_RTL
	git clone https://github.com/Lampro-Mellon/LEC_RTL.git
	make -f $(RV_ROOT)/tools/Makefile clean 
	make -f $(RV_ROOT)/tools/Makefile conf 
	make -f $(RV_ROOT)/tools/Makefile sbt_
	formality &
	@mv *.log formality_work/formality_log
