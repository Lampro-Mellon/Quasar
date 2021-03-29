import os
key= "RV_ROOT"
root = os.getenv(key)

infile = root+"/design/quasar_wrapper.v"
outfile = root+"/design/quasar_wrapper.sv"

delete_list1 = ["if (dbg_dm_rst_l)"]
delete_list2 = ["if (_T_597)"]
delete_list3 = ["if (io_dbg_rst_l)"]
delete_list4 = ["if (reset)"]
delete_list5 = ["posedge reset"]
delete_list6 = ["posedge dbg_dm_rst_l"]
delete_list7 = ["posedge _T_597"]
delete_list8 = ["posedge io_dbg_rst_l"]
delete_list9 = ["if (rst_not)"]
delete_list10 = ["posedge rst_not"]
delete_list11 = ["rvclkhdr"]

fin = open(infile)
fout = open(outfile, "w+")
for line in fin:
	for word in delete_list1:
		line = line.replace(word, "if (~dbg_dm_rst_l)")

	for word in delete_list2:
		line = line.replace(word, "if (~_T_597)")

	for word in delete_list3:
		line = line.replace(word, "if (~io_dbg_rst_l)")

	for word in delete_list4:
		line = line.replace(word, "if (~reset)")

	for word in delete_list5:
		line = line.replace(word, "negedge reset")

	for word in delete_list6:
		line = line.replace(word, "negedge dbg_dm_rst_l")

	for word in delete_list7:
		line = line.replace(word, "negedge _T_597")

	for word in delete_list8:
		line = line.replace(word, "negedge io_dbg_rst_l")

	for word in delete_list9:
		line = line.replace(word, "if (~rst_not)")

	for word in delete_list10:
		line = line.replace(word, "negedge rst_not")
	
	for word in delete_list11:
		line = line.replace(word, "rvclkhdr_ch")

		fout.write(line)
fin.close()
fout.close()

