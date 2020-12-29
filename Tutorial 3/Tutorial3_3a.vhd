----------------------------------------------------------------------------------
 library ieee;
 use ieee.std_logic_1164.all;
 use ieee.numeric_std.all;
----------------------------------------------------------------------------------
entity rom16x4 is

port(address : in std_logic_vector (3 downto 0); -- address input
    DOUT : out std_logic_vector (3 downto 0)); -- data output
    
end rom16x4;
----------------------------------------------------------------------------------
architecture behavior of rom16x4 is
type memory is array (0 to 15) of std_logic_vector (3 downto 0); -- 16 memory locations each 4 bits

    constant rommap : memory := ("0100",  -- data stored at address 0
                                  "1001", -- data stored at address 1
                                  "0010", -- data stored at address 2
                                  "0011", -- data stored at address 3
                                  "0110", -- data stored at address 4
                                  "0101", -- data stored at address 5
                                  "0110", -- data stored at address 6
                                  "0111", -- data stored at address 7
                                  "1010", -- data stored at address 8
                                  "1001", -- data stored at address 9
                                  "1010", -- data stored at address 10
                                  "1011", -- data stored at address 11
                                  "1100", -- data stored at address 12
                                  "1101", -- data stored at address 13
                                  "1110", -- data stored at address 14
                                  "1111"); -- data stored at address 15
begin
    process (address)
    begin
    
        DOUT <= rommap(to_integer(unsigned(address))); -- convert address to decimal and assign the related memory location to the output.
        
    end process;
end behavior;
----------------------------------------------------------------------------------