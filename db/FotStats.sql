-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Dec 09. 13:27
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `fotstats`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `csapatok`
--

CREATE TABLE `csapatok` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `orszag` varchar(100) DEFAULT NULL,
  `tipus` enum('klub','valogatott') DEFAULT 'klub',
  `liga_id` int(11) DEFAULT NULL,
  `helyezes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `csapatok`
--

INSERT INTO `csapatok` (`id`, `nev`, `orszag`, `tipus`, `liga_id`, `helyezes`) VALUES
(1, 'Manchester City', 'Anglia', 'klub', 1, 1),
(2, 'Arsenal', 'Anglia', 'klub', 1, 2),
(3, 'Liverpool', 'Anglia', 'klub', 1, 3),
(4, 'Aston Villa', 'Anglia', 'klub', 1, 4),
(5, 'Tottenham Hotspur', 'Anglia', 'klub', 1, 5),
(6, 'Real Madrid', 'Spanyolország', 'klub', 2, 1),
(7, 'Barcelona', 'Spanyolország', 'klub', 2, 2),
(8, 'Atletico Madrid', 'Spanyolország', 'klub', 2, 3),
(9, 'Girona', 'Spanyolország', 'klub', 2, 4),
(10, 'Real Sociedad', 'Spanyolország', 'klub', 2, 5),
(11, 'Bayer Leverkusen', 'Németország', 'klub', 3, 1),
(12, 'Bayern München', 'Németország', 'klub', 3, 2),
(13, 'Stuttgart', 'Németország', 'klub', 3, 3),
(14, 'RB Leipzig', 'Németország', 'klub', 3, 4),
(15, 'Borussia Dortmund', 'Németország', 'klub', 3, 5),
(16, 'Inter', 'Olaszország', 'klub', 4, 1),
(17, 'AC Milan', 'Olaszország', 'klub', 4, 2),
(18, 'Juventus', 'Olaszország', 'klub', 4, 3),
(19, 'Napoli', 'Olaszország', 'klub', 4, 4),
(20, 'Atalanta', 'Olaszország', 'klub', 4, 5),
(21, 'Paris Saint-Germain', 'Franciaország', 'klub', 5, 1),
(22, 'Monaco', 'Franciaország', 'klub', 5, 2),
(23, 'Lille', 'Franciaország', 'klub', 5, 3),
(24, 'Marseille', 'Franciaország', 'klub', 5, 4),
(25, 'Nice', 'Franciaország', 'klub', 5, 5),
(26, 'Real Madrid', 'Spanyolország', 'klub', 6, 1),
(27, 'Manchester City', 'Anglia', 'klub', 6, 2),
(28, 'Bayern München', 'Németország', 'klub', 6, 3),
(29, 'Paris Saint-Germain', 'Franciaország', 'klub', 6, 4),
(30, 'Inter', 'Olaszország', 'klub', 6, 5),
(31, 'Fiorentina', 'Olaszország', 'klub', 7, 1),
(32, 'Aston Villa', 'Anglia', 'klub', 7, 2),
(33, 'Club Brugge', 'Belgium', 'klub', 7, 3),
(34, 'Lille', 'Franciaország', 'klub', 7, 4),
(35, 'PAOK', 'Görögország', 'klub', 7, 5),
(36, 'Franciaország', 'Franciaország', 'valogatott', 8, 1),
(37, 'Anglia', 'Anglia', 'valogatott', 8, 2),
(38, 'Portugália', 'Portugália', 'valogatott', 8, 3),
(39, 'Spanyolország', 'Spanyolország', 'valogatott', 8, 4),
(40, 'Magyarország', 'Magyarország', 'valogatott', 8, 5),
(41, 'Chelsea', 'Anglia', 'klub', 1, 6),
(42, 'Manchester United', 'Anglia', 'klub', 1, 7),
(43, 'Newcastle United', 'Anglia', 'klub', 1, 8),
(44, 'West Ham United', 'Anglia', 'klub', 1, 9),
(45, 'Brighton & Hove Albion', 'Anglia', 'klub', 1, 10),
(46, 'Fulham', 'Anglia', 'klub', 1, 11),
(47, 'Crystal Palace', 'Anglia', 'klub', 1, 12),
(48, 'Brentford', 'Anglia', 'klub', 1, 13),
(49, 'Wolverhampton Wanderers', 'Anglia', 'klub', 1, 14),
(50, 'Nottingham Forest', 'Anglia', 'klub', 1, 15),
(51, 'Everton', 'Anglia', 'klub', 1, 16),
(52, 'Southampton', 'Anglia', 'klub', 1, 17),
(53, 'Ipswich Town', 'Anglia', 'klub', 1, 18),
(54, 'Leicester City', 'Anglia', 'klub', 1, 19),
(55, 'Bournemouth', 'Anglia', 'klub', 1, 20),
(56, 'Real Betis', 'Spanyolország', 'klub', 2, 6),
(57, 'Athletic Bilbao', 'Spanyolország', 'klub', 2, 7),
(58, 'Valencia', 'Spanyolország', 'klub', 2, 8),
(59, 'Sevilla', 'Spanyolország', 'klub', 2, 9),
(60, 'Villarreal', 'Spanyolország', 'klub', 2, 10),
(61, 'Osasuna', 'Spanyolország', 'klub', 2, 11),
(62, 'Getafe', 'Spanyolország', 'klub', 2, 12),
(63, 'Celta Vigo', 'Spanyolország', 'klub', 2, 13),
(64, 'Mallorca', 'Spanyolország', 'klub', 2, 14),
(65, 'Las Palmas', 'Spanyolország', 'klub', 2, 15),
(66, 'Rayo Vallecano', 'Spanyolország', 'klub', 2, 16),
(67, 'Alaves', 'Spanyolország', 'klub', 2, 17),
(68, 'Cadiz', 'Spanyolország', 'klub', 2, 18),
(69, 'Granada', 'Spanyolország', 'klub', 2, 19),
(70, 'Leganes', 'Spanyolország', 'klub', 2, 20),
(71, 'Eintracht Frankfurt', 'Németország', 'klub', 3, 6),
(72, 'TSG Hoffenheim', 'Németország', 'klub', 3, 7),
(73, 'SC Freiburg', 'Németország', 'klub', 3, 8),
(74, 'FC Augsburg', 'Németország', 'klub', 3, 9),
(75, 'Werder Bremen', 'Németország', 'klub', 3, 10),
(76, 'VfL Wolfsburg', 'Németország', 'klub', 3, 11),
(77, 'Borussia Mönchengladbach', 'Németország', 'klub', 3, 12),
(78, '1. FC Heidenheim', 'Németország', 'klub', 3, 13),
(79, 'VfL Bochum', 'Németország', 'klub', 3, 14),
(80, 'Mainz 05', 'Németország', 'klub', 3, 15),
(81, 'Union Berlin', 'Németország', 'klub', 3, 16),
(82, 'FC St. Pauli', 'Németország', 'klub', 3, 17),
(83, 'Greuther Fürth', 'Németország', 'klub', 3, 18),
(84, 'Holstein Kiel', 'Németország', 'klub', 3, 19),
(85, 'Fortuna Düsseldorf', 'Németország', 'klub', 3, 20),
(86, 'AS Roma', 'Olaszország', 'klub', 4, 6),
(87, 'Lazio', 'Olaszország', 'klub', 4, 7),
(88, 'Bologna', 'Olaszország', 'klub', 4, 8),
(89, 'Torino', 'Olaszország', 'klub', 4, 9),
(90, 'Fiorentina', 'Olaszország', 'klub', 4, 10),
(91, 'Monza', 'Olaszország', 'klub', 4, 11),
(92, 'Genoa', 'Olaszország', 'klub', 4, 12),
(93, 'Lecce', 'Olaszország', 'klub', 4, 13),
(94, 'Udinese', 'Olaszország', 'klub', 4, 14),
(95, 'Cagliari', 'Olaszország', 'klub', 4, 15),
(96, 'Empoli', 'Olaszország', 'klub', 4, 16),
(97, 'Sassuolo', 'Olaszország', 'klub', 4, 17),
(98, 'Verona', 'Olaszország', 'klub', 4, 18),
(99, 'Como', 'Olaszország', 'klub', 4, 19),
(100, 'Parma', 'Olaszország', 'klub', 4, 20),
(101, 'Lyon', 'Franciaország', 'klub', 5, 6),
(102, 'Rennes', 'Franciaország', 'klub', 5, 7),
(103, 'Lens', 'Franciaország', 'klub', 5, 8),
(104, 'Toulouse', 'Franciaország', 'klub', 5, 9),
(105, 'Montpellier', 'Franciaország', 'klub', 5, 10),
(106, 'Strasbourg', 'Franciaország', 'klub', 5, 11),
(107, 'Nantes', 'Franciaország', 'klub', 5, 12),
(108, 'Reims', 'Franciaország', 'klub', 5, 13),
(109, 'Le Havre', 'Franciaország', 'klub', 5, 14),
(110, 'Brest', 'Franciaország', 'klub', 5, 15),
(111, 'Lorient', 'Franciaország', 'klub', 5, 16),
(112, 'Clermont Foot', 'Franciaország', 'klub', 5, 17),
(113, 'Saint-Étienne', 'Franciaország', 'klub', 5, 18),
(114, 'Auxerre', 'Franciaország', 'klub', 5, 19),
(115, 'Angers', 'Franciaország', 'klub', 5, 20),
(116, 'Argentína', 'Argentína', 'valogatott', 8, 6),
(117, 'Brazília', 'Brazília', 'valogatott', 8, 7),
(118, 'Németország', 'Németország', 'valogatott', 8, 8),
(119, 'Hollandia', 'Hollandia', 'valogatott', 8, 9),
(120, 'Olaszország', 'Olaszország', 'valogatott', 8, 10),
(121, 'Belgium', 'Belgium', 'valogatott', 8, 11),
(122, 'Horvátország', 'Horvátország', 'valogatott', 8, 12),
(123, 'Dánia', 'Dánia', 'valogatott', 8, 13),
(124, 'Svájc', 'Svájc', 'valogatott', 8, 14),
(125, 'Szerbia', 'Szerbia', 'valogatott', 8, 15),
(126, 'Borussia Dortmund', 'Németország', 'klub', 6, 6),
(127, 'Barcelona', 'Spanyolország', 'klub', 6, 7),
(128, 'Atletico Madrid', 'Spanyolország', 'klub', 6, 8),
(129, 'RB Leipzig', 'Németország', 'klub', 6, 9),
(130, 'AC Milan', 'Olaszország', 'klub', 6, 10),
(131, 'Juventus', 'Olaszország', 'klub', 6, 11),
(132, 'Arsenal', 'Anglia', 'klub', 6, 12),
(133, 'Liverpool', 'Anglia', 'klub', 6, 13),
(134, 'Bayer Leverkusen', 'Németország', 'klub', 6, 14),
(135, 'Benfica', 'Portugália', 'klub', 6, 15),
(136, 'Fiorentina', 'Olaszország', 'klub', 7, 6),
(137, 'Aston Villa', 'Anglia', 'klub', 7, 7),
(138, 'Club Brugge', 'Belgium', 'klub', 7, 8),
(139, 'Lille', 'Franciaország', 'klub', 7, 9),
(140, 'PAOK', 'Görögország', 'klub', 7, 10),
(141, 'Fenerbahçe', 'Törökország', 'klub', 7, 11),
(142, 'Olympiacos', 'Görögország', 'klub', 7, 12),
(143, 'Dinamo Zagreb', 'Horvátország', 'klub', 7, 13),
(144, 'Midtjylland', 'Dánia', 'klub', 7, 14),
(145, 'AZ Alkmaar', 'Hollandia', 'klub', 7, 15);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jatekosok`
--

CREATE TABLE `jatekosok` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `poszt` varchar(50) DEFAULT NULL,
  `nemzetiseg` varchar(100) DEFAULT NULL,
  `csapat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `jatekosok`
--

INSERT INTO `jatekosok` (`id`, `nev`, `poszt`, `nemzetiseg`, `csapat_id`) VALUES
(1, 'Erling Haaland', 'Csatár', 'Norvégia', 1),
(2, 'Kevin De Bruyne', 'Középpályás', 'Belgium', 1),
(3, 'Bukayo Saka', 'Szélső', 'Anglia', 2),
(4, 'Martin Ødegaard', 'Középpályás', 'Norvégia', 2),
(5, 'Mohamed Salah', 'Szélső', 'Egyiptom', 3),
(6, 'Trent Alexander-Arnold', 'Védő', 'Anglia', 3),
(7, 'Ollie Watkins', 'Csatár', 'Anglia', 4),
(8, 'John McGinn', 'Középpályás', 'Skócia', 4),
(9, 'Heung-Min Son', 'Szélső', 'Dél-Korea', 5),
(10, 'James Maddison', 'Középpályás', 'Anglia', 5),
(11, 'Vinícius Júnior', 'Szélső', 'Brazília', 6),
(12, 'Jude Bellingham', 'Középpályás', 'Anglia', 6),
(13, 'Robert Lewandowski', 'Csatár', 'Lengyelország', 7),
(14, 'Pedri', 'Középpályás', 'Spanyolország', 7),
(15, 'Antoine Griezmann', 'Csatár', 'Franciaország', 8),
(16, 'Álvaro Morata', 'Csatár', 'Spanyolország', 8),
(17, 'Artem Dovbyk', 'Csatár', 'Ukrajna', 9),
(18, 'Aleix García', 'Középpályás', 'Spanyolország', 9),
(19, 'Mikel Oyarzabal', 'Szélső', 'Spanyolország', 10),
(20, 'Takefusa Kubo', 'Szélső', 'Japán', 10),
(21, 'Florian Wirtz', 'Középpályás', 'Németország', 11),
(22, 'Victor Boniface', 'Csatár', 'Nigéria', 11),
(23, 'Harry Kane', 'Csatár', 'Anglia', 12),
(24, 'Jamal Musiala', 'Középpályás', 'Németország', 12),
(25, 'Serhou Guirassy', 'Csatár', 'Guinea', 13),
(26, 'Chris Führich', 'Szélső', 'Németország', 13),
(27, 'Loïs Openda', 'Csatár', 'Belgium', 14),
(28, 'Xavi Simons', 'Középpályás', 'Hollandia', 14),
(29, 'Marco Reus', 'Középpályás', 'Németország', 15),
(30, 'Julian Brandt', 'Középpályás', 'Németország', 15),
(31, 'Lautaro Martínez', 'Csatár', 'Argentína', 16),
(32, 'Nicolò Barella', 'Középpályás', 'Olaszország', 16),
(33, 'Rafael Leão', 'Szélső', 'Portugália', 17),
(34, 'Olivier Giroud', 'Csatár', 'Franciaország', 17),
(35, 'Dusan Vlahović', 'Csatár', 'Szerbia', 18),
(36, 'Federico Chiesa', 'Szélső', 'Olaszország', 18),
(37, 'Khvicha Kvaratskhelia', 'Szélső', 'Grúzia', 19),
(38, 'Victor Osimhen', 'Csatár', 'Nigéria', 19),
(39, 'Teun Koopmeiners', 'Középpályás', 'Hollandia', 20),
(40, 'Gianluca Scamacca', 'Csatár', 'Olaszország', 20),
(41, 'Kylian Mbappé', 'Csatár', 'Franciaország', 21),
(42, 'Ousmane Dembélé', 'Szélső', 'Franciaország', 21),
(43, 'Wissam Ben Yedder', 'Csatár', 'Franciaország', 22),
(44, 'Takumi Minamino', 'Szélső', 'Japán', 22),
(45, 'Jonathan David', 'Csatár', 'Kanada', 23),
(46, 'Edon Zhegrova', 'Szélső', 'Koszovó', 23),
(47, 'Pierre-Emerick Aubameyang', 'Csatár', 'Gabon', 24),
(48, 'Jordan Veretout', 'Középpályás', 'Franciaország', 24),
(49, 'Terem Moffi', 'Csatár', 'Nigéria', 25),
(50, 'Gaëtan Laborde', 'Csatár', 'Franciaország', 25),
(51, 'Luka Modrić', 'Középpályás', 'Horvátország', 26),
(52, 'Rodrygo Goes', 'Szélső', 'Brazília', 26),
(53, 'Phil Foden', 'Szélső', 'Anglia', 27),
(54, 'Rúben Dias', 'Védő', 'Portugália', 27),
(55, 'Thomas Müller', 'Középpályás', 'Németország', 28),
(56, 'Joshua Kimmich', 'Középpályás', 'Németország', 28),
(57, 'Marquinhos', 'Védő', 'Brazília', 29),
(58, 'Gonçalo Ramos', 'Csatár', 'Portugália', 29),
(59, 'Lautaro Martínez', 'Csatár', 'Argentína', 30),
(60, 'Marcus Thuram', 'Szélső', 'Franciaország', 30),
(61, 'Nicolás González', 'Szélső', 'Argentína', 31),
(62, 'Lucas Beltrán', 'Csatár', 'Argentína', 31),
(63, 'Ollie Watkins', 'Csatár', 'Anglia', 32),
(64, 'Douglas Luiz', 'Középpályás', 'Brazília', 32),
(65, 'Hans Vanaken', 'Középpályás', 'Belgium', 33),
(66, 'Andreas Skov Olsen', 'Szélső', 'Dánia', 33),
(67, 'Jonathan David', 'Csatár', 'Kanada', 34),
(68, 'Rémy Cabella', 'Középpályás', 'Franciaország', 34),
(69, 'Andrija Živković', 'Szélső', 'Szerbia', 35),
(70, 'Konstantinos Koulierakis', 'Védő', 'Görögország', 35),
(71, 'Kylian Mbappé', 'Csatár', 'Franciaország', 36),
(72, 'Antoine Griezmann', 'Középpályás', 'Franciaország', 36),
(73, 'Harry Kane', 'Csatár', 'Anglia', 37),
(74, 'Declan Rice', 'Középpályás', 'Anglia', 37),
(75, 'Cristiano Ronaldo', 'Csatár', 'Portugália', 38),
(76, 'Bruno Fernandes', 'Középpályás', 'Portugália', 38),
(77, 'Álvaro Morata', 'Csatár', 'Spanyolország', 39),
(78, 'Rodri', 'Középpályás', 'Spanyolország', 39),
(79, 'Dominik Szoboszlai', 'Középpályás', 'Magyarország', 40),
(80, 'Roland Sallai', 'Szélső', 'Magyarország', 40),
(81, 'Cole Palmer', 'Középpályás', 'Anglia', 41),
(82, 'Moises Caicedo', 'Középpályás', 'Ecuador', 41),
(83, 'Bruno Fernandes', 'Középpályás', 'Portugália', 42),
(84, 'Marcus Rashford', 'Szélső', 'Anglia', 42),
(85, 'Alexander Isak', 'Csatár', 'Svédország', 43),
(86, 'Bruno Guimaraes', 'Középpályás', 'Brazília', 43),
(87, 'Jarrod Bowen', 'Szélső', 'Anglia', 44),
(88, 'Lucas Paquetá', 'Középpályás', 'Brazília', 44),
(89, 'Evan Ferguson', 'Csatár', 'Írország', 45),
(90, 'Pascal Gross', 'Középpályás', 'Németország', 45),
(91, 'Joao Palhinha', 'Középpályás', 'Portugália', 46),
(92, 'Raul Jimenez', 'Csatár', 'Mexikó', 46),
(93, 'Michael Olise', 'Szélső', 'Franciaország', 47),
(94, 'Eberechi Eze', 'Középpályás', 'Anglia', 47),
(95, 'Ivan Toney', 'Csatár', 'Anglia', 48),
(96, 'Bryan Mbeumo', 'Szélső', 'Kamerun', 48),
(97, 'Matheus Cunha', 'Csatár', 'Brazília', 49),
(98, 'Pedro Neto', 'Szélső', 'Portugália', 49),
(99, 'Morgan Gibbs-White', 'Középpályás', 'Anglia', 50),
(100, 'Taiwo Awoniyi', 'Csatár', 'Nigéria', 50),
(101, 'Dominic Calvert-Lewin', 'Csatár', 'Anglia', 51),
(102, 'James Garner', 'Középpályás', 'Anglia', 51),
(103, 'Che Adams', 'Csatár', 'Skócia', 52),
(104, 'James Ward-Prowse', 'Középpályás', 'Anglia', 52),
(105, 'Conor Chaplin', 'Csatár', 'Anglia', 53),
(106, 'Leif Davis', 'Védő', 'Anglia', 53),
(107, 'Jamie Vardy', 'Csatár', 'Anglia', 54),
(108, 'Wilfred Ndidi', 'Középpályás', 'Nigéria', 54),
(109, 'Dominic Solanke', 'Csatár', 'Anglia', 55),
(110, 'Ryan Christie', 'Középpályás', 'Skócia', 55),
(111, 'Lionel Messi', 'Csatár', 'Argentína', 116),
(112, 'Julian Alvarez', 'Csatár', 'Argentína', 116),
(113, 'Neymar Jr', 'Szélső', 'Brazília', 117),
(114, 'Vinícius Júnior', 'Szélső', 'Brazília', 117),
(115, 'Toni Kroos', 'Középpályás', 'Németország', 118),
(116, 'Ilkay Gundogan', 'Középpályás', 'Németország', 118),
(117, 'Virgil van Dijk', 'Védő', 'Hollandia', 119),
(118, 'Memphis Depay', 'Csatár', 'Hollandia', 119),
(119, 'Gianluigi Donnarumma', 'Kapus', 'Olaszország', 120),
(120, 'Nicolò Barella', 'Középpályás', 'Olaszország', 120),
(121, 'Kevin De Bruyne', 'Középpályás', 'Belgium', 121),
(122, 'Romelu Lukaku', 'Csatár', 'Belgium', 121),
(123, 'Luka Modrić', 'Középpályás', 'Horvátország', 122),
(124, 'Mateo Kovačić', 'Középpályás', 'Horvátország', 122),
(125, 'Christian Eriksen', 'Középpályás', 'Dánia', 123),
(126, 'Rasmus Højlund', 'Csatár', 'Dánia', 123),
(127, 'Granit Xhaka', 'Középpályás', 'Svájc', 124),
(128, 'Xherdan Shaqiri', 'Szélső', 'Svájc', 124),
(129, 'Dušan Tadić', 'Szélső', 'Szerbia', 125),
(130, 'Aleksandar Mitrović', 'Csatár', 'Szerbia', 125);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ligak`
--

CREATE TABLE `ligak` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `ligak`
--

INSERT INTO `ligak` (`id`, `nev`) VALUES
(1, 'Premier League'),
(2, 'La Liga'),
(3, 'Bundesliga'),
(4, 'Serie A'),
(5, 'Ligue 1'),
(6, 'Bajnokok Ligája'),
(7, 'Európa Konferencia Liga'),
(8, 'VB-selejtező');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `meccsek`
--

CREATE TABLE `meccsek` (
  `id` int(11) NOT NULL,
  `csapat1_id` int(11) NOT NULL,
  `csapat2_id` int(11) NOT NULL,
  `datum` datetime DEFAULT NULL,
  `liga_id` int(11) NOT NULL,
  `eredmeny` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `meccsek`
--

INSERT INTO `meccsek` (`id`, `csapat1_id`, `csapat2_id`, `datum`, `liga_id`, `eredmeny`) VALUES
(1, 1, 2, '2025-08-15 00:00:00', 1, '2-1'),
(2, 3, 4, '2025-08-16 00:00:00', 1, '1-1'),
(3, 6, 7, '2025-08-17 00:00:00', 2, '3-2'),
(4, 8, 9, '2025-09-04 00:00:00', 2, NULL),
(5, 26, 27, '2025-09-10 00:00:00', 6, '3-0'),
(6, 31, 32, '2025-09-15 00:00:00', 7, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `cim` varchar(255) NOT NULL,
  `datum` date NOT NULL,
  `forras` varchar(255) DEFAULT NULL,
  `osszefoglalo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `news`
--

INSERT INTO `news` (`id`, `cim`, `datum`, `forras`, `osszefoglalo`) VALUES
(1, 'Liverpool: Romano információi szerint nincs napirenden az edző menesztése', '2025-09-25', 'Football365 / Fabrizio Romano', 'Romano szerint a klubnak jelenleg nem áll szándékában menedzsert váltani, noha a szezon rosszul indult.'),
(2, 'A Manchester United csak akkor igazol csatárt januárban, ha Sesko sérülése komolyabb', '2025-10-22', 'Football365 / Fabrizio Romano', 'Romano úgy tudja, az MU csak akkor szerződtet új csatárt, ha Benjamin Sesko sérülése hosszabb távú problémának bizonyul.'),
(3, 'A Liverpool új szerződést kínált Konaténak, közel a megállapodás', '2025-11-23', 'LiverpoolWorld / Fabrizio Romano', 'Romano megerősítette, hogy az Anfield-csapat friss hosszabbítást ajánlott Ibrahima Konaténak, és bíznak a sikeres megegyezésben.'),
(4, 'Arsenal új ajánlatra készül egy középpályásért, a tárgyalások egyre intenzívebbek', '2025-12-05', 'Football365 / Fabrizio Romano', 'Romano szerint az Arsenal újabb ajánlatot készít elő egy kiszemelt középpályás megszerzésére, miközben a tárgyalások egyre aktívabbá válnak.'),
(5, 'A Chelsea közel a megállapodáshoz egy új védővel, a feltételekben már megegyeztek', '2025-12-08', 'LondonWorld / Fabrizio Romano', 'Romano információi alapján a Chelsea hamarosan bejelentheti új védőjét, a játékossal pedig már megállapodtak a személyes feltételekről.'),
(6, 'A Tottenham tárgyalásokat kezdett egy januári szélsőigazolásról', '2025-12-11', 'Football Insider / Fabrizio Romano', 'Romano szerint a Tottenham már megkezdte a tárgyalásokat egy szélső leigazolásáról a téli átigazolási időszakra, és optimisták az egyezség elérésében.'),
(7, 'A Newcastle új csatárt akar igazolni, a klub nem adja fel', '2025-12-15', 'ChronicleLive / Fabrizio Romano', 'Romano úgy tudja, hogy a Newcastle eltökélt egy új csatár szerződtetésében, és addig folytatják a tárgyalásokat, amíg nem sikerül megegyezni.'),
(8, 'A Barcelona áttörést ért el egy kulcsvédő szerződéshosszabbításában', '2025-12-18', 'Marca / Fabrizio Romano', 'Romano szerint a Barcelona komoly előrelépést tett egy fontos védő új szerződéséről szóló tárgyalásokban, és közel állnak a végleges megállapodáshoz.'),
(9, 'A Real Madrid új szerződést kínál fiatal tehetségének, közel a megegyezés', '2025-12-20', 'Marca / Fabrizio Romano', 'Romano szerint a Real Madrid már előrehaladott tárgyalásokat folytat egyik legnagyobb tehetségével a szerződéshosszabbításról, és hamarosan megegyezhetnek.'),
(10, 'A Bayern München új támadó szerződtetését tervezi a keret megerősítésére', '2025-12-22', 'Bild / Fabrizio Romano', 'Romano arról számolt be, hogy a Bayern München egy új támadó igazolásán dolgozik, és több jelölt neve is felmerült.'),
(11, 'Az Inter Milan közel áll egy új középpályás szerződtetéséhez', '2025-12-23', 'Gazzetta dello Sport / Fabrizio Romano', 'Romano információi szerint az Inter megegyezés közeli állapotban van egy középpályás érkezéséről, aki már januárban csatlakozhat a csapathoz.'),
(12, 'A Juventus hamarosan bemutathatja új védőjét', '2025-12-27', 'Tuttosport / Fabrizio Romano', 'Romano úgy tudja, hogy a Juventus lezárta az egyeztetéseket egy új védő szerződtetéséről, a bejelentés már csak idő kérdése.'),
(13, 'A PSG több kulcsjátékossal tárgyal a szerződéshosszabbításról', '2025-12-28', 'L Équipe / Fabrizio Romano', 'Romano jelentése szerint a PSG célja a keret stabilizálása, ezért egyszerre több meghatározó játékossal is tárgyal a hosszabbításról.');


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `statisztikak`
--

CREATE TABLE `statisztikak` (
  `id` int(11) NOT NULL,
  `jatekos_id` int(11) DEFAULT NULL,
  `csapat_id` int(11) DEFAULT NULL,
  `golok` tinyint(4) DEFAULT 0,
  `lovesek` int(11) DEFAULT 0,
  `passzok` int(11) DEFAULT 0,
  `labdabirtoklas` decimal(5,2) DEFAULT 0.00,
  `meccs_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `statisztikak`
--

INSERT INTO `statisztikak` (`id`, `jatekos_id`, `csapat_id`, `golok`, `lovesek`, `passzok`, `labdabirtoklas`, `meccs_id`) VALUES
(1, 10, 1, 2, 5, 42, 55.30, 1),
(2, 11, 1, 0, 1, 37, 55.30, 1),
(3, 21, 2, 1, 3, 28, 44.70, 1),
(4, 12, 1, 0, 2, 31, 60.10, 2),
(5, 22, 3, 1, 4, 24, 39.90, 2),
(6, 13, 4, 3, 6, 18, 48.20, 3),
(7, 23, 5, 0, 2, 33, 51.80, 3);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `csapatok`
--
ALTER TABLE `csapatok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_csapat_liga` (`liga_id`);

--
-- A tábla indexei `jatekosok`
--
ALTER TABLE `jatekosok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `csapat_id` (`csapat_id`);

--
-- A tábla indexei `ligak`
--
ALTER TABLE `ligak`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `meccsek`
--
ALTER TABLE `meccsek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `csapat1_id` (`csapat1_id`),
  ADD KEY `csapat2_id` (`csapat2_id`),
  ADD KEY `liga_id` (`liga_id`);

--
-- A tábla indexei `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `statisztikak`
--
ALTER TABLE `statisztikak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_statisztika_jatekos` (`jatekos_id`),
  ADD KEY `fk_statisztika_csapat` (`csapat_id`),
  ADD KEY `fk_meccs` (`meccs_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `csapatok`
--
ALTER TABLE `csapatok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT a táblához `jatekosok`
--
ALTER TABLE `jatekosok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT a táblához `ligak`
--
ALTER TABLE `ligak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `meccsek`
--
ALTER TABLE `meccsek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `statisztikak`
--
ALTER TABLE `statisztikak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `csapatok`
--
ALTER TABLE `csapatok`
  ADD CONSTRAINT `fk_csapat_liga` FOREIGN KEY (`liga_id`) REFERENCES `ligak` (`id`) ON DELETE SET NULL;

--
-- Megkötések a táblához `jatekosok`
--
ALTER TABLE `jatekosok`
  ADD CONSTRAINT `jatekosok_ibfk_1` FOREIGN KEY (`csapat_id`) REFERENCES `csapatok` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `meccsek`
--
ALTER TABLE `meccsek`
  ADD CONSTRAINT `fk_csapat1` FOREIGN KEY (`csapat1_id`) REFERENCES `csapatok` (`id`),
  ADD CONSTRAINT `fk_csapat2` FOREIGN KEY (`csapat2_id`) REFERENCES `csapatok` (`id`),
  ADD CONSTRAINT `meccsek_ibfk_1` FOREIGN KEY (`csapat1_id`) REFERENCES `csapatok` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `meccsek_ibfk_2` FOREIGN KEY (`csapat2_id`) REFERENCES `csapatok` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `meccsek_ibfk_3` FOREIGN KEY (`liga_id`) REFERENCES `ligak` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `statisztikak`
--
ALTER TABLE `statisztikak`
  ADD CONSTRAINT `fk_meccs` FOREIGN KEY (`meccs_id`) REFERENCES `meccsek` (`id`),
  ADD CONSTRAINT `fk_statisztika_csapat` FOREIGN KEY (`csapat_id`) REFERENCES `csapatok` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_statisztika_jatekos` FOREIGN KEY (`jatekos_id`) REFERENCES `jatekosok` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
