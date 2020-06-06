----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:47:55 02/06/2019 
-- Design Name: 
-- Module Name:    Mux_2to1 - Behavioral 
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

entity Mux_2to1 is
    Port ( Input1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux_2to1;

architecture Behavioral of Mux_2to1 is

begin

process(Input1, Input2, Sel)
begin

if (Sel = '0') then
	Output (31 downto 0) <= Input1 (31 downto 0);
else
	Output (31 downto 0) <= Input2 (31 downto 0);
end if;
end process;


end Behavioral;

