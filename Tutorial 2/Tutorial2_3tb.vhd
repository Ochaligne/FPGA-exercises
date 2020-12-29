----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.02.2020 17:19:42
-- Design Name: 
-- Module Name: Tutorial2_3tb - Behavioral
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

entity Tutorial2_3tb is

end Tutorial2_3tb;

architecture testbench of Tutorial2_3tb is
------ DUT Declaration:------
    component T_FF is
         Port ( clk, T : in std_logic; -- Set Inputs
           Q : out std_logic);-- Set Output
    end component;
    ------Signal Declaration:------
    signal clk_tb: std_logic := '0';
    signal T_tb: std_logic := '0';
    signal Q_tb : std_logic;
    
begin
    ------ DUT Instantiation:------
        dut: T_FF Port map (clk => clk_tb, T => T_tb, Q => Q_tb);
    ------ Stimuli Generation:------
        clk_tb <= NOT clk_tb AFTER 0.5us;
        T_tb <= NOT T_tb AFTER 1us, NOT T_tb AFTER 1.8us, NOT T_tb AFTER 3us, NOT T_tb AFTER 5us, NOT T_tb AFTER 7us, NOT T_tb AFTER 8us;
        

end testbench;
----------------------------------------------------------------------------------------------------

