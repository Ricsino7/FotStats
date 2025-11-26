-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Nov 26. 07:38
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
(40, 'Magyarország', 'Magyarország', 'valogatott', 8, 5);

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
(1, 'Liverpool: Romano receives “information” over Slot sack as Reds intention becomes “very clear”', '0000-00-00', 'Football365 / Fabrizio Romano', 'Romano szerint a klubnak nincs jelenleg szándéka menedzsert váltani, habár rosszul indult a szezonjuk.'),
(2, 'Manchester United will sign striker in January on one condition; scout “Brazilian Haaland”', '0000-00-00', 'Football365 / Fabrizio Romano', 'Romano szerint az MU csak akkor igazol majd csatárt januárban, ha Benjamin Sesko sérülése hosszabb távú problémát jelent.'),
(3, 'Liverpool transfer twist as Romano confirms contract talks with fresh offer made and Reds “confident” of deal', '0000-00-00', 'LiverpoolWorld / Fabrizio Romano', 'Romano megerősítette, hogy az Anfield‑klub friss szerződéshosszabbítást kínált Ibrahima Konaténak, és bíznak a megállapodásban.');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT a táblához `jatekosok`
--
ALTER TABLE `jatekosok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

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
