USE majorLeagueBaseball;

LOCK TABLES disabled_list WRITE;

INSERT INTO disabled_list VALUES
('Alex Rodriguez', 'HIP MUSCLE TEAR', '6 MONTHS', '2013-06-01', 225),
('Curtis Granderson', 'BROKEN FOREARM', '3 MONTHS', '2013-05-15', 226),
('Francisco Liriano', 'BROKEN ARM', '6-8 WEEKS', '2013-04-01', 227),
('Martin Perez', 'BROKEN FOREARM', '2 MONTHS', '2013-05-03', 228),
('Brandon McCarthy', 'SKULL FRACTURE', '3 MONTHS', '2013-04-01', 242),
('Mark Teixeira', 'BROKEN WRIST', '10 WEEKS', '2013-06-01', 250),
('Rafael Furcal', 'TOMMY JOHN SURGERY', '1 YEAR', '2014-04-01', 251);


SET foreign_key_checks = 1;

UNLOCK TABLES;