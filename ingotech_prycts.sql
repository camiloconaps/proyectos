-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 11-04-2023 a las 12:37:21
-- Versión del servidor: 10.3.38-MariaDB-cll-lve
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ingotech_prycts`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CAMBIO_FECHAS`
--

CREATE TABLE `CAMBIO_FECHAS` (
  `ID` int(11) NOT NULL,
  `ID_DETALLE` int(11) NOT NULL,
  `FECHA_ANTERIOR` date NOT NULL,
  `FECHA_NUEVA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CAMPANAS`
--

CREATE TABLE `CAMPANAS` (
  `ID` int(11) NOT NULL,
  `CAMPANA` varchar(250) NOT NULL,
  `ESTADO` int(11) NOT NULL,
  `ID_CLIENTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `CAMPANAS`
--

INSERT INTO `CAMPANAS` (`ID`, `CAMPANA`, `ESTADO`, `ID_CLIENTE`) VALUES
(1, 'Cartera castigada', 1, 2),
(2, 'ATH', 1, 1),
(3, 'Atencion lineas de servico al cliente', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CASOS`
--

CREATE TABLE `CASOS` (
  `NUM_CASO` int(11) NOT NULL,
  `ESTADO` int(11) NOT NULL,
  `FECHA_SOLICITUD` date NOT NULL,
  `FECHA_INICIO` date NOT NULL,
  `FECHA_FIN` date NOT NULL,
  `TIPO_SOLICITUD` int(11) NOT NULL,
  `SOLICITUD` int(11) NOT NULL,
  `CLIENTE` int(11) NOT NULL,
  `CAMPANA` int(11) NOT NULL,
  `LINEA_NEGOCIO` int(11) NOT NULL,
  `LINEA` int(11) NOT NULL,
  `LINEA_TECNICA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `CASOS`
--

INSERT INTO `CASOS` (`NUM_CASO`, `ESTADO`, `FECHA_SOLICITUD`, `FECHA_INICIO`, `FECHA_FIN`, `TIPO_SOLICITUD`, `SOLICITUD`, `CLIENTE`, `CAMPANA`, `LINEA_NEGOCIO`, `LINEA`, `LINEA_TECNICA`) VALUES
(763412, 10, '2023-01-10', '2023-03-29', '2023-04-10', 1, 3, 1, 1, 1, 1, 1),
(1423192, 4, '2023-04-03', '2023-04-04', '2023-04-11', 2, 1, 1, 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CLIENTES`
--

CREATE TABLE `CLIENTES` (
  `ID` int(11) NOT NULL,
  `CLIENTE` varchar(100) NOT NULL,
  `ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `CLIENTES`
--

INSERT INTO `CLIENTES` (`ID`, `CLIENTE`, `ESTADO`) VALUES
(1, 'ATH', 1),
(2, 'BANCO AV VILLAS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DETALLE_CASOS`
--

CREATE TABLE `DETALLE_CASOS` (
  `ID` int(11) NOT NULL,
  `ID_CASO` int(11) NOT NULL,
  `FECHA_INI_ESTIMADA` date NOT NULL,
  `FECHA_INI_REAL` date NOT NULL,
  `FECHA_FIN_PMO` date NOT NULL,
  `FECHA_FIN_DEV` date NOT NULL,
  `FECHA_FIN_QA` int(11) NOT NULL,
  `FECHA_DESPLIEGUE` date NOT NULL,
  `PMO` int(11) NOT NULL,
  `INGENIERO` int(11) NOT NULL,
  `QA` int(11) NOT NULL,
  `ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ESTADO`
--

CREATE TABLE `ESTADO` (
  `ID` int(11) NOT NULL,
  `DESCRIP` varchar(100) NOT NULL,
  `TIPO` varchar(20) NOT NULL,
  `ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ESTADO`
--

INSERT INTO `ESTADO` (`ID`, `DESCRIP`, `TIPO`, `ESTADO`) VALUES
(1, 'ACTIVO', 'LISTA', 0),
(2, 'INACTIVO', 'LISTA', 1),
(3, 'CANCELADO', 'REG', 2),
(4, 'EN COLA', 'REG', 3),
(5, 'EN PRODUCCION', 'REG', 4),
(6, 'EN PROGRESO', 'REG', 5),
(7, 'EN PRUEBAS', 'REG', 6),
(8, 'ESTANCADO', 'REG', 7),
(9, 'ESTIMACION', 'REG', 8),
(10, 'MARCHA BLANCA', 'REG', 9),
(11, 'SIN ACTA', 'REG', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LINEA`
--

CREATE TABLE `LINEA` (
  `ID` int(11) NOT NULL,
  `LINEA` varchar(120) NOT NULL,
  `ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `LINEA`
--

INSERT INTO `LINEA` (`ID`, `LINEA`, `ESTADO`) VALUES
(1, 'DESARROLLO', 1),
(2, 'SOPORTE', 1),
(3, 'DOCUMENTACION', 1),
(4, 'INVESTIGACION', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LINEA_NEGOCIO`
--

CREATE TABLE `LINEA_NEGOCIO` (
  `ID` int(11) NOT NULL,
  `LIENA_NEGOCIO` varchar(250) NOT NULL,
  `ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `LINEA_NEGOCIO`
--

INSERT INTO `LINEA_NEGOCIO` (`ID`, `LIENA_NEGOCIO`, `ESTADO`) VALUES
(1, 'ADM', 1),
(2, 'BPO', 1),
(3, 'COB', 1),
(4, 'SAC', 1),
(5, 'VMC', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LINEA_TECNICA`
--

CREATE TABLE `LINEA_TECNICA` (
  `ID` int(11) NOT NULL,
  `LINEA_TECNICA` varchar(50) NOT NULL,
  `ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `LINEA_TECNICA`
--

INSERT INTO `LINEA_TECNICA` (`ID`, `LINEA_TECNICA`, `ESTADO`) VALUES
(1, 'OUTBOUND', 1),
(2, 'INBOUND', 1),
(3, 'MAIL', 1),
(4, 'ENCUESTA', 1),
(5, 'CALLBACK', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PERSONAS`
--

CREATE TABLE `PERSONAS` (
  `ID` int(11) NOT NULL,
  `TIPO` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `CARGO` int(11) NOT NULL,
  `DOCUMENTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `PERSONAS`
--

INSERT INTO `PERSONAS` (`ID`, `TIPO`, `NOMBRE`, `CARGO`, `DOCUMENTO`) VALUES
(1, 1, 'SERGIO CRUZ', 1, 1110),
(2, 1, 'SEBASTIAN CORTES', 1, 1111),
(3, 1, 'LUIS ALVAREZ', 1, 1112),
(4, 1, 'DIEGO RODRIGUEZ', 1, 1113),
(5, 1, 'CAMILO PORRAS', 1, 1114),
(6, 1, 'DANIEL ESPITIA', 1, 1115),
(7, 1, 'CAMILO RODRIGUEZ', 1, 1116),
(8, 1, 'OSCAR QUEMBA', 1, 1117),
(9, 1, 'RUBEN REYES', 2, 1118),
(10, 1, 'CAMILO DIAZ', 3, 1119);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SEGUIMIENTO_CASO`
--

CREATE TABLE `SEGUIMIENTO_CASO` (
  `ID` int(11) NOT NULL,
  `ID_CASO` int(11) NOT NULL,
  `ID_DETALLE` int(11) NOT NULL,
  `FECHA` int(11) NOT NULL DEFAULT current_timestamp(),
  `SEG` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SOLICITUD`
--

CREATE TABLE `SOLICITUD` (
  `ID` int(11) NOT NULL,
  `SOLICITUD` varchar(100) NOT NULL,
  `ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `SOLICITUD`
--

INSERT INTO `SOLICITUD` (`ID`, `SOLICITUD`, `ESTADO`) VALUES
(1, 'Comercial', 1),
(2, 'Operacion', 1),
(3, 'PMO', 1),
(4, 'Tecnologia', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TIPO_SOLICITUD`
--

CREATE TABLE `TIPO_SOLICITUD` (
  `ID` int(11) NOT NULL,
  `TIPO_SOLICITUD` varchar(100) NOT NULL,
  `ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `TIPO_SOLICITUD`
--

INSERT INTO `TIPO_SOLICITUD` (`ID`, `TIPO_SOLICITUD`, `ESTADO`) VALUES
(1, 'Proyecto', 1),
(2, 'Requerimiento', 1),
(3, 'Tarea', 1),
(4, 'Soporte', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `CAMBIO_FECHAS`
--
ALTER TABLE `CAMBIO_FECHAS`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `CAMPANAS`
--
ALTER TABLE `CAMPANAS`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `CLIENTES`
--
ALTER TABLE `CLIENTES`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `DETALLE_CASOS`
--
ALTER TABLE `DETALLE_CASOS`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ESTADO`
--
ALTER TABLE `ESTADO`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `LINEA`
--
ALTER TABLE `LINEA`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `LINEA_NEGOCIO`
--
ALTER TABLE `LINEA_NEGOCIO`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `LINEA_TECNICA`
--
ALTER TABLE `LINEA_TECNICA`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `PERSONAS`
--
ALTER TABLE `PERSONAS`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `SEGUIMIENTO_CASO`
--
ALTER TABLE `SEGUIMIENTO_CASO`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `SOLICITUD`
--
ALTER TABLE `SOLICITUD`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `TIPO_SOLICITUD`
--
ALTER TABLE `TIPO_SOLICITUD`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `CAMBIO_FECHAS`
--
ALTER TABLE `CAMBIO_FECHAS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CAMPANAS`
--
ALTER TABLE `CAMPANAS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `CLIENTES`
--
ALTER TABLE `CLIENTES`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `DETALLE_CASOS`
--
ALTER TABLE `DETALLE_CASOS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ESTADO`
--
ALTER TABLE `ESTADO`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `LINEA`
--
ALTER TABLE `LINEA`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `LINEA_NEGOCIO`
--
ALTER TABLE `LINEA_NEGOCIO`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `LINEA_TECNICA`
--
ALTER TABLE `LINEA_TECNICA`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `PERSONAS`
--
ALTER TABLE `PERSONAS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `SEGUIMIENTO_CASO`
--
ALTER TABLE `SEGUIMIENTO_CASO`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `SOLICITUD`
--
ALTER TABLE `SOLICITUD`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `TIPO_SOLICITUD`
--
ALTER TABLE `TIPO_SOLICITUD`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
