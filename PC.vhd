----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:59:42 04/03/2019 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_arith.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
    Port ( inAddress : in  STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
           outAddress : out  STD_LOGIC_VECTOR (31 downto 0);
           Enable : in  STD_LOGIC;
			  Clk : in STD_LOGIC);
end PC;

architecture Behavioral of PC is

begin

process(Enable, Clk)
begin
if(Enable = '1' and rising_edge(Clk)) then
	outAddress <= inAddress;
end if;
end process;


end Behavioral;

