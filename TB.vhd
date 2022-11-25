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
        endereco    : in std_logic_vector(4 downto 0);
        ack_saida   : out std_logic;
        dadoPrt     : out std_logic;
        resposta    : out std_logic_vector(7 downto 0));
    end component;

    signal Requisita_Leitura    : std_logic:='0';
    signal ack_entrada          : std_logic:='0';
    signal endereco             : std_logic_vector(4 downto 0):="00000";
    signal ack_saida_TB         : std_logic;
    signal dadoPrt_TB           : std_logic;
    signal resposta_TB          : std_logic_vector(7 downto 0);

begin
    topo: topo 
    port map(
		reqLeit     => Requisita_Leitura,
        ack_entrada => ack_entrada,
        endereco    => endereco,
        ack_saida   => ack_saida_TB,
        dadoPrt     => dadoPrt_TB,
        resposta    => resposta_TB);
    process
        begin
            wait for 10 ns;
                endereco            <="00001";
                Requisita_Leitura   <= '1';
                ack_entrada         <='0';
            wait for 10 ns;
                if(ack_saida='1'){
                    endereco            <="00000";
                    Requisita_Leitura   <= '0';
                }
            wait for 10 ns;
                if(dadoPrt='1'){
                    ack_entrada<='1';
                }
            wait for 10 ns;
                if(dadoPrt='0'){
                    ack_entrada<='0';
                }
            wait;   
        end process;
end behavior;
