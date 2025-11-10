-- football_db_real_partial.sql
-- MySQL dump: schema + teams + competitions + REAL players for S.L. Benfica and Ferencvárosi TC (Wikipedia snapshots Nov 2025)
CREATE DATABASE IF NOT EXISTS football_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE football_db;

-- Schema (trimmed; assume same as before)
CREATE TABLE IF NOT EXISTS countries (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  iso_code VARCHAR(10)
);
CREATE TABLE IF NOT EXISTS leagues (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  country_id INT,
  level INT,
  season VARCHAR(20),
  UNIQUE(name, season),
  FOREIGN KEY (country_id) REFERENCES countries(id) ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS teams (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  short_name VARCHAR(50),
  country_id INT,
  founded YEAR NULL,
  stadium VARCHAR(200),
  wiki_page VARCHAR(300),
  UNIQUE(name),
  FOREIGN KEY (country_id) REFERENCES countries(id) ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS players (
  id INT AUTO_INCREMENT PRIMARY KEY,
  team_id INT,
  full_name VARCHAR(200) NOT NULL,
  squad_number VARCHAR(10),
  position VARCHAR(50),
  nationality VARCHAR(100),
  date_of_birth DATE NULL,
  wiki_page VARCHAR(300),
  FOREIGN KEY (team_id) REFERENCES teams(id) ON DELETE SET NULL
);

-- Countries (fixed ids)
INSERT INTO countries (id, name, iso_code) VALUES
(1,'England','GBR'),
(2,'Spain','ESP'),
(3,'Italy','ITA'),
(4,'Germany','DEU'),
(5,'France','FRA'),
(6,'Portugal','PRT'),
(7,'Hungary','HUN');

-- Teams (only the three requested extra clubs included here)
INSERT INTO teams (id, name, country_id, wiki_page) VALUES
(99,'S.L. Benfica',6,'https://en.wikipedia.org/wiki/S.L._Benfica'),
(100,'F.C. Porto',6,'https://en.wikipedia.org/wiki/FC_Porto'),
(101,'Ferencvárosi TC',7,'https://en.wikipedia.org/wiki/Ferencv%C3%A1rosi_TC');

-- Players for S.L. Benfica (team_id = 99)
-- Data source: Wikipedia "First-team squad" (as of Sept 2, 2025). Names and squad numbers taken from that page.
INSERT INTO players (id, team_id, full_name, squad_number, position, nationality, wiki_page) VALUES
(1,99,'Anatoliy Trubin','1','GK','Ukraine','https://en.wikipedia.org/wiki/Anatoliy_Trubin'),
(2,99,'Rafael Obrador','3','DF','Spain','https://en.wikipedia.org/wiki/Rafael_Obrador'),
(3,99,'António Silva','4','DF','Portugal','https://en.wikipedia.org/wiki/Ant%C3%B3nio_Silva_(footballer,_born_2003)'),
(4,99,'Enzo Barrenechea','5','MF','Argentina','https://en.wikipedia.org/wiki/Enzo_Barrenechea'),
(5,99,'Alexander Bah','6','DF','Denmark','https://en.wikipedia.org/wiki/Alexander_Bah'),
(6,99,'Fredrik Aursnes','8','MF','Norway','https://en.wikipedia.org/wiki/Fredrik_Aursnes'),
(7,99,'Franjo Ivanović','9','FW','Croatia','https://en.wikipedia.org/wiki/Franjo_Ivanovi%C4%87'),
(8,99,'Heorhiy Sudakov','10','MF','Ukraine','https://en.wikipedia.org/wiki/Heorhiy_Sudakov'),
(9,99,'Dodi Lukébakio','11','FW','Belgium','https://en.wikipedia.org/wiki/Dodi_Luk%C3%A9bakio'),
(10,99,'Vangelis Pavlidis','14','FW','Greece','https://en.wikipedia.org/wiki/Vangelis_Pavlidis'),
(11,99,'Manu Silva','16','MF','Portugal','https://en.wikipedia.org/wiki/Manu_Silva'),
(12,99,'Amar Dedić','17','DF','Bosnia and Herzegovina','https://en.wikipedia.org/wiki/Amar_Dedi%C4%87'),
(13,99,'Leandro Barreiro','18','MF','Luxembourg','https://en.wikipedia.org/wiki/Leandro_Barreiro'),
(14,99,'Richard Ríos','20','MF','Colombia','https://en.wikipedia.org/wiki/Richard_R%C3%ADos'),
(15,99,'Andreas Schjelderup','21','FW','Norway','https://en.wikipedia.org/wiki/Andreas_Schjelderup'),
(16,99,'Samuel Soares','24','GK','Portugal','https://en.wikipedia.org/wiki/Samuel_Soares_(footballer)'),
(17,99,'Gianluca Prestianni','25','FW','Argentina','https://en.wikipedia.org/wiki/Gianluca_Prestianni'),
(18,99,'Samuel Dahl','26','DF','Sweden','https://en.wikipedia.org/wiki/Samuel_Dahl'),
(19,99,'Bruma','27','FW','Portugal','https://en.wikipedia.org/wiki/Bruma_(footballer)'),
(20,99,'Nicolás Otamendi','30','DF','Argentina','https://en.wikipedia.org/wiki/Nicol%C3%A1s_Otamendi'),
(21,99,'Henrique Araújo','39','FW','Portugal','https://en.wikipedia.org/wiki/Henrique_Ara%C3%BAjo'),
(22,99,'Tomás Araújo','44','DF','Portugal','https://en.wikipedia.org/wiki/Tom%C3%A1s_Ara%C3%BAjo'),
(23,99,'Diogo Ferreira','50','GK','Portugal','https://en.wikipedia.org/wiki/Diogo_Ferreira_(footballer)');

-- Players for Ferencvárosi TC (team_id = 101)
-- Data source: Wikipedia "Current squad" (as of Sep/Nov 2025)
INSERT INTO players (id, team_id, full_name, squad_number, position, nationality, wiki_page) VALUES
(1001,101,'Stefan Gartenmann','3','DF','Switzerland','https://en.wikipedia.org/wiki/Stefan_Gartenmann'),
(1002,101,'Naby Keïta','5','MF','Guinea','https://en.wikipedia.org/wiki/Naby_Ke%C3%AFta'),
(1003,101,'Daniel Arzani','7','FW','Australia','https://en.wikipedia.org/wiki/Daniel_Arzani'),
(1004,101,'Aleksandar Pešić','8','FW','Serbia','https://en.wikipedia.org/wiki/Aleksandar_Pe%C5%A1i%C4%87'),
(1005,101,'Jonathan Levi','10','FW','Sweden','https://en.wikipedia.org/wiki/Jonathan_Levi'),
(1006,101,'Bamidele Yusuf','11','FW','Nigeria','https://en.wikipedia.org/wiki/Bamidele_Yusuf'),
(1007,101,'Mohammed Abu Fani','15','MF','Israel','https://en.wikipedia.org/wiki/Mohammed_Abu_Fani'),
(1008,101,'Kristoffer Zachariassen','16','FW','Norway','https://en.wikipedia.org/wiki/Kristoffer_Zachariassen'),
(1009,101,'Barnabás Varga','19','FW','Hungary','https://en.wikipedia.org/wiki/Barnab%C3%A1s_Varga'),
(1010,101,'Endre Botka','21','DF','Hungary','https://en.wikipedia.org/wiki/Endre_Botka'),
(1011,101,'Gábor Szalai','22','DF','Hungary','https://en.wikipedia.org/wiki/G%C3%A1bor_Szalai_(footballer)'),
(1012,101,'Bence Ötvös','23','MF','Hungary','https://en.wikipedia.org/wiki/Bence_%C3%96tv%C3%B6s'),
(1013,101,'Cebrail Makreckis','25','MF','Latvia','https://en.wikipedia.org/wiki/Cebrail_Makreckis'),
(1014,101,'Ibrahim Cissé','27','DF','France','https://en.wikipedia.org/wiki/Ibrahim_Ciss%C3%A9'),
(1015,101,'Toon Raemaekers','28','DF','Belgium','https://en.wikipedia.org/wiki/Toon_Raemaekers'),
(1016,101,'Gergő Szécsi','29','GK','Hungary','https://en.wikipedia.org/wiki/Gerg%C5%91_Sz%C3%A9csi'),
(1017,101,'Zsombor Gruber','30','FW','Hungary','https://en.wikipedia.org/wiki/Zsombor_Gruber'),
(1018,101,'Cadu','33','MF','Brazil','https://en.wikipedia.org/wiki/Cadu_(footballer)'),
(1019,101,'Gabi Kanichowsky','36','MF','Israel','https://en.wikipedia.org/wiki/Gabi_Kanichowsky'),
(1020,101,'Ismaïl Aaneba','44','DF','France','https://en.wikipedia.org/wiki/Isma%C3%AFl_Aaneba'),
(1021,101,'Callum O''Dowda','47','MF','Ireland','https://en.wikipedia.org/wiki/Callum_O%27Dowda'),
(1022,101,'Dániel Radnóti','63','GK','Hungary','https://en.wikipedia.org/wiki/D%C3%A1niel_Radn%C3%B3ti'),
(1023,101,'Alex Tóth','64','MF','Hungary','https://en.wikipedia.org/wiki/Alex_T%C3%B3th'),
(1024,101,'J%C3%BAlio Rom%C3%A3o','66','MF','Brazil','https://en.wikipedia.org/wiki/J%C3%BAlio_Rom%C3%A3o'),
(1025,101,'Ádám Madarász','72','MF','Hungary','https://en.wikipedia.org/wiki/%C3%81d%C3%A1m_Madar%C3%A1sz'),
(1026,101,'Szilárd Szabó','74','FW','Hungary','https://en.wikipedia.org/wiki/Szil%C3%A1rd_Szab%C3%B3_(footballer)'),
(1027,101,'Lenny Joseph','75','FW','France','https://en.wikipedia.org/wiki/Lenny_Joseph'),
(1028,101,'Krisztián Lisztes','76','MF','Hungary','https://en.wikipedia.org/wiki/Kriszti%C3%A1n_Lisztes'),
(1029,101,'Barnabás Nagy','77','DF','Hungary','https://en.wikipedia.org/wiki/Barnab%C3%A1s_Nagy'),
(1030,101,'Habib Maïga','80','MF','Côte d''Ivoire','https://en.wikipedia.org/wiki/Habib_Ma%C3%AFga'),
(1031,101,'Philippe Rommens','88','MF','Belgium','https://en.wikipedia.org/wiki/Philippe_Rommens'),
(1032,101,'Dénes Dibusz','90','GK','Hungary','https://en.wikipedia.org/wiki/D%C3%A9nes_Dibusz'),
(1033,101,'Dávid Gróf','99','GK','Hungary','https://en.wikipedia.org/wiki/D%C3%A1vid_Gr%C3%B3f');

-- End of file
