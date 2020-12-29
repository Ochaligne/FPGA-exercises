library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-------------------------------------------------------------
entity FSM_Sequence_Detector is
port (
 clk: in std_logic; -- clock signal
 rst: in std_logic; -- reset input
 Data_in: in std_logic; -- binary sequence input
 Detected: out std_logic -- output of the VHDL sequence detector
);
end FSM_Sequence_Detector;
---------------------------------------------------------------
architecture behaviour of FSM_Sequence_Detector is
signal s0,s1,s2,s3,s4: std_logic:= '0';

begin
-- Sequential control of the Sequence Detector
process(clk,rst)
    begin
     if(rst='1') then -- at reset zero the current state
        s0<='1';
        s1<='0';
        s2<='0';
        s3<='0';
        s4<='0';
     elsif(rising_edge(clk)) then -- change state at turn of the clock
          if s0='1' and Data_in='1' then
            s1 <= '1';
            s0 <= '0';
          else
            s0<='1';
          end if;
          if s1='1' and Data_in='1' then
            s2 <= '1';
            s1 <= '0';
          else
          s0<='1';
          end if;
          if s2='1' and Data_in='0' then
            s3 <= '1';
            s2 <= '0';
          else
            s1<='1';
          end if;
          if s3='1' and Data_in='1' then
            s4 <= '1';
            s3 <= '0';
          else
            s0<='1';
          end if;
          if s4='1' and Data_in='1' then
            s1 <='1';
            s4 <= '0';
          else
            s0 <='1';
           end if;
        end if;
    end process;
---------------------------------------------------------------
-- Output logic of the Sequence Detector
Detected <= '1' when s4='1' else
            '0' when s3='1' else
            '0' when s2='1' else
            '0' when s1='1' else
            '0' when s0='1';
end behaviour;
---------------------------------------------------------------
