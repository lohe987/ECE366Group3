input_file = open("machine_code_prog1.txt","r")
output_file = open("prog1_asm.txt","w")

output_file.write("Disassembling Machine Code from Program 1...\n \n")

for line in input_file:
    if (line[1:8] == "1111000"):
        output_file.write("initR2              //initialize R2 to 5\n")

    elif (line[1:8] == "1111001"):
        output_file.write("initR3              //initialize R3 to 5\n")

    elif (line[1:8] == "1111101"):
        output_file.write("beqInc               // if R0 == R1 branch to Increment\n")

    elif (line[1:8] == "1111110"):
        output_file.write("beqN               //if R1 == R0  branch to Next\n")
    
    elif (line[1:8] == "1111111"):
        output_file.write("STOP\n")

    elif (line[1:5] == "1110"):
        register = str(int(line[5:7],2))
        immediate = str(int(line[7],2))
        output_file.write("init R" + register + ", " + immediate)
        output_file.write("         // R" + register + " = " + immediate + "\n")

    elif (line[1:4] == "101"):
        register1 = str(int(line[4:6],2))
        register2 = str(int(line[6:8],2))
        output_file.write("slt R" + register1 + ", R" + register2)
        output_file.write("         // if R" + register1 + " < R" + register2 + ", R1 = 1 \n")

    elif (line[1:4] == "010"):
        register1 = str(int(line[4:6],2))
        register2 = str(int(line[6:8],2))
        output_file.write("store R" + register1 + ", (R" + register2 + ")")
        output_file.write("         // M[R" + register2 + "] <- R" + register1 + "\n")

    elif (line[1:4] == "011"):
        register1 = str(int(line[4:6],2))
        register2 = str(int(line[6:8],2))
        output_file.write("load R" + register1 + ", (R" + register2 + ")")
        output_file.write("         // R" + register1 + " <- M[R" + register2 + "] \n")

    elif (line[1:4] == "000"):
        register1 = str(int(line[4:6],2))
        register2 = str(int(line[6:8],2))
        output_file.write("sub R" + register1 + ", R" + register2)
        output_file.write("         // R" + register1 + " = R" + register1 + " - R" + register2 + "\n")

    elif (line[1:4] == "001"):
        register1 = str(int(line[4:6], 2))
        register2 = str(int(line[6:8], 2))
        output_file.write("add R" + register1 + ", R" + register2)
        output_file.write("         // R" + register1 + " = R" + register1 + " + R" + register2 + "\n")

    elif (line[1:4] == "110"):
        imm = str(int(line[4:8], 2))
        output_file.write("jump " + imm)
        output_file.write("         // PC = PC + imm \n")

    elif (line[1:4] == "100"):
        imm = str(int(line[4:8], 2))
        output_file.write("bezR2, " + imm)
        output_file.write("         // if R2 ==0: PC = PC + imm , else: PC++ \n")