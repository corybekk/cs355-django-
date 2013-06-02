USE majorLeagueBaseball;

LOCK TABLES suspended_list WRITE;
SET foreign_key_checks= 0;

INSERT INTO suspended_list VALUES

('Yasmani Grandal', 'FAILED DRUG TEST', '50 GAMES', '2013-05-20', 229),
('Bartolo Colon', 'FAILED DRUG TEST', '50 GAMES', '2013-04-01', 47),
('Melky Cabrea', 'FAILED DRUG TEST', '50 GAMES', '2013-04-01', 240),
('Yunel Escobar', 'TEAM IMPOSED SUSPENSION', '3 GAMES', '2012-07-20', 241);
SET foreign_key_checks = 1;

UNLOCK TABLES;