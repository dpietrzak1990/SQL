drop database if exists samochody;

CREATE DATABASE `samochody` ;
use samochody;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


CREATE TABLE IF NOT EXISTS `auta` (
  `idauta` int(11) NOT NULL AUTO_INCREMENT,
  `marka` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,books
  `model` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `przebieg` int(11) NOT NULL,
  `rocznik` int(11) NOT NULL,
  `kolor` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `ubezpieczenie` int(11) NOT NULL,
  PRIMARY KEY (`idauta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Zrzut danych tabeli `auta`
--

INSERT INTO `auta` (`idauta`, `marka`, `model`, `przebieg`, `rocznik`, `kolor`, `ubezpieczenie`) VALUES
(1, 'Fiat', 'Punto', 124150, 2007, 'green', 800),
(2, 'Ford', 'Focus', 250415, 2010, 'yellow', 1528),
(3, 'Ford', 'Fiesta', 88056, 2011, 'green', 2588),
(4, 'Opel', 'Astra', 145001, 2009, 'yellow', 999),
(5, 'Opel', 'Corsa', 185470, 2010, 'red', 1050);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `klienci`
--

CREATE TABLE IF NOT EXISTS `klienci` (
  `idklienta` int(11) NOT NULL AUTO_INCREMENT,
  `imie` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `dowod` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `adres` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `miasto` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `plec` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`idklienta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`idklienta`, `imie`, `nazwisko`, `dowod`, `adres`, `miasto`, `plec`) VALUES
(1, 'Andrzej', 'Nowak', 'AFK343456', 'Toszecka 75, 44-100', 'Gliwice', 'm'),
(2, 'Joanna', 'Pastewniak', 'ACN345345', 'Rolna 57, 40-001', 'Katowice', 'k'),
(3, 'Jan', 'Jakubowski', 'ACN112234', 'Rolna 15, 40-001', 'Katowice', 'm'),
(4, 'Anna', 'Mariańska', 'ACF345678', 'Korfantego 13, 40-001', 'Katowice', 'k');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `wypozyczenia`
--

CREATE TABLE IF NOT EXISTS `wypozyczenia` (
  `idwyp` int(11) NOT NULL AUTO_INCREMENT,
  `idklienta` int(11) NOT NULL,
  `idauta` int(11) NOT NULL,
  `datawyp` date NOT NULL,
  `datazwrotu` date NOT NULL,
  `naleznosc` int(11) NOT NULL,
  PRIMARY KEY (`idwyp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `wypozyczenia`
--

INSERT INTO `wypozyczenia` (`idwyp`, `idklienta`, `idauta`, `datawyp`, `datazwrotu`, `naleznosc`) VALUES
(1, 2, 3, '2012-11-04', '2012-11-06', 89),
(2, 3, 1, '2012-11-01', '2012-11-13', 320),
(3, 4, 5, '2012-11-12', '2012-11-15', 102),
(4, 4, 1, '2012-04-15', '2012-04-20', 221);

DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity
(
`Idactivity` int NOT NULL AUTO_INCREMENT,
`Message` TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`Query` TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
PRIMARY KEY(`Idactivity`))
DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;


delimiter |
DROP TRIGGER if exists  wypozyczSamochod;
|

CREATE TRIGGER wypozyczSamochod
AFTER INSERT ON wypozyczenia
FOR EACH ROW
BEGIN
INSERT INTO Activity
SET Message= (SELECT(CONCAT("Wypożycz auto:", marka, model))
FROM auta WHERE idAuta = NEW.idAuta);
END
|

INSERT INTO wypozyczenia
SET idklienta =1, idauta =1, datawyp = "2017-09-14", datazwrotu = "2017-09-15", naleznosc = 111;
|
SELECT * FROM Activity;
|

CREATE TRIGGER noweAuto
AFTER INSERT ON auta
FOR EACH ROW 
BEGIN
INSERT INTO Activity
SET Message=(SELECT(CONCAT("Nowe auto:", new.marka, new.model, new.przebieg)));
END
|

INSERT INTO auta
SET
marka="VW",
model="Passat",
przebieg=200000,
rocznik=2015,
kolor= "srebrny metalik",
ubezpieczenie = 1;
|
SELECT * FROM auta;










