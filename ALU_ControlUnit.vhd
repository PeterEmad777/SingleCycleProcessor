----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:46:37 02/20/2019 
-- Design Name: 
-- Module Name:    ALU_ControlUnit - Behavioral 
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

entity ALU_ControlUnit is
    Port ( Instruction : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUop : in  STD_LOGIC_VECTOR (1 downto 0);
           ALUoperation : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU_ControlUnit;

architecture Behavioral of ALU_ControlUnit is

begin
process (Instruction, ALUop)

begin

if(ALUop = "00") then 
	ALUoperation <= "0010";
elsif (ALUop = "01")  then
	ALUoperation <= "0110";
elsif (ALUop = "10" and Instruction = "100000") then
	ALUoperation <= "0010";
elsif (ALUop = "10" and Instruction = "100010") then 
	ALUoperation <= "0110";
elsif (ALUop = "10" and Instruction = "100100") then
	ALUoperation <= "0000";
elsif (ALUop = "10" and Instruction = "100101") then 
	ALUoperation <= "0001";
elsif (ALUop = "10" and Instruction = "101010") then
	ALUoperation <= "0111";
	end if;
end process;

end Behavioral;

