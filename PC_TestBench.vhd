--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:15:21 04/03/2019
-- Design Name:   
-- Module Name:   D:/Peter/Right/MUX_4to1_using_2to1/PC_TestBench.vhd
-- Project Name:  MUX_4to1_using_2to1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC
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
 
ENTITY PC_TestBench IS
END PC_TestBench;
 
ARCHITECTURE behavior OF PC_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         inAddress : IN  std_logic_vector(31 downto 0);
         outAddress : OUT  std_logic_vector(31 downto 0);
         Enable : IN  std_logic;
         Clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal inAddress : std_logic_vector(31 downto 0) := (others => '0');
   signal Enable : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal outAddress : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          inAddress => inAddress,
          outAddress => outAddress,
          Enable => Enable,
          Clk => Clk
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
		
		
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Enable <= '1';
		inAddress <= "10101010101010101010101010101010";
		wait for 100 ns;
		Enable <= '0';
		wait for 100 ns;
		Enable <= '1';
		inAddress <= "11111111111111110000000000000000";
		wait for 100 ns;
      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
		
		
   end process;

END;
