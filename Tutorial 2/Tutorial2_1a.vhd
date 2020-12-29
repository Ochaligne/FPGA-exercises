----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Olivier Chaligne
-- 
-- Create Date: 27.01.2020 10:37:40
-- Design Name: D Flipflop
-- Module Name: Tutorial2_1a - Behavioral
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

entity D_FF is -- I/O Settings description
    Port ( clk : in STD_LOGIC; -- clock set as input
           d : in STD_LOGIC; -- d set as input
           q : out STD_LOGIC); -- q set as output
end D_FF;

architecture Behavioral of D_FF is -- description of D-Flip Flop
begin
    process(clk) -- run process for every rising edge of the clock.
    begin
        if (clk' event and clk='1') Then -- change output if clk rises and clk is 1
            q <= d; -- output q changed to d
        end if;
    end process;
    
end Behavioral;
