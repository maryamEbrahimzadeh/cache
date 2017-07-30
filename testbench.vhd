library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end entity testbench;

architecture rtl of testbench is

  component cachemem is
  port(clk, readmem, writemem ,readio,writeio,reset: in std_logic;
	  input :in  std_logic_vector (15 downto 0);
	  output : out  std_logic_vector (15 downto 0);
		addressbus: in std_logic_vector (15 downto 0);
		databus : in std_logic_vector (15 downto 0);
		databusout : out std_logic_vector (15 downto 0);
    memdataready : out std_logic
  );
  end component;
  signal clk :std_logic := '1';
  signal  readmem, writemem,readio,writeio,reset : std_logic := '0';
  signal addressbus: std_logic_vector (15 downto 0);
  signal  databus,databusout,input,output : std_logic_vector (15 downto 0);
  signal  memdataready: std_logic;
  
  
begin
  cashe0: cachemem port map(clk, readmem, writemem,readio,writeio,reset,input,output,
    addressbus,
    databus,databusout,
    memdataready);
    
  reset <='1','0'  after 10 ns;
  writemem<='0','1' after 10 ns,'0' after 60 ns; 
  databus<="1111111111111111", "1111111111110000" after 30 ns;--,"0000111111110000" after 70 ns;
  addressbus<="0000000000000000", "0000000001000100" after 30 ns, "0000000000000000" after 70 ns;
  readmem<='0', '1' after 70 ns, '0' after 110 ns; 
  clk <= not clk after 5 ns;
  --clock preiod is 10ns
end architecture;