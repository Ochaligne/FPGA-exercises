----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Olivier Chaligne
-- 
-- Create Date: 02.02.2020 09:03:49
-- Design Name: T type flipflop
-- Module Name: Tutorial2_3 - Behavioral
-- Project Name: Tutorial 2_3
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

entity T_FF is
  port(
    clk, T : in  std_logic;
    Q       : out std_logic);
end entity T_FF;

architecture behaviour of T_FF is
signal temp: STD_LOGIC :='0';
begin
    process(clk) is
    begin
        if falling_edge(clk) then
            if T = '1' then
            temp <= not (temp);
            elsif T ='0' then
            temp <= temp;
            end if;
       end if; 
     Q <= temp;
  end process;
end behaviour;

