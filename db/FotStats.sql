-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Ápr 14. 12:13
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
-- Tábla szerkezet ehhez a táblához `bet`
--

CREATE TABLE `bet` (
  `id` int(11) NOT NULL,
  `meccs_id` int(11) NOT NULL,
  `odd_hazai` decimal(5,2) DEFAULT NULL,
  `odd_dontetlen` decimal(5,2) DEFAULT NULL,
  `odd_vendeg` decimal(5,2) DEFAULT NULL,
  `odd_over_15` decimal(5,2) DEFAULT NULL,
  `odd_under_15` decimal(5,2) DEFAULT NULL,
  `odd_over_25` decimal(5,2) DEFAULT NULL,
  `odd_under_25` decimal(5,2) DEFAULT NULL,
  `odd_btts_igen` decimal(5,2) DEFAULT NULL,
  `odd_btts_nem` decimal(5,2) DEFAULT NULL,
  `odd_szoglet_over_75` decimal(5,2) DEFAULT NULL,
  `odd_szoglet_under_75` decimal(5,2) DEFAULT NULL,
  `odd_tobb_szoglet_hazai` decimal(5,2) DEFAULT NULL,
  `odd_tobb_szoglet_vendeg` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `bet`
--

INSERT INTO `bet` (`id`, `meccs_id`, `odd_hazai`, `odd_dontetlen`, `odd_vendeg`, `odd_over_15`, `odd_under_15`, `odd_over_25`, `odd_under_25`, `odd_btts_igen`, `odd_btts_nem`, `odd_szoglet_over_75`, `odd_szoglet_under_75`, `odd_tobb_szoglet_hazai`, `odd_tobb_szoglet_vendeg`, `created_at`) VALUES
(1, 1, 1.85, 3.40, 4.20, 1.30, 3.20, 1.75, 2.05, 1.65, 2.20, 1.90, 1.90, 1.80, 2.00, '2026-02-10 06:35:49'),
(2, 2, 2.10, 3.10, 3.60, 1.45, 2.70, 1.95, 1.85, 1.72, 2.05, 1.85, 1.95, 1.75, 2.10, '2026-02-10 06:35:49'),
(3, 3, 1.95, 3.50, 3.80, 1.25, 3.60, 1.65, 2.20, 1.55, 2.35, 1.88, 1.92, 1.90, 1.95, '2026-02-10 06:35:49'),
(4, 4, 2.30, 3.00, 3.10, 1.55, 2.45, 2.05, 1.75, 1.80, 1.95, 1.92, 1.88, 1.85, 2.05, '2026-02-10 06:35:49'),
(5, 5, 1.40, 4.20, 6.50, 1.20, 4.00, 1.55, 2.40, 1.60, 2.30, 1.75, 2.10, 2.00, 1.80, '2026-02-10 06:35:49'),
(6, 6, 2.00, 3.25, 3.50, 1.50, 2.55, 1.90, 1.90, 1.70, 2.10, 1.95, 1.85, 1.78, 2.02, '2026-02-10 06:35:49');

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
  `helyezes` int(11) DEFAULT NULL,
  `kep` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `csapatok`
--

INSERT INTO `csapatok` (`id`, `nev`, `orszag`, `tipus`, `liga_id`, `helyezes`, `kep`) VALUES
(1, 'Manchester City', 'Anglia', 'klub', 1, 1, 'Manchester_City.jpg'),
(2, 'Arsenal', 'Anglia', 'klub', 1, 2, 'Arsenal_FC.jpg'),
(3, 'Liverpool', 'Anglia', 'klub', 1, 3, 'Liverpool.jpg'),
(4, 'Aston Villa', 'Anglia', 'klub', 1, 4, 'astonvilla.jpg'),
(5, 'Tottenham Hotspur', 'Anglia', 'klub', 1, 5, 'tottenham.jpg'),
(6, 'Real Madrid', 'Spanyolország', 'klub', 2, 1, 'real-madrid.jpg'),
(7, 'Barcelona', 'Spanyolország', 'klub', 2, 2, 'Barcelona.jpg'),
(8, 'Atletico Madrid', 'Spanyolország', 'klub', 2, 3, 'atleticomadrid.jpg'),
(9, 'Girona', 'Spanyolország', 'klub', 2, 4, 'girona.jpg'),
(10, 'Real Sociedad', 'Spanyolország', 'klub', 2, 5, 'realsociedad.jpg'),
(11, 'Bayer Leverkusen', 'Németország', 'klub', 3, 1, 'bayerleverkusen.jpg'),
(12, 'Bayern München', 'Németország', 'klub', 3, 2, 'bayernmunich.jpg'),
(13, 'Stuttgart', 'Németország', 'klub', 3, 3, 'stuttgart.jpg'),
(14, 'RB Leipzig', 'Németország', 'klub', 3, 4, 'rbleipzig.jpg'),
(15, 'Borussia Dortmund', 'Németország', 'klub', 3, 5, 'BorussiaDortmund.jpg'),
(16, 'Inter', 'Olaszország', 'klub', 4, 1, 'inter.jpg'),
(17, 'AC Milan', 'Olaszország', 'klub', 4, 2, 'acmilan.jpg'),
(18, 'Juventus', 'Olaszország', 'klub', 4, 3, 'juventus.jpg'),
(19, 'Napoli', 'Olaszország', 'klub', 4, 4, 'napoli.jpg'),
(20, 'Atalanta', 'Olaszország', 'klub', 4, 5, 'atalanta.jpg'),
(21, 'Paris Saint-Germain', 'Franciaország', 'klub', 5, 1, 'psg.jpg'),
(22, 'Monaco', 'Franciaország', 'klub', 5, 2, 'monaco.jpg'),
(23, 'Lille', 'Franciaország', 'klub', 5, 3, 'lille.jpg'),
(24, 'Marseille', 'Franciaország', 'klub', 5, 4, 'marseille.jpg'),
(25, 'Nice', 'Franciaország', 'klub', 5, 5, 'nice.jpg'),
(26, 'Real Madrid', 'Spanyolország', 'klub', 6, 1, ''),
(27, 'Manchester City', 'Anglia', 'klub', 6, 2, ''),
(28, 'Bayern München', 'Németország', 'klub', 6, 3, ''),
(29, 'Paris Saint-Germain', 'Franciaország', 'klub', 6, 4, ''),
(30, 'Inter', 'Olaszország', 'klub', 6, 5, ''),
(31, 'Fiorentina', 'Olaszország', 'klub', 7, 1, 'fiorentina.jpg'),
(32, 'Aston Villa', 'Anglia', 'klub', 7, 2, ''),
(33, 'Club Brugge', 'Belgium', 'klub', 7, 3, 'brugge.jpg'),
(34, 'Lille', 'Franciaország', 'klub', 7, 4, ''),
(35, 'PAOK', 'Görögország', 'klub', 7, 5, 'paok.jpg'),
(36, 'Franciaország', 'Franciaország', 'valogatott', 8, 1, 'france.jpg'),
(37, 'Anglia', 'Anglia', 'valogatott', 8, 2, 'england.jpg'),
(38, 'Portugália', 'Portugália', 'valogatott', 8, 3, 'portugal.jpg'),
(39, 'Spanyolország', 'Spanyolország', 'valogatott', 8, 4, 'spain.jpg'),
(40, 'Magyarország', 'Magyarország', 'valogatott', 8, 5, 'hungary.jpg'),
(41, 'Chelsea', 'Anglia', 'klub', 1, 6, 'chelsea.jpg'),
(42, 'Manchester United', 'Anglia', 'klub', 1, 7, 'manchesterunited.jpg'),
(43, 'Newcastle United', 'Anglia', 'klub', 1, 8, 'newcastle.jpg'),
(44, 'West Ham United', 'Anglia', 'klub', 1, 9, 'westham.jpg'),
(45, 'Brighton & Hove Albion', 'Anglia', 'klub', 1, 10, 'brighton.jpg'),
(46, 'Fulham', 'Anglia', 'klub', 1, 11, 'fullham.jpg'),
(47, 'Crystal Palace', 'Anglia', 'klub', 1, 12, 'crystalpalace.jpg'),
(48, 'Brentford', 'Anglia', 'klub', 1, 13, 'brentford.jpg'),
(49, 'Wolverhampton Wanderers', 'Anglia', 'klub', 1, 14, 'wolverhampton.jpg'),
(50, 'Nottingham Forest', 'Anglia', 'klub', 1, 15, 'nottingham.jpg'),
(51, 'Everton', 'Anglia', 'klub', 1, 16, 'everton.jpg'),
(52, 'Southampton', 'Anglia', 'klub', 1, 17, 'southamphton.jpg'),
(53, 'Ipswich Town', 'Anglia', 'klub', 1, 18, 'ipswitch.jpg'),
(54, 'Leicester City', 'Anglia', 'klub', 1, 19, 'leichester.jpg'),
(55, 'Bournemouth', 'Anglia', 'klub', 1, 20, 'bournemouth.jpg'),
(56, 'Real Betis', 'Spanyolország', 'klub', 2, 6, ''),
(57, 'Athletic Bilbao', 'Spanyolország', 'klub', 2, 7, ''),
(58, 'Valencia', 'Spanyolország', 'klub', 2, 8, ''),
(59, 'Sevilla', 'Spanyolország', 'klub', 2, 9, ''),
(60, 'Villarreal', 'Spanyolország', 'klub', 2, 10, ''),
(61, 'Osasuna', 'Spanyolország', 'klub', 2, 11, ''),
(62, 'Getafe', 'Spanyolország', 'klub', 2, 12, ''),
(63, 'Celta Vigo', 'Spanyolország', 'klub', 2, 13, ''),
(64, 'Mallorca', 'Spanyolország', 'klub', 2, 14, ''),
(65, 'Las Palmas', 'Spanyolország', 'klub', 2, 15, ''),
(66, 'Rayo Vallecano', 'Spanyolország', 'klub', 2, 16, ''),
(67, 'Alaves', 'Spanyolország', 'klub', 2, 17, ''),
(68, 'Cadiz', 'Spanyolország', 'klub', 2, 18, ''),
(69, 'Granada', 'Spanyolország', 'klub', 2, 19, ''),
(70, 'Leganes', 'Spanyolország', 'klub', 2, 20, ''),
(71, 'Eintracht Frankfurt', 'Németország', 'klub', 3, 6, ''),
(72, 'TSG Hoffenheim', 'Németország', 'klub', 3, 7, ''),
(73, 'SC Freiburg', 'Németország', 'klub', 3, 8, ''),
(74, 'FC Augsburg', 'Németország', 'klub', 3, 9, ''),
(75, 'Werder Bremen', 'Németország', 'klub', 3, 10, ''),
(76, 'VfL Wolfsburg', 'Németország', 'klub', 3, 11, ''),
(77, 'Borussia Mönchengladbach', 'Németország', 'klub', 3, 12, ''),
(78, '1. FC Heidenheim', 'Németország', 'klub', 3, 13, ''),
(79, 'VfL Bochum', 'Németország', 'klub', 3, 14, ''),
(80, 'Mainz 05', 'Németország', 'klub', 3, 15, ''),
(81, 'Union Berlin', 'Németország', 'klub', 3, 16, ''),
(82, 'FC St. Pauli', 'Németország', 'klub', 3, 17, ''),
(83, 'Greuther Fürth', 'Németország', 'klub', 3, 18, ''),
(84, 'Holstein Kiel', 'Németország', 'klub', 3, 19, ''),
(85, 'Fortuna Düsseldorf', 'Németország', 'klub', 3, 20, ''),
(86, 'AS Roma', 'Olaszország', 'klub', 4, 6, ''),
(87, 'Lazio', 'Olaszország', 'klub', 4, 7, ''),
(88, 'Bologna', 'Olaszország', 'klub', 4, 8, ''),
(89, 'Torino', 'Olaszország', 'klub', 4, 9, ''),
(90, 'Fiorentina', 'Olaszország', 'klub', 4, 10, ''),
(91, 'Monza', 'Olaszország', 'klub', 4, 11, ''),
(92, 'Genoa', 'Olaszország', 'klub', 4, 12, ''),
(93, 'Lecce', 'Olaszország', 'klub', 4, 13, ''),
(94, 'Udinese', 'Olaszország', 'klub', 4, 14, ''),
(95, 'Cagliari', 'Olaszország', 'klub', 4, 15, ''),
(96, 'Empoli', 'Olaszország', 'klub', 4, 16, ''),
(97, 'Sassuolo', 'Olaszország', 'klub', 4, 17, ''),
(98, 'Verona', 'Olaszország', 'klub', 4, 18, ''),
(99, 'Como', 'Olaszország', 'klub', 4, 19, ''),
(100, 'Parma', 'Olaszország', 'klub', 4, 20, ''),
(101, 'Lyon', 'Franciaország', 'klub', 5, 6, ''),
(102, 'Rennes', 'Franciaország', 'klub', 5, 7, ''),
(103, 'Lens', 'Franciaország', 'klub', 5, 8, ''),
(104, 'Toulouse', 'Franciaország', 'klub', 5, 9, ''),
(105, 'Montpellier', 'Franciaország', 'klub', 5, 10, ''),
(106, 'Strasbourg', 'Franciaország', 'klub', 5, 11, ''),
(107, 'Nantes', 'Franciaország', 'klub', 5, 12, ''),
(108, 'Reims', 'Franciaország', 'klub', 5, 13, ''),
(109, 'Le Havre', 'Franciaország', 'klub', 5, 14, ''),
(110, 'Brest', 'Franciaország', 'klub', 5, 15, ''),
(111, 'Lorient', 'Franciaország', 'klub', 5, 16, ''),
(112, 'Clermont Foot', 'Franciaország', 'klub', 5, 17, ''),
(113, 'Saint-Étienne', 'Franciaország', 'klub', 5, 18, ''),
(114, 'Auxerre', 'Franciaország', 'klub', 5, 19, ''),
(115, 'Angers', 'Franciaország', 'klub', 5, 20, ''),
(116, 'Argentína', 'Argentína', 'valogatott', 8, 6, 'argentina.jpg'),
(117, 'Brazília', 'Brazília', 'valogatott', 8, 7, 'brasil.jpg'),
(118, 'Németország', 'Németország', 'valogatott', 8, 8, 'germany.jpg'),
(119, 'Hollandia', 'Hollandia', 'valogatott', 8, 9, 'netherland.jpg'),
(120, 'Olaszország', 'Olaszország', 'valogatott', 8, 10, 'italy.jpg'),
(121, 'Belgium', 'Belgium', 'valogatott', 8, 11, 'belgium.jpg'),
(122, 'Horvátország', 'Horvátország', 'valogatott', 8, 12, 'croatia.jpg'),
(123, 'Dánia', 'Dánia', 'valogatott', 8, 13, 'denmark.jpg'),
(124, 'Svájc', 'Svájc', 'valogatott', 8, 14, 'switczerland.jpg'),
(125, 'Szerbia', 'Szerbia', 'valogatott', 8, 15, 'serbia.jpg'),
(126, 'Borussia Dortmund', 'Németország', 'klub', 6, 6, ''),
(127, 'Barcelona', 'Spanyolország', 'klub', 6, 7, ''),
(128, 'Atletico Madrid', 'Spanyolország', 'klub', 6, 8, ''),
(129, 'RB Leipzig', 'Németország', 'klub', 6, 9, ''),
(130, 'AC Milan', 'Olaszország', 'klub', 6, 10, ''),
(131, 'Juventus', 'Olaszország', 'klub', 6, 11, ''),
(132, 'Arsenal', 'Anglia', 'klub', 6, 12, ''),
(133, 'Liverpool', 'Anglia', 'klub', 6, 13, ''),
(134, 'Bayer Leverkusen', 'Németország', 'klub', 6, 14, ''),
(135, 'Benfica', 'Portugália', 'klub', 6, 15, ''),
(137, 'Aston Villa', 'Anglia', 'klub', 7, 7, ''),
(138, 'Club Brugge', 'Belgium', 'klub', 7, 8, ''),
(139, 'Lille', 'Franciaország', 'klub', 7, 9, ''),
(140, 'PAOK', 'Görögország', 'klub', 7, 10, ''),
(141, 'Fenerbahçe', 'Törökország', 'klub', 7, 11, ''),
(142, 'Olympiacos', 'Görögország', 'klub', 7, 12, ''),
(143, 'Dinamo Zagreb', 'Horvátország', 'klub', 7, 13, ''),
(144, 'Midtjylland', 'Dánia', 'klub', 7, 14, ''),
(145, 'AZ Alkmaar', 'Hollandia', 'klub', 7, 15, '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jatekosok`
--

CREATE TABLE `jatekosok` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `poszt_tmp` varchar(50) DEFAULT NULL,
  `nemzetiseg` varchar(100) DEFAULT NULL,
  `csapat_id` int(11) DEFAULT NULL,
  `poszt` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `jatekosok`
--

INSERT INTO `jatekosok` (`id`, `nev`, `poszt_tmp`, `nemzetiseg`, `csapat_id`, `poszt`) VALUES
(1, 'Erling Haaland', 'Csatár', 'Norvégia', 1, 'CS'),
(2, 'Kevin De Bruyne', 'Középpályás', 'Belgium', 1, 'KP'),
(3, 'Bukayo Saka', 'Szélső', 'Anglia', 2, 'SZ'),
(4, 'Martin Ødegaard', 'Középpályás', 'Norvégia', 2, 'KP'),
(5, 'Mohamed Salah', 'Szélső', 'Egyiptom', 3, 'SZ'),
(6, 'Trent Alexander-Arnold', 'Védő', 'Anglia', 3, 'HAT'),
(7, 'Ollie Watkins', 'Csatár', 'Anglia', 4, 'CS'),
(8, 'John McGinn', 'Középpályás', 'Skócia', 4, 'KP'),
(9, 'Heung-Min Son', 'Szélső', 'Dél-Korea', 5, 'SZ'),
(10, 'James Maddison', 'Középpályás', 'Anglia', 5, 'KP'),
(11, 'Vinícius Júnior', 'Szélső', 'Brazília', 6, 'SZ'),
(12, 'Jude Bellingham', 'Középpályás', 'Anglia', 6, 'KP'),
(13, 'Robert Lewandowski', 'Csatár', 'Lengyelország', 7, 'CS'),
(14, 'Pedri', 'Középpályás', 'Spanyolország', 7, 'KP'),
(15, 'Antoine Griezmann', 'Csatár', 'Franciaország', 8, 'CS'),
(16, 'Álvaro Morata', 'Csatár', 'Spanyolország', 8, 'CS'),
(17, 'Artem Dovbyk', 'Csatár', 'Ukrajna', 9, 'CS'),
(18, 'Aleix García', 'Középpályás', 'Spanyolország', 9, 'KP'),
(19, 'Mikel Oyarzabal', 'Szélső', 'Spanyolország', 10, 'SZ'),
(20, 'Takefusa Kubo', 'Szélső', 'Japán', 10, 'SZ'),
(21, 'Florian Wirtz', 'Középpályás', 'Németország', 11, 'KP'),
(22, 'Victor Boniface', 'Csatár', 'Nigéria', 11, 'CS'),
(23, 'Harry Kane', 'Csatár', 'Anglia', 12, 'CS'),
(24, 'Jamal Musiala', 'Középpályás', 'Németország', 12, 'KP'),
(25, 'Serhou Guirassy', 'Csatár', 'Guinea', 13, 'CS'),
(26, 'Chris Führich', 'Szélső', 'Németország', 13, 'SZ'),
(27, 'Loïs Openda', 'Csatár', 'Belgium', 14, 'CS'),
(28, 'Xavi Simons', 'Középpályás', 'Hollandia', 14, 'KP'),
(29, 'Marco Reus', 'Középpályás', 'Németország', 15, 'KP'),
(30, 'Julian Brandt', 'Középpályás', 'Németország', 15, 'KP'),
(31, 'Lautaro Martínez', 'Csatár', 'Argentína', 16, 'CS'),
(32, 'Nicolò Barella', 'Középpályás', 'Olaszország', 16, 'KP'),
(33, 'Rafael Leão', 'Szélső', 'Portugália', 17, 'SZ'),
(34, 'Olivier Giroud', 'Csatár', 'Franciaország', 17, 'CS'),
(35, 'Dusan Vlahović', 'Csatár', 'Szerbia', 18, 'CS'),
(36, 'Federico Chiesa', 'Szélső', 'Olaszország', 18, 'SZ'),
(37, 'Khvicha Kvaratskhelia', 'Szélső', 'Grúzia', 19, 'SZ'),
(38, 'Victor Osimhen', 'Csatár', 'Nigéria', 19, 'CS'),
(39, 'Teun Koopmeiners', 'Középpályás', 'Hollandia', 20, 'KP'),
(40, 'Gianluca Scamacca', 'Csatár', 'Olaszország', 20, 'CS'),
(41, 'Kylian Mbappé', 'Csatár', 'Franciaország', 21, 'CS'),
(42, 'Ousmane Dembélé', 'Szélső', 'Franciaország', 21, 'SZ'),
(43, 'Wissam Ben Yedder', 'Csatár', 'Franciaország', 22, 'CS'),
(44, 'Takumi Minamino', 'Szélső', 'Japán', 22, 'SZ'),
(45, 'Jonathan David', 'Csatár', 'Kanada', 23, 'CS'),
(46, 'Edon Zhegrova', 'Szélső', 'Koszovó', 23, 'SZ'),
(47, 'Pierre-Emerick Aubameyang', 'Csatár', 'Gabon', 24, 'CS'),
(48, 'Jordan Veretout', 'Középpályás', 'Franciaország', 24, 'KP'),
(49, 'Terem Moffi', 'Csatár', 'Nigéria', 25, 'CS'),
(50, 'Gaëtan Laborde', 'Csatár', 'Franciaország', 25, 'CS'),
(51, 'Luka Modrić', 'Középpályás', 'Horvátország', 26, 'KP'),
(52, 'Rodrygo Goes', 'Szélső', 'Brazília', 26, 'SZ'),
(53, 'Phil Foden', 'Szélső', 'Anglia', 27, 'SZ'),
(54, 'Rúben Dias', 'Védő', 'Portugália', 27, 'HAT'),
(55, 'Thomas Müller', 'Középpályás', 'Németország', 28, 'KP'),
(56, 'Joshua Kimmich', 'Középpályás', 'Németország', 28, 'KP'),
(57, 'Marquinhos', 'Védő', 'Brazília', 29, 'HAT'),
(58, 'Gonçalo Ramos', 'Csatár', 'Portugália', 29, 'CS'),
(59, 'Lautaro Martínez', 'Csatár', 'Argentína', 30, 'CS'),
(60, 'Marcus Thuram', 'Szélső', 'Franciaország', 30, 'SZ'),
(61, 'Nicolás González', 'Szélső', 'Argentína', 31, 'SZ'),
(62, 'Lucas Beltrán', 'Csatár', 'Argentína', 31, 'CS'),
(63, 'Ollie Watkins', 'Csatár', 'Anglia', 32, 'CS'),
(64, 'Douglas Luiz', 'Középpályás', 'Brazília', 32, 'KP'),
(65, 'Hans Vanaken', 'Középpályás', 'Belgium', 33, 'KP'),
(66, 'Andreas Skov Olsen', 'Szélső', 'Dánia', 33, 'SZ'),
(67, 'Jonathan David', 'Csatár', 'Kanada', 34, 'CS'),
(68, 'Rémy Cabella', 'Középpályás', 'Franciaország', 34, 'KP'),
(69, 'Andrija Živković', 'Szélső', 'Szerbia', 35, 'SZ'),
(70, 'Konstantinos Koulierakis', 'Védő', 'Görögország', 35, 'HAT'),
(71, 'Kylian Mbappé', 'Csatár', 'Franciaország', 36, 'CS'),
(72, 'Antoine Griezmann', 'Középpályás', 'Franciaország', 36, 'KP'),
(73, 'Harry Kane', 'Csatár', 'Anglia', 37, 'CS'),
(74, 'Declan Rice', 'Középpályás', 'Anglia', 37, 'KP'),
(75, 'Cristiano Ronaldo', 'Csatár', 'Portugália', 38, 'CS'),
(76, 'Bruno Fernandes', 'Középpályás', 'Portugália', 38, 'KP'),
(77, 'Álvaro Morata', 'Csatár', 'Spanyolország', 39, 'CS'),
(78, 'Rodri', 'Középpályás', 'Spanyolország', 39, 'KP'),
(79, 'Dominik Szoboszlai', 'Középpályás', 'Magyarország', 40, 'KP'),
(80, 'Roland Sallai', 'Szélső', 'Magyarország', 40, 'SZ'),
(81, 'Cole Palmer', 'Középpályás', 'Anglia', 41, 'KP'),
(82, 'Moises Caicedo', 'Középpályás', 'Ecuador', 41, 'KP'),
(83, 'Bruno Fernandes', 'Középpályás', 'Portugália', 42, 'KP'),
(84, 'Marcus Rashford', 'Szélső', 'Anglia', 42, 'SZ'),
(85, 'Alexander Isak', 'Csatár', 'Svédország', 43, 'CS'),
(86, 'Bruno Guimaraes', 'Középpályás', 'Brazília', 43, 'KP'),
(87, 'Jarrod Bowen', 'Szélső', 'Anglia', 44, 'SZ'),
(88, 'Lucas Paquetá', 'Középpályás', 'Brazília', 44, 'KP'),
(89, 'Evan Ferguson', 'Csatár', 'Írország', 45, 'CS'),
(90, 'Pascal Gross', 'Középpályás', 'Németország', 45, 'KP'),
(91, 'Joao Palhinha', 'Középpályás', 'Portugália', 46, 'KP'),
(92, 'Raul Jimenez', 'Csatár', 'Mexikó', 46, 'CS'),
(93, 'Michael Olise', 'Szélső', 'Franciaország', 47, 'SZ'),
(94, 'Eberechi Eze', 'Középpályás', 'Anglia', 47, 'KP'),
(95, 'Ivan Toney', 'Csatár', 'Anglia', 48, 'CS'),
(96, 'Bryan Mbeumo', 'Szélső', 'Kamerun', 48, 'SZ'),
(97, 'Matheus Cunha', 'Csatár', 'Brazília', 49, 'CS'),
(98, 'Pedro Neto', 'Szélső', 'Portugália', 49, 'SZ'),
(99, 'Morgan Gibbs-White', 'Középpályás', 'Anglia', 50, 'KP'),
(100, 'Taiwo Awoniyi', 'Csatár', 'Nigéria', 50, 'CS'),
(101, 'Dominic Calvert-Lewin', 'Csatár', 'Anglia', 51, 'CS'),
(102, 'James Garner', 'Középpályás', 'Anglia', 51, 'KP'),
(103, 'Che Adams', 'Csatár', 'Skócia', 52, 'CS'),
(104, 'James Ward-Prowse', 'Középpályás', 'Anglia', 52, 'KP'),
(105, 'Conor Chaplin', 'Csatár', 'Anglia', 53, 'CS'),
(106, 'Leif Davis', 'Védő', 'Anglia', 53, 'HAT'),
(107, 'Jamie Vardy', 'Csatár', 'Anglia', 54, 'CS'),
(108, 'Wilfred Ndidi', 'Középpályás', 'Nigéria', 54, 'KP'),
(109, 'Dominic Solanke', 'Csatár', 'Anglia', 55, 'CS'),
(110, 'Ryan Christie', 'Középpályás', 'Skócia', 55, 'KP'),
(111, 'Lionel Messi', 'Csatár', 'Argentína', 116, 'CS'),
(112, 'Julian Alvarez', 'Csatár', 'Argentína', 116, 'CS'),
(113, 'Neymar Jr', 'Szélső', 'Brazília', 117, 'SZ'),
(114, 'Vinícius Júnior', 'Szélső', 'Brazília', 117, 'SZ'),
(115, 'Toni Kroos', 'Középpályás', 'Németország', 118, 'KP'),
(116, 'Ilkay Gundogan', 'Középpályás', 'Németország', 118, 'KP'),
(117, 'Virgil van Dijk', 'Védő', 'Hollandia', 119, 'HAT'),
(118, 'Memphis Depay', 'Csatár', 'Hollandia', 119, 'CS'),
(119, 'Gianluigi Donnarumma', 'Kapus', 'Olaszország', 120, 'KAP'),
(120, 'Nicolò Barella', 'Középpályás', 'Olaszország', 120, 'KP'),
(121, 'Kevin De Bruyne', 'Középpályás', 'Belgium', 121, 'KP'),
(122, 'Romelu Lukaku', 'Csatár', 'Belgium', 121, 'CS'),
(123, 'Luka Modrić', 'Középpályás', 'Horvátország', 122, 'KP'),
(124, 'Mateo Kovačić', 'Középpályás', 'Horvátország', 122, 'KP'),
(125, 'Christian Eriksen', 'Középpályás', 'Dánia', 123, 'KP'),
(126, 'Rasmus Højlund', 'Csatár', 'Dánia', 123, 'CS'),
(127, 'Granit Xhaka', 'Középpályás', 'Svájc', 124, 'KP'),
(128, 'Xherdan Shaqiri', 'Szélső', 'Svájc', 124, 'SZ'),
(129, 'Dušan Tadić', 'Szélső', 'Szerbia', 125, 'SZ'),
(130, 'Aleksandar Mitrović', 'Csatár', 'Szerbia', 125, 'CS'),
(131, 'Joan Garcia', 'Kapus', 'Spanyolország', 7, 'KAP'),
(132, 'Marc-André ter Stegen', 'Kapus', 'Németország', 7, 'KAP'),
(133, 'Inaki Peña', 'Kapus', 'Spanyolország', 7, 'KAP'),
(134, 'Jules Koundé', 'Védő', 'Franciaország', 7, 'HAT'),
(135, 'Ronald Araújo', 'Védő', 'Uruguay', 7, 'HAT'),
(136, 'Pau Cubarsí', 'Védő', 'Spanyolország', 7, 'HAT'),
(137, 'Andreas Christensen', 'Védő', 'Dánia', 7, 'HAT'),
(138, 'Alejandro Balde', 'Védő', 'Spanyolország', 7, 'HAT'),
(139, 'Héctor Fort', 'Védő', 'Spanyolország', 7, 'HAT'),
(140, 'Frenkie de Jong', 'Középpályás', 'Hollandia', 7, 'KP'),
(141, 'Gavi', 'Középpályás', 'Spanyolország', 7, 'KP'),
(142, 'Ilkay Gündogan', 'Középpályás', 'Németország', 7, 'KP'),
(143, 'Fermín López', 'Középpályás', 'Spanyolország', 7, 'KP'),
(144, 'Oriol Romeu', 'Középpályás', 'Spanyolország', 7, 'KP'),
(145, 'Lamine Yamal', 'Szélső', 'Spanyolország', 7, 'SZ'),
(146, 'Raphinha', 'Szélső', 'Brazília', 7, 'SZ'),
(147, 'Ferran Torres', 'Szélső', 'Spanyolország', 7, 'SZ'),
(148, 'Vitor Roque', 'Csatár', 'Brazília', 7, 'CS'),
(149, 'Ansu Fati', 'Szélső', 'Spanyolország', 7, 'SZ'),
(150, 'Hansi Dieter Flick', 'Edző', 'Németország', 7, 'EDZ'),
(151, 'Ederson Moraes', 'Kapus', 'Brazília', 1, 'KAP'),
(152, 'Stefan Ortega', 'Kapus', 'Németország', 1, 'KAP'),
(153, 'Kyle Walker', 'Védő', 'Anglia', 1, 'HAT'),
(154, 'John Stones', 'Védő', 'Anglia', 1, 'HAT'),
(155, 'Rúben Dias', 'Védő', 'Portugália', 1, 'HAT'),
(156, 'Manuel Akanji', 'Védő', 'Svájc', 1, 'HAT'),
(157, 'Nathan Aké', 'Védő', 'Hollandia', 1, 'HAT'),
(158, 'Joško Gvardiol', 'Védő', 'Horvátország', 1, 'HAT'),
(159, 'Sergio Gómez', 'Védő', 'Spanyolország', 1, 'HAT'),
(160, 'Rodri', 'Középpályás', 'Spanyolország', 1, 'KP'),
(161, 'Mateo Kovacic', 'Középpályás', 'Horvátország', 1, 'KP'),
(162, 'Bernardo Silva', 'Középpályás', 'Portugália', 1, 'KP'),
(163, 'Phil Foden', 'Középpályás', 'Anglia', 1, 'KP'),
(164, 'Matheus Nunes', 'Középpályás', 'Portugália', 1, 'KP'),
(165, 'Oscar Bobb', 'Középpályás', 'Norvégia', 1, 'KP'),
(166, 'Julián Álvarez', 'Csatár', 'Argentína', 1, 'CS'),
(167, 'Jérémy Doku', 'Szélső', 'Belgium', 1, 'SZ'),
(168, 'Jack Grealish', 'Szélső', 'Anglia', 1, 'SZ'),
(169, 'Josep Guardiola', 'Edző', 'Spanyolország', 1, 'EDZ'),
(170, 'David Raya', 'Kapus', 'Spanyolország', 2, 'KAP'),
(171, 'Aaron Ramsdale', 'Kapus', 'Anglia', 2, 'KAP'),
(172, 'William Saliba', 'Védő', 'Franciaország', 2, 'HAT'),
(173, 'Gabriel Magalhães', 'Védő', 'Brazília', 2, 'HAT'),
(174, 'Oleksandr Zinchenko', 'Védő', 'Ukrajna', 2, 'HAT'),
(175, 'Takehiro Tomiyasu', 'Védő', 'Japán', 2, 'HAT'),
(176, 'Ben White', 'Védő', 'Anglia', 2, 'HAT'),
(177, 'Jurriën Timber', 'Védő', 'Hollandia', 2, 'HAT'),
(178, 'Jakub Kiwior', 'Védő', 'Lengyelország', 2, 'HAT'),
(179, 'Declan Rice', 'Középpályás', 'Anglia', 2, 'KP'),
(180, 'Jorginho', 'Középpályás', 'Olaszország', 2, 'KP'),
(181, 'Kai Havertz', 'Középpályás', 'Németország', 2, 'KP'),
(182, 'Thomas Partey', 'Középpályás', 'Ghána', 2, 'KP'),
(183, 'Emile Smith Rowe', 'Középpályás', 'Anglia', 2, 'KP'),
(184, 'Mohamed Elneny', 'Középpályás', 'Egyiptom', 2, 'KP'),
(185, 'Gabriel Jesus', 'Csatár', 'Brazília', 2, 'CS'),
(186, 'Gabriel Martinelli', 'Szélső', 'Brazília', 2, 'SZ'),
(187, 'Leandro Trossard', 'Szélső', 'Belgium', 2, 'SZ'),
(188, 'Reiss Nelson', 'Szélső', 'Anglia', 2, 'SZ'),
(189, 'Eddie Nketiah', 'Csatár', 'Anglia', 2, 'CS'),
(190, 'Mikel Arteta', 'Edző', 'Spanyolország', 2, 'EDZ'),
(191, 'Alisson Becker', 'Kapus', 'Brazília', 3, 'KAP'),
(192, 'Caoimhín Kelleher', 'Kapus', 'Írország', 3, 'KAP'),
(193, 'Adrián', 'Kapus', 'Spanyolország', 3, 'KAP'),
(194, 'Virgil van Dijk', 'Védő', 'Hollandia', 3, 'HAT'),
(195, 'Ibrahima Konaté', 'Védő', 'Franciaország', 3, 'HAT'),
(196, 'Joe Gomez', 'Védő', 'Anglia', 3, 'HAT'),
(197, 'Andy Robertson', 'Védő', 'Skócia', 3, 'HAT'),
(198, 'Kostas Tsimikas', 'Védő', 'Görögország', 3, 'HAT'),
(199, 'Jarell Quansah', 'Védő', 'Anglia', 3, 'HAT'),
(200, 'Alexis Mac Allister', 'Középpályás', 'Argentína', 3, 'KP'),
(201, 'Dominik Szoboszlai', 'Középpályás', 'Magyarország', 3, 'KP'),
(202, 'Wataru Endo', 'Középpályás', 'Japán', 3, 'KP'),
(203, 'Curtis Jones', 'Középpályás', 'Anglia', 3, 'KP'),
(204, 'Harvey Elliott', 'Középpályás', 'Anglia', 3, 'KP'),
(205, 'Ryan Gravenberch', 'Középpályás', 'Hollandia', 3, 'KP'),
(206, 'Stefan Bajcetic', 'Középpályás', 'Spanyolország', 3, 'KP'),
(207, 'Darwin Núñez', 'Csatár', 'Uruguay', 3, 'CS'),
(208, 'Luis Díaz', 'Szélső', 'Kolumbia', 3, 'SZ'),
(209, 'Diogo Jota', 'Csatár', 'Portugália', 3, 'CS'),
(210, 'Cody Gakpo', 'Szélső', 'Hollandia', 3, 'SZ'),
(211, 'Ben Doak', 'Szélső', 'Skócia', 3, 'SZ'),
(212, 'Arne Slot', 'Edző', 'Hollandia', 3, 'EDZ'),
(213, 'Ezri Konsa', 'Védő', 'Anglia', 4, 'HAT'),
(214, 'Pau Torres', 'Védő', 'Spanyolország', 4, 'HAT'),
(215, 'Matty Cash', 'Védő', 'Lengyelország', 4, 'HAT'),
(216, 'Lucas Digne', 'Védő', 'Franciaország', 4, 'HAT'),
(217, 'Diego Carlos', 'Védő', 'Brazília', 4, 'HAT'),
(218, 'Álex Moreno', 'Védő', 'Spanyolország', 4, 'HAT'),
(219, 'Boubacar Kamara', 'Középpályás', 'Franciaország', 4, 'KP'),
(220, 'Douglas Luiz', 'Középpályás', 'Brazília', 4, 'KP'),
(221, 'Nicolò Zaniolo', 'Középpályás', 'Olaszország', 4, 'KP'),
(222, 'Leon Bailey', 'Szélső', 'Jamaica', 4, 'SZ'),
(223, 'Moussa Diaby', 'Szélső', 'Franciaország', 4, 'SZ'),
(224, 'Jhon Durán', 'Csatár', 'Kolumbia', 4, 'CS'),
(225, 'Emiliano Martínez', 'Kapus', 'Argentína', 4, 'KAP'),
(226, 'Robin Olsen', 'Kapus', 'Svédország', 4, 'KAP'),
(227, 'Unai Emery', 'Edző', 'Spanyolország', 4, 'EDZ'),
(228, 'Guglielmo Vicario', 'Kapus', 'Olaszország', 5, 'KAP'),
(229, 'Fraser Forster', 'Kapus', 'Anglia', 5, 'KAP'),
(230, 'Cristian Romero', 'Védő', 'Argentína', 5, 'HAT'),
(231, 'Micky van de Ven', 'Védő', 'Hollandia', 5, 'HAT'),
(232, 'Pedro Porro', 'Védő', 'Spanyolország', 5, 'HAT'),
(233, 'Destiny Udogie', 'Védő', 'Olaszország', 5, 'HAT'),
(234, 'Ben Davies', 'Védő', 'Wales', 5, 'HAT'),
(235, 'Radu Drăgușin', 'Védő', 'Románia', 5, 'HAT'),
(236, 'Pape Matar Sarr', 'Középpályás', 'Szenegál', 5, 'KP'),
(237, 'Yves Bissouma', 'Középpályás', 'Mali', 5, 'KP'),
(238, 'Pierre-Emile Højbjerg', 'Középpályás', 'Dánia', 5, 'KP'),
(239, 'Rodrigo Bentancur', 'Középpályás', 'Uruguay', 5, 'KP'),
(240, 'Giovani Lo Celso', 'Középpályás', 'Argentína', 5, 'KP'),
(241, 'Richarlison', 'Csatár', 'Brazília', 5, 'CS'),
(242, 'Dejan Kulusevski', 'Szélső', 'Svédország', 5, 'SZ'),
(243, 'Brennan Johnson', 'Szélső', 'Wales', 5, 'SZ'),
(244, 'Manor Solomon', 'Szélső', 'Izrael', 5, 'SZ'),
(245, 'Ange Postecoglou', 'Edző', 'Ausztrália', 5, 'EDZ'),
(246, 'Thibaut Courtois', 'Kapus', 'Belgium', 6, 'KAP'),
(247, 'Andriy Lunin', 'Kapus', 'Ukrajna', 6, 'KAP'),
(248, 'Éder Militão', 'Védő', 'Brazília', 6, 'HAT'),
(249, 'Antonio Rüdiger', 'Védő', 'Németország', 6, 'HAT'),
(250, 'David Alaba', 'Védő', 'Ausztria', 6, 'HAT'),
(251, 'Ferland Mendy', 'Védő', 'Franciaország', 6, 'HAT'),
(252, 'Daniel Carvajal', 'Védő', 'Spanyolország', 6, 'HAT'),
(253, 'Fran García', 'Védő', 'Spanyolország', 6, 'HAT'),
(254, 'Nacho Fernández', 'Védő', 'Spanyolország', 6, 'HAT'),
(255, 'Federico Valverde', 'Középpályás', 'Uruguay', 6, 'KP'),
(256, 'Luka Modrić', 'Középpályás', 'Horvátország', 6, 'KP'),
(257, 'Toni Kroos', 'Középpályás', 'Németország', 6, 'KP'),
(258, 'Aurélien Tchouaméni', 'Középpályás', 'Franciaország', 6, 'KP'),
(259, 'Eduardo Camavinga', 'Középpályás', 'Franciaország', 6, 'KP'),
(260, 'Dani Ceballos', 'Középpályás', 'Spanyolország', 6, 'KP'),
(261, 'Rodrygo Goes', 'Szélső', 'Brazília', 6, 'SZ'),
(262, 'Kylian Mbappé', 'Csatár', 'Franciaország', 6, 'CS'),
(263, 'Endrick', 'Csatár', 'Brazília', 6, 'CS'),
(264, 'Joselu', 'Csatár', 'Spanyolország', 6, 'CS'),
(265, 'Carlo Ancelotti', 'Edző', 'Olaszország', 6, 'EDZ'),
(266, 'Jan Oblak', 'Kapus', 'Szlovénia', 8, 'KAP'),
(267, 'Horatiu Moldovan', 'Kapus', 'Románia', 8, 'KAP'),
(268, 'José María Giménez', 'Védő', 'Uruguay', 8, 'HAT'),
(269, 'Stefan Savić', 'Védő', 'Montenegró', 8, 'HAT'),
(270, 'Reinildo Mandava', 'Védő', 'Mozambik', 8, 'HAT'),
(271, 'Mario Hermoso', 'Védő', 'Spanyolország', 8, 'HAT'),
(272, 'César Azpilicueta', 'Védő', 'Spanyolország', 8, 'HAT'),
(273, 'Nahuel Molina', 'Védő', 'Argentína', 8, 'HAT'),
(274, 'Rodrigo Riquelme', 'Szélső/Védő', 'Spanyolország', 8, 'HAT'),
(275, 'Koke', 'Középpályás', 'Spanyolország', 8, 'KP'),
(276, 'Marcos Llorente', 'Középpályás', 'Spanyolország', 8, 'KP'),
(277, 'Rodrigo De Paul', 'Középpályás', 'Argentína', 8, 'KP'),
(278, 'Saúl Ñíguez', 'Középpályás', 'Spanyolország', 8, 'KP'),
(279, 'Pablo Barrios', 'Középpályás', 'Spanyolország', 8, 'KP'),
(280, 'Memphis Depay', 'Csatár', 'Hollandia', 8, 'CS'),
(281, 'Samuel Lino', 'Szélső', 'Brazília', 8, 'SZ'),
(282, 'Ángel Correa', 'Csatár', 'Argentína', 8, 'CS'),
(283, 'Rodrigo Martins', 'Szélső', 'Portugália', 8, 'SZ'),
(284, 'Diego Simeone', 'Edző', 'Argentína', 8, 'EDZ'),
(285, 'Paulo Gazzaniga', 'Kapus', 'Argentína', 9, 'KAP'),
(286, 'Juan Carlos', 'Kapus', 'Spanyolország', 9, 'KAP'),
(287, 'Miguel Gutiérrez', 'Védő', 'Spanyolország', 9, 'HAT'),
(288, 'Arnau Martínez', 'Védő', 'Spanyolország', 9, 'HAT'),
(289, 'Daley Blind', 'Védő', 'Hollandia', 9, 'HAT'),
(290, 'Eric García', 'Védő', 'Spanyolország', 9, 'HAT'),
(291, 'David López', 'Védő', 'Spanyolország', 9, 'HAT'),
(292, 'Yan Couto', 'Védő', 'Brazília', 9, 'HAT'),
(293, 'Yangel Herrera', 'Középpályás', 'Venezuela', 9, 'KP'),
(294, 'Iván Martín', 'Középpályás', 'Spanyolország', 9, 'KP'),
(295, 'Pablo Torre', 'Középpályás', 'Spanyolország', 9, 'KP'),
(296, 'Portu', 'Középpályás/Szélső', 'Spanyolország', 9, 'KP'),
(297, 'Cristian Stuani', 'Csatár', 'Uruguay', 9, 'CS'),
(298, 'Sávio', 'Szélső', 'Brazília', 9, 'SZ'),
(299, 'Taty Castellanos', 'Csatár', 'Argentína', 9, 'CS'),
(300, 'Míchel', 'Edző', 'Spanyolország', 9, 'EDZ'),
(301, 'Álex Remiro', 'Kapus', 'Spanyolország', 10, 'KAP'),
(302, 'Unai Marrero', 'Kapus', 'Spanyolország', 10, 'KAP'),
(303, 'Robin Le Normand', 'Védő', 'Franciaország', 10, 'HAT'),
(304, 'Igor Zubeldia', 'Védő', 'Spanyolország', 10, 'HAT'),
(305, 'Aritz Elustondo', 'Védő', 'Spanyolország', 10, 'HAT'),
(306, 'Jon Pacheco', 'Védő', 'Spanyolország', 10, 'HAT'),
(307, 'Kieran Tierney', 'Védő', 'Skócia', 10, 'HAT'),
(308, 'Hamari Traoré', 'Védő', 'Mali', 10, 'HAT'),
(309, 'Javi Galán', 'Védő', 'Spanyolország', 10, 'HAT'),
(310, 'Brais Méndez', 'Középpályás', 'Spanyolország', 10, 'KP'),
(311, 'Mikel Merino', 'Középpályás', 'Spanyolország', 10, 'KP'),
(312, 'Beñat Turrientes', 'Középpályás', 'Spanyolország', 10, 'KP'),
(313, 'Ander Guevara', 'Középpályás', 'Spanyolország', 10, 'KP'),
(314, 'Mohamed-Ali Cho', 'Középpályás/Szélső', 'Franciaország', 10, 'KP'),
(315, 'Umar Sadiq', 'Csatár', 'Nigéria', 10, 'CS'),
(316, 'Carlos Fernández', 'Csatár', 'Spanyolország', 10, 'CS'),
(317, 'Ander Barrenetxea', 'Szélső', 'Spanyolország', 10, 'SZ'),
(318, 'Jon Magunazelaia', 'Csatár', 'Spanyolország', 10, 'CS'),
(319, 'Imanol Alguacil', 'Edző', 'Spanyolország', 10, 'EDZ'),
(320, 'Lukáš Hrádecký', 'Kapus', 'Finnország', 11, 'KAP'),
(321, 'Matej Kovář', 'Kapus', 'Csehország', 11, 'KAP'),
(322, 'Jeremie Frimpong', 'Védő', 'Hollandia', 11, 'HAT'),
(323, 'Alejandro Grimaldo', 'Védő', 'Spanyolország', 11, 'HAT'),
(324, 'Jonathan Tah', 'Védő', 'Németország', 11, 'HAT'),
(325, 'Odilon Kossounou', 'Védő', 'Elefántcsontpart', 11, 'HAT'),
(326, 'Piero Hincapié', 'Védő', 'Ecuador', 11, 'HAT'),
(327, 'Josip Stanišić', 'Védő', 'Horvátország', 11, 'HAT'),
(328, 'Granit Xhaka', 'Középpályás', 'Svájc', 11, 'KP'),
(329, 'Exequiel Palacios', 'Középpályás', 'Argentína', 11, 'KP'),
(330, 'Robert Andrich', 'Középpályás', 'Németország', 11, 'KP'),
(331, 'Patrik Schick', 'Csatár', 'Csehország', 11, 'CS'),
(332, 'Adam Hložek', 'Csatár', 'Csehország', 11, 'CS'),
(333, 'Nathan Tella', 'Szélső', 'Anglia', 11, 'SZ'),
(334, 'Xabi Alonso', 'Edző', 'Spanyolország', 11, 'EDZ'),
(335, 'Manuel Neuer', 'Kapus', 'Németország', 12, 'KAP'),
(336, 'Sven Ulreich', 'Kapus', 'Németország', 12, 'KAP'),
(337, 'Daniel Peretz', 'Kapus', 'Izrael', 12, 'KAP'),
(338, 'Matthijs de Ligt', 'Védő', 'Hollandia', 12, 'HAT'),
(339, 'Dayot Upamecano', 'Védő', 'Franciaország', 12, 'HAT'),
(340, 'Kim Min-jae', 'Védő', 'Dél-Korea', 12, 'HAT'),
(341, 'Alphonso Davies', 'Védő', 'Kanada', 12, 'HAT'),
(342, 'Noussair Mazraoui', 'Védő', 'Marokkó', 12, 'HAT'),
(343, 'Joshua Kimmich', 'Védő/Középpályás', 'Németország', 12, 'HAT'),
(344, 'Bouna Sarr', 'Védő', 'Szenegál', 12, 'HAT'),
(345, 'Leon Goretzka', 'Középpályás', 'Németország', 12, 'KP'),
(346, 'Konrad Laimer', 'Középpályás', 'Ausztria', 12, 'KP'),
(347, 'Raphaël Guerreiro', 'Középpályás/Védő', 'Portugália', 12, 'HAT'),
(348, 'Serge Gnabry', 'Szélső', 'Németország', 12, 'SZ'),
(349, 'Kingsley Coman', 'Szélső', 'Franciaország', 12, 'SZ'),
(350, 'Leroy Sané', 'Szélső', 'Németország', 12, 'SZ'),
(351, 'Eric Maxim Choupo-Moting', 'Csatár', 'Kamerun', 12, 'CS'),
(352, 'Bryan Zaragoza', 'Szélső', 'Spanyolország', 12, 'SZ'),
(353, 'Thomas Tuchel', 'Edző', 'Németország', 12, 'EDZ'),
(354, 'Alexander Nübel', 'Kapus', 'Németország', 13, 'KAP'),
(355, 'Florian Müller', 'Kapus', 'Németország', 13, 'KAP'),
(356, 'Waldemar Anton', 'Védő', 'Németország', 13, 'HAT'),
(357, 'Hiroki Ito', 'Védő', 'Japán', 13, 'HAT'),
(358, 'Dan-Axel Zagadou', 'Védő', 'Franciaország', 13, 'HAT'),
(359, 'Maximilian Mittelstädt', 'Védő', 'Németország', 13, 'HAT'),
(360, 'Josha Vagnoman', 'Védő', 'Németország', 13, 'HAT'),
(361, 'Angelo Stiller', 'Középpályás', 'Németország', 13, 'KP'),
(362, 'Enzo Millot', 'Középpályás', 'Franciaország', 13, 'KP'),
(363, 'Atakan Karazor', 'Középpályás', 'Németország', 13, 'KP'),
(364, 'Lilander Egloff', 'Középpályás', 'Németország', 13, 'KP'),
(365, 'Deniz Undav', 'Csatár', 'Németország', 13, 'CS'),
(366, 'Silas Katompa Mvumpa', 'Szélső', 'Kongói DK', 13, 'SZ'),
(367, 'Jamie Leweling', 'Szélső', 'Németország', 13, 'SZ'),
(368, 'Sebastian Hoeneß', 'Edző', 'Németország', 13, 'EDZ'),
(369, 'Janis Blaswich', 'Kapus', 'Németország', 14, 'KAP'),
(370, 'Peter Gulácsi', 'Kapus', 'Magyarország', 14, 'KAP'),
(371, 'Willi Orbán', 'Védő', 'Magyarország', 14, 'HAT'),
(372, 'Mohamed Simakan', 'Védő', 'Franciaország', 14, 'HAT'),
(373, 'David Raum', 'Védő', 'Németország', 14, 'HAT'),
(374, 'Castello Lukeba', 'Védő', 'Franciaország', 14, 'HAT'),
(375, 'Benjamin Henrichs', 'Védő', 'Németország', 14, 'HAT'),
(376, 'Amadou Haidara', 'Középpályás', 'Mali', 14, 'KP'),
(377, 'Kevin Kampl', 'Középpályás', 'Szlovénia', 14, 'KP'),
(378, 'Nicolas Seiwald', 'Középpályás', 'Ausztria', 14, 'KP'),
(379, 'Eljif Elmas', 'Középpályás', 'Észak-Macedónia', 14, 'KP'),
(380, 'Benjamin Šeško', 'Csatár', 'Szlovénia', 14, 'CS'),
(381, 'Timo Werner', 'Csatár', 'Németország', 14, 'CS'),
(382, 'Christoph Baumgartner', 'Szélső', 'Ausztria', 14, 'SZ'),
(383, 'Yussuf Poulsen', 'Csatár', 'Dánia', 14, 'CS'),
(384, 'Marco Rose', 'Edző', 'Németország', 14, 'EDZ'),
(385, 'Gregor Kobel', 'Kapus', 'Svájc', 15, 'KAP'),
(386, 'Alexander Meyer', 'Kapus', 'Németország', 15, 'KAP'),
(387, 'Mats Hummels', 'Védő', 'Németország', 15, 'HAT'),
(388, 'Nico Schlotterbeck', 'Védő', 'Németország', 15, 'HAT'),
(389, 'Ian Maatsen', 'Védő', 'Hollandia', 15, 'HAT'),
(390, 'Julian Ryerson', 'Védő', 'Norvégia', 15, 'HAT'),
(391, 'Thomas Meunier', 'Védő', 'Belgium', 15, 'HAT'),
(392, 'Emre Can', 'Középpályás', 'Németország', 15, 'KP'),
(393, 'Marcel Sabitzer', 'Középpályás', 'Ausztria', 15, 'KP'),
(394, 'Salih Özcan', 'Középpályás', 'Törökország', 15, 'KP'),
(395, 'Felix Nmecha', 'Középpályás', 'Németország', 15, 'KP'),
(396, 'Karim Adeyemi', 'Szélső', 'Németország', 15, 'SZ'),
(397, 'Donyell Malen', 'Szélső', 'Hollandia', 15, 'SZ'),
(398, 'Youssoufa Moukoko', 'Csatár', 'Németország', 15, 'CS'),
(399, 'Sebastien Haller', 'Csatár', 'Elefántcsontpart', 15, 'CS'),
(400, 'Edin Terzić', 'Edző', 'Németország', 15, 'EDZ'),
(401, 'Yann Sommer', 'Kapus', 'Svájc', 16, 'KAP'),
(402, 'Emil Audero', 'Kapus', 'Olaszország', 16, 'KAP'),
(403, 'Francesco Acerbi', 'Védő', 'Olaszország', 16, 'HAT'),
(404, 'Matteo Darmian', 'Védő', 'Olaszország', 16, 'HAT'),
(405, 'Stefan de Vrij', 'Védő', 'Hollandia', 16, 'HAT'),
(406, 'Benjamin Pavard', 'Védő', 'Franciaország', 16, 'HAT'),
(407, 'Denzel Dumfries', 'Védő', 'Hollandia', 16, 'HAT'),
(408, 'Carlos Augusto', 'Védő', 'Brazília', 16, 'HAT'),
(409, 'Hakan Çalhanoğlu', 'Középpályás', 'Törökország', 16, 'KP'),
(410, 'Henrikh Mkhitaryan', 'Középpályás', 'Örményország', 16, 'KP'),
(411, 'Davide Frattesi', 'Középpályás', 'Olaszország', 16, 'KP'),
(412, 'Kristjan Asllani', 'Középpályás', 'Albánia', 16, 'KP'),
(413, 'Marcus Thuram', 'Csatár', 'Franciaország', 16, 'CS'),
(414, 'Marko Arnautović', 'Csatár', 'Ausztria', 16, 'CS'),
(415, 'Alexis Sánchez', 'Csatár', 'Chile', 16, 'CS'),
(416, 'Simone Inzaghi', 'Edző', 'Olaszország', 16, 'EDZ'),
(417, 'Mike Maignan', 'Kapus', 'Franciaország', 17, 'KAP'),
(418, 'Marco Sportiello', 'Kapus', 'Olaszország', 17, 'KAP'),
(419, 'Theo Hernández', 'Védő', 'Franciaország', 17, 'HAT'),
(420, 'Fikayo Tomori', 'Védő', 'Anglia', 17, 'HAT'),
(421, 'Malick Thiaw', 'Védő', 'Németország', 17, 'HAT'),
(422, 'Davide Calabria', 'Védő', 'Olaszország', 17, 'HAT'),
(423, 'Alessandro Florenzi', 'Védő', 'Olaszország', 17, 'HAT'),
(424, 'Ruben Loftus-Cheek', 'Középpályás', 'Anglia', 17, 'KP'),
(425, 'Tijjani Reijnders', 'Középpályás', 'Hollandia', 17, 'KP'),
(426, 'Ismaël Bennacer', 'Középpályás', 'Algéria', 17, 'KP'),
(427, 'Yunus Musah', 'Középpályás', 'USA', 17, 'KP'),
(428, 'Noah Okafor', 'Csatár', 'Svájc', 17, 'CS'),
(429, 'Christian Pulisic', 'Szélső', 'USA', 17, 'SZ'),
(430, 'Samuel Chukwueze', 'Szélső', 'Nigéria', 17, 'SZ'),
(431, 'Luka Jović', 'Csatár', 'Szerbia', 17, 'CS'),
(432, 'Stefano Pioli', 'Edző', 'Olaszország', 17, 'EDZ'),
(433, 'Wojciech Szczęsny', 'Kapus', 'Lengyelország', 18, 'KAP'),
(434, 'Mattia Perin', 'Kapus', 'Olaszország', 18, 'KAP'),
(435, 'Gleison Bremer', 'Védő', 'Brazília', 18, 'HAT'),
(436, 'Danilo', 'Védő', 'Brazília', 18, 'HAT'),
(437, 'Alex Sandro', 'Védő', 'Brazília', 18, 'HAT'),
(438, 'Federico Gatti', 'Védő', 'Olaszország', 18, 'HAT'),
(439, 'Andrea Cambiaso', 'Védő', 'Olaszország', 18, 'HAT'),
(440, 'Adrien Rabiot', 'Középpályás', 'Franciaország', 18, 'KP'),
(441, 'Manuel Locatelli', 'Középpályás', 'Olaszország', 18, 'KP'),
(442, 'Weston McKennie', 'Középpályás', 'USA', 18, 'KP'),
(443, 'Fabio Miretti', 'Középpályás', 'Olaszország', 18, 'KP'),
(444, 'Nicolo Fagioli', 'Középpályás', 'Olaszország', 18, 'KP'),
(445, 'Arkadiusz Milik', 'Csatár', 'Lengyelország', 18, 'CS'),
(446, 'Moise Kean', 'Csatár', 'Olaszország', 18, 'CS'),
(447, 'Kenan Yıldız', 'Szélső', 'Törökország', 18, 'SZ'),
(448, 'Massimiliano Allegri', 'Edző', 'Olaszország', 18, 'EDZ'),
(449, 'Alex Meret', 'Kapus', 'Olaszország', 19, 'KAP'),
(450, 'Pierluigi Gollini', 'Kapus', 'Olaszország', 19, 'KAP'),
(451, 'Giovanni Di Lorenzo', 'Védő', 'Olaszország', 19, 'HAT'),
(452, 'Amir Rrahmani', 'Védő', 'Koszovó', 19, 'HAT'),
(453, 'Leo Østigård', 'Védő', 'Norvégia', 19, 'HAT'),
(454, 'Mathías Olivera', 'Védő', 'Uruguay', 19, 'HAT'),
(455, 'Natan', 'Védő', 'Brazília', 19, 'HAT'),
(456, 'Stanislav Lobotka', 'Középpályás', 'Szlovákia', 19, 'KP'),
(457, 'Piotr Zieliński', 'Középpályás', 'Lengyelország', 19, 'KP'),
(458, 'André-Frank Zambo Anguissa', 'Középpályás', 'Kamerun', 19, 'KP'),
(459, 'Eljif Elmas', 'Középpályás', 'Észak-Macedónia', 19, 'KP'),
(460, 'Giacomo Raspadori', 'Csatár', 'Olaszország', 19, 'CS'),
(461, 'Matteo Politano', 'Szélső', 'Olaszország', 19, 'SZ'),
(462, 'Giovanni Simeone', 'Csatár', 'Argentína', 19, 'CS'),
(463, 'Walter Mazzarri', 'Edző', 'Olaszország', 19, 'EDZ'),
(464, 'Juan Musso', 'Kapus', 'Argentína', 20, 'KAP'),
(465, 'Marco Carnesecchi', 'Kapus', 'Olaszország', 20, 'KAP'),
(466, 'Sead Kolašinac', 'Védő', 'Bosznia-Hercegovina', 20, 'HAT'),
(467, 'Giorgio Scalvini', 'Védő', 'Olaszország', 20, 'HAT'),
(468, 'Berat Djimsiti', 'Védő', 'Albánia', 20, 'HAT'),
(469, 'Rafael Tolói', 'Védő', 'Olaszország', 20, 'HAT'),
(470, 'Hans Hateboer', 'Védő', 'Hollandia', 20, 'HAT'),
(471, 'Ederson', 'Középpályás', 'Brazília', 20, 'KP'),
(472, 'Marten de Roon', 'Középpályás', 'Hollandia', 20, 'KP'),
(473, 'Mario Pašalić', 'Középpályás', 'Horvátország', 20, 'KP'),
(474, 'Michel Adopo', 'Középpályás', 'Franciaország', 20, 'KP'),
(475, 'Ademola Lookman', 'Szélső', 'Nigéria', 20, 'SZ'),
(476, 'Luis Muriel', 'Csatár', 'Kolumbia', 20, 'CS'),
(477, 'El Bilal Touré', 'Csatár', 'Mali', 20, 'CS'),
(478, 'Gian Piero Gasperini', 'Edző', 'Olaszország', 20, 'EDZ'),
(479, 'Gianluigi Donnarumma', 'Kapus', 'Olaszország', 21, 'KAP'),
(480, 'Arnau Tenas', 'Kapus', 'Spanyolország', 21, 'KAP'),
(481, 'Marquinhos', 'Védő', 'Brazília', 21, 'HAT'),
(482, 'Achraf Hakimi', 'Védő', 'Marokkó', 21, 'HAT'),
(483, 'Milan Škriniar', 'Védő', 'Szlovákia', 21, 'HAT'),
(484, 'Lucas Hernández', 'Védő', 'Franciaország', 21, 'HAT'),
(485, 'Nordi Mukiele', 'Védő', 'Franciaország', 21, 'HAT'),
(486, 'Vitinha', 'Középpályás', 'Portugália', 21, 'KP'),
(487, 'Warren Zaïre-Emery', 'Középpályás', 'Franciaország', 21, 'KP'),
(488, 'Manuel Ugarte', 'Középpályás', 'Uruguay', 21, 'KP'),
(489, 'Fabián Ruiz', 'Középpályás', 'Spanyolország', 21, 'KP'),
(490, 'Randal Kolo Muani', 'Csatár', 'Franciaország', 21, 'CS'),
(491, 'Gonçalo Ramos', 'Csatár', 'Portugália', 21, 'CS'),
(492, 'Marco Asensio', 'Szélső', 'Spanyolország', 21, 'SZ'),
(493, 'Bradley Barcola', 'Szélső', 'Franciaország', 21, 'SZ'),
(494, 'Luis Enrique', 'Edző', 'Spanyolország', 21, 'EDZ'),
(495, 'Philipp Köhn', 'Kapus', 'Svájc', 22, 'KAP'),
(496, 'Radosław Majecki', 'Kapus', 'Lengyelország', 22, 'KAP'),
(497, 'Guillermo Maripán', 'Védő', 'Chile', 22, 'HAT'),
(498, 'Caio Henrique', 'Védő', 'Brazília', 22, 'HAT'),
(499, 'Axel Disasi', 'Védő', 'Franciaország', 22, 'HAT'),
(500, 'Vanderson', 'Védő', 'Brazília', 22, 'HAT'),
(501, 'Ismail Jakobs', 'Védő', 'Szenegál', 22, 'HAT'),
(502, 'Youssouf Fofana', 'Középpályás', 'Franciaország', 22, 'KP'),
(503, 'Mohamed Camara', 'Középpályás', 'Mali', 22, 'KP'),
(504, 'Denis Zakaria', 'Középpályás', 'Svájc', 22, 'KP'),
(505, 'Eliesse Ben Seghir', 'Középpályás', 'Franciaország', 22, 'KP'),
(506, 'Aleksandr Golovin', 'Szélső', 'Oroszország', 22, 'SZ'),
(507, 'Breel Embolo', 'Csatár', 'Svájc', 22, 'CS'),
(508, 'Folarin Balogun', 'Csatár', 'USA', 22, 'CS'),
(509, 'Adi Hütter', 'Edző', 'Ausztria', 22, 'EDZ'),
(510, 'Lucas Chevalier', 'Kapus', 'Franciaország', 23, 'KAP'),
(511, 'Vito Mannone', 'Kapus', 'Olaszország', 23, 'KAP'),
(512, 'Tiago Djaló', 'Védő', 'Portugália', 23, 'HAT'),
(513, 'Alexsandro Ribeiro', 'Védő', 'Brazília', 23, 'HAT'),
(514, 'Gabriel Gudmundsson', 'Védő', 'Svédország', 23, 'HAT'),
(515, 'Bafodé Diakité', 'Védő', 'Franciaország', 23, 'HAT'),
(516, 'Ismaily', 'Védő', 'Brazília', 23, 'HAT'),
(517, 'Benjamin André', 'Középpályás', 'Franciaország', 23, 'KP'),
(518, 'Yusuf Yazıcı', 'Középpályás', 'Törökország', 23, 'KP'),
(519, 'Nabil Bentaleb', 'Középpályás', 'Algéria', 23, 'KP'),
(520, 'Angel Gomes', 'Középpályás', 'Anglia', 23, 'KP'),
(521, 'Rémy Cabella', 'Szélső', 'Franciaország', 23, 'SZ'),
(522, 'Jonathan Bamba', 'Szélső', 'Franciaország', 23, 'SZ'),
(523, 'Mohamed Bayo', 'Csatár', 'Guinea', 23, 'CS'),
(524, 'Paulo Fonseca', 'Edző', 'Portugália', 23, 'EDZ'),
(525, 'Pau López', 'Kapus', 'Spanyolország', 24, 'KAP'),
(526, 'Rubén Blanco', 'Kapus', 'Spanyolország', 24, 'KAP'),
(527, 'Samuel Gigot', 'Védő', 'Franciaország', 24, 'HAT'),
(528, 'Chancel Mbemba', 'Védő', 'Kongó', 24, 'HAT'),
(529, 'Leonardo Balerdi', 'Védő', 'Argentína', 24, 'HAT'),
(530, 'Renan Lodi', 'Védő', 'Brazília', 24, 'HAT'),
(531, 'Jonathan Clauss', 'Védő', 'Franciaország', 24, 'HAT'),
(532, 'Geoffrey Kondogbia', 'Középpályás', 'Közép-afrikai Köztársaság', 24, 'KP'),
(533, 'Valentin Rongier', 'Középpályás', 'Franciaország', 24, 'KP'),
(534, 'Azzedine Ounahi', 'Középpályás', 'Marokkó', 24, 'KP'),
(535, 'Pape Gueye', 'Középpályás', 'Szenegál', 24, 'KP'),
(536, 'Ismaïla Sarr', 'Szélső', 'Szenegál', 24, 'SZ'),
(537, 'Iliman Ndiaye', 'Csatár', 'Szenegál', 24, 'CS'),
(538, 'Amine Harit', 'Szélső', 'Marokkó', 24, 'SZ'),
(539, 'Gennaro Gattuso', 'Edző', 'Olaszország', 24, 'EDZ'),
(540, 'Marcin Bułka', 'Kapus', 'Lengyelország', 25, 'KAP'),
(541, 'Salvatore Sirigu', 'Kapus', 'Olaszország', 25, 'KAP'),
(542, 'Jean-Clair Todibo', 'Védő', 'Franciaország', 25, 'HAT'),
(543, 'Dante', 'Védő', 'Brazília', 25, 'HAT'),
(544, 'Melvin Bard', 'Védő', 'Franciaország', 25, 'HAT'),
(545, 'Jordan Lotomba', 'Védő', 'Svájc', 25, 'HAT'),
(546, 'Youssouf Ndayishimiye', 'Védő', 'Burundi', 25, 'HAT'),
(547, 'Khephren Thuram', 'Középpályás', 'Franciaország', 25, 'KP'),
(548, 'Morgan Sanson', 'Középpályás', 'Franciaország', 25, 'KP'),
(549, 'Hicham Boudaoui', 'Középpályás', 'Algéria', 25, 'KP'),
(550, 'Pablo Rosario', 'Középpályás', 'Hollandia', 25, 'KP'),
(551, 'Jeremie Boga', 'Szélső', 'Elefántcsontpart', 25, 'SZ'),
(552, 'Sofiane Diop', 'Szélső', 'Franciaország', 25, 'SZ'),
(553, 'Evann Guessand', 'Csatár', 'Franciaország', 25, 'CS'),
(554, 'Francesco Farioli', 'Edző', 'Olaszország', 25, 'EDZ'),
(555, 'Pietro Terracciano', 'Kapus', 'Olaszország', 31, 'KAP'),
(556, 'Oliver Christensen', 'Kapus', 'Dánia', 31, 'KAP'),
(557, 'Nikola Milenković', 'Védő', 'Szerbia', 31, 'HAT'),
(558, 'Cristiano Biraghi', 'Védő', 'Olaszország', 31, 'HAT'),
(559, 'Lucas Martínez Quarta', 'Védő', 'Argentína', 31, 'HAT'),
(560, 'Dodo', 'Védő', 'Brazília', 31, 'HAT'),
(561, 'Fabiano Parisi', 'Védő', 'Olaszország', 31, 'HAT'),
(562, 'Giacomo Bonaventura', 'Középpályás', 'Olaszország', 31, 'KP'),
(563, 'Rolando Mandragora', 'Középpályás', 'Olaszország', 31, 'KP'),
(564, 'Alfred Duncan', 'Középpályás', 'Ghána', 31, 'KP'),
(565, 'Arthur Melo', 'Középpályás', 'Brazília', 31, 'KP'),
(566, 'Cristian Kouamé', 'Szélső', 'Elefántcsontpart', 31, 'SZ'),
(567, 'Jonathan Ikoné', 'Szélső', 'Franciaország', 31, 'SZ'),
(568, 'M Bala Nzola', 'Csatár', 'Angola', 31, 'CS'),
(569, 'Vincenzo Italiano', 'Edző', 'Olaszország', 31, 'EDZ'),
(570, 'Simon Mignolet', 'Kapus', 'Belgium', 33, 'KAP'),
(571, 'Senne Lammens', 'Kapus', 'Belgium', 33, 'KAP'),
(572, 'Brandon Mechele', 'Védő', 'Belgium', 33, 'HAT'),
(573, 'Jack Hendry', 'Védő', 'Skócia', 33, 'HAT'),
(574, 'Bjorn Meijer', 'Védő', 'Hollandia', 33, 'HAT'),
(575, 'Denis Odoi', 'Védő', 'Ghána', 33, 'HAT'),
(576, 'Casper Nielsen', 'Középpályás', 'Dánia', 33, 'KP'),
(577, 'Raphael Onyedika', 'Középpályás', 'Nigéria', 33, 'KP'),
(578, 'Eder Balanta', 'Középpályás', 'Kolumbia', 33, 'KP'),
(579, 'Noa Lang', 'Szélső', 'Hollandia', 33, 'SZ'),
(580, 'Roman Yaremchuk', 'Csatár', 'Ukrajna', 33, 'CS'),
(581, 'Ferrán Jutglà', 'Csatár', 'Spanyolország', 33, 'CS'),
(582, 'Ronny Deila', 'Edző', 'Norvégia', 33, 'EDZ'),
(583, 'Dominik Kotarski', 'Kapus', 'Horvátország', 35, 'KAP'),
(584, 'Živko Živković', 'Kapus', 'Szerbia', 35, 'KAP'),
(585, 'Giannis Michailidis', 'Védő', 'Görögország', 35, 'HAT'),
(586, 'Tomasz Kędziora', 'Védő', 'Lengyelország', 35, 'HAT'),
(587, 'Khaled Narey', 'Védő', 'Németország', 35, 'HAT'),
(588, 'Marwan Mohamed', 'Védő', 'Görögország', 35, 'HAT'),
(589, 'Soualiho Meïté', 'Középpályás', 'Elefántcsontpart', 35, 'KP'),
(590, 'Stefan Schwab', 'Középpályás', 'Ausztria', 35, 'KP'),
(591, 'Thomas Murg', 'Középpályás', 'Ausztria', 35, 'KP'),
(592, 'Giannis Konstantelias', 'Középpályás', 'Görögország', 35, 'KP'),
(593, 'Brandon Thomas', 'Csatár', 'Spanyolország', 35, 'CS'),
(594, 'Taison', 'Szélső', 'Brazília', 35, 'SZ'),
(595, 'Khaled Narey', 'Szélső', 'Németország', 35, 'SZ'),
(596, 'Răzvan Lucescu', 'Edző', 'Románia', 35, 'EDZ'),
(597, 'Mike Maignan', 'Kapus', 'Franciaország', 36, 'KAP'),
(598, 'Alphonse Areola', 'Kapus', 'Franciaország', 36, 'KAP'),
(599, 'Jules Koundé', 'Védő', 'Franciaország', 36, 'HAT'),
(600, 'Dayot Upamecano', 'Védő', 'Franciaország', 36, 'HAT'),
(601, 'William Saliba', 'Védő', 'Franciaország', 36, 'HAT'),
(602, 'Lucas Hernández', 'Védő', 'Franciaország', 36, 'HAT'),
(603, 'Benjamin Pavard', 'Védő', 'Franciaország', 36, 'HAT'),
(604, 'Theo Hernández', 'Védő', 'Franciaország', 36, 'HAT'),
(605, 'Aurélien Tchouaméni', 'Középpályás', 'Franciaország', 36, 'KP'),
(606, 'Adrien Rabiot', 'Középpályás', 'Franciaország', 36, 'KP'),
(607, 'Eduardo Camavinga', 'Középpályás', 'Franciaország', 36, 'KP'),
(608, 'Youssouf Fofana', 'Középpályás', 'Franciaország', 36, 'KP'),
(609, 'Ousmane Dembélé', 'Szélső', 'Franciaország', 36, 'SZ'),
(610, 'Olivier Giroud', 'Csatár', 'Franciaország', 36, 'CS'),
(611, 'Kingsley Coman', 'Szélső', 'Franciaország', 36, 'SZ'),
(612, 'Randal Kolo Muani', 'Csatár', 'Franciaország', 36, 'CS'),
(613, 'Didier Deschamps', 'Edző', 'Franciaország', 36, 'EDZ'),
(614, 'Jordan Pickford', 'Kapus', 'Anglia', 37, 'KAP'),
(615, 'Aaron Ramsdale', 'Kapus', 'Anglia', 37, 'KAP'),
(616, 'Kyle Walker', 'Védő', 'Anglia', 37, 'HAT'),
(617, 'John Stones', 'Védő', 'Anglia', 37, 'HAT'),
(618, 'Harry Maguire', 'Védő', 'Anglia', 37, 'HAT'),
(619, 'Luke Shaw', 'Védő', 'Anglia', 37, 'HAT'),
(620, 'Kieran Trippier', 'Védő', 'Anglia', 37, 'HAT'),
(621, 'Ben Chilwell', 'Védő', 'Anglia', 37, 'HAT'),
(622, 'Jude Bellingham', 'Középpályás', 'Anglia', 37, 'KP'),
(623, 'Mason Mount', 'Középpályás', 'Anglia', 37, 'KP'),
(624, 'Phil Foden', 'Középpályás', 'Anglia', 37, 'KP'),
(625, 'Conor Gallagher', 'Középpályás', 'Anglia', 37, 'KP'),
(626, 'Bukayo Saka', 'Szélső', 'Anglia', 37, 'SZ'),
(627, 'Marcus Rashford', 'Szélső', 'Anglia', 37, 'SZ'),
(628, 'Jack Grealish', 'Szélső', 'Anglia', 37, 'SZ'),
(629, 'Ivan Toney', 'Csatár', 'Anglia', 37, 'CS'),
(630, 'Gareth Southgate', 'Edző', 'Anglia', 37, 'EDZ'),
(631, 'Diogo Costa', 'Kapus', 'Portugália', 38, 'KAP'),
(632, 'Rui Patrício', 'Kapus', 'Portugália', 38, 'KAP'),
(633, 'Rúben Dias', 'Védő', 'Portugália', 38, 'HAT'),
(634, 'João Cancelo', 'Védő', 'Portugália', 38, 'HAT'),
(635, 'Pepe', 'Védő', 'Portugália', 38, 'HAT'),
(636, 'Nuno Mendes', 'Védő', 'Portugália', 38, 'HAT'),
(637, 'Diogo Dalot', 'Védő', 'Portugália', 38, 'HAT'),
(638, 'Vitinha', 'Középpályás', 'Portugália', 38, 'KP'),
(639, 'Bernardo Silva', 'Középpályás', 'Portugália', 38, 'KP'),
(640, 'João Palhinha', 'Középpályás', 'Portugália', 38, 'KP'),
(641, 'João Félix', 'Csatár', 'Portugália', 38, 'CS'),
(642, 'Rafael Leão', 'Szélső', 'Portugália', 38, 'SZ'),
(643, 'Gonçalo Ramos', 'Csatár', 'Portugália', 38, 'CS'),
(644, 'Roberto Martínez', 'Edző', 'Spanyolország', 38, 'EDZ');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ligak`
--

CREATE TABLE `ligak` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `kep` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `ligak`
--

INSERT INTO `ligak` (`id`, `nev`, `kep`) VALUES
(1, 'Premier League', 'Premier_League.jpg'),
(2, 'La Liga', 'laliga.jpg'),
(3, 'Bundesliga', 'Bundesliga.jpg'),
(4, 'Serie A', 'Serie_A.jpg'),
(5, 'Ligue 1', 'Ligue_1.jpg'),
(6, 'Bajnokok Ligája', 'Champions_League.jpg'),
(7, 'Európa Konferencia Liga', 'UECL.jpg'),
(8, 'VB-selejtező', 'FIFA_World_Cup.jpg');

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
(6, 31, 32, '2025-09-15 00:00:00', 7, NULL),
(7, 1, 2, '2025-08-15 18:00:00', 1, '2-1'),
(8, 3, 4, '2025-08-16 20:45:00', 1, '1-1'),
(9, 6, 7, '2025-08-17 17:30:00', 2, '3-2'),
(10, 8, 9, '2025-09-04 21:00:00', 2, '0-0'),
(11, 26, 27, '2025-09-10 19:00:00', 6, '3-0'),
(12, 31, 32, '2025-09-15 20:30:00', 7, '2-2'),
(13, 10, 11, '2025-09-20 18:00:00', 1, '1-0'),
(14, 12, 13, '2025-09-21 20:45:00', 1, '2-2'),
(15, 14, 15, '2025-09-22 19:30:00', 2, '3-1'),
(16, 16, 17, '2025-09-23 18:30:00', 2, '0-1'),
(17, 18, 19, '2025-09-24 21:00:00', 3, '1-3'),
(18, 20, 21, '2025-09-25 20:45:00', 3, '2-0'),
(19, 22, 23, '2025-09-26 18:00:00', 4, '2-1'),
(20, 24, 25, '2025-09-27 21:00:00', 4, '0-0'),
(21, 27, 28, '2025-09-28 17:15:00', 5, '1-4'),
(22, 29, 30, '2025-09-29 20:00:00', 5, '3-3'),
(23, 33, 34, '2025-10-01 18:00:00', 6, '1-0'),
(24, 35, 36, '2025-10-02 20:45:00', 6, '2-2'),
(25, 37, 38, '2025-10-03 19:00:00', 7, '4-2'),
(26, 39, 40, '2025-10-04 21:00:00', 7, '0-1'),
(27, 41, 42, '2025-10-05 20:45:00', 1, '3-0'),
(28, 43, 44, '2025-10-06 18:00:00', 1, '1-2'),
(29, 45, 46, '2025-10-07 17:30:00', 2, '2-2'),
(30, 47, 48, '2025-10-08 21:00:00', 2, '1-0'),
(31, 49, 50, '2025-10-10 20:00:00', 3, '2-3'),
(32, 51, 52, '2025-10-11 18:30:00', 3, '0-0'),
(33, 53, 54, '2025-10-12 19:45:00', 4, '3-1'),
(34, 55, 56, '2025-10-13 21:00:00', 4, '1-1'),
(35, 57, 58, '2025-10-15 20:45:00', 5, '4-0'),
(36, 59, 60, '2025-10-16 18:00:00', 5, '2-1');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `meccsek_statisztika`
--

CREATE TABLE `meccsek_statisztika` (
  `id` int(11) NOT NULL,
  `meccs_id` int(11) NOT NULL,
  `jatekos_id` int(11) DEFAULT NULL,
  `csapat_id` int(11) DEFAULT NULL,
  `perc` int(11) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `meccsek_statisztika`
--

INSERT INTO `meccsek_statisztika` (`id`, `meccs_id`, `jatekos_id`, `csapat_id`, `perc`, `type`) VALUES
(5, 3, 11, 6, 23, 'gol'),
(6, 3, 12, 6, 67, 'gol'),
(7, 3, 11, 6, 81, 'gol'),
(8, 3, NULL, 6, 12, 'szoglet'),
(9, 3, NULL, 6, 34, 'szoglet'),
(10, 3, NULL, 6, 71, 'szoglet'),
(11, 3, NULL, 6, 88, 'szoglet'),
(12, 3, 13, 7, 15, 'gol'),
(13, 3, 14, 7, 45, 'gol'),
(14, 3, NULL, 7, 8, 'szoglet'),
(15, 3, NULL, 7, 27, 'szoglet'),
(16, 3, NULL, 7, 52, 'szoglet'),
(17, 3, NULL, 7, 78, 'szoglet'),
(21, 3, NULL, NULL, 93, 'ended'),
(22, 13, 21, 10, 37, 'gol'),
(23, 13, NULL, 10, 8, 'szoglet'),
(24, 13, NULL, 10, 24, 'szoglet'),
(25, 13, NULL, 10, 45, 'szoglet'),
(26, 13, NULL, 10, 62, 'szoglet'),
(27, 13, NULL, 10, 78, 'szoglet'),
(28, 13, NULL, 10, 88, 'szoglet'),
(29, 13, 22, 11, 15, 'sarga_lap'),
(30, 13, NULL, 11, 19, 'szoglet'),
(31, 13, NULL, 11, 41, 'szoglet'),
(32, 13, NULL, 11, 70, 'szoglet'),
(33, 13, NULL, NULL, 94, 'ended'),
(34, 14, 23, 12, 22, 'gol'),
(35, 14, 24, 12, 68, 'gol'),
(36, 14, NULL, 12, 5, 'szoglet'),
(37, 14, NULL, 12, 29, 'szoglet'),
(38, 14, NULL, 12, 44, 'szoglet'),
(39, 14, NULL, 12, 73, 'szoglet'),
(40, 14, NULL, 12, 90, 'szoglet'),
(41, 14, 25, 13, 45, 'gol'),
(42, 14, 26, 13, 81, 'gol'),
(43, 14, NULL, 13, 12, 'szoglet'),
(44, 14, NULL, 13, 36, 'szoglet'),
(45, 14, NULL, 13, 59, 'szoglet'),
(46, 14, NULL, 13, 85, 'szoglet'),
(47, 14, 27, 14, 55, 'sarga_lap'),
(48, 14, NULL, NULL, 96, 'ended'),
(49, 15, 28, 14, 14, 'gol'),
(50, 15, 27, 14, 33, 'gol'),
(51, 15, 28, 14, 78, 'gol'),
(52, 15, NULL, 14, 10, 'szoglet'),
(53, 15, NULL, 14, 27, 'szoglet'),
(54, 15, NULL, 14, 45, 'szoglet'),
(55, 15, NULL, 14, 63, 'szoglet'),
(56, 15, NULL, 14, 80, 'szoglet'),
(57, 15, 29, 15, 55, 'gol'),
(58, 15, NULL, 15, 6, 'szoglet'),
(59, 15, NULL, 15, 38, 'szoglet'),
(60, 15, NULL, 15, 71, 'szoglet'),
(61, 15, 30, 15, 42, 'sarga_lap'),
(62, 15, 31, 16, 89, 'sarga_lap'),
(63, 15, NULL, NULL, 93, 'ended'),
(64, 16, 32, 16, 44, 'sarga_lap'),
(65, 16, 33, 17, 29, 'gol'),
(66, 16, NULL, 16, 15, 'szoglet'),
(67, 16, NULL, 16, 48, 'szoglet'),
(68, 16, NULL, 16, 77, 'szoglet'),
(69, 16, NULL, 17, 22, 'szoglet'),
(70, 16, NULL, 17, 55, 'szoglet'),
(71, 16, NULL, 17, 84, 'szoglet'),
(72, 16, NULL, NULL, 92, 'ended'),
(73, 17, 34, 18, 12, 'gol'),
(74, 17, NULL, 18, 8, 'szoglet'),
(75, 17, NULL, 18, 34, 'szoglet'),
(76, 17, NULL, 18, 66, 'szoglet'),
(77, 17, 35, 19, 23, 'gol'),
(78, 17, 36, 19, 58, 'gol'),
(79, 17, 37, 19, 74, 'gol'),
(80, 17, NULL, 19, 19, 'szoglet'),
(81, 17, NULL, 19, 44, 'szoglet'),
(82, 17, NULL, 19, 70, 'szoglet'),
(83, 17, NULL, 19, 88, 'szoglet'),
(84, 17, 38, 19, 41, 'sarga_lap'),
(85, 17, NULL, NULL, 95, 'ended'),
(86, 18, 39, 20, 31, 'gol'),
(87, 18, 40, 20, 67, 'gol'),
(88, 18, NULL, 20, 12, 'szoglet'),
(89, 18, NULL, 20, 28, 'szoglet'),
(90, 18, NULL, 20, 55, 'szoglet'),
(91, 18, NULL, 20, 79, 'szoglet'),
(92, 18, 41, 21, 44, 'sarga_lap'),
(93, 18, NULL, 21, 16, 'szoglet'),
(94, 18, NULL, 21, 48, 'szoglet'),
(95, 18, NULL, 21, 83, 'szoglet'),
(96, 18, NULL, NULL, 91, 'ended'),
(97, 19, 42, 22, 18, 'gol'),
(98, 19, 43, 22, 65, 'gol'),
(99, 19, NULL, 22, 7, 'szoglet'),
(100, 19, NULL, 22, 33, 'szoglet'),
(101, 19, NULL, 22, 60, 'szoglet'),
(102, 19, NULL, 22, 85, 'szoglet'),
(103, 19, 44, 23, 42, 'gol'),
(104, 19, NULL, 23, 14, 'szoglet'),
(105, 19, NULL, 23, 39, 'szoglet'),
(106, 19, NULL, 23, 71, 'szoglet'),
(107, 19, 45, 23, 55, 'sarga_lap'),
(108, 19, NULL, NULL, 94, 'ended'),
(109, 20, 46, 24, 88, 'sarga_lap'),
(110, 20, 47, 25, 34, 'sarga_lap'),
(111, 20, NULL, 24, 11, 'szoglet'),
(112, 20, NULL, 24, 29, 'szoglet'),
(113, 20, NULL, 24, 58, 'szoglet'),
(114, 20, NULL, 24, 77, 'szoglet'),
(115, 20, NULL, 25, 19, 'szoglet'),
(116, 20, NULL, 25, 46, 'szoglet'),
(117, 20, NULL, 25, 68, 'szoglet'),
(118, 20, NULL, 25, 90, 'szoglet'),
(119, 20, NULL, NULL, 93, 'ended'),
(120, 21, 48, 27, 23, 'gol'),
(121, 21, NULL, 27, 5, 'szoglet'),
(122, 21, NULL, 27, 34, 'szoglet'),
(123, 21, NULL, 27, 62, 'szoglet'),
(124, 21, 49, 28, 12, 'gol'),
(125, 21, 50, 28, 45, 'gol'),
(126, 21, 51, 28, 71, 'gol'),
(127, 21, 52, 28, 89, 'gol'),
(128, 21, NULL, 28, 18, 'szoglet'),
(129, 21, NULL, 28, 41, 'szoglet'),
(130, 21, NULL, 28, 77, 'szoglet'),
(131, 21, NULL, 28, 90, 'szoglet'),
(132, 21, 53, 27, 38, 'sarga_lap'),
(133, 21, NULL, NULL, 96, 'ended'),
(134, 22, 54, 29, 15, 'gol'),
(135, 22, 55, 29, 44, 'gol'),
(136, 22, 56, 29, 82, 'gol'),
(137, 22, NULL, 29, 9, 'szoglet'),
(138, 22, NULL, 29, 28, 'szoglet'),
(139, 22, NULL, 29, 56, 'szoglet'),
(140, 22, NULL, 29, 88, 'szoglet'),
(141, 22, 57, 30, 22, 'gol'),
(142, 22, 58, 30, 67, 'gol'),
(143, 22, 59, 30, 90, 'gol'),
(144, 22, NULL, 30, 14, 'szoglet'),
(145, 22, NULL, 30, 38, 'szoglet'),
(146, 22, NULL, 30, 74, 'szoglet'),
(147, 22, 60, 30, 50, 'sarga_lap'),
(148, 22, NULL, NULL, 95, 'ended'),
(149, 23, 61, 33, 31, 'gol'),
(150, 23, NULL, 33, 12, 'szoglet'),
(151, 23, NULL, 33, 29, 'szoglet'),
(152, 23, NULL, 33, 58, 'szoglet'),
(153, 23, NULL, 33, 84, 'szoglet'),
(154, 23, 62, 34, 67, 'sarga_lap'),
(155, 23, NULL, 34, 17, 'szoglet'),
(156, 23, NULL, 34, 44, 'szoglet'),
(157, 23, NULL, 34, 76, 'szoglet'),
(158, 23, NULL, NULL, 92, 'ended'),
(159, 24, 63, 35, 11, 'gol'),
(160, 24, 64, 35, 54, 'gol'),
(161, 24, NULL, 35, 8, 'szoglet'),
(162, 24, NULL, 35, 36, 'szoglet'),
(163, 24, NULL, 35, 69, 'szoglet'),
(164, 24, NULL, 35, 90, 'szoglet'),
(165, 24, 65, 36, 27, 'gol'),
(166, 24, 66, 36, 78, 'gol'),
(167, 24, NULL, 36, 14, 'szoglet'),
(168, 24, NULL, 36, 42, 'szoglet'),
(169, 24, NULL, 36, 71, 'szoglet'),
(170, 24, 67, 36, 33, 'sarga_lap'),
(171, 24, NULL, NULL, 96, 'ended'),
(172, 25, 68, 37, 18, 'gol'),
(173, 25, 69, 37, 36, 'gol'),
(174, 25, 70, 37, 59, 'gol'),
(175, 25, 71, 37, 88, 'gol'),
(176, 25, NULL, 37, 6, 'szoglet'),
(177, 25, NULL, 37, 22, 'szoglet'),
(178, 25, NULL, 37, 44, 'szoglet'),
(179, 25, NULL, 37, 67, 'szoglet'),
(180, 25, NULL, 37, 85, 'szoglet'),
(181, 25, 72, 38, 28, 'gol'),
(182, 25, 73, 38, 73, 'gol'),
(183, 25, NULL, 38, 15, 'szoglet'),
(184, 25, NULL, 38, 40, 'szoglet'),
(185, 25, NULL, 38, 77, 'szoglet'),
(186, 25, 74, 38, 55, 'sarga_lap'),
(187, 25, NULL, NULL, 94, 'ended'),
(188, 26, 75, 39, 66, 'sarga_lap'),
(189, 26, 76, 40, 42, 'gol'),
(190, 26, NULL, 39, 11, 'szoglet'),
(191, 26, NULL, 39, 35, 'szoglet'),
(192, 26, NULL, 39, 64, 'szoglet'),
(193, 26, NULL, 39, 89, 'szoglet'),
(194, 26, NULL, 40, 19, 'szoglet'),
(195, 26, NULL, 40, 47, 'szoglet'),
(196, 26, NULL, 40, 78, 'szoglet'),
(197, 26, NULL, NULL, 93, 'ended'),
(198, 27, 77, 41, 24, 'gol'),
(199, 27, 78, 41, 56, 'gol'),
(200, 27, 79, 41, 82, 'gol'),
(201, 27, NULL, 41, 7, 'szoglet'),
(202, 27, NULL, 41, 30, 'szoglet'),
(203, 27, NULL, 41, 63, 'szoglet'),
(204, 27, NULL, 41, 88, 'szoglet'),
(205, 27, 80, 42, 44, 'sarga_lap'),
(206, 27, NULL, 42, 14, 'szoglet'),
(207, 27, NULL, 42, 38, 'szoglet'),
(208, 27, NULL, 42, 71, 'szoglet'),
(209, 27, NULL, NULL, 92, 'ended'),
(210, 28, 81, 43, 33, 'gol'),
(211, 28, NULL, 43, 9, 'szoglet'),
(212, 28, NULL, 43, 27, 'szoglet'),
(213, 28, NULL, 43, 55, 'szoglet'),
(214, 28, NULL, 43, 79, 'szoglet'),
(215, 28, 82, 44, 18, 'gol'),
(216, 28, 83, 44, 67, 'gol'),
(217, 28, NULL, 44, 15, 'szoglet'),
(218, 28, NULL, 44, 41, 'szoglet'),
(219, 28, NULL, 44, 73, 'szoglet'),
(220, 28, 84, 44, 89, 'sarga_lap'),
(221, 28, NULL, NULL, 95, 'ended'),
(222, 29, 85, 45, 11, 'gol'),
(223, 29, 86, 45, 48, 'gol'),
(224, 29, NULL, 45, 6, 'szoglet'),
(225, 29, NULL, 45, 32, 'szoglet'),
(226, 29, NULL, 45, 59, 'szoglet'),
(227, 29, NULL, 45, 84, 'szoglet'),
(228, 29, 87, 46, 27, 'gol'),
(229, 29, 88, 46, 76, 'gol'),
(230, 29, NULL, 46, 13, 'szoglet'),
(231, 29, NULL, 46, 40, 'szoglet'),
(232, 29, NULL, 46, 68, 'szoglet'),
(233, 29, NULL, 46, 90, 'szoglet'),
(234, 29, NULL, NULL, 97, 'ended'),
(235, 30, 89, 47, 56, 'gol'),
(236, 30, NULL, 47, 10, 'szoglet'),
(237, 30, NULL, 47, 37, 'szoglet'),
(238, 30, NULL, 47, 71, 'szoglet'),
(239, 30, 90, 48, 33, 'sarga_lap'),
(240, 30, NULL, 48, 18, 'szoglet'),
(241, 30, NULL, 48, 52, 'szoglet'),
(242, 30, NULL, 48, 85, 'szoglet'),
(243, 30, NULL, NULL, 92, 'ended'),
(244, 31, 91, 49, 14, 'gol'),
(245, 31, 92, 49, 68, 'gol'),
(246, 31, NULL, 49, 8, 'szoglet'),
(247, 31, NULL, 49, 31, 'szoglet'),
(248, 31, NULL, 49, 60, 'szoglet'),
(249, 31, NULL, 49, 87, 'szoglet'),
(250, 31, 93, 50, 22, 'gol'),
(251, 31, 94, 50, 45, 'gol'),
(252, 31, 95, 50, 79, 'gol'),
(253, 31, NULL, 50, 17, 'szoglet'),
(254, 31, NULL, 50, 44, 'szoglet'),
(255, 31, NULL, 50, 75, 'szoglet'),
(256, 31, 96, 50, 63, 'sarga_lap'),
(257, 31, NULL, NULL, 96, 'ended'),
(258, 32, 97, 51, 44, 'sarga_lap'),
(259, 32, 98, 52, 28, 'sarga_lap'),
(260, 32, NULL, 51, 12, 'szoglet'),
(261, 32, NULL, 51, 35, 'szoglet'),
(262, 32, NULL, 51, 67, 'szoglet'),
(263, 32, NULL, 51, 89, 'szoglet'),
(264, 32, NULL, 52, 19, 'szoglet'),
(265, 32, NULL, 52, 46, 'szoglet'),
(266, 32, NULL, 52, 78, 'szoglet'),
(267, 32, NULL, NULL, 93, 'ended'),
(268, 33, 99, 53, 24, 'gol'),
(269, 33, 100, 53, 58, 'gol'),
(270, 33, 101, 53, 84, 'gol'),
(271, 33, NULL, 53, 9, 'szoglet'),
(272, 33, NULL, 53, 33, 'szoglet'),
(273, 33, NULL, 53, 66, 'szoglet'),
(274, 33, NULL, 53, 90, 'szoglet'),
(275, 33, 102, 54, 42, 'gol'),
(276, 33, NULL, 54, 14, 'szoglet'),
(277, 33, NULL, 54, 38, 'szoglet'),
(278, 33, NULL, 54, 72, 'szoglet'),
(279, 33, 103, 54, 67, 'sarga_lap'),
(280, 33, NULL, NULL, 95, 'ended'),
(281, 34, 104, 55, 33, 'gol'),
(282, 34, NULL, 55, 7, 'szoglet'),
(283, 34, NULL, 55, 29, 'szoglet'),
(284, 34, NULL, 55, 64, 'szoglet'),
(285, 34, NULL, 55, 88, 'szoglet'),
(286, 34, 105, 56, 55, 'gol'),
(287, 34, NULL, 56, 15, 'szoglet'),
(288, 34, NULL, 56, 42, 'szoglet'),
(289, 34, NULL, 56, 76, 'szoglet'),
(290, 34, 106, 56, 81, 'sarga_lap'),
(291, 34, NULL, NULL, 94, 'ended'),
(292, 35, 107, 57, 18, 'gol'),
(293, 35, 108, 57, 44, 'gol'),
(294, 35, 109, 57, 67, 'gol'),
(295, 35, 110, 57, 89, 'gol'),
(296, 35, NULL, 57, 5, 'szoglet'),
(297, 35, NULL, 57, 23, 'szoglet'),
(298, 35, NULL, 57, 51, 'szoglet'),
(299, 35, NULL, 57, 78, 'szoglet'),
(300, 35, NULL, 57, 90, 'szoglet'),
(301, 35, 111, 58, 37, 'sarga_lap'),
(302, 35, NULL, 58, 12, 'szoglet'),
(303, 35, NULL, 58, 48, 'szoglet'),
(304, 35, NULL, 58, 82, 'szoglet'),
(305, 35, NULL, NULL, 95, 'ended'),
(306, 36, 112, 59, 27, 'gol'),
(307, 36, 113, 59, 69, 'gol'),
(308, 36, NULL, 59, 9, 'szoglet'),
(309, 36, NULL, 59, 35, 'szoglet'),
(310, 36, NULL, 59, 63, 'szoglet'),
(311, 36, NULL, 59, 87, 'szoglet'),
(312, 36, 114, 60, 44, 'gol'),
(313, 36, NULL, 60, 16, 'szoglet'),
(314, 36, NULL, 60, 40, 'szoglet'),
(315, 36, NULL, 60, 74, 'szoglet'),
(316, 36, 115, 60, 58, 'sarga_lap'),
(317, 36, NULL, NULL, 93, 'ended');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `cim` varchar(255) NOT NULL,
  `datum` date NOT NULL,
  `forras` varchar(255) DEFAULT NULL,
  `osszefoglalo` text DEFAULT NULL,
  `kep` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `news`
--

INSERT INTO `news` (`id`, `cim`, `datum`, `forras`, `osszefoglalo`, `kep`) VALUES
(1, 'hirek_leirasa_01', '2025-09-25', 'Football365 / Fabrizio Romano', 'hir_osszefoglalo_01', 'slot.jpg'),
(2, 'hirek_leirasa_02', '2025-10-22', 'Football365 / Fabrizio Romano', 'hir_osszefoglalo_02', 'sesko.jpg'),
(3, 'hirek_leirasa_03', '2025-11-23', 'LiverpoolWorld / Fabrizio Romano', 'hir_osszefoglalo_03', 'konate.jpg'),
(4, 'hirek_leirasa_04', '2025-12-05', 'Football365 / Fabrizio Romano', 'hir_osszefoglalo_04', 'arteta.jpg'),
(5, 'hirek_leirasa_05', '2025-12-08', 'LondonWorld / Fabrizio Romano', 'hir_osszefoglalo_05', 'maresca.jpg'),
(6, 'hirek_leirasa_06', '2025-12-11', 'Football Insider / Fabrizio Romano', 'hir_osszefoglalo_06', 'totthenam.jpg'),
(7, 'hirek_leirasa_07', '2025-12-15', 'ChronicleLive / Fabrizio Romano', 'hir_osszefoglalo_07', 'woltemade.jpg'),
(8, 'hirek_leirasa_08', '2025-12-18', 'Marca / Fabrizio Romano', 'hir_osszefoglalo_08', 'ericgarcia.jpg'),
(9, 'hirek_leirasa_09', '2025-12-20', 'Marca / Fabrizio Romano', 'hir_osszefoglalo_09', 'gonzalogarcia.jpg'),
(10, 'hirek_leirasa_10', '2025-12-22', 'Bild / Fabrizio Romano', 'hir_osszefoglalo_10', 'bayern.jpg'),
(11, 'hirek_leirasa_11', '2025-12-23', 'Gazzetta dello Sport / Fabrizio Romano', 'hir_osszefoglalo_11', 'inter.jpg'),
(12, 'hirek_leirasa_12', '2025-12-27', 'Tuttosport / Fabrizio Romano', 'hir_osszefoglalo_12', 'juve.jpg'),
(13, 'hirek_leirasa_13', '2025-12-28', 'L Équipe / Fabrizio Romano', 'hir_osszefoglalo_13', 'psg.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `poszt`
--

CREATE TABLE `poszt` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `name_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `poszt`
--

INSERT INTO `poszt` (`id`, `name`, `name_id`) VALUES
(1, 'Csatár', 'CS'),
(2, 'Kapus', 'KAP'),
(3, 'Szélső', 'SZ'),
(4, 'Védő', 'HAT'),
(5, 'Középpályás', 'KP'),
(6, 'Edző', 'EDZ');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tabella`
--

CREATE TABLE `tabella` (
  `pontszam` tinyint(20) NOT NULL,
  `lottgol` tinyint(50) NOT NULL,
  `kapottgol` tinyint(50) NOT NULL,
  `golarany` int(50) NOT NULL,
  `lejatszottmeccs` tinyint(50) NOT NULL,
  `gyozelem` tinyint(50) NOT NULL,
  `dontetlen` tinyint(50) NOT NULL,
  `vereseg` tinyint(50) NOT NULL,
  `helyezes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'admin', 'admin@admin.hu', '12345', 'admin', '2026-01-29 11:59:37'),
(2, 'asd', 'a.aa@gmail.com', '12345678', 'user', '2026-02-10 06:26:59');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `bet`
--
ALTER TABLE `bet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meccs_id` (`meccs_id`);

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
  ADD KEY `csapat_id` (`csapat_id`),
  ADD KEY `idx_jatekos_poszt` (`poszt`);

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
-- A tábla indexei `meccsek_statisztika`
--
ALTER TABLE `meccsek_statisztika`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meccs_id` (`meccs_id`),
  ADD KEY `jatekos_id` (`jatekos_id`),
  ADD KEY `csapat_id` (`csapat_id`);

--
-- A tábla indexei `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `poszt`
--
ALTER TABLE `poszt`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_poszt_name_id` (`name_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `bet`
--
ALTER TABLE `bet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `csapatok`
--
ALTER TABLE `csapatok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT a táblához `jatekosok`
--
ALTER TABLE `jatekosok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=645;

--
-- AUTO_INCREMENT a táblához `ligak`
--
ALTER TABLE `ligak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `meccsek`
--
ALTER TABLE `meccsek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT a táblához `meccsek_statisztika`
--
ALTER TABLE `meccsek_statisztika`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=318;

--
-- AUTO_INCREMENT a táblához `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `poszt`
--
ALTER TABLE `poszt`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `bet`
--
ALTER TABLE `bet`
  ADD CONSTRAINT `bet_ibfk_1` FOREIGN KEY (`meccs_id`) REFERENCES `meccsek` (`id`);

--
-- Megkötések a táblához `csapatok`
--
ALTER TABLE `csapatok`
  ADD CONSTRAINT `fk_csapat_liga` FOREIGN KEY (`liga_id`) REFERENCES `ligak` (`id`) ON DELETE SET NULL;

--
-- Megkötések a táblához `jatekosok`
--
ALTER TABLE `jatekosok`
  ADD CONSTRAINT `fk_jatekos_poszt` FOREIGN KEY (`poszt`) REFERENCES `poszt` (`name_id`),
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
-- Megkötések a táblához `meccsek_statisztika`
--
ALTER TABLE `meccsek_statisztika`
  ADD CONSTRAINT `meccsek_statisztika_ibfk_1` FOREIGN KEY (`meccs_id`) REFERENCES `meccsek` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `meccsek_statisztika_ibfk_2` FOREIGN KEY (`jatekos_id`) REFERENCES `jatekosok` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `meccsek_statisztika_ibfk_3` FOREIGN KEY (`csapat_id`) REFERENCES `csapatok` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
