----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:32:40 04/11/2019 
-- Design Name: 
-- Module Name:    Concatenate - Behavioral 
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

entity Concatenate is
    Port ( PCNew : in  STD_LOGIC_VECTOR (31 downto 0);
           InstructionShifted : in  STD_LOGIC_VECTOR (27 downto 0);
           JumpAddress : out  STD_LOGIC_VECTOR (31 downto 0));
end Concatenate;

architecture Behavioral of Concatenate is

begin
	JumpAddress (31 downto 28) <= PCNew(31 downto 28);
	JumpAddress (27 downto  0) <= InstructionShifted(27 downto 0);


end Behavioral;

