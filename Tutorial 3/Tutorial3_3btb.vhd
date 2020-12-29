library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
-- VHDL testbench code for the single-port RAM
entity Tutorial3_3btb is
end Tutorial3_3btb;
------ DUT Declaration:------ 
architecture testbench OF Tutorial3_3btb is 
 
    -- Component Declaration for the single-port RAM in VHDL
 
    component single_port_RAM
    PORT(
        clk: in std_logic;
        W_Nr : in std_logic;
        addr : in std_logic_vector(15 downto 0);
        Data_in : in std_logic_vector(7 downto 0);
        Data_out : out std_logic_vector(7 downto 0)
        );
    end component;
    ------Signal Declaration:------
   signal addr_tb : std_logic_vector(15 downto 0) := (others => '0');
   signal Data_in_tb : std_logic_vector(7 downto 0) := (others => '0');
   signal W_Nr_tb : std_logic := '0';
   signal clk_tb : std_logic := '0';
   signal Data_out_tb : std_logic_vector(7 downto 0);

begin
 
     ------ DUT Instantiation:------
    dut: single_port_RAM Port map(addr =>addr_tb, Data_in => Data_in_tb, W_Nr => W_Nr_tb, clk => clk_tb, Data_out => Data_out_tb);   

     ----- Stimuli Generation:------
    clk_tb <= NOT clk_tb AFTER 5ns;
    stim_proc: process
       begin  
      W_Nr_tb <= '0'; 
      addr_tb <= "0000000000000000";
      Data_in_tb <= x"FF";
          wait for 100 ns; 
      -- Read data from RAM to check if blank.
      for i in 0 to 5 loop
      addr_tb <= addr_tb + "000000000000001";
          wait for 50 ns;
      end loop;
      addr_tb <= "0000000000000000";
      W_Nr_tb <= '1';
      -- Write Data to RAM
      wait for 100 ns; 
      for i in 0 to 5 loop
      addr_tb <= addr_tb + "000000000000001";
      Data_in_tb <= Data_in_tb-x"01";
          wait for 50 ns;
      end loop;  
      W_Nr_tb <= '0';
            addr_tb <= "0000000000000000";
      Data_in_tb <= x"FF";
          wait for 100 ns; 
      -- Read data stored in RAM.
      for i in 0 to 5 loop
      addr_tb <= addr_tb + "000000000000001";
          wait for 50 ns;
      end loop;
          wait;
       end process;
end testbench;