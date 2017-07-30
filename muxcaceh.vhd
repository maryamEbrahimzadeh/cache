library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux is
    port(clk,sel:in STD_LOGIC;
         en : in std_logic;
         w0:in STD_LOGIC_VECTOR(15 downto 0);
         w1:in STD_LOGIC_VECTOR(15 downto 0);
         output: out STD_LOGIC_VECTOR(15 downto 0)
     );
end mux;

architecture behavioral of mux is
begin
    process(sel,en,clk)
      begin
    if(clk'event and clk ='1') then
        if sel='0' and en='1' then
          output<=w0;
        elsif sel='1' and en='1' then
          output<=w1;
        else
           output<="ZZZZZZZZZZZZZZZZ"; 
         end if;
    end if;
      end process;
end behavioral;





