--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:59:01 02/20/2019
-- Design Name:   
-- Module Name:   D:/Peter/Week2/Peter/MUX_4to1_using_2to1/ALU_ControlUnit_TestBench.vhd
-- Project Name:  MUX_4to1_using_2to1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_ControlUnit
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
 
ENTITY ALU_ControlUnit_TestBench IS
END ALU_ControlUnit_TestBench;
 
ARCHITECTURE behavior OF ALU_ControlUnit_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_ControlUnit
    PORT(
         Instruction : IN  std_logic_vector(5 downto 0);
         ALUop : IN  std_logic_vector(1 downto 0);
         ALUoperation : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Instruction : std_logic_vector(5 downto 0) := (others => '0');
   signal ALUop : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal ALUoperation : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_ControlUnit PORT MAP (
          Instruction => Instruction,
          ALUop => ALUop,
          ALUoperation => ALUoperation
        );

   -- Clock process definitions


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
   ALUop <= "00";
	Instruction <= "000000";
	wait for 100 ns;
	
	ALUop <= "01";
	wait for 100 ns;
	
	ALUop <= "10";
	Instruction <= "100000";
	wait for 100 ns;
	
	Instruction <= "100010";
	wait for 100 ns;
	
	Instruction <= "100100";
	wait for 100 ns;
	
	Instruction <= "100101";
	wait for 100 ns;
	
	Instruction <= "101010";
	wait for 100 ns;
	
	
	
      -- insert stimulus here 

      wait;
   end process;

END;
