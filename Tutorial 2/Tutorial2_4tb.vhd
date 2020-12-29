----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.02.2020 17:40:21
-- Design Name: 
-- Module Name: Tutorial2_4tb - Behavioral
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

entity Tutorial2_4tb is
end Tutorial2_4tb;

architecture testbench of Tutorial2_4tb is
------ DUT Declaration:------
    component D_FF_4bit_reg is
    Port ( clk : in STD_LOGIC; -- clock set as input
           d : in STD_LOGIC_VECTOR (3 DOWNTO 0); -- clock set as input
           ena : in STD_LOGIC; -- ena as an input
           rst : in STD_LOGIC; -- rst as an input
           q : out STD_LOGIC_VECTOR (3 DOWNTO 0)); -- q set as output
    end component;
    ------Signal Declaration:------
    signal clk_tb: std_logic := '0';
    signal d_tb: std_logic_vector(3 DOWNTO 0);
    signal ena_tb : std_logic := '1';
    signal rst_tb : std_logic := '0';
    signal q_tb : std_logic_vector(3 DOWNTO 0);
    
begin
    ------ DUT Instantiation:------
        dut: D_FF_4bit_reg Port map (clk => clk_tb, d => d_tb, q => q_tb, ena => ena_tb, rst => rst_tb);
    ------ Stimuli Generation:------
        clk_tb <= NOT clk_tb AFTER 0.5us;
        rst_tb <= NOT rst_tb AFTER 9us;
        ena_tb <=  NOT ena_tb AFTER 5us, ena_tb AFTER 6us;
        d_tb <= "0011" AFTER 1us, "0110" AFTER 1.8us, "1000" AFTER 3us, "1010" AFTER 5us, "1100" AFTER 7us, "1001" AFTER 7.5us, "1111" AFTER 8us;

        

end testbench;
----------------------------------------------------------------------------------------------------

