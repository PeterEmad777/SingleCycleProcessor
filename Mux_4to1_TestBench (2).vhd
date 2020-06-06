--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:27:11 02/06/2019
-- Design Name:   
-- Module Name:   D:/Peter/Mux_4to1_using_2to1/Mux_4to1_TestBench.vhd
-- Project Name:  Mux_4to1_using_2to1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux_4to1
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
 
ENTITY Mux_4to1_TestBench IS
END Mux_4to1_TestBench;
 
ARCHITECTURE behavior OF Mux_4to1_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux_4to1
    PORT(
         In1 : IN  std_logic_vector(31 downto 0);
         In2 : IN  std_logic_vector(31 downto 0);
         In3 : IN  std_logic_vector(31 downto 0);
         In4 : IN  std_logic_vector(31 downto 0);
         S : IN  std_logic_vector(1 downto 0);
         O : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal In1 : std_logic_vector(31 downto 0) := (others => '0');
   signal In2 : std_logic_vector(31 downto 0) := (others => '0');
   signal In3 : std_logic_vector(31 downto 0) := (others => '0');
   signal In4 : std_logic_vector(31 downto 0) := (others => '0');
   signal S : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal O : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_4to1 PORT MAP (
          In1 => In1,
          In2 => In2,
          In3 => In3,
          In4 => In4,
          S => S,
          O => O
        );


stim_proc: process
   begin		


      -- insert stimulus here 
	In1 <= "11111111111111111111111111111111";
	In2 <= "00000000000000000000000000000000";
	In3 <= "11111111111111110000000000000000";
	In4 <= "00000000000000001111111111111111";
	
	S <= "00";
		wait for 100 ns;
	S <= "01";
		wait for 100 ns;
	S <= "10";
		wait for 100 ns;
	S <= "11";
		wait for 100 ns;
     
   end process;

END;
