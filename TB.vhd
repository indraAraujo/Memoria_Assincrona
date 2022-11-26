library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity TB is
end entity;

architecture behavior of TB is

    component topo is port (
        reqLeit     : in std_logic;
        ack_entrada : in std_logic;
        endereco    : in INTEGER RANGE 0 TO 15;
        ack_saida   : out std_logic;
        dadoPrt     : out std_logic;
        resposta    : out std_logic_vector(7 downto 0));
    end component;

    signal Requisita_Leitura    : std_logic:='0';
    signal ack_entrada          : std_logic:='0';
    signal endereco             : INTEGER RANGE 0 TO 15:=0;
    signal ack_saida_TB         : std_logic:='0';
    signal dadoPrt_TB           : std_logic:='0';
    signal resposta_TB          : std_logic_vector(7 downto 0);

begin
    memassc: topo port map(
		reqLeit     => Requisita_Leitura,
        ack_entrada => ack_entrada,
        endereco    => endereco,
        ack_saida   => ack_saida_TB,
        dadoPrt     => dadoPrt_TB,
        resposta    => resposta_TB);
    process
        begin
            wait for 10 ns;
                endereco            <=1;
                Requisita_Leitura   <= '1';
                ack_entrada         <='0';
            wait for 10 ns;
                if(ack_saida_TB = '1') then
                    endereco            <=0;
                    Requisita_Leitura   <= '0';
                end if;
            wait for 10 ns;
                if(dadoPrt_TB = '1') then
                    ack_entrada <= '1';
                end if;
            wait for 10 ns;
                if(dadoPrt_TB = '0') then
                    ack_entrada <= '0';
                end if;
            wait;   
        end process;
end behavior;
