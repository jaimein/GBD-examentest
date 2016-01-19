-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 24-01-2016 a las 22:49:21
-- Versión del servidor: 5.5.46-0ubuntu0.14.04.2
-- Versión de PHP: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `GBD-examentest`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `descripcion`) VALUES
(1, '1ºASIR'),
(2, '2ºASIR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

CREATE TABLE IF NOT EXISTS `examen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `cursos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_examen_cursos1_idx` (`cursos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `examen`
--

INSERT INTO `examen` (`id`, `descripcion`, `cursos_id`) VALUES
(1, 'GBD', 1),
(2, 'ISO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intentos`
--

CREATE TABLE IF NOT EXISTS `intentos` (
  `id` int(11) NOT NULL,
  `intentos` int(11) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `examen_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_intentos_users1_idx` (`users_id`),
  KEY `fk_intentos_examen1_idx` (`examen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE IF NOT EXISTS `opciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enunciado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preguntas_id` int(11) NOT NULL,
  `correcta` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_opciones_preguntas1_idx` (`preguntas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`id`, `enunciado`, `preguntas_id`, `correcta`) VALUES
(1, 'create table `nomtabla`', 1, 0),
(2, 'drop table `nomtabla`', 1, 0),
(3, 'create database `nomtabla`', 1, 0),
(4, 'create table `nomtabla`', 2, 0),
(5, 'drop table `nomtabla`', 2, 0),
(6, 'create database `nomtabla`', 2, 0),
(7, 'drop database `nomtabla`', 2, 0),
(8, 'create table `nomtabla`', 1, 1),
(9, 'drop table `nomtabla`', 1, 0),
(10, 'create database `nomtabla`', 1, 0),
(11, 'create table `nomtabla`', 2, 0),
(12, 'drop table `nomtabla`', 2, 1),
(13, 'create database `nomtabla`', 2, 0),
(14, 'drop database `nomtabla`', 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE IF NOT EXISTS `preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enunciado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `examen_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_preguntas_examen1_idx` (`examen_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `enunciado`, `examen_id`) VALUES
(1, '¿Cual es la sentencia para crear una tabla?', 1),
(2, '¿Cual es la sentencia para borrar una tabla?', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seleciones`
--

CREATE TABLE IF NOT EXISTS `seleciones` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `intentos_id` int(11) NOT NULL,
  `examen_id` int(11) NOT NULL,
  `preguntas_id` int(11) NOT NULL,
  `opciones_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_seleciones_users1_idx` (`users_id`),
  KEY `fk_seleciones_intentos1_idx` (`intentos_id`),
  KEY `fk_seleciones_examen1_idx` (`examen_id`),
  KEY `fk_seleciones_preguntas1_idx` (`preguntas_id`),
  KEY `fk_seleciones_opciones1_idx` (`opciones_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellidos` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userpass` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cursos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_users_cursos_idx` (`cursos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `apellidos`, `username`, `userpass`, `email`, `cursos_id`) VALUES
(1, 'pepe', 'pepe pepe', 'pepe', 'pepe', 'pepe@gmail.com', 1),
(2, 'paula', 'paula', 'paula', 'paula', 'paula@gmail.com', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `examen`
--
ALTER TABLE `examen`
  ADD CONSTRAINT `fk_examen_cursos1` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `intentos`
--
ALTER TABLE `intentos`
  ADD CONSTRAINT `fk_intentos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_intentos_examen1` FOREIGN KEY (`examen_id`) REFERENCES `examen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD CONSTRAINT `fk_opciones_preguntas1` FOREIGN KEY (`preguntas_id`) REFERENCES `preguntas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `fk_preguntas_examen1` FOREIGN KEY (`examen_id`) REFERENCES `examen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `seleciones`
--
ALTER TABLE `seleciones`
  ADD CONSTRAINT `fk_seleciones_users1` FOREIGN KEY (`users_id`) REFERENCES `mydb`.`users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_seleciones_intentos1` FOREIGN KEY (`intentos_id`) REFERENCES `mydb`.`intentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_seleciones_examen1` FOREIGN KEY (`examen_id`) REFERENCES `mydb`.`examen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_seleciones_preguntas1` FOREIGN KEY (`preguntas_id`) REFERENCES `mydb`.`preguntas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_seleciones_opciones1` FOREIGN KEY (`opciones_id`) REFERENCES `mydb`.`opciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_cursos` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
