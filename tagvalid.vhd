library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity tag_valid_array is
    port(clk,wren,reset_n,invalidate,validate:in STD_LOGIC;
         address:in STD_LOGIC_VECTOR(5 downto 0);
         wrdata:in STD_LOGIC_VECTOR(3 downto 0);
         output:out STD_LOGIC_VECTOR(4 downto 0)
     );
end tag_valid_array;
architecture arc of tag_valid_array is
  type tagvalidarr is array (63 downto 0) of STD_LOGIC_VECTOR(4 downto 0);
    signal tag_array : tagvalidarr ;

begin
  --reading
  output <= tag_array(to_integer(unsigned(address)));
  
  process(clk)
    variable init : boolean := true;
    begin
      if init = true then
			init := false;
		end if;

    if(clk'event and clk ='1') then
        if reset_n='1' then
          tag_array<=(others => (others => '0'));
        end if;
        
        if wren ='1' then
          tag_array(to_integer(unsigned(address)))(3 downto 0)<=wrdata;
          tag_array(to_integer(unsigned(address)))(4)<='1';
        end if;
        
        if invalidate ='1'  and wren='1' then
          tag_array(to_integer(unsigned(address)))(4) <= '0';
        end if; 
           
        if validate ='1'  and wren='1' then
          tag_array(to_integer(unsigned(address)))(4) <= '1';
        end if;  
      end if;
      
      
    end process;
  
  
end arc;




