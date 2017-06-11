--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:00:53 06/11/2017
-- Design Name:   
-- Module Name:   E:/Project/COA/ALU_32/alu32_tb.vhd
-- Project Name:  ALU_32
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_32
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
USE IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY alu32_tb IS
END alu32_tb;
 
ARCHITECTURE behavior OF alu32_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_32
    PORT(
			a,b : in signed(31 downto 0); --input operands
			operation : in unsigned(3 downto 0); --Operation to be performed
			result : out signed(31 downto 0);  --output of ALU
			zero : out std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : signed(31 downto 0) := (others => '0');
   signal b : signed(31 downto 0) := (others => '0');
   signal operation : unsigned(3 downto 0) := (others => '0');

 	--Outputs
   signal result : signed(31 downto 0);
   signal zero : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_32 PORT MAP (
          a => a,
          b => b,
          operation => operation,
          result => result,
          zero => zero
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		a  <= "00000000000000000000000000010011"; --19 in decimal
		b  <= "00000000000000000000000000001100"; --12 in decimal
		operation <= "0000";  wait for 100  ns;   -- and
		operation <= "0001";  wait for 100  ns;   -- or
		operation <= "0010";  wait for 100  ns;   -- add
		operation <= "0110";  wait for 100  ns;   -- subtract
		operation <= "0111";  wait for 100  ns;   -- slt
		operation <= "1100";  wait for 100  ns;   -- nor
		-- test SLT the other way around
		b  <= "00000000000000000000000000010011"; --19 in decimal
		a  <= "00000000000000000000000000001100"; --12 in decimal
		operation <= "0000";  wait for 100  ns;   -- and
		operation <= "0001";  wait for 100  ns;   -- or
		operation <= "0010";  wait for 100  ns;   -- add
		operation <= "0110";  wait for 100  ns;   -- subtract
		operation <= "0111";  wait for 100  ns;   -- slt
		operation <= "1100";  wait for 100  ns;   -- nor
		-- test Branch equal  that substraction is 0 and zero is 1
		a  <= "00000000000000000000000000001011"; --11 in decimal
		b  <= "00000000000000000000000000001011"; --11 in decimal
		operation <= "0000";  wait for 100  ns;   -- and
		operation <= "0001";  wait for 100  ns;   -- or
		operation <= "0010";  wait for 100  ns;   -- add
		operation <= "0110";  wait for 100  ns;   -- subtract
		operation <= "0111";  wait for 100  ns;   -- slt
		operation <= "1100";  wait for 100  ns;   -- nor
      -- insert stimulus here 

      wait;
   end process;

END;
