library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-------------------------------------------------------------
entity FSM_Sequence_Detector is
port (
 clk: in std_logic; -- clock signal
 rst: in std_logic; -- reset input
 Data_in: in std_logic; -- binary sequence input
 Z1: out std_logic; -- Z1 output of the VHDL sequence detector
 Z2: out std_logic -- Z2 output of the VHDL sequence detector
);
end FSM_Sequence_Detector;
---------------------------------------------------------------
architecture behaviour of FSM_Sequence_Detector is
type Sequence_Detector is (Zero, ZeroZero, One, OneOne, OneOneOne); -- Sequence State Names
signal current_state, next_state: Sequence_Detector; -- State Flags
signal Z2trig : std_logic := '0'; -- Z2 triggered state
begin
-- Sequential control of the Sequence Detector
process(clk,rst)
    begin
     if(rst='1') then -- at reset zero the current state and Z2 Trigger state
      current_state <= Zero;
      Z2trig <= '0';
     elsif(rising_edge(clk)) then -- change state at turn of the clock
      current_state <= next_state;
     end if;
end process;
---------------------------------------------------------------
-- Next state logic of the Sequence Detector
process(current_state,Data_in)
    begin
        case(current_state) is
         when Zero => -- previous 0 bit 
          if(Data_in='1') then -- required bit for Z1
           -- "1"
           next_state <= One;
          else
           next_state <= ZeroZero; -- required bit for Z2
          end if;
         when One => -- previous bit sequence
          if(Data_in='1') then -- required bit for Z1
           -- "11"
           next_state <= OneOne;
          else
           next_state <= Zero; -- restart sequence
          end if;  
         when OneOne => -- previous bit sequence
          if(Data_in='1') and Z2trig='0' then -- required bit for Z1 and Z2 ondition
           -- "111"
           next_state <= OneOneOne;
          else
           next_state <= Zero; -- start sequence check again
          end if;  
         when ZeroZero => -- to restart sequence from 00
          if(Data_in='1') then 
           -- "001"
           next_state <= One; -- restart sequence at 1
          else
           next_state <= Zero; -- restart sequence at 0
          end if; 
         when OneOneOne => -- to restart sequence from 111
          if(Data_in='1') then 
           next_state <= One; -- restart sequence at 1
          else
           next_state <= Zero; -- restart sequence at 0
          end if;
        end case;
end process;
---------------------------------------------------------------
-- Output logic of the Sequence Detector
process(current_state)
    begin 
       case current_state is -- Z1 is low until OneOneOne Valid, Z2 and Z2 trigger low until ZeroZero
         when Zero =>
          Z1 <= '0';
          Z2 <= '0';
         when One =>
          Z1 <= '0';
          Z2 <= '0';
         when OneOne => 
          Z1 <= '0';
          Z2 <= '0'; 
         when OneOneOne =>
          Z1 <= '1';
         when ZeroZero =>
          Z2 <= '1';
          Z1 <= '0';
          Z2trig <='1';
       end case;
    end process;
end behaviour;
---------------------------------------------------------------
