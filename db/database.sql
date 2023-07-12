SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


DROP DATABASE IF EXISTS `citas`;

CREATE DATABASE citas;

CREATE TABLE `usuarios`(
    `usu_id` INT(11) NOT NULL,
    `usu_nombre` VARCHAR(50) NOT NULL,
    `usu_segdo_apellido_usuar` VARCHAR(50) NOT NULL,
    `usu_primer_apellido_usuar` VARCHAR(50) NOT NULL,
    `usu_telefono` VARCHAR(50) NOT NULL,
    `usu_direccion` VARCHAR(50) NOT NULL,
    `usu_e-mail` VARCHAR(50) NOT NULL,
    `usu_tipodoc` INT(11) NOT NULL,
    `usu_genero` INT(11) NOT NULL,
    `usu_acudiente` INT(11) NOT NULL,

    CONSTRAINT fk_tipodoc 
    FOREIGN KEY(usu_tipodoc) REFERENCES tipo_documento(tipdoc_id),
    
    CONSTRAINT fk_genero 
    FOREIGN KEY(usu_genero) REFERENCES genero(gen_id),

    CONSTRAINT fk_acudiente 
    FOREIGN KEY(usu_acudiente) REFERENCES acudiente(acu_codigo),


);


