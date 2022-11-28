library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity topo is
    port(
        reqLeit_topo     : in std_logic;
        ack_entrada_topo : in std_logic;
        endereco_topo    : in INTEGER RANGE 0 TO 15;
        ack_saida_topo   : out std_logic;
        dadoPrt_topo     : out std_logic;
        resposta_topo    : out std_logic_vector(7 downto 0)
    );
end entity;
architecture behavior of topo is

component fsm is
	port(
        reqLeit     : in std_logic;
        ack_entrada : in std_logic;
        ack_saida   : out std_logic;
        dadoPrt     : out std_logic;
        ler         : out std_logic
	);
end component;

component memory is
	port(
		ler         : in std_logic;
        endereco    : in INTEGER RANGE 0 TO 15;
        resposta    : out std_logic_vector(7 downto 0)
		);
end component;

signal ler_topo: std_logic;

begin


inst_fsm: fsm
	port map(
            reqLeit     => reqLeit_topo,
            ack_entrada => ack_entrada_topo,
            ack_saida   => ack_saida_topo,
            dadoPrt     => dadoPrt_topo,
            ler         => ler_topo
        );

inst_memory: memory
   port map (
            ler         => ler_topo,
            endereco    => endereco_topo,
            resposta    => resposta_topo
            );
end behavior;
	