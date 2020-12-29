----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
----------------------------------------------------------------------------------
entity single_port_RAM is

  port(
    clk: in std_logic; -- clock signal
    W_Nr : in std_logic; -- write not read when high
    addr : in std_logic_vector(15 downto 0); -- ram address
    Data_in : in std_logic_vector(7 downto 0); -- data port
    Data_out : out std_logic_vector(7 downto 0) -- data port
    );
end single_port_RAM;
----------------------------------------------------------------------------------
architecture behaviour of single_port_RAM is
 type ram_type is array (15 downto 0) of std_logic_vector (7 downto 0); -- 16 addresses of 8 bit each
 signal ram_single_port : ram_type; -- ram signal
begin
  process(clk)
  begin 
    if (clk'event and clk='1') then -- when the clock is high
      if (W_Nr='1') then -- if write not read is high write data to address 'addr'
        --convert 'addr' type to integer from std_logic_vector
        ram_single_port(to_integer(unsigned(addr))) <= Data_in; -- assign the data to the current ram address.
      end if;
    end if;
 end process;
Data_out <= ram_single_port(to_integer(unsigned(addr))); -- read data out
end behaviour;
----------------------------------------------------------------------------------
