-- Active: 1688916402845@@127.0.0.1@3306
-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 12, 2023 at 02:02 PM
-- Server version: 8.0.33-0ubuntu0.22.04.2
-- PHP Version: 8.1.2-1ubuntu2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `citas`;

--
-- Database: `citas`
--

-- --------------------------------------------------------

--
-- Table structure for table `acudiente`
--

USE `citas`;

CREATE TABLE `acudiente` (
  `acu_codigo` int NOT NULL,
  `acu_nombreCompleto` varchar(100) NOT NULL,
  `acu_telefono` varchar(100) NOT NULL,
  `acu_direccion` varchar(200) NOT NULL
);

INSERT INTO `acudiente` (`acu_codigo`, `acu_nombreCompleto`, `acu_telefono`, `acu_direccion`) VALUES
(1, 'Beniti Caldas', '+57384361614', 'En tu corazon bb'),
(2, 'Antonio Miranda', '+5738852641', 'avenida 15, en los ojos de tu corazon'),
(3, 'Estebaston Ramirez', '+5738854261', 'Carrea 18, por las curvas de tus cintura');


CREATE TABLE `cita` (
  `cit_codigo` int NOT NULL,
  `cit_fecha` date NOT NULL,
  `cit_estado` int NOT NULL,
  `cit_medico` int NOT NULL,
  `cit_datosUsuario` int NOT NULL
);

INSERT INTO `cita` (`cit_codigo`, `cit_fecha`, `cit_estado`, `cit_medico`, `cit_datosUsuario`) VALUES
(6, '2023-05-13', 2, 1234, 1),
(7, '2023-08-13', 1, 12468, 1),
(8, '2023-10-13', 1, 12468, 1),
(9, '2023-08-13', 1, 1345, 2),
(10, '2023-08-20', 1, 1234, 2);

CREATE TABLE `consultorio` (
  `cons_codigo` int NOT NULL,
  `cons_nombre` varchar(50) NOT NULL
);


INSERT INTO `consultorio` (`cons_codigo`, `cons_nombre`) VALUES
(1, 'Paso al infierno'),
(2, 'Mi primera uci'),
(3, 'San pedro'),
(4, 'Adios Amigos');

CREATE TABLE `especialidad` (
  `esp_id` int NOT NULL,
  `esp_nombre` varchar(20) NOT NULL
);

INSERT INTO `especialidad` (`esp_id`, `esp_nombre`) VALUES
(1, 'Oftamologia'),
(2, 'Neurologia'),
(3, 'Cardiologia'),
(4, 'Odontologia');

CREATE TABLE `estado_cita` (
  `estcita_id` int NOT NULL,
  `estcita_nombre` varchar(20) NOT NULL
);

INSERT INTO `estado_cita` (`estcita_id`, `estcita_nombre`) VALUES
(1, 'Pendiente'),
(2, 'Finalizada'),
(3, 'En curso'),
(4, 'Cancelada');

CREATE TABLE `genero` (
  `gen_id` int NOT NULL,
  `gen_nombre` varchar(50) NOT NULL,
  `gen_abreviatura` varchar(50) NOT NULL
);

INSERT INTO `genero` (`gen_id`, `gen_nombre`, `gen_abreviatura`) VALUES
(1, 'Maculino', 'M'),
(2, 'Femenino', 'F'),
(3, 'Otros', 'LGBTQ+'),
(4, 'Helicoptero Apache', 'HA'),
(5, 'Misil Ruso', 'MR');

CREATE TABLE `medico` (
  `med_nroMatriculaProsional` int NOT NULL,
  `med_nombreCompleto` varchar(120) NOT NULL,
  `med_consultorio` int NOT NULL,
  `med_especialidad` int NOT NULL
);

INSERT INTO `medico` (`med_nroMatriculaProsional`, `med_nombreCompleto`, `med_consultorio`, `med_especialidad`) VALUES
(1234, 'Antonio Taquemas', 1, 1),
(1345, 'Esteban Quito', 4, 4),
(12345, 'Diomedez Diaz', 3, 3),
(12468, 'Mr Zulander', 2, 2);

CREATE TABLE `tipo_documento` (
  `tipdoc_id` int NOT NULL,
  `tipdoc_nombre` varchar(50) NOT NULL,
  `tipdoc_abreviatura` varchar(50) NOT NULL
);


INSERT INTO `tipo_documento` (`tipdoc_id`, `tipdoc_nombre`, `tipdoc_abreviatura`) VALUES
(1, 'Cedula de ciudadania', 'CC'),
(2, 'Tarjeta de identidad', 'TI'),
(3, 'Pasaporte', 'PA'),
(4, 'Registro civil', 'RC'),
(5, 'Cédula de Extranjería', 'CE');


CREATE TABLE `usuarios` (
  `usu_id` int NOT NULL,
  `usu_nombre` varchar(50) NOT NULL,
  `usu_segdo_apellido_usuar` varchar(50) NOT NULL,
  `usu_primer_apellido_usuar` varchar(50) NOT NULL,
  `usu_telefono` varchar(50) NOT NULL,
  `usu_direccion` varchar(50) NOT NULL,
  `usu_e-mail` varchar(50) NOT NULL,
  `usu_tipodoc` int NOT NULL,
  `usu_genero` int NOT NULL,
  `usu_acudiente` int NOT NULL
);


INSERT INTO `usuarios` (`usu_id`, `usu_nombre`, `usu_segdo_apellido_usuar`, `usu_primer_apellido_usuar`, `usu_telefono`, `usu_direccion`, `usu_e-mail`, `usu_tipodoc`, `usu_genero`, `usu_acudiente`) VALUES
(1, 'German Aston', 'Merida', 'Galagoz', '+57231818989', 'Avenida tus abrazos', 'dartProGamer@correo.com', 1, 4, 2),
(2, 'Abigail Zorr', 'Gonzales', 'Cabalga', '+57231775955', 'Carrera 18 - aqui no roban', 'bbcitaAbiprincess@correo.com', 1, 2, 1);


ALTER TABLE `acudiente`
  ADD PRIMARY KEY (`acu_codigo`);

ALTER TABLE `cita`
  ADD PRIMARY KEY (`cit_codigo`),
  ADD KEY `fk_estado` (`cit_estado`),
  ADD KEY `fk_medico` (`cit_medico`),
  ADD KEY `fk_datosUsuario` (`cit_datosUsuario`);

ALTER TABLE `consultorio`
  ADD PRIMARY KEY (`cons_codigo`);

ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`esp_id`);

ALTER TABLE `estado_cita`
  ADD PRIMARY KEY (`estcita_id`);

ALTER TABLE `genero`
  ADD PRIMARY KEY (`gen_id`);

ALTER TABLE `medico`
  ADD PRIMARY KEY (`med_nroMatriculaProsional`),
  ADD KEY `fk_consultorio` (`med_consultorio`),
  ADD KEY `fk_especialidad` (`med_especialidad`);

ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`tipdoc_id`);

ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usu_id`),
  ADD KEY `fk_tipodoc` (`usu_tipodoc`),
  ADD KEY `fk_genero` (`usu_genero`),
  ADD KEY `fk_acudiente` (`usu_acudiente`);

ALTER TABLE `acudiente`
  MODIFY `acu_codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `cita`
  MODIFY `cit_codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `consultorio`
  MODIFY `cons_codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `especialidad`
  MODIFY `esp_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `estado_cita`
  MODIFY `estcita_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `genero`
  MODIFY `gen_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `tipo_documento`
  MODIFY `tipdoc_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `usuarios`
  MODIFY `usu_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `cita`
  ADD CONSTRAINT `fk_datosUsuario` FOREIGN KEY (`cit_datosUsuario`) REFERENCES `usuarios` (`usu_id`),
  ADD CONSTRAINT `fk_estado` FOREIGN KEY (`cit_estado`) REFERENCES `estado_cita` (`estcita_id`),
  ADD CONSTRAINT `fk_medico` FOREIGN KEY (`cit_medico`) REFERENCES `medico` (`med_nroMatriculaProsional`);

ALTER TABLE `medico`
  ADD CONSTRAINT `fk_consultorio` FOREIGN KEY (`med_consultorio`) REFERENCES `consultorio` (`cons_codigo`),
  ADD CONSTRAINT `fk_especialidad` FOREIGN KEY (`med_especialidad`) REFERENCES `especialidad` (`esp_id`);

ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_acudiente` FOREIGN KEY (`usu_acudiente`) REFERENCES `acudiente` (`acu_codigo`),
  ADD CONSTRAINT `fk_genero` FOREIGN KEY (`usu_genero`) REFERENCES `genero` (`gen_id`),
  ADD CONSTRAINT `fk_tipodoc` FOREIGN KEY (`usu_tipodoc`) REFERENCES `tipo_documento` (`tipdoc_id`);