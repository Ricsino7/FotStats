-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Nov 11. 00:51
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
-- Adatbázis: `football_db`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bajnoksagok`
--

CREATE TABLE `bajnoksagok` (
  `id` int(11) NOT NULL,
  `nev` varchar(150) NOT NULL,
  `orszag_id` int(11) DEFAULT NULL,
  `szint` int(11) DEFAULT NULL,
  `sezon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `bajnoksagok`
--

INSERT INTO `bajnoksagok` (`id`, `nev`, `orszag_id`, `szint`, `sezon`) VALUES
(1, 'Premier League', 1, 1, '2025-26'),
(2, 'La Liga', 2, 1, '2025-26'),
(3, 'Serie A', 3, 1, '2025-26'),
(4, 'Bundesliga', 4, 1, '2025-26'),
(5, 'Ligue 1', 5, 1, '2025-26');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `csapatok`
--

CREATE TABLE `csapatok` (
  `id` int(11) NOT NULL,
  `nev` varchar(200) NOT NULL,
  `rovid_nev` varchar(50) DEFAULT NULL,
  `orszag_id` int(11) DEFAULT NULL,
  `alapitas_ev` year(4) DEFAULT NULL,
  `stadion` varchar(200) DEFAULT NULL,
  `wiki` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `csapatok`
--

INSERT INTO `csapatok` (`id`, `nev`, `rovid_nev`, `orszag_id`, `alapitas_ev`, `stadion`, `wiki`) VALUES
(1, 'Arsenal', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/Arsenal_F.C.'),
(2, 'Aston Villa', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/Aston_Villa_F.C.'),
(3, 'AFC Bournemouth', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/AFC_Bournemouth'),
(4, 'Brentford', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/Brentford_F.C.'),
(5, 'Brighton & Hove Albion', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/Brighton_%26_Hove_Albion_F.C.'),
(6, 'Chelsea', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/Chelsea_F.C.'),
(7, 'Crystal Palace', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/Crystal_Palace_F.C.'),
(8, 'Everton', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/Everton_F.C.'),
(9, 'Fulham', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/Fulham_F.C.'),
(10, 'Liverpool', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/Liverpool_F.C.'),
(11, 'Luton Town', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/Luton_Town_F.C.'),
(12, 'Manchester City', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/Manchester_City_F.C.'),
(13, 'Manchester United', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/Manchester_United_F.C.'),
(14, 'Newcastle United', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/Newcastle_United_F.C.'),
(15, 'Nottingham Forest', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/Nottingham_Forest_F.C.'),
(16, 'Sheffield United', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/Sheffield_United_F.C.'),
(17, 'Tottenham Hotspur', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/Tottenham_Hotspur_F.C.'),
(18, 'West Ham United', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/West_Ham_United_F.C.'),
(19, 'Wolverhampton Wanderers', NULL, 1, NULL, NULL, 'https://en.wikipedia.org/wiki/Wolverhampton_Wanderers_F.C.'),
(20, '(Premier slot 20)', NULL, 1, NULL, NULL, NULL),
(21, 'Real Madrid', NULL, 2, NULL, NULL, 'https://en.wikipedia.org/wiki/Real_Madrid_CF'),
(22, 'Barcelona', NULL, 2, NULL, NULL, 'https://en.wikipedia.org/wiki/FC_Barcelona'),
(23, 'Atletico Madrid', NULL, 2, NULL, NULL, 'https://en.wikipedia.org/wiki/Atl%C3%A9tico_Madrid'),
(24, 'Sevilla', NULL, 2, NULL, NULL, 'https://en.wikipedia.org/wiki/Sevilla_FC'),
(25, 'Real Sociedad', NULL, 2, NULL, NULL, 'https://en.wikipedia.org/wiki/Real_Sociedad'),
(26, 'Real Betis', NULL, 2, NULL, NULL, 'https://en.wikipedia.org/wiki/Real_Betis'),
(27, 'Villarreal', NULL, 2, NULL, NULL, 'https://en.wikipedia.org/wiki/Villarreal_CF'),
(28, 'Valencia', NULL, 2, NULL, NULL, 'https://en.wikipedia.org/wiki/Valencia_CF'),
(29, 'Athletic Club', NULL, 2, NULL, NULL, 'https://en.wikipedia.org/wiki/Athletic_Club'),
(30, 'Mallorca', NULL, 2, NULL, NULL, 'https://en.wikipedia.org/wiki/RCD_Mallorca'),
(31, 'Celta Vigo', NULL, 2, NULL, NULL, 'https://en.wikipedia.org/wiki/RC_Celta_de_Vigo'),
(32, 'Getafe', NULL, 2, NULL, NULL, 'https://en.wikipedia.org/wiki/Getafe_CF'),
(33, 'Girona', NULL, 2, NULL, NULL, 'https://en.wikipedia.org/wiki/Girona_FC'),
(34, 'Cadiz', NULL, 2, NULL, NULL, 'https://en.wikipedia.org/wiki/C%C3%A1diz_CF'),
(35, 'Rayo Vallecano', NULL, 2, NULL, NULL, 'https://en.wikipedia.org/wiki/Rayo_Vallecano'),
(36, 'Alaves', NULL, 2, NULL, NULL, 'https://en.wikipedia.org/wiki/Deportivo_Alav%C3%A9s'),
(37, 'Espanyol', NULL, 2, NULL, NULL, 'https://en.wikipedia.org/wiki/RCD_Espanyol'),
(38, 'Las Palmas', NULL, 2, NULL, NULL, 'https://en.wikipedia.org/wiki/UD_Las_Palmas'),
(39, '(LaLiga slot 19)', NULL, 2, NULL, NULL, NULL),
(40, '(LaLiga slot 20)', NULL, 2, NULL, NULL, NULL),
(41, 'Juventus', NULL, 3, NULL, NULL, 'https://en.wikipedia.org/wiki/Juventus_F.C.'),
(42, 'Inter Milan', NULL, 3, NULL, NULL, 'https://en.wikipedia.org/wiki/Inter_Milan'),
(43, 'AC Milan', NULL, 3, NULL, NULL, 'https://en.wikipedia.org/wiki/AC_Milan'),
(44, 'Napoli', NULL, 3, NULL, NULL, 'https://en.wikipedia.org/wiki/SSC_Napoli'),
(45, 'AS Roma', NULL, 3, NULL, NULL, 'https://en.wikipedia.org/wiki/AS_Roma'),
(46, 'Atalanta', NULL, 3, NULL, NULL, 'https://en.wikipedia.org/wiki/Atalanta_B.C.'),
(47, 'Lazio', NULL, 3, NULL, NULL, 'https://en.wikipedia.org/wiki/S.S._Lazio'),
(48, 'Fiorentina', NULL, 3, NULL, NULL, 'https://en.wikipedia.org/wiki/ACF_Fiorentina'),
(49, 'Torino', NULL, 3, NULL, NULL, 'https://en.wikipedia.org/wiki/Torino_F.C.'),
(50, 'Monza', NULL, 3, NULL, NULL, 'https://en.wikipedia.org/wiki/A.C._Monza'),
(51, 'Sassuolo', NULL, 3, NULL, NULL, 'https://en.wikipedia.org/wiki/U.S._Sassuolo_Calcio'),
(52, 'Bologna', NULL, 3, NULL, NULL, 'https://en.wikipedia.org/wiki/Bologna_F.C._1909'),
(53, 'Genoa', NULL, 3, NULL, NULL, 'https://en.wikipedia.org/wiki/Genoa_CFC'),
(54, 'Empoli', NULL, 3, NULL, NULL, 'https://en.wikipedia.org/wiki/Empoli_F.C.'),
(55, '(SerieA slot 15)', NULL, 3, NULL, NULL, NULL),
(56, '(SerieA slot 16)', NULL, 3, NULL, NULL, NULL),
(57, '(SerieA slot 17)', NULL, 3, NULL, NULL, NULL),
(58, '(SerieA slot 18)', NULL, 3, NULL, NULL, NULL),
(59, '(SerieA slot 19)', NULL, 3, NULL, NULL, NULL),
(60, '(SerieA slot 20)', NULL, 3, NULL, NULL, NULL),
(61, 'Bayern Munich', NULL, 4, NULL, NULL, 'https://en.wikipedia.org/wiki/FC_Bayern_Munich'),
(62, 'Borussia Dortmund', NULL, 4, NULL, NULL, 'https://en.wikipedia.org/wiki/Borussia_Dortmund'),
(63, 'RB Leipzig', NULL, 4, NULL, NULL, 'https://en.wikipedia.org/wiki/RB_Leipzig'),
(64, 'Bayer Leverkusen', NULL, 4, NULL, NULL, 'https://en.wikipedia.org/wiki/Bayer_04_Leverkusen'),
(65, 'Eintracht Frankfurt', NULL, 4, NULL, NULL, 'https://en.wikipedia.org/wiki/Eintracht_Frankfurt'),
(66, 'VfL Wolfsburg', NULL, 4, NULL, NULL, 'https://en.wikipedia.org/wiki/VfL_Wolfsburg'),
(67, 'Borussia Mönchengladbach', NULL, 4, NULL, NULL, 'https://en.wikipedia.org/wiki/Borussia_M%C3%B6nchengladbach'),
(68, 'VfB Stuttgart', NULL, 4, NULL, NULL, 'https://en.wikipedia.org/wiki/VfB_Stuttgart'),
(69, 'Hoffenheim', NULL, 4, NULL, NULL, 'https://en.wikipedia.org/wiki/TSG_1899_Hoffenheim'),
(70, 'Werder Bremen', NULL, 4, NULL, NULL, 'https://en.wikipedia.org/wiki/SV_Werder_Bremen'),
(71, '(Bundesliga slot 11)', NULL, 4, NULL, NULL, NULL),
(72, '(Bundesliga slot 12)', NULL, 4, NULL, NULL, NULL),
(73, '(Bundesliga slot 13)', NULL, 4, NULL, NULL, NULL),
(74, '(Bundesliga slot 14)', NULL, 4, NULL, NULL, NULL),
(75, '(Bundesliga slot 15)', NULL, 4, NULL, NULL, NULL),
(76, '(Bundesliga slot 16)', NULL, 4, NULL, NULL, NULL),
(77, '(Bundesliga slot 17)', NULL, 4, NULL, NULL, NULL),
(78, '(Bundesliga slot 18)', NULL, 4, NULL, NULL, NULL),
(79, 'Paris Saint-Germain', NULL, 5, NULL, NULL, 'https://en.wikipedia.org/wiki/Paris_Saint-Germain_F.C.'),
(80, 'Olympique Marseille', NULL, 5, NULL, NULL, 'https://en.wikipedia.org/wiki/Olympique_de_Marseille'),
(81, 'AS Monaco', NULL, 5, NULL, NULL, 'https://en.wikipedia.org/wiki/AS_Monaco'),
(82, 'Olympique Lyonnais', NULL, 5, NULL, NULL, 'https://en.wikipedia.org/wiki/Olympique_Lyonnais'),
(83, 'Lens', NULL, 5, NULL, NULL, 'https://en.wikipedia.org/wiki/Lens'),
(84, 'Rennes', NULL, 5, NULL, NULL, 'https://en.wikipedia.org/wiki/Stade_Rennais_FC'),
(85, 'Nice', NULL, 5, NULL, NULL, 'https://en.wikipedia.org/wiki/OGC_Nice'),
(86, 'Lille', NULL, 5, NULL, NULL, 'https://en.wikipedia.org/wiki/Lille_OSC'),
(87, 'Nantes', NULL, 5, NULL, NULL, 'https://en.wikipedia.org/wiki/F.C._Nantes'),
(88, '(Ligue1 slot 10)', NULL, 5, NULL, NULL, NULL),
(89, '(Ligue1 slot 11)', NULL, 5, NULL, NULL, NULL),
(90, '(Ligue1 slot 12)', NULL, 5, NULL, NULL, NULL),
(91, '(Ligue1 slot 13)', NULL, 5, NULL, NULL, NULL),
(92, '(Ligue1 slot 14)', NULL, 5, NULL, NULL, NULL),
(93, '(Ligue1 slot 15)', NULL, 5, NULL, NULL, NULL),
(94, '(Ligue1 slot 16)', NULL, 5, NULL, NULL, NULL),
(95, '(Ligue1 slot 17)', NULL, 5, NULL, NULL, NULL),
(96, '(Ligue1 slot 18)', NULL, 5, NULL, NULL, NULL),
(97, '(Ligue1 slot 19)', NULL, 5, NULL, NULL, NULL),
(98, '(Ligue1 slot 20)', NULL, 5, NULL, NULL, NULL),
(99, 'S.L. Benfica', NULL, 6, NULL, NULL, 'https://en.wikipedia.org/wiki/S.L._Benfica'),
(100, 'F.C. Porto', NULL, 6, NULL, NULL, 'https://en.wikipedia.org/wiki/F.C._Porto'),
(101, 'Ferencvárosi TC', NULL, 7, NULL, NULL, 'https://en.wikipedia.org/wiki/Ferencv%C3%A1rosi_TC');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jatekosok`
--

CREATE TABLE `jatekosok` (
  `id` int(11) NOT NULL,
  `csapat_id` int(11) DEFAULT NULL,
  `teljes_nev` varchar(200) NOT NULL,
  `koznev` varchar(150) DEFAULT NULL,
  `mezszam` varchar(10) DEFAULT NULL,
  `poszt` varchar(50) DEFAULT NULL,
  `nemzetiseg` varchar(100) DEFAULT NULL,
  `szuletesi_datum` date DEFAULT NULL,
  `magassag_cm` int(11) DEFAULT NULL,
  `suly_kg` int(11) DEFAULT NULL,
  `wiki` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `jatekosok`
--

INSERT INTO `jatekosok` (`id`, `csapat_id`, `teljes_nev`, `koznev`, `mezszam`, `poszt`, `nemzetiseg`, `szuletesi_datum`, `magassag_cm`, `suly_kg`, `wiki`) VALUES
(1, 99, 'Anatoliy Trubin', NULL, '1', 'GK', 'Ukraine', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Anatoliy_Trubin'),
(2, 99, 'Rafael Obrador', NULL, '3', 'DF', 'Spain', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Rafael_Obrador'),
(3, 99, 'António Silva', NULL, '4', 'DF', 'Portugal', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Ant%C3%B3nio_Silva_(footballer,_born_2003)'),
(4, 99, 'Enzo Barrenechea', NULL, '5', 'MF', 'Argentina', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Enzo_Barrenechea'),
(5, 99, 'Alexander Bah', NULL, '6', 'DF', 'Denmark', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Alexander_Bah'),
(6, 99, 'Fredrik Aursnes', NULL, '8', 'MF', 'Norway', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Fredrik_Aursnes'),
(7, 99, 'Franjo Ivanović', NULL, '9', 'FW', 'Croatia', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Franjo_Ivanovi%C4%87'),
(8, 99, 'Heorhiy Sudakov', NULL, '10', 'MF', 'Ukraine', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Heorhiy_Sudakov'),
(9, 99, 'Dodi Lukébakio', NULL, '11', 'FW', 'Belgium', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Dodi_Luk%C3%A9bakio'),
(10, 99, 'Vangelis Pavlidis', NULL, '14', 'FW', 'Greece', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Vangelis_Pavlidis'),
(11, 99, 'Manu Silva', NULL, '16', 'MF', 'Portugal', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Manu_Silva'),
(12, 99, 'Amar Dedić', NULL, '17', 'DF', 'Bosnia and Herzegovina', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Amar_Dedi%C4%87'),
(13, 99, 'Leandro Barreiro', NULL, '18', 'MF', 'Luxembourg', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Leandro_Barreiro'),
(14, 99, 'Richard Ríos', NULL, '20', 'MF', 'Colombia', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Richard_R%C3%ADos'),
(15, 99, 'Andreas Schjelderup', NULL, '21', 'FW', 'Norway', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Andreas_Schjelderup'),
(16, 99, 'Samuel Soares', NULL, '24', 'GK', 'Portugal', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Samuel_Soares_(footballer)'),
(17, 99, 'Gianluca Prestianni', NULL, '25', 'FW', 'Argentina', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Gianluca_Prestianni'),
(18, 99, 'Samuel Dahl', NULL, '26', 'DF', 'Sweden', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Samuel_Dahl'),
(19, 99, 'Bruma', NULL, '27', 'FW', 'Portugal', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Bruma_(footballer)'),
(20, 99, 'Nicolás Otamendi', NULL, '30', 'DF', 'Argentina', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Nicol%C3%A1s_Otamendi'),
(21, 99, 'Henrique Araújo', NULL, '39', 'FW', 'Portugal', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Henrique_Ara%C3%BAjo'),
(22, 99, 'Tomás Araújo', NULL, '44', 'DF', 'Portugal', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Tom%C3%A1s_Ara%C3%BAjo'),
(23, 99, 'Diogo Ferreira', NULL, '50', 'GK', 'Portugal', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Diogo_Ferreira_(footballer)'),
(1001, 101, 'Stefan Gartenmann', NULL, '3', 'DF', 'Denmark', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Stefan_Gartenmann'),
(1002, 101, 'Naby Keïta', NULL, '5', 'MF', 'Guinea', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Naby_Ke%C3%AFta'),
(1003, 101, 'Daniel Arzani', NULL, '7', 'FW', 'Australia', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Daniel_Arzani'),
(1004, 101, 'Aleksandar Pešić', NULL, '8', 'FW', 'Serbia', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Aleksandar_Pe%C5%A1i%C4%87'),
(1005, 101, 'Jonathan Levi', NULL, '10', 'FW', 'Sweden', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Jonathan_Levi'),
(1006, 101, 'Bamidele Yusuf', NULL, '11', 'FW', 'Nigeria', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Bamidele_Yusuf'),
(1007, 101, 'Mohammed Abu Fani', NULL, '15', 'MF', 'Israel', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Mohammed_Abu_Fani'),
(1008, 101, 'Kristoffer Zachariassen', NULL, '16', 'FW', 'Norway', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Kristoffer_Zachariassen'),
(1009, 101, 'Barnabás Varga', NULL, '19', 'FW', 'Hungary', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Barnab%C3%A1s_Varga'),
(1010, 101, 'Endre Botka', NULL, '21', 'DF', 'Hungary', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Endre_Botka'),
(1011, 101, 'Gábor Szalai', NULL, '22', 'DF', 'Hungary', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/G%C3%A1bor_Szalai_(footballer)'),
(1012, 101, 'Bence Ötvös', NULL, '23', 'MF', 'Hungary', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Bence_%C3%96tv%C3%B6s'),
(1013, 101, 'Cebrail Makreckis', NULL, '25', 'MF', 'Latvia', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Cebrail_Makreckis'),
(1014, 101, 'Ibrahim Cissé', NULL, '27', 'DF', 'France', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Ibrahim_Ciss%C3%A9'),
(1015, 101, 'Toon Raemaekers', NULL, '28', 'DF', 'Belgium', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Toon_Raemaekers'),
(1016, 101, 'Gergő Szécsi', NULL, '29', 'GK', 'Hungary', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Gerg%C5%91_Sz%C3%A9csi'),
(1017, 101, 'Zsombor Gruber', NULL, '30', 'FW', 'Hungary', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Zsombor_Gruber'),
(1018, 101, 'Cadu', NULL, '33', 'MF', 'Brazil', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Cadu_(footballer)'),
(1019, 101, 'Gabi Kanichowsky', NULL, '36', 'MF', 'Israel', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Gabi_Kanichowsky'),
(1020, 101, 'Ismaïl Aaneba', NULL, '44', 'DF', 'France', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Isma%C3%AFl_Aaneba'),
(1021, 101, 'Callum O\'Dowda', NULL, '47', 'MF', 'Ireland', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Callum_O%27Dowda'),
(1022, 101, 'Dániel Radnóti', NULL, '63', 'GK', 'Hungary', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/D%C3%A1niel_Radn%C3%B3ti'),
(1023, 101, 'Alex Tóth', NULL, '64', 'MF', 'Hungary', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Alex_T%C3%B3th'),
(1024, 101, 'J%C3%BAlio Rom%C3%A3o', NULL, '66', 'MF', 'Brazil', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/J%C3%BAlio_Rom%C3%A3o'),
(1025, 101, 'Ádám Madarász', NULL, '72', 'MF', 'Hungary', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/%C3%81d%C3%A1m_Madar%C3%A1sz'),
(1026, 101, 'Szilárd Szabó', NULL, '74', 'FW', 'Hungary', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Szil%C3%A1rd_Szab%C3%B3_(footballer)'),
(1027, 101, 'Lenny Joseph', NULL, '75', 'FW', 'France', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Lenny_Joseph'),
(1028, 101, 'Krisztián Lisztes', NULL, '76', 'MF', 'Hungary', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Kriszti%C3%A1n_Lisztes'),
(1029, 101, 'Barnabás Nagy', NULL, '77', 'DF', 'Hungary', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Barnab%C3%A1s_Nagy'),
(1030, 101, 'Habib Maïga', NULL, '80', 'MF', 'Côte d\'Ivoire', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Habib_Ma%C3%AFga'),
(1031, 101, 'Philippe Rommens', NULL, '88', 'MF', 'Belgium', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Philippe_Rommens'),
(1032, 101, 'Dénes Dibusz', NULL, '90', 'GK', 'Hungary', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/D%C3%A9nes_Dibusz'),
(1033, 101, 'Dávid Gróf', NULL, '99', 'GK', 'Hungary', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/D%C3%A1vid_Gr%C3%B3f');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kupak`
--

CREATE TABLE `kupak` (
  `id` int(11) NOT NULL,
  `nev` varchar(200) NOT NULL,
  `orszag_id` int(11) DEFAULT NULL,
  `sezon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `kupak`
--

INSERT INTO `kupak` (`id`, `nev`, `orszag_id`, `sezon`) VALUES
(1, 'Magyar Kupa', 7, '2025-26'),
(2, 'Copa del Rey', 2, '2025-26'),
(3, 'Coupe de France', 5, '2025-26'),
(4, 'EFL Cup', 1, '2025-26'),
(5, 'FA Cup', 1, '2025-26'),
(6, 'Coppa Italia', 3, '2025-26'),
(7, 'DFB-Pokal', 4, '2025-26');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kupa_resztvevok`
--

CREATE TABLE `kupa_resztvevok` (
  `id` int(11) NOT NULL,
  `kupa_id` int(11) NOT NULL,
  `csapat_id` int(11) NOT NULL,
  `sezon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `kupa_resztvevok`
--

INSERT INTO `kupa_resztvevok` (`id`, `kupa_id`, `csapat_id`, `sezon`) VALUES
(1, 1, 101, '2025-26'),
(2, 2, 21, '2025-26'),
(3, 2, 22, '2025-26'),
(4, 2, 23, '2025-26'),
(5, 2, 24, '2025-26'),
(6, 2, 25, '2025-26'),
(7, 2, 26, '2025-26'),
(8, 2, 27, '2025-26'),
(9, 2, 28, '2025-26'),
(10, 2, 29, '2025-26'),
(11, 2, 30, '2025-26'),
(12, 2, 31, '2025-26'),
(13, 2, 32, '2025-26'),
(14, 2, 33, '2025-26'),
(15, 2, 34, '2025-26'),
(16, 2, 35, '2025-26'),
(17, 2, 36, '2025-26'),
(18, 2, 37, '2025-26'),
(19, 2, 38, '2025-26'),
(20, 2, 39, '2025-26'),
(21, 2, 40, '2025-26'),
(100, 3, 79, '2025-26'),
(101, 3, 80, '2025-26'),
(102, 3, 81, '2025-26'),
(103, 3, 82, '2025-26'),
(104, 3, 83, '2025-26'),
(105, 3, 84, '2025-26'),
(106, 3, 85, '2025-26'),
(107, 3, 86, '2025-26'),
(108, 3, 87, '2025-26'),
(109, 3, 88, '2025-26'),
(110, 3, 89, '2025-26'),
(111, 3, 90, '2025-26'),
(112, 3, 91, '2025-26'),
(113, 3, 92, '2025-26'),
(114, 3, 93, '2025-26'),
(115, 3, 94, '2025-26'),
(116, 3, 95, '2025-26'),
(117, 3, 96, '2025-26'),
(118, 3, 97, '2025-26'),
(119, 3, 98, '2025-26'),
(42, 4, 1, '2025-26'),
(43, 4, 2, '2025-26'),
(44, 4, 3, '2025-26'),
(45, 4, 4, '2025-26'),
(46, 4, 5, '2025-26'),
(47, 4, 6, '2025-26'),
(48, 4, 7, '2025-26'),
(49, 4, 8, '2025-26'),
(50, 4, 9, '2025-26'),
(51, 4, 10, '2025-26'),
(52, 4, 11, '2025-26'),
(53, 4, 12, '2025-26'),
(54, 4, 13, '2025-26'),
(55, 4, 14, '2025-26'),
(56, 4, 15, '2025-26'),
(57, 4, 16, '2025-26'),
(58, 4, 17, '2025-26'),
(59, 4, 18, '2025-26'),
(60, 4, 19, '2025-26'),
(61, 4, 20, '2025-26'),
(22, 5, 1, '2025-26'),
(23, 5, 2, '2025-26'),
(24, 5, 3, '2025-26'),
(25, 5, 4, '2025-26'),
(26, 5, 5, '2025-26'),
(27, 5, 6, '2025-26'),
(28, 5, 7, '2025-26'),
(29, 5, 8, '2025-26'),
(30, 5, 9, '2025-26'),
(31, 5, 10, '2025-26'),
(32, 5, 11, '2025-26'),
(33, 5, 12, '2025-26'),
(34, 5, 13, '2025-26'),
(35, 5, 14, '2025-26'),
(36, 5, 15, '2025-26'),
(37, 5, 16, '2025-26'),
(38, 5, 17, '2025-26'),
(39, 5, 18, '2025-26'),
(40, 5, 19, '2025-26'),
(41, 5, 20, '2025-26'),
(62, 6, 41, '2025-26'),
(63, 6, 42, '2025-26'),
(64, 6, 43, '2025-26'),
(65, 6, 44, '2025-26'),
(66, 6, 45, '2025-26'),
(67, 6, 46, '2025-26'),
(68, 6, 47, '2025-26'),
(69, 6, 48, '2025-26'),
(70, 6, 49, '2025-26'),
(71, 6, 50, '2025-26'),
(72, 6, 51, '2025-26'),
(73, 6, 52, '2025-26'),
(74, 6, 53, '2025-26'),
(75, 6, 54, '2025-26'),
(76, 6, 55, '2025-26'),
(77, 6, 56, '2025-26'),
(78, 6, 57, '2025-26'),
(79, 6, 58, '2025-26'),
(80, 6, 59, '2025-26'),
(81, 6, 60, '2025-26'),
(82, 7, 61, '2025-26'),
(83, 7, 62, '2025-26'),
(84, 7, 63, '2025-26'),
(85, 7, 64, '2025-26'),
(86, 7, 65, '2025-26'),
(87, 7, 66, '2025-26'),
(88, 7, 67, '2025-26'),
(89, 7, 68, '2025-26'),
(90, 7, 69, '2025-26'),
(91, 7, 70, '2025-26'),
(92, 7, 71, '2025-26'),
(93, 7, 72, '2025-26'),
(94, 7, 73, '2025-26'),
(95, 7, 74, '2025-26'),
(96, 7, 75, '2025-26'),
(97, 7, 76, '2025-26'),
(98, 7, 77, '2025-26'),
(99, 7, 78, '2025-26');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `liga_tagok`
--

CREATE TABLE `liga_tagok` (
  `id` int(11) NOT NULL,
  `bajnoksag_id` int(11) NOT NULL,
  `csapat_id` int(11) NOT NULL,
  `sezon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `liga_tagok`
--

INSERT INTO `liga_tagok` (`id`, `bajnoksag_id`, `csapat_id`, `sezon`) VALUES
(1, 1, 1, '2025-26'),
(2, 1, 2, '2025-26'),
(3, 1, 3, '2025-26'),
(4, 1, 4, '2025-26'),
(5, 1, 5, '2025-26'),
(6, 1, 6, '2025-26'),
(7, 1, 7, '2025-26'),
(8, 1, 8, '2025-26'),
(9, 1, 9, '2025-26'),
(10, 1, 10, '2025-26'),
(11, 1, 11, '2025-26'),
(12, 1, 12, '2025-26'),
(13, 1, 13, '2025-26'),
(14, 1, 14, '2025-26'),
(15, 1, 15, '2025-26'),
(16, 1, 16, '2025-26'),
(17, 1, 17, '2025-26'),
(18, 1, 18, '2025-26'),
(19, 1, 19, '2025-26'),
(20, 1, 20, '2025-26'),
(21, 2, 21, '2025-26'),
(22, 2, 22, '2025-26'),
(23, 2, 23, '2025-26'),
(24, 2, 24, '2025-26'),
(25, 2, 25, '2025-26'),
(26, 2, 26, '2025-26'),
(27, 2, 27, '2025-26'),
(28, 2, 28, '2025-26'),
(29, 2, 29, '2025-26'),
(30, 2, 30, '2025-26'),
(31, 2, 31, '2025-26'),
(32, 2, 32, '2025-26'),
(33, 2, 33, '2025-26'),
(34, 2, 34, '2025-26'),
(35, 2, 35, '2025-26'),
(36, 2, 36, '2025-26'),
(37, 2, 37, '2025-26'),
(38, 2, 38, '2025-26'),
(39, 2, 39, '2025-26'),
(40, 2, 40, '2025-26'),
(41, 3, 41, '2025-26'),
(42, 3, 42, '2025-26'),
(43, 3, 43, '2025-26'),
(44, 3, 44, '2025-26'),
(45, 3, 45, '2025-26'),
(46, 3, 46, '2025-26'),
(47, 3, 47, '2025-26'),
(48, 3, 48, '2025-26'),
(49, 3, 49, '2025-26'),
(50, 3, 50, '2025-26'),
(51, 3, 51, '2025-26'),
(52, 3, 52, '2025-26'),
(53, 3, 53, '2025-26'),
(54, 3, 54, '2025-26'),
(55, 3, 55, '2025-26'),
(56, 3, 56, '2025-26'),
(57, 3, 57, '2025-26'),
(58, 3, 58, '2025-26'),
(59, 3, 59, '2025-26'),
(60, 3, 60, '2025-26'),
(61, 4, 61, '2025-26'),
(62, 4, 62, '2025-26'),
(63, 4, 63, '2025-26'),
(64, 4, 64, '2025-26'),
(65, 4, 65, '2025-26'),
(66, 4, 66, '2025-26'),
(67, 4, 67, '2025-26'),
(68, 4, 68, '2025-26'),
(69, 4, 69, '2025-26'),
(70, 4, 70, '2025-26'),
(71, 4, 71, '2025-26'),
(72, 4, 72, '2025-26'),
(73, 4, 73, '2025-26'),
(74, 4, 74, '2025-26'),
(75, 4, 75, '2025-26'),
(76, 4, 76, '2025-26'),
(77, 4, 77, '2025-26'),
(78, 4, 78, '2025-26'),
(79, 5, 79, '2025-26'),
(80, 5, 80, '2025-26'),
(81, 5, 81, '2025-26'),
(82, 5, 82, '2025-26'),
(83, 5, 83, '2025-26'),
(84, 5, 84, '2025-26'),
(85, 5, 85, '2025-26'),
(86, 5, 86, '2025-26'),
(87, 5, 87, '2025-26'),
(88, 5, 88, '2025-26'),
(89, 5, 89, '2025-26'),
(90, 5, 90, '2025-26'),
(91, 5, 91, '2025-26'),
(92, 5, 92, '2025-26'),
(93, 5, 93, '2025-26'),
(94, 5, 94, '2025-26'),
(95, 5, 95, '2025-26'),
(96, 5, 96, '2025-26'),
(97, 5, 97, '2025-26'),
(98, 5, 98, '2025-26');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orszagok`
--

CREATE TABLE `orszagok` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `iso_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `orszagok`
--

INSERT INTO `orszagok` (`id`, `nev`, `iso_code`) VALUES
(1, 'England', 'GBR'),
(2, 'Spain', 'ESP'),
(3, 'Italy', 'ITA'),
(4, 'Germany', 'DEU'),
(5, 'France', 'FRA'),
(6, 'Portugal', 'PRT'),
(7, 'Hungary', 'HUN');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `bajnoksagok`
--
ALTER TABLE `bajnoksagok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nev` (`nev`,`sezon`),
  ADD KEY `orszag_id` (`orszag_id`);

--
-- A tábla indexei `csapatok`
--
ALTER TABLE `csapatok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nev` (`nev`),
  ADD KEY `orszag_id` (`orszag_id`);

--
-- A tábla indexei `jatekosok`
--
ALTER TABLE `jatekosok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `csapat_id` (`csapat_id`,`teljes_nev`,`mezszam`);

--
-- A tábla indexei `kupak`
--
ALTER TABLE `kupak`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nev` (`nev`,`sezon`),
  ADD KEY `orszag_id` (`orszag_id`);

--
-- A tábla indexei `kupa_resztvevok`
--
ALTER TABLE `kupa_resztvevok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kupa_id` (`kupa_id`,`csapat_id`,`sezon`),
  ADD KEY `csapat_id` (`csapat_id`);

--
-- A tábla indexei `liga_tagok`
--
ALTER TABLE `liga_tagok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bajnoksag_id` (`bajnoksag_id`,`csapat_id`,`sezon`),
  ADD KEY `csapat_id` (`csapat_id`);

--
-- A tábla indexei `orszagok`
--
ALTER TABLE `orszagok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nev` (`nev`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `bajnoksagok`
--
ALTER TABLE `bajnoksagok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `csapatok`
--
ALTER TABLE `csapatok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT a táblához `jatekosok`
--
ALTER TABLE `jatekosok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1034;

--
-- AUTO_INCREMENT a táblához `kupak`
--
ALTER TABLE `kupak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `kupa_resztvevok`
--
ALTER TABLE `kupa_resztvevok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT a táblához `liga_tagok`
--
ALTER TABLE `liga_tagok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT a táblához `orszagok`
--
ALTER TABLE `orszagok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `bajnoksagok`
--
ALTER TABLE `bajnoksagok`
  ADD CONSTRAINT `bajnoksagok_ibfk_1` FOREIGN KEY (`orszag_id`) REFERENCES `orszagok` (`id`) ON DELETE SET NULL;

--
-- Megkötések a táblához `csapatok`
--
ALTER TABLE `csapatok`
  ADD CONSTRAINT `csapatok_ibfk_1` FOREIGN KEY (`orszag_id`) REFERENCES `orszagok` (`id`) ON DELETE SET NULL;

--
-- Megkötések a táblához `jatekosok`
--
ALTER TABLE `jatekosok`
  ADD CONSTRAINT `jatekosok_ibfk_1` FOREIGN KEY (`csapat_id`) REFERENCES `csapatok` (`id`) ON DELETE SET NULL;

--
-- Megkötések a táblához `kupak`
--
ALTER TABLE `kupak`
  ADD CONSTRAINT `kupak_ibfk_1` FOREIGN KEY (`orszag_id`) REFERENCES `orszagok` (`id`) ON DELETE SET NULL;

--
-- Megkötések a táblához `kupa_resztvevok`
--
ALTER TABLE `kupa_resztvevok`
  ADD CONSTRAINT `kupa_resztvevok_ibfk_1` FOREIGN KEY (`kupa_id`) REFERENCES `kupak` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kupa_resztvevok_ibfk_2` FOREIGN KEY (`csapat_id`) REFERENCES `csapatok` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `liga_tagok`
--
ALTER TABLE `liga_tagok`
  ADD CONSTRAINT `liga_tagok_ibfk_1` FOREIGN KEY (`bajnoksag_id`) REFERENCES `bajnoksagok` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `liga_tagok_ibfk_2` FOREIGN KEY (`csapat_id`) REFERENCES `csapatok` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
