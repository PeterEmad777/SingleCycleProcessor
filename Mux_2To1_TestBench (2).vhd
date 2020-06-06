--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:00:23 02/06/2019
-- Design Name:   
-- Module Name:   D:/Peter/Mux_4to1_using_2to1/Mux_2To1_TestBench.vhd
-- Project Name:  Mux_4to1_using_2to1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux_2to1
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
 
ENTITY Mux_2To1_TestBench IS
END Mux_2To1_TestBench;
 
ARCHITECTURE behavior OF Mux_2To1_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux_2to1
    PORT(
         Input1 : IN  std_logic_vector(31 downto 0);
         Input2 : IN  std_logic_vector(31 downto 0);
         Sel : IN  std_logic;
         Output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Input1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Input2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Sel : std_logic := '0';

 	--Outputs
   signal Output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_2to1 PORT MAP (
          Input1 => Input1,
          Input2 => Input2,
          Sel => Sel,
          Output => Output
        );

   -- Clock process definitions
  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
     Input1 <= "11111111111111111111111111111111";
	  Input2 <= "00000000000000000000000000000000";
	  Sel <= '0';
	  wait for 100 ns;
	  Sel <= '1';
	  wait for 100 ns;


      -- insert stimulus here 

      wait;
   end process;

END;
