----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Olivier Chaligne
-- 
-- Create Date: 01.02.2020 18:06:10
-- Design Name: Synchronous sequential control. 
-- Module Name: Tutorial2-2 - Behavioral
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

entity DFF_comb2seq is
    Port ( clk : in STD_LOGIC; -- clock set as an input.
           door : in STD_LOGIC; -- door set as an input.
           ignition : in STD_LOGIC;-- ignition set as an input.
           sbelt : in STD_LOGIC;-- sbelt set as an input.
           q : out STD_LOGIC); -- q set as output
           
end DFF_comb2seq;

architecture Behavioral of DFF_comb2seq is
signal d: STD_LOGIC;
begin
    process(clk) -- run process for every rising edge of the clock.
    begin
        if (clk' event and clk='1') Then -- change output if clk rises and clk is 1
           q <= d; -- output of D flipflop updated to output through logic.
        end if;
    end process;
  d <= (not door or not sbelt) and ignition;
end Behavioral;


