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
----------------------------------------------------------------------------------
entity Tutorial3_3atb is
end Tutorial3_3atb;
----------------------------------------------------------------------------------
architecture testbench of Tutorial3_3atb is
------ DUT Declaration:------
    component rom16x4 is
        Port (address : in std_logic_vector (3 downto 0); -- address input
              DOUT : out std_logic_vector (3 downto 0)); -- data output
    end component;
    ------Signal Declaration:------
    signal address_tb : std_logic_vector (3 downto 0):= "0000";
    signal DOUT_tb : std_logic_vector (3 downto 0);
    
    
begin
    ------ DUT Instantiation:------
        dut: rom16x4 Port map (address => address_tb, DOUT => DOUT_tb);
    ------ Stimuli Generation:------
        address_tb <= "0001" AFTER 3us,
                  "0010" AFTER 6us,
                  "0011" AFTER 9us, 
                  "0100" AFTER 12us,
                  "0101" AFTER 15us,
                  "0110" AFTER 18us,
                  "0111" AFTER 21us,
                  "1000" AFTER 24us,
                  "1001" AFTER 27us,
                  "1010" AFTER 30us,
                  "1011" AFTER 33us,
                  "1100" AFTER 36us,
                  "1101" AFTER 39us,
                  "1110" AFTER 41us,
                  "1111" AFTER 43us;
   
end testbench;
----------------------------------------------------------------------------------
