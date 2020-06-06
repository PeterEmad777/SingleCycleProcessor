----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:42:17 04/09/2019 
-- Design Name: 
-- Module Name:    SingleCycle2 - Behavioral 
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

entity SingleCycle2 is
    Port ( Clk : in  STD_LOGIC;
           Enable : in  STD_LOGIC);
end SingleCycle2;

architecture Behavioral of SingleCycle2 is

Component PC is
    Port ( inAddress : in  STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
           outAddress : out  STD_LOGIC_VECTOR (31 downto 0);
           Enable : in  STD_LOGIC;
			  Clk : in STD_LOGIC);
end Component;

Component Adder is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Sum : out  STD_LOGIC_VECTOR (31 downto 0));
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
           ALUOp : out  STD_LOGIC_VECTOR (1 downto 0));
end Component;

Component Mux_2to1 is
    Port ( Input1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end Component;


signal pcin, pcout, instruction, writeregister, readdata1, readdata2, writeback : STD_LOGIC_VECTOR (31 downto 0);
signal regdst, alusrc, memtoreg, regwrite, memread, branch : STD_LOGIC;
signal aluop : STD_LOGIC_VECTOR (1 downto 0);
signal writeadress : STD_LOGIC_VECTOR (4 downto 0);
begin
ProgramCounter : PC port map
(	
	inAddress => pcin,
	outAddress => pcout,
	Enable => Enable,
	Clk > Clk
);

PcAdder : Adder port map
(
	A => pcin,
	B => "00000000000000000000000000000010",
	Sum => pcnew
);

instructionmemory : InstructionMemory port map
(
	inAddress => pcout,
	Instruction => instruction
);

controlunit : ControlUnit port map
(
	Op => instruction (31 downto 26),
	RegDst => regdst,
	ALUSrc => alusrc,
	MemtoReg => memtoreg,
	RegWrite => regwrite,
	MemRead => memread,
	MemWrite => memwrite,
	Branch => branch,
	ALUOp => aluop
);

registerfile : RegisterFile port map
(
	 Read_Addr_1 => instruction (25 downto 21), 
    Read_Addr_2 => instruction (20 downto 16),
	 Write_Addr => writeregister,
	 Write_Data => writeback,
	 Read_Data_1 => readdata1,
	 Read_Data_2 => readdata2,
	 Write_Enable => regwrite
);

writeregisterMux : Mux_2to1 port map
(
	Input1 => instruction (20 downto 16),
	Input2 => instruction (15 downto 11),
	Sel => regdst,
	Output => writeregister
);

ALUMux : Mux_2to1 port map
(
	Input1 => readdata2
	Input2 => E
	Sel => alusrc
	Output => alu2
);
end Behavioral;

