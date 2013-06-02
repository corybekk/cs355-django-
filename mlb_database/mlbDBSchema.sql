use majorLeagueBaseball;
BEGIN;
set @@foreign_key_checks = 0;



DROP TABLE IF EXISTS stadium;
CREATE TABLE stadium(
address	      varchar(50)	 NOT NULL PRIMARY KEY,
sname	      varchar(30) 	 NOT NULL,
capacity      integer		 NOT NULL,
roof	      boolean 		 NOT NULL
);



DROP TABLE IF EXISTS pro_team;
CREATE TABLE pro_team(
tname  varchar(20)	NOT NULL PRIMARY KEY,
league varchar(2)	NOT NULL,
city   varchar(20)	NOT NULL,
record varchar(10)	NOT NULL,
sAddress varchar(50)	NOT NULL UNIQUE
);
ALTER TABLE pro_team ADD CONSTRAINT pro_team_sAddress_refs_stadium_address FOREIGN KEY(sAddress) REFERENCES stadium(address); 



DROP TABLE IF EXISTS prospect;
CREATE TABLE prospect(
fID    	     integer		NOT NULL PRIMARY KEY,
pname  	     varchar(20)	NOT NULL,
ranking	     integer,		
height	     varchar(10)	NOT NULL,
weight	     integer		NOT NULL,
birthDay     datetime		NOT NULL,
pposition     varchar(10)	NOT NULL,
team	      varchar(20)
);
ALTER TABLE prospect ADD CONSTRAINT prospect_team_refs_farm_team_ftname FOREIGN KEY(team) REFERENCES farm_team(ftname);


DROP TABLE IF EXISTS d_stats;
CREATE TABLE d_stats(
fld_pct	     decimal(3,3),
errors	     integer,
playerID     integer	NOT NULL
);
ALTER TABLE d_stats ADD CONSTRAINT d_stats_playerID_refs_pro_player_pID FOREIGN KEY(playerID) REFERENCES pro_player(pID);



DROP TABLE IF EXISTS p_stats;
CREATE TABLE p_stats(
W        integer,
L        integer,
ERA      decimal(3,2),
WHIP  	 decimal(3,2),
K     	 integer,
BB 	 integer,      
SV     	 integer,
playerID integer        NOT NULL

);
ALTER TABLE p_stats ADD CONSTRAINT p_stats_playerID_refs_pro_player_pID FOREIGN KEY(playerID) REFERENCES pro_player(pID);



DROP TABLE IF EXISTS pro_player;
CREATE TABLE pro_player(
pID		integer		NOT NULL PRIMARY KEY,
pname  		varchar(20)	NOT NULL,
height		varchar(20)	NOT NULL,
weight 		integer		NOT NULL,
birthDay 	datetime	NOT NULL,
debutDate 	datetime	NOT NULL,
pposition  	varchar(10)	NOT NULL,
team		varchar(20)
);
ALTER TABLE pro_player ADD CONSTRAINT pro_player_team_refs_pro_team_tname FOREIGN KEY(team) REFERENCES pro_team(tname);


DROP TABLE IF EXISTS free_agent;
CREATE TABLE free_agent(

playerName	varchar(40)	NOT NULL,
formerTeam	varchar(15)	NOT NULL,
pposition	varchar(10)	NOT NULL,
playerID	integer		NOT NULL
);
ALTER TABLE free_agent ADD CONSTRAINT free_agent_playerID_refs_pro_player_pID FOREIGN KEY(playerID) REFERENCES pro_player(pID);

ALTER TABLE free_agent ADD CONSTRAINT free_agent_formerTeam_refs_pro_team_tname FOREIGN KEY(formerTeam) REFERENCES pro_team(tname);

DROP TABLE IF EXISTS farm_team;
CREATE TABLE farm_team(
ftname 	 varchar(20)	NOT NULL,
flevel   varchar(10)	NOT NULL,
city     varchar(20)	NOT NULL,
record 	 varchar(10)	NOT NULL,
sAddress varchar(50)	NOT NULL UNIQUE,
proteam	 varchar(50)	NOT NULL
);
ALTER TABLE farm_team ADD CONSTRAINT farm_team_sAddress_refs_stadium_address FOREIGN KEY(sAddress) REFERENCES stadium(address);
ALTER TABLE farm_team ADD CONSTRAINT farm_team_proteam_refs_pro_team_tname FOREIGN KEY(proteam) REFERENCES pro_team(tname);



DROP TABLE IF EXISTS o_stats;
CREATE TABLE o_stats(
average decimal(3,3),		    
slg 	decimal(3,3), 
obs 	decimal(3,3),
ops 	decimal(3,3),	     
hits 	integer,
2B   	integer,
3B   	integer,
HR   	integer, 
RBI  	integer,
SB   	integer,
BB   	integer,
K    	integer,
playerID 	integer        NOT NULL
);
ALTER TABLE o_stats ADD CONSTRAINT o_stats_playerID_refs_pro_player_pID FOREIGN KEY(playerID) REFERENCES pro_player(pID);



DROP TABLE IF EXISTS suspended_list;
CREATE TABLE suspended_list(
s_playerName		varchar(40)	NOT NULL,
s_reason		varchar(30)	NOT NULL,
s_term    		varchar(20)	NOT NULL,
s_expected_return_date 	datetime	NOT NULL,
s_playerID		integer
);
ALTER TABLE suspended_list ADD CONSTRAINT suspended_list_s_playerID_refs_pro_player_pID FOREIGN KEY(s_playerID) REFERENCES pro_player(pID);



DROP TABLE IF EXISTS disabled_list;
CREATE TABLE disabled_list(
playerName	varchar(40)	NOT NULL,	
reason		varchar(30)	NOT NULL,
term    	varchar(20)	NOT NULL,
expected_return_date datetime	NOT NULL,
playerID	integer
);
ALTER TABLE disabled_list ADD CONSTRAINT disabled_list_playerID_refs_pro_player_pID FOREIGN KEY(playerID) REFERENCES pro_player(pID);


set @@foreign_key_checks = 1;

COMMIT;
