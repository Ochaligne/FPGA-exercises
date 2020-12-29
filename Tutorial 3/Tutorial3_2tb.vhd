----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.02.2020 11:29:20
-- Design Name: 
-- Module Name: Tutorial3_2tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Tutorial3_2tb is
end Tutorial3_2tb;

architecture testbench of Tutorial3_2tb is
------ DUT Declaration:------
    component ALU is
        Port ( A, B: in signed (7 DOWNTO 0); -- 4 data inputs of 8 bit
           Op_Code : in STD_LOGIC_VECTOR (2 DOWNTO 0); -- 3 bit Selector
           Op_Out : out signed (7 DOWNTO 0)); -- system output
    end component;
    ------Signal Declaration:------
    signal Op_Code_tb: STD_LOGIC_VECTOR (2 DOWNTO 0):="000";
    signal A_tb: signed(7 DOWNTO 0):= "00000001";
    signal B_tb: signed(7 DOWNTO 0):= "00000010";
    signal Op_Out_tb: signed(7 DOWNTO 0);
    
begin
    ------ DUT Instantiation:------
        dut: ALU Port map (Op_Code => Op_Code_tb, A => A_tb, B => B_tb, Op_Out => Op_Out_tb);
    ------ Stimuli Generation:------
        Op_Code_tb <= "001" AFTER 1us,
                  "010" AFTER 3us,
                  "011" AFTER 5us, 
                  "100" AFTER 6us,
                  "101" AFTER 7us,
                  "110" AFTER 10us,
                  "111" AFTER 13us;
   
end testbench;

