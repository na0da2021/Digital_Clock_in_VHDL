LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

PACKAGE v_of_v IS

TYPE v_of_v IS ARRAY(1 DOWNTO 0) OF STD_LOGIC_VECTOR(3 DOWNTO 0);

END v_of_v;
------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.v_of_v.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY digital_clock IS
port(
  clk     : in  std_logic; --Assumed to be 1 HZ
  reset   : in  std_logic;
  inp_sec : in  v_of_v   := ("0000","0000");
  inp_min : in  v_of_v   := ("0000","0000");
  inp_hr  : in  v_of_v   := ("0000","0000");  
  sec     : out v_of_v   ;
  min     : out v_of_v   ;
  hr      : out v_of_v 
);
END ENTITY;

ARCHITECTURE BEH OF digital_clock IS
SIGNAL sec0_reg   : UNSIGNED(3 DOWNTO 0);
SIGNAL sec0_next  : UNSIGNED(3 DOWNTO 0);
SIGNAL sec1_reg   : UNSIGNED(3 DOWNTO 0);
SIGNAL sec1_next  : UNSIGNED(3 DOWNTO 0);
--------------------------------------------
SIGNAL min0_reg   : UNSIGNED(3 DOWNTO 0);
SIGNAL min0_next  : UNSIGNED(3 DOWNTO 0);
SIGNAL min1_reg   : UNSIGNED(3 DOWNTO 0);
SIGNAL min1_next  : UNSIGNED(3 DOWNTO 0);
--------------------------------------------
SIGNAL hr0_reg    : UNSIGNED(3 DOWNTO 0);
SIGNAL hr0_next   : UNSIGNED(3 DOWNTO 0);
SIGNAL hr1_reg    : UNSIGNED(3 DOWNTO 0);
SIGNAL hr1_next   : UNSIGNED(3 DOWNTO 0);

BEGIN

    PROCESS (clk) 
    BEGIN	      
          IF (RISING_EDGE(clk)) THEN
		    IF(reset = '0')THEN
			 sec0_reg <=  unsigned(inp_sec(0));
			 sec1_reg <=  unsigned(inp_sec(1));
			 min0_reg <=  unsigned(inp_min(0));
			 min1_reg <=  unsigned(inp_min(1));
			 hr0_reg  <=  unsigned(inp_hr(0) );
			 hr1_reg  <=  unsigned(inp_hr(1) );
          ELSE
          sec0_reg <= sec0_next;
			 sec1_reg <= sec1_next;	
	       min0_reg <= min0_next;
			 min1_reg <= min1_next;	
			 hr0_reg  <= hr0_next ;
			 hr1_reg  <= hr1_next ;
			 END IF;
			 END IF;
	 END PROCESS;
sec0_next <= (OTHERS => '0') WHEN (sec0_reg  = 9)  ELSE
             sec0_reg+1;
				 
sec1_next <= (OTHERS => '0') WHEN ((sec1_reg = 5) AND (sec0_reg  = 9)) ELSE
             sec1_reg+1      WHEN ( sec0_reg = 9 )                     ELSE
				 sec1_reg;	 
-------------------------------------------------------------------------------------				 
min0_next <= (OTHERS => '0') WHEN ((min0_reg  = 9) AND (sec1_reg = 5) AND (sec0_reg  = 9))  ELSE
             min0_reg+1      WHEN (sec1_reg = 5) AND (sec0_reg  = 9)                        ELSE
				 min0_reg; 

min1_next <= (OTHERS => '0') WHEN ((min1_reg = 5) AND (min0_reg  = 9) AND (sec1_reg = 5) AND (sec0_reg  = 9)) ELSE
             min1_reg+1      WHEN ((min0_reg = 9)  AND (sec1_reg = 5) AND (sec0_reg  = 9))                    ELSE     
				 min1_reg;	 
-------------------------------------------------------------------------------------			
hr0_next <= (OTHERS => '0') WHEN ((hr0_reg  = 9) AND (min1_reg = 5) AND (min0_reg  = 9) AND (sec1_reg = 5) AND (sec0_reg  = 9))  ELSE
            (OTHERS => '0') WHEN ((hr1_reg  = 2) AND (hr0_reg  = 3) AND (min1_reg = 5) AND (min0_reg  = 9) AND (sec1_reg = 5) AND (sec0_reg  = 9))  ELSE
             hr0_reg+1      WHEN ((min1_reg = 5) AND (min0_reg  = 9) AND (sec1_reg = 5) AND (sec0_reg  = 9))                     ELSE      
				 hr0_reg; 
				 
hr1_next <=  (OTHERS => '0') WHEN ((hr1_reg  = 2) AND (hr0_reg  = 3) AND (min1_reg = 5) AND (min0_reg  = 9) AND (sec1_reg = 5) AND (sec0_reg  = 9))  ELSE
             (hr1_reg+1)     WHEN ((hr0_reg  = 9) AND (min1_reg = 5) AND (min0_reg  = 9) AND (sec1_reg = 5) AND (sec0_reg  = 9))   ELSE
				  hr1_reg;

-------------------------------------------------------------------------------------	 
sec(0) <= STD_LOGIC_VECTOR(sec0_reg);
sec(1) <= STD_LOGIC_VECTOR(sec1_reg);
min(0) <= STD_LOGIC_VECTOR(min0_reg);
min(1) <= STD_LOGIC_VECTOR(min1_reg);
 hr(0) <= STD_LOGIC_VECTOR(hr0_reg) ;
 hr(1) <= STD_LOGIC_VECTOR(hr1_reg) ;
END BEH;