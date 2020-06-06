----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:42:46 02/13/2019 
-- Design Name: 
-- Module Name:    ALU_Module - Behavioral 
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
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_Module is
    Port ( I1 : in  STD_LOGIC_VECTOR (31 downto 0);
           I2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC);
end ALU_Module;

architecture Behavioral of ALU_Module is

begin

Result <= I1 and I2 when (Op = "0000") else
			 I1 or  I2 when (Op = "0001") else
			 I1  +  I2 when (Op = "0010") else
			 I1  -  I2 when (Op = "0110") else 
			 I1 nor I2 when (Op = "1100") else
			 "00000000000000000000000000000001" when (Op = "0111" and I1 < I2) else
			 "00000000000000000000000000000000" when (Op = "0111" and I1 >= I2);
Zero <= '1' when (I1 = I2) else
		  '0';


end Behavioral;

