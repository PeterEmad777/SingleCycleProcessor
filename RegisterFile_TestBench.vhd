--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:30:11 03/06/2019
-- Design Name:   
-- Module Name:   D:/Peter/MUX_4to1_using_2to1/RegisterFile_TestBench.vhd
-- Project Name:  MUX_4to1_using_2to1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegisterFile
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY RegisterFile_TestBench IS
END RegisterFile_TestBench;
 
ARCHITECTURE behavior OF RegisterFile_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterFile
    PORT(
         Read_Addr_1 : IN  std_logic_vector(4 downto 0);
         Read_Addr_2 : IN  std_logic_vector(4 downto 0);
         Write_Addr : IN  std_logic_vector(4 downto 0);
         Write_Data : IN  std_logic_vector(31 downto 0);
         Read_Data_1 : OUT  std_logic_vector(31 downto 0);
         Read_Data_2 : OUT  std_logic_vector(31 downto 0);
         Write_Enable : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Read_Addr_1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Read_Addr_2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Write_Addr : std_logic_vector(4 downto 0) := (others => '0');
   signal Write_Data : std_logic_vector(31 downto 0) := (others => '0');
   signal Write_Enable : std_logic := '0';

 	--Outputs
   signal Read_Data_1 : std_logic_vector(31 downto 0);
   signal Read_Data_2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
	
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
          Read_Addr_1 => Read_Addr_1,
          Read_Addr_2 => Read_Addr_2,
          Write_Addr => Write_Addr,
          Write_Data => Write_Data,
          Read_Data_1 => Read_Data_1,
          Read_Data_2 => Read_Data_2,
          Write_Enable => Write_Enable
        );

   -- Clock process definitions
 
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		wait for 100 ns;
		Write_Data <= x"01234567";
		Write_Addr <= "00000";
		Write_Enable <= '1';
		wait for 100 ns;
		Write_Data <= x"89101234";
		Write_Addr <= "11111";
		
		for I in 0 to 30 Loop
		Read_Addr_1 <= STD_LOGIC_VECTOR(to_unsigned(I, 5));
		Read_Addr_2 <= STD_LOGIC_VECTOR(to_unsigned(I+1, 5));
		wait for 25 ns;
		end loop;

      -- insert stimulus here 

      wait;
   end process;

END;
