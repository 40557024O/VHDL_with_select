entity HW1 is
port( A,B: in integer range 0 to 255;
	  C: in bit_vector(1 downto 0);
	  Y: out integer range 0 to 4095;
	  E: out bit);
end HW1;

architecture HW1_ARCH of HW1 is
 
    begin 
	process (A,B,C) 
		variable temp:integer;
		begin 
		if C="00" then
			temp:=A+B;
			E<='0';
		elsif C="01" then
			temp:=A*B; 
			if temp<4096 then 
				E<='0';
			else
			   temp:=4095;
			   E<='1';
			end if;
		elsif C="10" then
			temp:=A/B;
			E<='0';
		elsif C="11" then
			temp:=A mod B;
			E<='0';
		else
			temp:=0;
			E<='0';
		end if;
		Y<=temp;
	end process;
			   
		
    
end HW1_ARCH;