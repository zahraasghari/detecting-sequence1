library ieee ;
use ieee.std_logic_1164.all ;


entity detect_sequence1 is

	port(
	
		clk : in std_logic ;
		input : in std_logic ;
		reset : in std_logic ;
		
		output : out std_logic 
	
	);

end detect_sequence1 ;


architecture bhv of detect_sequence1 is

	type state is (s0,s1,s2,s3,s4 ) ;
	
	
	signal cs : state := s0 ;
	signal ns : state := s0 ;


begin

	process(clk ,reset )
	
	begin
	
		if reset = '1' then
		
			cs <= s0 ;
			
		elsif clk'event and clk = '1' then
		
			cs <= ns ;
			
		end if ;
	
	end process ;
	
	process(cs , input)
	
	begin
	
		case cs is
		
		when s0 =>
		
			output <= '0' ;
			
			if input = '0' then
				ns <= s1 ;
			else
				ns <= s0 ;
			end if ;
		when s1 =>
		
			output <= '0' ;
			
			if input = '0' then
				ns <= s1 ;
			else
				ns <= s2 ;
			end if ;	
		when s2 =>
		
			output <= '0' ;
			
			if input = '0' then
				ns <= s3 ;
			else
				ns <= s0 ;
			end if ;
		when s3 =>
		
			output <= '0' ;
			
			if input = '0' then
				ns <= s1 ;
			else
				ns <= s4 ;
			end if ;
		when s4 =>
		
			output <= '1';
		
				ns <= s0 ;
			
		
			
		end case ;
	
	end process ;






end bhv ;