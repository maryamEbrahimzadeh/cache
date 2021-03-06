library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dataarry Is 
generic (blocksize : integer := 64);
port(
  clk : in std_logic;
  address : in std_logic_vector(5 downto 0);
  wren : in std_logic;
  wrdata : in std_logic_vector(15 downto 0);
  data : out std_logic_vector(15 downto 0)
);
end dataarry;

architecture arc of dataarry is
	type mem is array (0 to blocksize - 1) of std_logic_vector (15 downto 0);
	signal darr0 : mem := (others => (others => '0'));
begin
  
			-- Readiing  without clock
          data <= darr0(to_integer(unsigned(address)));	
	        
  process(clk)
     variable init : boolean := true;
    begin
    if init = true then
			init := false;
		end if;
      if(clk'event and clk ='1') then
      		if wren = '1' then -- Writing 
				    darr0(to_integer(unsigned(address))) <= wrdata;
			  end if;
			end if;
	
    end process;
  
  
end arc;


