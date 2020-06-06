----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:08:29 02/06/2019 
-- Design Name: 
-- Module Name:    Mux_4to1 - Behavioral 
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

entity Mux_4to1 is
    Port ( In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           In2 : in  STD_LOGIC_VECTOR (31 downto 0);
           In3 : in  STD_LOGIC_VECTOR (31 downto 0);
           In4 : in  STD_LOGIC_VECTOR (31 downto 0);
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           O : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux_4to1;

architecture Behavioral of Mux_4to1 is

Component  Mux_2to1 is
    Port ( Input1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end Component;

signal S1, S2 : STD_LOGIC_VECTOR (31 downto 0);

begin
M1 : Mux_2to1 port map(Input1 => In1, Input2 => In2, Output => S1, Sel => S(0)); 
M2 : Mux_2to1 port map(Input1 => In3, Input2 => In4, Output => S2, Sel => S(0));
M3 : Mux_2to1 port map(Input1 => S1, Input2 => S2, Output => O, Sel => S(1));
end Behavioral;

