drop database if exists clinic;

CREATE DATABASE `clinic` ;
use clinic;


CREATE TABLE `Pacjent`
(
`idpacjenta` INT NOT NULL AUTO_INCREMENT,
`imie` VARCHAR(40) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`nazwisko` VARCHAR(60) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`street` VARCHAR(40) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`city`VARCHAR(40) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
PRIMARY KEY(`idpacjenta`))
DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;


CREATE TABLE `Lekarz`
(
`idlekarza` INT NOT NULL AUTO_INCREMENT,
`imie` VARCHAR(40) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`nazwisko` VARCHAR(60) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`specialize` VARCHAR(40) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
PRIMARY KEY(`idlekarza`))
DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

CREATE TABLE `Wizyty`
(
`idwizyty` INT NOT NULL AUTO_INCREMENT,
`idpacjenta` INT(10),
`idlekarza` INT (3),
`data` DATE NOT NULL,
`godzina` TIME NOT NULL,
PRIMARY KEY(`idwizyty`))
DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;








