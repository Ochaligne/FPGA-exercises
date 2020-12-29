----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.02.2020 15:33:10
-- Design Name: 
-- Module Name: Tutorial1_1tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Tutorial1_1tb is
end Tutorial1_1tb;

architecture testbench of Tutorial1_1tb is
------ DUT Decleration:------
    component Tutorial1_1 is
         Port ( A, B, C, D: in std_logic; -- Set Inputs
           F: out std_logic);-- Set Output
    end component;
    ------Signal Declaration:------
    signal A_tb: std_logic := '0';
    signal B_tb: std_logic := '0';
    signal C_tb: std_logic := '0';
    signal D_tb: std_logic := '0';
    signal F_tb : std_logic;
begin
    ------ DUT Instantiation:------
        dut: Tutorial1_1 Port map (A => A_tb, B => B_tb, C => C_tb, D => D_tb, F => F_tb);
    ------ Stimuli Generation:------
        A_tb <= NOT A_tb AFTER 40ns;
        B_tb <= NOT B_tb AFTER 60ns;
        C_tb <= NOT C_tb AFTER 20ns;
        D_tb <= NOT D_tb AFTER 80ns;

end testbench;
