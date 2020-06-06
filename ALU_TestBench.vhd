--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:55:18 02/13/2019
-- Design Name:   
-- Module Name:   D:/Peter/MUX_4to1_using_2to1/ALU_TestBench.vhd
-- Project Name:  MUX_4to1_using_2to1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_Module
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
 
ENTITY ALU_TestBench IS
END ALU_TestBench;
 
ARCHITECTURE behavior OF ALU_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_Module
    PORT(
         I1 : IN  std_logic_vector(31 downto 0);
         I2 : IN  std_logic_vector(31 downto 0);
         Op : IN  std_logic_vector(3 downto 0);
         Result : OUT  std_logic_vector(31 downto 0);
         Zero : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal I1 : std_logic_vector(31 downto 0) := (others => '0');
   signal I2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Op : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Result : std_logic_vector(31 downto 0);
   signal Zero : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_Module PORT MAP (
          I1 => I1,
          I2 => I2,
          Op => Op,
          Result => Result,
          Zero => Zero
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
I1 <= "11111111111111111111111111111111";
I2 <= "11111111111111111111111111111111";	
Op <= "0000";
wait for 100 ns;
Op <= "0001";
wait for 100 ns;
Op <= "0010";
wait for 100 ns;
Op <= "0110";
wait for 100 ns;
Op <= "0111";
wait for 100 ns;
Op <= "1100";
wait for 100 ns;


      
      -- insert stimulus here 

      wait;
   end process;

END;
