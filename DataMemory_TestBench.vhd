--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:56:24 03/20/2019
-- Design Name:   
-- Module Name:   D:/Peter/Week8/Peter/Week2/Peter/MUX_4to1_using_2to1/DataMemory_TestBench.vhd
-- Project Name:  MUX_4to1_using_2to1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DataMemory
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
--USE ieee.numeric_std.ALL;
 
ENTITY DataMemory_TestBench IS
END DataMemory_TestBench;
 
ARCHITECTURE behavior OF DataMemory_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataMemory
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         writeData : IN  std_logic_vector(31 downto 0);
         memRead : IN  std_logic;
         memWrite : IN  std_logic;
         readData : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal writeData : std_logic_vector(31 downto 0) := (others => '0');
   signal memRead : std_logic := '0';
   signal memWrite : std_logic := '0';

 	--Outputs
   signal readData : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataMemory PORT MAP (
          address => address,
          writeData => writeData,
          memRead => memRead,
          memWrite => memWrite,
          readData => readData
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		address <= x"00000000";
      memRead  <= '1';
		memWrite <= '0';
		
		wait for 100 ns;
		
		memWrite <= '1';
		memRead  <= '0';
		address   <= x"00000000";
		writeData <= x"00000001";
		
		wait for 100 ns;
		
		memRead  <= '1';
		memWrite <= '0';
		address   <= x"00000000";
      -- insert stimulus here 

      wait;
   end process;

END;
