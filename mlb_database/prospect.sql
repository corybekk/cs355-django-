USE majorLeagueBaseball;

LOCK TABLES prospect WRITE;

SET foreign_key_checks = 0;

INSERT INTO prospect VALUES
('1000', 'Mitch Lively',NULL , '6-5', '240', '1985-09-07', 'RHP', 'Grizzlies'),
('1001', 'Jason Stevenson' , NULL, '6-1', '175', '1981-08-08', 'LHP', 'Grizzlies'),
('1002', 'Steve Edlesfsen', NULL, '6-2', '195', '1985-06-27', 'RHP', 'Grizzlies'),
('1003', 'Boof Bonser', NULL, '6-4', '245', '1981-10-14', 'RHP', 'Grizzlies'),
('1004', 'Scott Shuman',NULL, '6-3','205', '1988-03-28', 'RHP', 'Grizzlies'),
('1005', 'Shane Loux', NULL, '6-2','225', '1979-08-31', 'RHP', 'Grizzlies'),
('1006', 'Scott Proctor', NULL, '6-1', '195', '1977-01-02', 'RHP','Grizzlies'),
('1007', 'Chad Gaudin', NULL, '5-10','185', '1983-03-24', 'RHP', 'Grizzlies'),
('1008', 'Mason Tobin', NULL, '6-3', '210', '1987-07-08', 'RHP', 'Grizzlies'),
('1010', 'Fabio Castillo', NULL, '6-1', '235', '1989-02-19', 'RHP', 'Grizzlies'),
('1011', 'Heath Hembree', NULL, '6-4', '210', '1989-01-13', 'RHP', 'Grizzlies'),
('1012', 'Jackson Williams', NULL, '5-11', '200', '1986-05-14', 'C', 'Grizzlies'),
('1013', 'Eric Sim', NULL, '6-2', '215', '1989-01-03', 'C',  'Grizzlies'),
('1014', 'Brock Bond', NULL, '5-10', '200', '1986-05-14', '2B',  'Grizzlies'),
('1015', 'Wilson Valdez', NULL, '5-11', '170', '1978-05-20', 'SS',  'Grizzlies'),
('1016', 'Ydwin Villegas', NULL, '5-10', '180', '1990-09-01', 'SS',  'Grizzlies'),
('1017', 'Juan Ciriaco', NULL, '6-0', '160', '1983-08-15', 'OF',  'Grizzlies'),
('1018', 'Ryan Lollis', NULL, '6-2', '185', '1986-12-16', 'OF',  'Grizzlies'),
('1019','Chris Dominguez', NULL, '6-5', '235', '1986-11-22', 'OF', 'Grizzlies'),
('1020', 'Cole Gillespie', NULL, '6-1', '215', '1984-06-20', 'OF',  'Grizzlies'),
('1021', 'Jarrad Parre', NULL, '6-1', '205', '1984-10-19', 'OF',  'Grizzlies'),
('1022', 'Travis Banwart', NULL, '6-4', '205', '1986-02-14', 'RHP', 'River Cats'),
('1023', 'Bruce Billings', NULL, '6-0', '210', '1985-11-18', 'RHP',  'River Cats'),
('1024', 'James Simmons', NULL, '6-3', '220', '1986-09-29', 'RHP', 'River Cats'),
('1025', 'Carlos Hernandez', NULL, '5-11', '155', '1987-03-04', 'LHP',  'River Cats'),
('1026', 'Hideki Okajima', NULL, '6-1', '195', '1975-12-25', 'LHP',  'River Cats'),
('1027', 'Shawn Haviland', NULL, '6-2', '200', '1985-11-10', 'RHP',  'River Cats'),
('1028', 'Sonny Gray', NULL, '5-11', '200', '1989-11-07', 'RHP',  'River Cats'),
('1029', 'Andrew Carignan', NULL,'5-11', '235', '1986-07-23', 'RHP',  'River Cats'),
('1030', 'Brian Gordon', NULL, '6-0', '190', '1978-08-16', 'RHP',  'River Cats'),
('1031', 'Mike Ekstrom', NULL, '6-0', '190', '1983-08-30', 'RHP',  'River Cats'),
('1032', 'Garrett Olson', NULL, '6-1', '205', '1983-10-18', 'LHP',  'River Cats'),
('1033', 'Kyler Newby', NULL, '6-4', '225', '1985-02-22', 'RHP',  'River Cats'),
('1034', 'Justin Thomas', NULL, '6-3', '220', '1984-01-18', 'LHP',  'River Cats'),
('1035', 'Steven Hill', NULL, '5-11', '200', '1985-03-14', 'C',  'River Cats'),
('1036', 'Luke Montz', NULL, '6-1', '230', '1983-07-07', 'C',  'River Cats'),
('1037', 'Stephen Parker', NULL, '6-2', '200', '1987-09-03', '3B', 'River Cats'),
('1038', 'Tommy Medonca', NULL, '6-1', '200', '1988-04-12', '3B',  'River Cats'),
('1039', 'Josh Horton', NULL, '6-1', '200', '1986-02-19','SS',  'River Cats'),
('1040', 'Scott Moore', NULL, '6-2', '195', '1983-11-17', '3B',  'River Cats'),
('1041', 'Darwin Perez', NULL, '5-10', '160', '1989-07-27', 'SS',  'River Cats'),
('1042', 'Jurickson Profar', '1', '6-0', '165', '1993-02-20', 'SS', 'Rough Riders'), 
('1043', 'Dylan Bundy', '2', '6-1', '195', '1992-11-15', 'RHP', 'Baysox'),
('1044', 'Oscar Traveras', '3', '6-2', '180', '1992-06-19', 'OF', 'Cardinals'),
('1045', 'Wil Myers', '4', '6-3', '205', '1990-12-10', 'OF', 'Rays'),
('1046', 'Taijuan Walker', '5', '6-4', '210', '1992-08-13', 'RHP', 'Generals'),
('1047', 'Travis dArnaud', '6', '6-2', '195', '1989-02-10', 'C', '51s'),
('1048', 'Jose Fernandez', '7', '6-2', '240', '1992-07-31', 'RHP', 'Hammerheads'),
('1049', 'Zack Wheeler', '8', '6-4', '185', '1990-05-30', 'RHP', '51s'),
('1050', 'Gerrit Cole', '9', '6-4', '220', '1990-09-08', 'RHP', 'Indians'),
('1051', 'Tyler Skaggs', '10', '6-3', '195', '1991-07-13', 'LHP', 'Aces'),
('1052', 'Xander Bogaerts', '20', '6-3', '185', '1992-10-01', 'SS', 'Sea Dogs'),
('1053', 'Gary Sanchez', '36', '6-2', '220', '1992-12-02', 'C', 'Yankees');
SET foreign_key_checks = 1;

UNLOCK TABLES;  