----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:41:02 04/03/2019 
-- Design Name: 
-- Module Name:    InstructionMemory - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstructionMemory is
    Port ( inAddress : in  STD_LOGIC_VECTOR (31 downto 0);
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is

type InstMem is array (0 to 51) of STD_LOGIC_VECTOR (7 downto 0);
signal Inst_Mem : InstMem := (
										"00100000","01000001","00000000","00000101", --addi $s1 $s2 5
										"00000000","01000011","00001000","00100000", --add $S1 $S2 $S3
										"00010000","00100001","00000000","00000001", --Beq $s1 $s1 1
										"00100000","01000001","00000000","00000101", --addi $s1 $s2 5 ()()
										"00001000","00000000","00000000","00000111", --Jump 6 
										"00100000","01000001","00000000","00000111", --addi $s1 $s2 7 ()()
										"00100000","01000001","00000000","00000101", --addi $s1 $s2 5 ()()
										"10101100","10100101","00000000","00000000", --sw $5 0($5)
										"00000000","01000011","00001000","00100010",	--sub $1 $2 $3 
										"00000000","01000011","00001000","00100100",	--and $1 $2 $3 
										"00000000","01000011","00001000","00100101",	-- or $1 $2 $3 
										"00000000","01000001","00001000","00101010",	--slt $1 $2 $3
										"10001100","10100101","00000000","00000000"  --lw $5 0($5)
										);
begin
Instruction (31 downto 24) <= Inst_Mem(to_integer(unsigned(inAddress)));
Instruction (23 downto 16) <= Inst_Mem(to_integer(unsigned(inAddress)+1));
Instruction (15 downto  8) <= Inst_Mem(to_integer(unsigned(inAddress)+2));
Instruction (7 downto   0) <= Inst_Mem(to_integer(unsigned(inAddress)+3));



end Behavioral;

