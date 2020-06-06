----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:05:41 03/20/2019 
-- Design Name: 
-- Module Name:    DataMemory - Behavioral 
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
--use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DataMemory is
    Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
           writeData : in  STD_LOGIC_VECTOR (31 downto 0);
           memRead : in  STD_LOGIC;
           memWrite : in  STD_LOGIC;
           readData : out  STD_LOGIC_VECTOR (31 downto 0));
end DataMemory;

architecture Behavioral of DataMemory is

type arr is array (0 to 10) of STD_LOGIC_VECTOR(7 downto 0);

signal dataArray : arr := ("00000000","00000001","00000010","00000011","00000100","00000101","00000110","00000111","00001000","00001001","00001100");
begin
Process(MemWrite,MemRead)
begin
if(MemRead='1'and MemWrite='0') then 
   readData (7 downto 0)   <= dataArray(to_integer(unsigned(address)));
	readData (15 downto 8)  <= dataArray(to_integer(unsigned(address))+1);
	readData (23 downto 16) <= dataArray(to_integer(unsigned(address))+2);
	readData (31 downto 24) <= dataArray(to_integer(unsigned(address))+3);

elsif( MemRead='0' and MemWrite='1')
  then 
   dataArray (to_integer(unsigned(address)))    <= writeData(7  downto 0);
	dataArray (to_integer(unsigned(address))+1)  <= writeData(15 downto 8);
	dataArray (to_integer(unsigned(address))+2)  <= writeData(23 downto 16);
	dataArray (to_integer(unsigned(address))+3)  <= writeData(31 downto 24);


end if;
end process;
--readData (7 downto 0)   <= dataArray(to_integer(unsigned(address)))  when (memRead = '1' and memWrite = '0');
--readData (15 downto 8)  <= dataArray(to_integer(unsigned(address))+1)when (memRead = '1' and memWrite = '0'); 
--readData (23 downto 16) <= dataArray(to_integer(unsigned(address))+2)when (memRead = '1' and memWrite = '0');
--readData (31 downto 24) <= dataArray(to_integer(unsigned(address))+3)when (memRead = '1' and memWrite = '0');

--dataArray (to_integer(unsigned(address)))    <= writeData(7  downto 0) when (memRead = '0' and memWrite = '1');
--dataArray (to_integer(unsigned(address))+1)  <= writeData(15 downto 8) when (memRead = '0' and memWrite = '1'); 
--dataArray (to_integer(unsigned(address))+2)  <= writeData(23 downto 16)when (memRead = '0' and memWrite = '1');
--dataArray (to_integer(unsigned(address))+3)  <= writeData(31 downto 24)when (memRead = '0' and memWrite = '1');

end Behavioral;

