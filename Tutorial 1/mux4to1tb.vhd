----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux4to1tb is
end mux4to1tb;

architecture testbench of mux4to1tb is
------ DUT Declaration:------
    component mux4to1 is
         Port ( A, B: in std_logic; -- Set Inputs
            D0, D1, D2, D3 : in std_logic_vector(3 downto 0);
           F : out std_logic_vector(3 downto 0));-- Set Output
    end component;
    ------Signal Declaration:------
    signal A_tb: std_logic := '0';
    signal B_tb: std_logic := '0';
    signal D0_tb: std_logic_vector(3 downto 0) := "0001";
    signal D1_tb : std_logic_vector(3 downto 0):= "0011";
    signal D2_tb : std_logic_vector(3 downto 0):= "0110";
    signal D3_tb : std_logic_vector(3 downto 0):= "0111";
    signal F_tb : std_logic_vector(3 downto 0);
begin
    ------ DUT Instantiation:------
        dut: mux4to1 Port map (A => A_tb, B => B_tb, D0 => D0_tb, D1 => D1_tb, D2 => D2_tb, D3 => D3_tb, F=>F_tb);
    ------ Stimuli Generation:------
        A_tb <= NOT A_tb AFTER 40ns;
        B_tb <= NOT B_tb AFTER 60ns;
        
end testbench;
----------------------------------------------------------------------------------------------------
