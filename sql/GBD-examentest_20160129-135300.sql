﻿-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 29-01-2016 a las 13:52:03
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
CREATE DATABASE IF NOT EXISTS `GBD-examentest` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `GBD-examentest`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

DROP TABLE IF EXISTS `cursos`;
CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Truncar tablas antes de insertar `cursos`
--

TRUNCATE TABLE `cursos`;
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

DROP TABLE IF EXISTS `examen`;
CREATE TABLE IF NOT EXISTS `examen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `cursos_id` int(11) NOT NULL,
  `intentosMax` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_examen_cursos1_idx` (`cursos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Truncar tablas antes de insertar `examen`
--

TRUNCATE TABLE `examen`;
--
-- Volcado de datos para la tabla `examen`
--

INSERT INTO `examen` (`id`, `descripcion`, `cursos_id`, `intentosMax`) VALUES
(1, 'GBD', 1, 3),
(2, 'ISO', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intentos`
--

DROP TABLE IF EXISTS `intentos`;
CREATE TABLE IF NOT EXISTS `intentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intentos` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `examen_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_intentos_users1_idx` (`users_id`),
  KEY `fk_intentos_examen1_idx` (`examen_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Truncar tablas antes de insertar `intentos`
--

TRUNCATE TABLE `intentos`;
--
-- Volcado de datos para la tabla `intentos`
--

INSERT INTO `intentos` (`id`, `intentos`, `users_id`, `examen_id`, `fecha`) VALUES
(11, 1, 1, 1, '2016-01-29 12:51:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) NOT NULL,
  `time` varchar(30) NOT NULL,
  KEY `index_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar `login_attempts`
--

TRUNCATE TABLE `login_attempts`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

DROP TABLE IF EXISTS `opciones`;
CREATE TABLE IF NOT EXISTS `opciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enunciado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preguntas_id` int(11) NOT NULL,
  `correcta` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_opciones_preguntas1_idx` (`preguntas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Truncar tablas antes de insertar `opciones`
--

TRUNCATE TABLE `opciones`;
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

DROP TABLE IF EXISTS `preguntas`;
CREATE TABLE IF NOT EXISTS `preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enunciado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `examen_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_preguntas_examen1_idx` (`examen_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Truncar tablas antes de insertar `preguntas`
--

TRUNCATE TABLE `preguntas`;
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

DROP TABLE IF EXISTS `seleciones`;
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

--
-- Truncar tablas antes de insertar `seleciones`
--

TRUNCATE TABLE `seleciones`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `usuario` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `cursos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`usuario`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_users_cursos_idx` (`cursos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Truncar tablas antes de insertar `users`
--

TRUNCATE TABLE `users`;
--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `apellidos`, `usuario`, `password`, `email`, `cursos_id`) VALUES
(1, 'pepe', 'pepe pepe', 'pepe', '974f3036f39834082e23f4d70f1feba9d4805b3ee2cedb50b6f1f49f72dd83616c2155f9ff6e08a1cefbf9e6ba2f4aaa45233c8c066a65e002924abfa51590c4', 'pepe@gmail.com', 1),
(2, 'paula', 'paula', 'paula', '65b491a49a5b59f5f00267177f585629d96c1365de4a6e9ae1821109a132ebcef8495a4a511259bb017f0731c62ee8239a8c6244a6b74f42273a67b5edce5e08', 'paula@gmail.com', 1);

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
  ADD CONSTRAINT `fk_intentos_examen1` FOREIGN KEY (`examen_id`) REFERENCES `examen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_intentos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD CONSTRAINT `login_attempts_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `fk_seleciones_examen1` FOREIGN KEY (`examen_id`) REFERENCES `examen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_seleciones_intentos1` FOREIGN KEY (`intentos_id`) REFERENCES `intentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_seleciones_opciones1` FOREIGN KEY (`opciones_id`) REFERENCES `opciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_seleciones_preguntas1` FOREIGN KEY (`preguntas_id`) REFERENCES `preguntas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_seleciones_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_cursos` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
