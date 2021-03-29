import re
infile= open("./design/snapshots/default/param.vh",'r')
params = []
lines = infile.readlines() 
for line in lines:
	patern_1=re.match(r'(.*):(.*)' , line )
	if ((patern_1)):
		lesson_group2=patern_1.group(1)
		splittedl = lesson_group2.split()
		split_data=''
		for x in splittedl:
  			split_data=split_data+" "+x
		lesson_group3=patern_1.group(2)
		splittedl2 = lesson_group3.split()
		split_data2=''
		for x in splittedl2:
  			split_data2=split_data2+" "+x
	else:
		continue
	params.append(split_data+" = " + split_data2)

#writing to a file
filename2 = "./verif/LEC/LEC_RTL/Golden_RTL/parameter.sv"
#w+ tells python we are opening the file to write into it
outfile = open(filename2, 'w+')
outfile.write("#(parameter"+"\n")
outfile.write("\t"+" AWIDTH = 7,"+"\n")
outfile.write("\t"+" TAG = 1'h1,"+"\n")
for x in params:
	if ("DCCM_INDEX_BITS") in x:
		y="// " + "DCCM_INDEX_BITS =  4'hC ,"
		outfile.write("\t"+str(y)+"\n")
	else:
		outfile.write("\t"+str(x)+"\n")
outfile.write(")"+"\n")
outfile.close() #Close file
print("Done...!")


