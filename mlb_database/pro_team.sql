USE majorLeagueBaseball;

LOCK TABLES pro_team WRITE;

SET foreign_key_checks = 0;

INSERT INTO pro_team VALUES
('Giants', 'NL', 'San Francisco', '94-68', '24 Willie Mays Plaza San Francisco, CA'),
('Dodgers', 'NL', 'Los Angeles', '86-76', '1000 Elysian Park Ave Los Angeles, CA'),
('Diamondbacks', 'NL', 'Arizona', '81-81', '401 East Jefferson Street Phoenix, AZ'),
('Padres', 'NL', 'San Diego', '76-86', '100 Park Blvd San Diego, CA'),
('Rockies', 'NL', 'Colorado', '64-98', '2001 Blake Street Denver, CO'),
('Reds', 'NL', 'Cincinnati', '97-65', '100 Joe Nuxhall Way Cincinnati, OH'),
('Cardinals', 'NL', 'St. Louis', '88-74', '700 Clark Street St. Louis, MO'),
('Brewers', 'NL', 'Milwaukee', '83-79', '1 Brewers Way Milwaukee, WI'),
('Pirates', 'NL', 'PittsBurgh', '79-83', '115 Federal Street Pittsburgh, PA'),
('Cubs', 'NL', 'Chicago', '61-101', '1060 West Addison Ave Chicago, Il'),
('Astros', 'NL', 'Houston', '55-107', '501 Crawford Street Houston, TX'),
('Nationals', 'NL', 'Washington, D.C.', '98-64', '1500 South Capitol Street SE Washington, D.C'),
('Braves', 'NL', 'Atlanta', '94-68', '755 Hank Aaron Drive SE Atlanta, GA'),
('Phillies', 'NL', 'Philadelphia', '81-81', '1 Citizens Bank Way Philadelphia, PA'), 
('Mets', 'NL', 'New York', '74-88', '123 Roosevelt Ave New York, NY'),
('Marlins', 'NL', 'Miami', '69-93', '501 Marlins Way Miami, FL'),
('Athletics', 'AL', 'Oakland', '94-68', '7000 Coliseum Way Oakland, CA'),
('Rangers', 'AL', 'Texas', '93-69', '1000 Ballpark Way Arlington, TX'),
('Angels', 'AL', 'Los Angeles', '89-73', '2000 E Gene Autry Way Anaheim, CA'),
('Mariners', 'AL', 'Seattle', '75-87', '1250 1st Ave S Seattle, WA'),
('Tigers', 'AL', 'Detroit', '88-74', '2100 Woodward Detroit, MI'),
('White Sox', 'AL', 'Chicago', '85-77', '333 W 35th Street Chicago, IL'),
('Royals', 'AL', 'Kansas City', '72-90', '1 Royal Way Kansas City, MO'),
('Indians', 'AL', 'Cleveland', '68-94', '2401 Ontario Street Cleveland, OH'),
('Twins', 'AL', 'Minnesota', '66-96', '1 Twins Way Minneapolis, MN'),
('Yankees', 'AL', 'New York', '95-67', '1 East 161 Street Bronx, NY'),
('Orioles', 'AL', 'Baltimore', '93-69', '1 W Lee Street Baltimore, MD'),
('Rays', 'AL', 'Tampa Bay', '90-72', '1 Tropicana Drive St. Petersburg, FL'),
('Blue Jays', 'AL', 'Toronto', '73-89', '1 Blue Jays Way Toronto, ON'),
('Red Sox', 'AL', 'Boston', '69-93', '4 Yawkey Way Boston, MA');
SET foreign_key_checks = 1;

UNLOCK TABLES;

