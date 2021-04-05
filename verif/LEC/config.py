# Load Configurations for LEC of Golden and Revised Design

import re
infile= open("./design/snapshots/default/param.vh",'r')
params = []
lines = infile.readlines() # Read Param.vh file.
for line in lines:
	patern_1=re.match(r'(.*):(.*)' , line )
	if ((patern_1)):
		# Group string to the left side of colon
		patern_group1=patern_1.group(1)
		split_bef_col = patern_group1.split()
		bef_col=''
		print("split_bef_col = ",split_bef_col)
		for parametr in split_bef_col:
			bef_col=bef_col+" "+parametr
		# Group string to the right side of colon
		patern_group2=patern_1.group(2)		
		split_after_col = patern_group2.split()
		after_col=''
		for strng in split_after_col:
			after_col=after_col+strng
			
	else:
		continue
	# concatenate the string obtained before and after colon
	params.append(bef_col+" = " + after_col)

# Writing configurations to file
filename2 = "./verif/LEC/LEC_RTL/Golden_RTL/parameter.sv"
outfile = open(filename2, 'w+')
outfile.write("#(parameter"+"\n")
outfile.write("\t"+" AWIDTH = 7,"+"\n")
outfile.write("\t"+" TAG = 1'h1,"+"\n")
for parameters in params:
	if ("DCCM_INDEX_BITS") in parameters:
		commented=" //" + parameters
		outfile.write("\t"+str(commented)+"\n")
	else:
		outfile.write("\t"+str(parameters)+"\n")
outfile.write(")"+"\n")
outfile.close() #Close file
print("\nConfiguration file for LEC is updated successfully.\n")