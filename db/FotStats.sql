-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Nov 12. 08:16
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
  `liga` varchar(100) DEFAULT NULL,
  `tipus` enum('klub','valogatott') DEFAULT 'klub',
  `helyezes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `csapatok`
--

INSERT INTO `csapatok` (`id`, `nev`, `orszag`, `liga`, `tipus`, `helyezes`) VALUES
(1, 'Manchester City', 'Anglia', 'Premier League', 'klub', 1),
(2, 'Arsenal', 'Anglia', 'Premier League', 'klub', 2),
(3, 'Liverpool', 'Anglia', 'Premier League', 'klub', 3),
(4, 'Aston Villa', 'Anglia', 'Premier League', 'klub', 4),
(5, 'Tottenham Hotspur', 'Anglia', 'Premier League', 'klub', 5),
(6, 'Real Madrid', 'Spanyolország', 'La Liga', 'klub', 1),
(7, 'Barcelona', 'Spanyolország', 'La Liga', 'klub', 2),
(8, 'Atletico Madrid', 'Spanyolország', 'La Liga', 'klub', 3),
(9, 'Girona', 'Spanyolország', 'La Liga', 'klub', 4),
(10, 'Real Sociedad', 'Spanyolország', 'La Liga', 'klub', 5),
(11, 'Bayer Leverkusen', 'Németország', 'Bundesliga', 'klub', 1),
(12, 'Bayern München', 'Németország', 'Bundesliga', 'klub', 2),
(13, 'Stuttgart', 'Németország', 'Bundesliga', 'klub', 3),
(14, 'RB Leipzig', 'Németország', 'Bundesliga', 'klub', 4),
(15, 'Borussia Dortmund', 'Németország', 'Bundesliga', 'klub', 5),
(16, 'Inter', 'Olaszország', 'Serie A', 'klub', 1),
(17, 'AC Milan', 'Olaszország', 'Serie A', 'klub', 2),
(18, 'Juventus', 'Olaszország', 'Serie A', 'klub', 3),
(19, 'Napoli', 'Olaszország', 'Serie A', 'klub', 4),
(20, 'Atalanta', 'Olaszország', 'Serie A', 'klub', 5),
(21, 'Paris Saint-Germain', 'Franciaország', 'Ligue 1', 'klub', 1),
(22, 'Monaco', 'Franciaország', 'Ligue 1', 'klub', 2),
(23, 'Lille', 'Franciaország', 'Ligue 1', 'klub', 3),
(24, 'Marseille', 'Franciaország', 'Ligue 1', 'klub', 4),
(25, 'Nice', 'Franciaország', 'Ligue 1', 'klub', 5),
(26, 'Real Madrid', 'Spanyolország', 'Bajnokok Ligája', 'klub', 1),
(27, 'Manchester City', 'Anglia', 'Bajnokok Ligája', 'klub', 2),
(28, 'Bayern München', 'Németország', 'Bajnokok Ligája', 'klub', 3),
(29, 'Paris Saint-Germain', 'Franciaország', 'Bajnokok Ligája', 'klub', 4),
(30, 'Inter', 'Olaszország', 'Bajnokok Ligája', 'klub', 5),
(31, 'Fiorentina', 'Olaszország', 'Európa Konferencia Liga', 'klub', 1),
(32, 'Aston Villa', 'Anglia', 'Európa Konferencia Liga', 'klub', 2),
(33, 'Club Brugge', 'Belgium', 'Európa Konferencia Liga', 'klub', 3),
(34, 'Lille', 'Franciaország', 'Európa Konferencia Liga', 'klub', 4),
(35, 'PAOK', 'Görögország', 'Európa Konferencia Liga', 'klub', 5),
(36, 'Franciaország', 'Franciaország', 'VB-selejtező', 'valogatott', 1),
(37, 'Anglia', 'Anglia', 'VB-selejtező', 'valogatott', 2),
(38, 'Portugália', 'Portugália', 'VB-selejtező', 'valogatott', 3),
(39, 'Spanyolország', 'Spanyolország', 'VB-selejtező', 'valogatott', 4),
(40, 'Magyarország', 'Magyarország', 'VB-selejtező', 'valogatott', 5);

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
(80, 'Roland Sallai', 'Szélső', 'Magyarország', 40);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `csapatok`
--
ALTER TABLE `csapatok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `jatekosok`
--
ALTER TABLE `jatekosok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `csapat_id` (`csapat_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `csapatok`
--
ALTER TABLE `csapatok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT a táblához `jatekosok`
--
ALTER TABLE `jatekosok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `jatekosok`
--
ALTER TABLE `jatekosok`
  ADD CONSTRAINT `jatekosok_ibfk_1` FOREIGN KEY (`csapat_id`) REFERENCES `csapatok` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
