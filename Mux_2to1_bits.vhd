----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:56:35 04/07/2019 
-- Design Name: 
-- Module Name:    Mux_2to1_5bits - Behavioral 
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

entity Mux_2to1_5bits is
    Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
           B : in  STD_LOGIC_VECTOR (4 downto 0);
           output : out  STD_LOGIC_VECTOR (4 downto 0);
           Sel : in  STD_LOGIC);
end Mux_2to1_5bits;

architecture Behavioral of Mux_2to1_5bits is

begin
--process(Sel)
--begin
--if (Sel = '0') then
--	output <= A;
--elsif (Sel = '1') then
--	output <= B;
--end if;
--end process;

output <= A when (Sel = '0') else
		    B when (Sel = '1');



end Behavioral;

