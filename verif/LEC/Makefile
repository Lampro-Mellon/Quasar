git clone git@github.com:waleedbinehsan-lm/LEC_RTL.git
fm_run = fm_shell -f formality_work/run_me.fms

eda_check:
	@$(CHECK_EDA_PATH)

fm_run: eda_check
	git clone https://github.com/Lampro-Mellon/LEC_RTL.git
	$(fm_run) 
	@mv *.log formality_work/formality_log

fm_gui: eda_check
	git clone https://github.com/Lampro-Mellon/LEC_RTL.git
	formality &
	@mv *.log formality_work/formality_log
