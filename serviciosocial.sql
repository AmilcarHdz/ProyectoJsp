-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2019 a las 04:07:58
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `serviciosocial`
--
CREATE DATABASE IF NOT EXISTS `serviciosocial` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `serviciosocial`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `IdCarrera` int(11) NOT NULL,
  `NombreCarrera` varchar(50) NOT NULL,
  `Tipocarrera` varchar(50) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`IdCarrera`, `NombreCarrera`, `Tipocarrera`, `estado`) VALUES
(1212, 'Quimica', 'Tecnico', 1),
(1247, 'Sistemas Informaticos', 'Tecnico', 1),
(4786, 'Mecatronica', 'Ingenieria', 1),
(7459, 'Indutrial', 'Ingenieria', 1),
(7486, 'Gastronomia', 'Tecnico', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlhoras`
--

CREATE TABLE `controlhoras` (
  `IdControl` int(11) NOT NULL,
  `TotalHoras` double NOT NULL,
  `IdDetalle` int(11) NOT NULL,
  `Id_Estudiante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordinador`
--

CREATE TABLE `coordinador` (
  `IdCoordinador` int(11) NOT NULL,
  `NombCoordinador` varchar(50) NOT NULL,
  `EdadCoordinador` int(11) NOT NULL,
  `SexoCor` varchar(50) NOT NULL,
  `CorreoCoord` varchar(50) NOT NULL,
  `Escuela` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `coordinador`
--

INSERT INTO `coordinador` (`IdCoordinador`, `NombCoordinador`, `EdadCoordinador`, `SexoCor`, `CorreoCoord`, `Escuela`, `estado`) VALUES
(1212, 'sadad', 20, 'Masculino', 'xample@gmail.com', 7486, 1),
(2312, 'rony', 18, 'Masculino', 'xample@gmail.com', 7459, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallehoras`
--

CREATE TABLE `detallehoras` (
  `IdDet` int(11) NOT NULL,
  `IdRegHoras` int(11) NOT NULL,
  `fechaAct` date NOT NULL,
  `Actividad` varchar(500) NOT NULL,
  `HorasD` double NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detallehoras`
--

INSERT INTO `detallehoras` (`IdDet`, `IdRegHoras`, `fechaAct`, `Actividad`, `HorasD`, `estado`) VALUES
(1, 1, '2019-11-11', 'wewe', 1, 1),
(9, 1, '2019-11-14', 'trapear', 12, 1),
(10, 1, '2019-11-14', 'trapear', 12, 1),
(11, 1, '2019-11-11', 'wewerer', 1, 1),
(12, 1, '2019-11-11', 'okys', 10, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `IdEstudiante` int(11) NOT NULL,
  `NombreEstudiante` varchar(50) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Sexo` varchar(50) NOT NULL,
  `CorreoElectronico` varchar(50) NOT NULL,
  `IdCarrera` int(11) NOT NULL,
  `EstadoCarrera` varchar(50) NOT NULL,
  `Sede` varchar(50) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`IdEstudiante`, `NombreEstudiante`, `Edad`, `Sexo`, `CorreoElectronico`, `IdCarrera`, `EstadoCarrera`, `Sede`, `estado`) VALUES
(2132, 'Xample', 17, 'Masculino', 'xample@gmail.com', 1212, 'En Curso', 'Sede Santa Tecla', 1),
(2234, 'Xample2', 19, 'Masculino', 'Xample00@gmail.com', 7486, 'En Curso', 'Sede Santa Tecla', 1),
(4781, 'rony', 19, 'Masculino', 'Xample00@gmail.com', 7486, 'En Curso', 'Sede Santa Tecla', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `finalsse`
--

CREATE TABLE `finalsse` (
  `IdF` int(11) NOT NULL,
  `Estudiante` varchar(50) NOT NULL,
  `Escuela` varchar(100) NOT NULL,
  `Sede` varchar(100) NOT NULL,
  `Carrera` varchar(100) NOT NULL,
  `Carnet` int(11) NOT NULL,
  `Jornada` varchar(25) NOT NULL,
  `AnioEstudio` varchar(25) NOT NULL,
  `TelefonoEst` varchar(25) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Institucion` varchar(200) NOT NULL,
  `Direccion` varchar(500) NOT NULL,
  `TelefonoIns` varchar(20) NOT NULL,
  `SitioWeb` varchar(100) NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL,
  `Observaciones` varchar(500) DEFAULT NULL,
  `EncargadoIns` varchar(100) NOT NULL,
  `Coordinador` varchar(100) NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `finalsse`
--

INSERT INTO `finalsse` (`IdF`, `Estudiante`, `Escuela`, `Sede`, `Carrera`, `Carnet`, `Jornada`, `AnioEstudio`, `TelefonoEst`, `Correo`, `Institucion`, `Direccion`, `TelefonoIns`, `SitioWeb`, `FechaInicio`, `FechaFin`, `Observaciones`, `EncargadoIns`, `Coordinador`, `Estado`) VALUES
(1, 'Rony', 'Quimica', 'Regional La Union', 'Quimica', 4781, 'Diurna', 'Primer anio', '7849-6648', 'xample@gmail.com', 'xcd', 'dskj', '7869-4512', 'sdlsdsjl', '2019-11-12', '2019-11-14', 'dsds', 'vjklxvxjvkl', 'clxczxkcxk', 1),
(10, 'Rony', 'Quimica', 'Regional La Union', 'Quimica', 2234, 'Diurna', 'Primer anio', '7849-6648', 'xample@gmail.com', 'xcd', 'dskj', '7869-4512', 'sdlsdsjl', '2019-11-12', '2019-11-14', 'dsds', 'vjklxvxjvkl', 'clxczxkcxk', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarioyact`
--

CREATE TABLE `horarioyact` (
  `IdHA` int(11) NOT NULL,
  `CarnetEstudiante` int(11) NOT NULL,
  `ActRealizar` varchar(500) NOT NULL,
  `Objetivo` varchar(500) NOT NULL,
  `Meta` varchar(500) NOT NULL,
  `Duracion` int(11) NOT NULL,
  `Lunes` varchar(70) DEFAULT NULL,
  `Martes` varchar(70) DEFAULT NULL,
  `Miercoles` varchar(70) DEFAULT NULL,
  `Jueves` varchar(70) DEFAULT NULL,
  `Viernes` varchar(70) DEFAULT NULL,
  `Sabado` varchar(70) DEFAULT NULL,
  `Domingo` varchar(70) DEFAULT NULL,
  `NombreEst` varchar(70) NOT NULL,
  `EstadoS` varchar(50) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horarioyact`
--

INSERT INTO `horarioyact` (`IdHA`, `CarnetEstudiante`, `ActRealizar`, `Objetivo`, `Meta`, `Duracion`, `Lunes`, `Martes`, `Miercoles`, `Jueves`, `Viernes`, `Sabado`, `Domingo`, `NombreEst`, `EstadoS`, `estado`) VALUES
(1, 4781, 'xd', 'xda', 'xdasf', 6, '7am-4pm', '7am-4pm', '7am-4pm', '7am-4pm', '7am-4pm', '7am-4pm', '7am-5pm', 'rony', 'Aprovado', 1),
(2, 2234, 'hola', 'insert', 'sdddd', 6, '8am-5pm', '8am-5pm', '8am-5pm', '8am-5pm', '8am-5pm', '8am-5pm', '8am-5pm', 'RAAH', 'No aprovado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `llenar`
--

CREATE TABLE `llenar` (
  `IdRegistroHoras` int(11) NOT NULL,
  `sedeEstudio` varchar(50) NOT NULL,
  `nombreEstudiante` varchar(50) NOT NULL,
  `EscuelaP` varchar(50) NOT NULL,
  `nombreCarrera` varchar(50) NOT NULL,
  `IdEstudiante` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `llenar`
--

INSERT INTO `llenar` (`IdRegistroHoras`, `sedeEstudio`, `nombreEstudiante`, `EscuelaP`, `nombreCarrera`, `IdEstudiante`, `estado`) VALUES
(1, 'Sede Santa Tecla', 'Rony', 'Computacion', 'Sistemas Informaticos', 4781, 1),
(2, 'Regional La Union', 'sds', 'Computacion', 'Sistemas Informaticos', 2234, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sse`
--

CREATE TABLE `sse` (
  `IdSse` int(11) NOT NULL,
  `Sede` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `NombreEstudiante` varchar(50) NOT NULL,
  `NombreInstitucion` varchar(70) NOT NULL,
  `Destinatario` varchar(70) NOT NULL,
  `Comentarios` varchar(500) DEFAULT NULL,
  `EstadoSolicitud` varchar(50) NOT NULL,
  `CarnetEstudiante` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sse`
--

INSERT INTO `sse` (`IdSse`, `Sede`, `NombreEstudiante`, `NombreInstitucion`, `Destinatario`, `Comentarios`, `EstadoSolicitud`, `CarnetEstudiante`, `fecha`, `estado`) VALUES
(2, 'Regional La Union', 'sdasdfafd', 'dfsfsdfsd', 'xsdscsdd', 'Sin comentarios', 'Aprovada', 4781, '2019-11-11', 1),
(28, 'Sede Santa Tecla', 'sddfs', 'awd', 'wdawd', 'awdawdaw', 'Pendiente', 2132, '2019-11-15', 1),
(34, 'Sede Santa Tecla', 'dfkdj', 'jkjk', 'jkhjh', 'wdsdsSin comentarios', 'Pendiente', 2234, '2019-11-15', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IdUsuario` int(11) NOT NULL,
  `Usuario` varchar(50) NOT NULL,
  `Pass` varchar(50) NOT NULL,
  `Privilegios` int(50) NOT NULL,
  `estado` int(11) NOT NULL,
  `carnet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IdUsuario`, `Usuario`, `Pass`, `Privilegios`, `estado`, `carnet`) VALUES
(45, 'Invitado', '123', 1, 0, 0),
(47, 'rony', '202cb962ac59075b964b07152d234b70', 2, 0, 0),
(52, 'anaya', '202cb962ac59075b964b07152d234b70', 1, 1, 0),
(55, 'xd', '202cb962ac59075b964b07152d234b70', 1, 1, 0),
(56, 'raa', 'a1f925a7b5b70b7b3f7fe2208513e10f', 2, 1, 0),
(61, 'xcsd', '202cb962ac59075b964b07152d234b70', 1, 0, 0),
(62, 'sad', '81dc9bdb52d04dc20036dbd8313ed055', 1, 0, 0),
(63, 'gfgfgfg', 'e99bbbb78e71ed8cdb1b9c57ceed64ff', 1, 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`IdCarrera`);

--
-- Indices de la tabla `controlhoras`
--
ALTER TABLE `controlhoras`
  ADD PRIMARY KEY (`IdControl`),
  ADD KEY `fkEstudiante` (`Id_Estudiante`);

--
-- Indices de la tabla `coordinador`
--
ALTER TABLE `coordinador`
  ADD PRIMARY KEY (`IdCoordinador`);

--
-- Indices de la tabla `detallehoras`
--
ALTER TABLE `detallehoras`
  ADD PRIMARY KEY (`IdDet`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`IdEstudiante`),
  ADD KEY `fkCarrera` (`IdCarrera`);

--
-- Indices de la tabla `finalsse`
--
ALTER TABLE `finalsse`
  ADD PRIMARY KEY (`IdF`),
  ADD UNIQUE KEY `FinsseCarnet` (`Carnet`);

--
-- Indices de la tabla `horarioyact`
--
ALTER TABLE `horarioyact`
  ADD PRIMARY KEY (`IdHA`);

--
-- Indices de la tabla `llenar`
--
ALTER TABLE `llenar`
  ADD PRIMARY KEY (`IdRegistroHoras`),
  ADD UNIQUE KEY `fkcarne` (`IdEstudiante`) USING BTREE,
  ADD KEY `IdEstudiante` (`IdEstudiante`);

--
-- Indices de la tabla `sse`
--
ALTER TABLE `sse`
  ADD PRIMARY KEY (`IdSse`),
  ADD UNIQUE KEY `fkUnique` (`CarnetEstudiante`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IdUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detallehoras`
--
ALTER TABLE `detallehoras`
  MODIFY `IdDet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `finalsse`
--
ALTER TABLE `finalsse`
  MODIFY `IdF` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `horarioyact`
--
ALTER TABLE `horarioyact`
  MODIFY `IdHA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `llenar`
--
ALTER TABLE `llenar`
  MODIFY `IdRegistroHoras` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sse`
--
ALTER TABLE `sse`
  MODIFY `IdSse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `controlhoras`
--
ALTER TABLE `controlhoras`
  ADD CONSTRAINT `fkEstudiante` FOREIGN KEY (`Id_Estudiante`) REFERENCES `estudiantes` (`IdEstudiante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `fkCarrera` FOREIGN KEY (`IdCarrera`) REFERENCES `carrera` (`IdCarrera`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `llenar`
--
ALTER TABLE `llenar`
  ADD CONSTRAINT `llenar_ibfk_1` FOREIGN KEY (`IdEstudiante`) REFERENCES `estudiantes` (`IdEstudiante`);

--
-- Filtros para la tabla `sse`
--
ALTER TABLE `sse`
  ADD CONSTRAINT `fkcarnet` FOREIGN KEY (`CarnetEstudiante`) REFERENCES `estudiantes` (`IdEstudiante`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
