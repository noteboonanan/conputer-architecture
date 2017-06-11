--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:47:56 06/11/2017
-- Design Name:   
-- Module Name:   E:/Project/COA/ALU_32/tr.vhd
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY alu_32test IS
END alu_32test;

ARCHITECTURE ALU_32 OF alu_32test IS 


    COMPONENT ALU_32
    PORT(
         InRegA : IN  signed(31 downto 0);
         InRegB : IN  signed(31 downto 0);
         InOp : IN  unsigned(2 downto 0);
         OutReg : OUT  signed(31 downto 0);
         OutZero : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal InRegA : signed(31 downto 0) := (others => '0');
   signal InRegB : signed(31 downto 0) := (others => '0');
   signal InOp : unsigned(2 downto 0) := (others => '0');

    --Outputs
   signal OutReg : signed(31 downto 0);
   signal OutZero : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

   --constant <InOp>_period : time := 10 ns;

BEGIN

   -- Instantiate the Unit Under Test (UUT)
   uut: ALU_32 PORT MAP (
          InRegA => InRegA,
          InRegB => InRegB,
          InOp => InOp,
          OutReg => OutReg,
          OutZero => OutZero
        );

   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
      wait for 100 ns;  

      -- insert stimulus here 
        --test normal operations
        InRegA  <= "00000000000000000000000000010011"; --19 in decimal
        InRegB  <= "00000000000000000000000000001100"; --12 in decimal
        InOp <= "000";  wait for 100  ns;    --Bitwise and A and B
        InOp <= "001";  wait for 100  ns;    --Bitwise or B from A.
        InOp <= "010";  wait for 100  ns;    --addition A nad B
        InOp <= "100";  wait for 100  ns;    --Bitwise NOR of A and B
        InOp <= "011";  wait for 100  ns;    --Bitwise XOR of A and B
        InOp <= "110";  wait for 100  ns;    --substract A and B
        InOp <= "101";  wait for 100  ns;    --Bitwise NOT of A
        InOp <= "111";  wait for 100  ns;    --Bitwise SLT of A and B
        -- test SLT the other way around
        InRegB  <= "00000000000000000000000000010011"; --19 in decimal
        InRegA  <= "00000000000000000000000000001100"; --12 in decimal
        InOp <= "111";  wait for 100  ns;    --Bitwise SLT of A and B
        -- test Branch equal  that substraction is 0 and zero is 1
        InRegA  <= "00000000000000000000000000001011"; --11 in decimal
        InRegB  <= "00000000000000000000000000001011"; --11 in decimal
        InOp <= "110";  wait for 100  ns;    --substract A and B

      wait;
   end process;
END;