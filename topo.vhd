library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity topo is
    port(
        reqLeit_topo     : in std_logic;
        ack_entrada_topo : in std_logic;
        endereco    : in INTEGER RANGE 0 TO 15;
        ack_saida   : out std_logic;
        dadoPrt     : out std_logic;
        resposta    : out std_logic_vector(7 downto 0)
    );
end entity;
architecture behavior of topo is

component memory_fsm is
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
    mef: fsm port map(
		reqLeit     => reqLeit_topo,
        ack_entrada => ack_entrada_topo,
        ack_saida   => ack_saida,
        dadoPrt     => dadoPrt,
        ler         => ler_topo);

    mem: memory port map(
        ler         => ler_topo,
        endereco    => endereco,
        resposta    => resposta );

inst_fsm: memory_fsm
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
	