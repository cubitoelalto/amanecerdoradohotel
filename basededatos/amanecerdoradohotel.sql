-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 18-12-2023 a las 02:31:18
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `amanecerdoradohotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apPaterno` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apMaterno` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` bigint NOT NULL,
  `correo` varchar(40) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `nombre`, `apPaterno`, `apMaterno`, `direccion`, `telefono`, `correo`) VALUES
(30, 'ads', 'adssadas', 'asdsad', 'asdasdsad12', 2132112331213123, 'adssad@a.com'),
(31, 'Jacobo', 'Martinez', 'Martinez', 'Pajaritos #890', 8341229890, 'jacobo@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

DROP TABLE IF EXISTS `facturas`;
CREATE TABLE IF NOT EXISTS `facturas` (
  `idFactura` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `idReserva` int NOT NULL,
  `precio` int NOT NULL,
  `metodoPago` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fechaPago` date DEFAULT NULL,
  `pago` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `fk_cliente_factura` (`idCliente`),
  KEY `fk_reserva_factura` (`idReserva`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idFactura`, `idCliente`, `idReserva`, `precio`, `metodoPago`, `fechaPago`, `pago`) VALUES
(42, 30, 79, 0, 'Visa', '2023-12-17', 'Pagado'),
(43, 30, 80, 0, 'Paypal', '2023-12-17', 'Pagado'),
(44, 31, 81, 0, 'Efectivo', '2023-12-18', 'Pagado'),
(45, 31, 82, 0, 'Mastercard', '2023-12-18', 'Pagado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--

DROP TABLE IF EXISTS `habitaciones`;
CREATE TABLE IF NOT EXISTS `habitaciones` (
  `noHabitacion` int NOT NULL,
  `tipoHabitacion` varchar(20) NOT NULL,
  `precio` int NOT NULL,
  `estado` varchar(30) NOT NULL,
  PRIMARY KEY (`noHabitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `habitaciones`
--

INSERT INTO `habitaciones` (`noHabitacion`, `tipoHabitacion`, `precio`, `estado`) VALUES
(101, 'Individual', 1000, 'Disponible'),
(102, 'Individual', 1000, 'Disponible'),
(103, 'Individual', 1000, 'Disponible'),
(104, 'Individual', 1000, 'Disponible'),
(105, 'Individual', 1000, 'Disponible'),
(106, 'Individual', 1000, 'Disponible'),
(107, 'Individual', 1000, 'Disponible'),
(108, 'Individual', 1000, 'Disponible'),
(109, 'Individual', 1000, 'Disponible'),
(111, 'Doble', 1500, 'Disponible'),
(112, 'Doble', 1500, 'Disponible'),
(113, 'Doble', 1500, 'Disponible'),
(114, 'Doble', 1500, 'Disponible'),
(115, 'Doble', 1500, 'Disponible'),
(116, 'Doble', 1500, 'Limpieza'),
(117, 'Doble', 1500, 'Disponible'),
(118, 'Doble', 1500, 'Disponible'),
(119, 'Doble', 1500, 'Disponible'),
(121, 'Suite', 2000, 'Disponible'),
(122, 'Suite', 2000, 'Disponible'),
(123, 'Suite', 2000, 'Disponible'),
(124, 'Suite', 2000, 'Disponible'),
(125, 'Suite', 2000, 'Disponible'),
(126, 'Suite', 2000, 'Disponible'),
(127, 'Suite', 2000, 'Disponible'),
(128, 'Suite', 2000, 'Limpieza'),
(129, 'Suite', 2000, 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opiniones`
--

DROP TABLE IF EXISTS `opiniones`;
CREATE TABLE IF NOT EXISTS `opiniones` (
  `idOpinion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `correo` varchar(50) NOT NULL,
  `mensaje` varchar(100) NOT NULL,
  PRIMARY KEY (`idOpinion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `opiniones`
--

INSERT INTO `opiniones` (`idOpinion`, `nombre`, `correo`, `mensaje`) VALUES
(5, 'Luis', 'luis@hotmail.com', 'Muy buen hotel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservasactivas`
--

DROP TABLE IF EXISTS `reservasactivas`;
CREATE TABLE IF NOT EXISTS `reservasactivas` (
  `idReserva` int NOT NULL AUTO_INCREMENT,
  `fechaLlegada` date NOT NULL,
  `fechaSalida` date NOT NULL,
  `habReservada` int DEFAULT NULL,
  `idCliente` int DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`idReserva`),
  KEY `idCliente` (`idCliente`),
  KEY `habReservada` (`habReservada`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `reservasactivas`
--

INSERT INTO `reservasactivas` (`idReserva`, `fechaLlegada`, `fechaSalida`, `habReservada`, `idCliente`, `precio`, `estado`) VALUES
(79, '2023-12-19', '2023-12-23', 109, 30, 1000, 'liberada'),
(80, '2023-12-19', '2023-12-23', 122, 30, 2000, 'liberada'),
(81, '2023-12-20', '2023-12-29', 116, 31, 1500, 'liberada'),
(82, '2023-12-20', '2023-12-29', 128, 31, 2000, 'liberada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaspendientes`
--

DROP TABLE IF EXISTS `reservaspendientes`;
CREATE TABLE IF NOT EXISTS `reservaspendientes` (
  `idReserva` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `habitaciones` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fechaLlegada` date NOT NULL,
  `fechaSalida` date NOT NULL,
  PRIMARY KEY (`idReserva`),
  KEY `fk_idCliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL,
  `user` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pass` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `user`, `pass`) VALUES
(1, 'admin', 'admin');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `fk_cliente_factura` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  ADD CONSTRAINT `fk_reserva_factura` FOREIGN KEY (`idReserva`) REFERENCES `reservasactivas` (`idReserva`);

--
-- Filtros para la tabla `reservasactivas`
--
ALTER TABLE `reservasactivas`
  ADD CONSTRAINT `reservasactivas_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`);

--
-- Filtros para la tabla `reservaspendientes`
--
ALTER TABLE `reservaspendientes`
  ADD CONSTRAINT `fk_idCliente` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
