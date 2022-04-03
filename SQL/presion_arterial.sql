-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2022 at 01:31 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `presion_arterial`
--

-- --------------------------------------------------------

--
-- Table structure for table `clinica`
--

CREATE TABLE `clinica` (
  `cod_clin` int(8) NOT NULL,
  `Nombre_clinica` varchar(35) NOT NULL,
  `Nombre_Med` varchar(35) NOT NULL,
  `Especialidad` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clinica`
--

INSERT INTO `clinica` (`cod_clin`, `Nombre_clinica`, `Nombre_Med`, `Especialidad`) VALUES
(1, 'Unidad Medica Provincia', 'Stephen Strange', 'Neurocirujano'),
(2, 'Clinica Tuxtepec', 'Jorge Zapata', 'Medicina Interna'),
(3, 'Clinica Monterrey', 'Antonio Perez', 'Medicina Interna'),
(4, 'Salud para Todos', 'Rodrigo Francisco', 'Cirujano Plastico');

-- --------------------------------------------------------

--
-- Table structure for table `pacientes`
--

CREATE TABLE `pacientes` (
  `Num_Pac` int(8) NOT NULL,
  `Nombre_Pac` varchar(35) NOT NULL,
  `Edad` int(3) NOT NULL,
  `Genero` varchar(15) NOT NULL,
  `Fecha_ingreso` date NOT NULL,
  `Sistolica_mmHg` int(4) NOT NULL,
  `Diastolica_mmHg` int(4) NOT NULL,
  `cod_clin_fk` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pacientes`
--

INSERT INTO `pacientes` (`Num_Pac`, `Nombre_Pac`, `Edad`, `Genero`, `Fecha_ingreso`, `Sistolica_mmHg`, `Diastolica_mmHg`, `cod_clin_fk`) VALUES
(1, 'Vladimir Putin', 69, 'Masculino', '2022-01-10', 120, 80, 1),
(2, 'Jessica Lopez', 32, 'Femenino', '2022-03-01', 180, 120, 2),
(3, 'Octavio Hernandez', 21, 'Masculino', '2021-06-14', 129, 80, 3),
(4, 'Ernesto Alonso', 54, 'Masculino', '2022-03-01', 140, 92, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clinica`
--
ALTER TABLE `clinica`
  ADD PRIMARY KEY (`cod_clin`);

--
-- Indexes for table `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`Num_Pac`),
  ADD KEY `cod_clin_fk` (`cod_clin_fk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clinica`
--
ALTER TABLE `clinica`
  MODIFY `cod_clin` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `Num_Pac` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`Num_Pac`) REFERENCES `clinica` (`cod_clin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pacientes_ibfk_2` FOREIGN KEY (`cod_clin_fk`) REFERENCES `clinica` (`cod_clin`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
