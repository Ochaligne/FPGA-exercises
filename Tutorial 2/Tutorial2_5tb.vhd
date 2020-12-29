
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

entity Tutorial2_5tb is
end Tutorial2_5tb;

architecture testbench of Tutorial2_5tb is
------ DUT Declaration:------
    component Mux8to8 is
        Port ( A, B, C, D : in STD_LOGIC_VECTOR (7 DOWNTO 0); -- 4 data inputs of 8 bit
           sel : in STD_LOGIC_VECTOR (1 DOWNTO 0); -- 2 bit 
           clk : in STD_LOGIC; -- clock input
           ena : in STD_LOGIC; -- output enable input
           Q : out STD_LOGIC_VECTOR (7 DOWNTO 0)); -- system output
    end component;
    ------Signal Declaration:------
    signal clk_tb: std_logic := '0';
    signal A_tb: std_logic_vector(7 DOWNTO 0):= "00000001";
    signal B_tb: std_logic_vector(7 DOWNTO 0):= "00001111";
    signal C_tb: std_logic_vector(7 DOWNTO 0):= "00111000";
    signal D_tb: std_logic_vector(7 DOWNTO 0):= "10000000";
    signal sel_tb: std_logic_vector(1 DOWNTO 0);
    signal ena_tb : std_logic := '1';
    signal Q_tb : std_logic_vector(7 DOWNTO 0);
    
begin
    ------ DUT Instantiation:------
        dut: Mux8to8 Port map (clk => clk_tb, A => A_tb, B => B_tb, C => C_tb, D => D_tb, ena => ena_tb, sel => sel_tb, Q => Q_tb);
    ------ Stimuli Generation:------
        clk_tb <= NOT clk_tb AFTER 0.5us;
        ena_tb <=  NOT ena_tb AFTER 5us, ena_tb AFTER 6us;
        sel_tb <= "00" AFTER 1us,
                  "01" AFTER 3us,
                  "10" AFTER 5us, 
                  "11" AFTER 6us,
                  "10" AFTER 7us,
                  "00" AFTER 10us;
   
end testbench;

