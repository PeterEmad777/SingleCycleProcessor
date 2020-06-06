----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:55:44 04/07/2019 
-- Design Name: 
-- Module Name:    SingleCycleProcessor - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SingleCycleProcessor is
end SingleCycleProcessor;

architecture Behavioral of SingleCycleProcessor is

Component Shift28 is
    Port ( Input : in  STD_LOGIC_VECTOR (25 downto 0);
           Output : out  STD_LOGIC_VECTOR (27 downto 0));
end Component;

Component Concatenate is
    Port ( PCNew : in  STD_LOGIC_VECTOR (31 downto 0);
           InstructionShifted : in  STD_LOGIC_VECTOR (27 downto 0);
           JumpAddress : out  STD_LOGIC_VECTOR (31 downto 0));
end Component;

Component PC is
    Port ( inAddress : in  STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
           outAddress : out  STD_LOGIC_VECTOR (31 downto 0);
           Enable : in  STD_LOGIC;
			  Clk : in STD_LOGIC);
end Component;

Component InstructionMemory is
    Port ( inAddress : in  STD_LOGIC_VECTOR (31 downto 0);
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end Component;

Component RegisterFile is
    Port ( Read_Addr_1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Read_Addr_2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Write_Addr : in  STD_LOGIC_VECTOR (4 downto 0);
           Write_Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Read_Data_1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Read_Data_2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Write_Enable : in  STD_LOGIC);
end Component;

Component ControlUnit is
    Port ( Op : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
			  Jump : out STD_LOGIC;
           ALUOp : out  STD_LOGIC_VECTOR (1 downto 0));
end Component;

Component  Mux_2to1 is
    Port ( Input1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end Component;


Component ALU_ControlUnit is
    Port ( Instruction : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUop : in  STD_LOGIC_VECTOR (1 downto 0);
           ALUoperation : out  STD_LOGIC_VECTOR (3 downto 0));
end Component;

Component ALU_Module is
    Port ( I1 : in  STD_LOGIC_VECTOR (31 downto 0);
           I2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC);
end Component;

Component DataMemory is
    Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
           writeData : in  STD_LOGIC_VECTOR (31 downto 0);
           memRead : in  STD_LOGIC;
           memWrite : in  STD_LOGIC;
           readData : out  STD_LOGIC_VECTOR (31 downto 0));
end Component;

Component ShiftLeft is
    Port ( Input : in  STD_LOGIC_VECTOR (31 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end Component;

Component SignExtend is
    Port ( Input : in  STD_LOGIC_VECTOR (15 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end Component;

Component Adder is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Sum : out  STD_LOGIC_VECTOR (31 downto 0));
end Component;


Component Mux_2to1_5bits is
    Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
           B : in  STD_LOGIC_VECTOR (4 downto 0);
           output : out  STD_LOGIC_VECTOR (4 downto 0);
           Sel : in  STD_LOGIC);
end Component;


signal Clk, Enable : STD_LOGIC;
signal pcout, inst : STD_LOGIC_VECTOR (31 downto 0);
signal RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Z : STD_LOGIC;
signal ALUOp : STD_LOGIC_VECTOR (1 downto 0);
signal ReadData1, ReadData2, WriteBack, E, ALU2, Res, MemOut, Shifted, PcNew, addout, pcin : STD_LOGIC_VECTOR (31 downto 0);
signal WriteReg : STD_LOGIC_VECTOR (4 downto 0);
signal Operation : STD_LOGIC_VECTOR (3 downto 0);
signal instructionShifted : STD_LOGIC_VECTOR (27 downto 0);
signal jumpAddress, PC4 : STD_LOGIC_VECTOR(31 downto 0);
signal test : STD_LOGIC_VECTOR (25 downto 0);
begin

ProgramCounter : PC PORT MAP
(
	inAddress => pcin,
	outAddress => pcout,
	Enable => Enable,
	Clk => Clk
);

Instruction_Memory : InstructionMemory Port Map
(
	inAddress => pcout,
	Instruction => inst
);

Control_Unit : ControlUnit Port Map
(
	Op => inst( 31 downto 26), 
	RegDst => RegDst,
	Branch => Branch,
	MemRead => MemRead,
	MemtoReg => MemtoReg,
	ALUOp => ALUOp,
	MemWrite => MemWrite,
   ALUSrc => ALUSrc,
   RegWrite => RegWrite,
	Jump => Jump
);

WriteRegisterMux : Mux_2to1_5bits Port Map
(
	A => inst(20 downto 16),
	B => inst(15 downto 11),
	Sel => RegDst,
	output => WriteReg
);

AluMux : Mux_2to1 Port Map
(
	Input1 => ReadData2,
	Input2 => E,
	Sel => ALUSrc,
	Output => ALU2
);

Register_File : RegisterFile Port Map
(
	Read_Addr_1 => inst(25 downto 21),
   Read_Addr_2 => inst(20 downto 16),
   Write_Addr => WriteReg,
   Write_Data => WriteBack,
   Read_Data_1 => ReadData1,
   Read_Data_2 => ReadData2,
   Write_Enable => RegWrite
);

ALUControl : ALU_ControlUnit Port Map
(
	Instruction => inst(5 downto 0),
	ALUop => ALUOp,
	ALUoperation => Operation
);

ALU : ALU_Module Port Map
(
	I1 => ReadData1,
	I2 => Alu2,
	Op => Operation,
	Result => Res,
	Zero => Z
);

Memory : DataMemory Port Map
(
	address => Res,
	writeData => ReadData2,
	memRead => MemRead,
	memWrite => MemWrite,
	readData => Memout
);

MemoryMux : Mux_2to1 Port Map
(
	Input1 => Res,
	Input2 => Memout,
	Sel => MemtoReg,
	Output => WriteBack
);

AddShiftLEft : ShiftLeft Port Map
(
	Input  => E,
	Output => Shifted
);

SgnExt : SignExtend Port Map
(
	Input => inst(15 downto 0),
	Output => E
);

Add : Adder Port Map
(
	A => PcNew,
	B => Shifted,
	Sum => Addout
);

PCAdd : Adder Port Map
(
	A => pcout,
	B => "00000000000000000000000000000100",
	Sum => PcNew
);

AddMux : Mux_2to1 Port Map
(
	Input1 => PcNew,
	Input2 => Addout,
	Sel => (Branch and Z),
	Output => PC4
);

JumpShift : Shift28 Port Map
(
	Input => inst(25 downto 0),
	Output=> instructionShifted
);

JumpConcatenate : Concatenate Port Map
(
    PCNew => PcNew,
	 InstructionShifted => instructionShifted,
	 JumpAddress => jumpAddress
);

JumpMux : Mux_2to1 Port Map
(
	Input1 => PC4,
	Input2 => JumpAddress,
	Sel => Jump,
	Output => pcin
);
test <= inst(25 downto 0);
end Behavioral;

