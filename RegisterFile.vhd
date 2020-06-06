----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:46:59 03/06/2019 
-- Design Name: 
-- Module Name:    RegisterFile - Behavioral 
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

entity RegisterFile is
    Port ( Read_Addr_1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Read_Addr_2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Write_Addr : in  STD_LOGIC_VECTOR (4 downto 0);
           Write_Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Read_Data_1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Read_Data_2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Write_Enable : in  STD_LOGIC);
end RegisterFile;

architecture Behavioral of RegisterFile is

type reg_file_type is array (0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
signal reg_array : reg_file_type := 
	("00000000000000000000000000000000",
	 "00000000000000000000000000000001",
	 "00000000000000000000000000000010",
	 "00000000000000000000000000000011",
	 "00000000000000000000000000000100",
	 "00000000000000000000000000000101",
	 "00000000000000000000000000000110",
	 "00000000000000000000000000000111",
	 "00000000000000000000000000001000",
	 "00000000000000000000000000001001",
	 "00000000000000000000000000001010",
	 "00000000000000000000000000001011",
	 "00000000000000000000000000001100",
	 "00000000000000000000000000001101",
	 "00000000000000000000000000001110",
	 "00000000000000000000000000001111",
	 "00000000000000000000000000010000",
	 "00000000000000000000000000010001",
	 "00000000000000000000000000010010",
	 "00000000000000000000000000010011",
	 "00000000000000000000000000010100",
	 "00000000000000000000000000010101",
	 "00000000000000000000000000010110",
	 "00000000000000000000000000010111",
	 "00000000000000000000000000011000",
	 "00000000000000000000000000011001",
	 "00000000000000000000000000011010",
	 "00000000000000000000000000011011",
	 "00000000000000000000000000011100",
	 "00000000000000000000000000011101",
	 "00000000000000000000000000011110",
	 "00000000000000000000000000011111");
begin
reg_array(to_integer(unsigned(Write_Addr))) <= Write_Data when Write_Enable = '1';
		

--process(Write_Enable, Write_Addr, Write_Data)
--begin 
--if (Write_Enable = '1')
--	reg_array(to_integer(unsigned(Write_Addr))) <= Write_Data when Write_Enable = '1'; 
--else reg_array(to_integer(unsigned(Write_Addr))) <= "00000";
--end if;
--end process;


Read_Data_1 <= reg_array(to_integer(unsigned(Read_Addr_1)));
Read_Data_2 <= reg_array(to_integer(unsigned(Read_Addr_2)));




end Behavioral;

