----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.01.2020 11:22:03
-- Design Name: 
-- Module Name: Tutorial2_1c - Behavioral
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

entity D_FFa is -- Description of I/0
    Port ( clk : in STD_LOGIC; -- clock set as an input.
           d : in STD_LOGIC; -- d set as an input
           rst : in STD_LOGIC; -- reset as in put
           q : out STD_LOGIC);
end D_FFa;

architecture Behavioral of D_FFa is -- description of D-Flip Flop
begin
    process(clk, rst) -- run process for every rising edge of the clock or reset.
    begin
        if rst= '1' then -- if reset is enabled.
            q <= '0'; -- set output to 0.
        elsif (clk' event and clk='1') then -- change output if clk rises and clk is 1.
            q <= d; -- output q changed to d.
        end if;
    end process;
    
end Behavioral;

