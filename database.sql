-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 28-10-2025 a las 19:42:12
-- Versión del servidor: 10.8.2-MariaDB-1:10.8.2+maria~focal
-- Versión de PHP: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `database`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bazkide_liburuak`
--

CREATE TABLE `bazkide_liburuak` (
  `bazkide_id` int(11) NOT NULL,
  `liburu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bazkide_liburuak`
--

INSERT INTO `bazkide_liburuak` (`bazkide_id`, `liburu_id`) VALUES
(5, 10),
(5, 11),
(5, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elementuak`
--

CREATE TABLE `elementuak` (
  `id` int(11) NOT NULL,
  `erabiltzaile_id` int(11) NOT NULL,
  `izena` varchar(100) NOT NULL,
  `deskribapena` text NOT NULL,
  `prezioa` decimal(10,2) NOT NULL,
  `stocka` int(11) NOT NULL DEFAULT 0,
  `kategoria` varchar(50) DEFAULT NULL,
  `portada_fitxategia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `elementuak`
--

INSERT INTO `elementuak` (`id`, `erabiltzaile_id`, `izena`, `deskribapena`, `prezioa`, `stocka`, `kategoria`, `portada_fitxategia`) VALUES
(8, 1, 'Beruna patrikan', 'Ander Izagirrek liburu honetan Tourreko kondaira bihurtu duten gesten errepasoa egiten du, txirrindularien ikuspegi berezi batetik.', 18.50, 8, 'Kirola/Txirrindularitza', '8d96b92953736b58c90d2be78354054e.jpg'),
(9, 1, 'Socrates en bicicleta', 'Guillaume Martin txirrindulari eta filosofoak idatzitako liburua, filosofia eta kirola uztartzen dituena[cite: 2].', 22.00, 4, 'Filosofia/Kirola', '3a4b0d976ed0034e6f659b1958d4df06.jpg'),
(10, 1, 'Sky\'s the limit', '\"Sky\'s the limit\" liburuak Team Sky txirrindularitza taldearen hasierako urteak eta Dave Brailsford buru zela, \"Ciclismo 2.0\" filosofia berritzailearekin nola lortu zuten Frantziako Tourra irabaztea, kirolaren oinarriak irauli eta mundu mailako txirrindularitza menderatuz.', 16.90, 6, 'Kirola/Txirrindularitza', '2979502dd7152b64ae5a43113b12aee5.jpg'),
(11, 1, 'The Secret Race', 'Tyler Hamilton txirrindulari ohiak Daniel Coyle-rekin idatzitako liburua, txirrindularitzako dopinaren barneko mundua azaltzen duena.', 24.99, 2, 'Kirola/Biografia', '10bf9557f1d7ebe41ce46a97149f78c3.jpg'),
(19, 1, 'V de Vendetta', 'Alan Moore eta David Lloyd-en lan honek anarkiaren eta faxismoaren arteko borroka, kontrol sozialaren kritika zorrotza eta askatasun indibidualaren garrantzia aztertzen ditu.', 30.00, 2, 'Zientzia-fikzioa/Distopia', '433cf50dd7a7e5c1be4351e8597dde1f.jpg'),
(20, 1, '1984', 'Sistema totalitarioen, zaintza masiboaren eta errealitatearen manipulazioaren kritika zorrotza da.', 20.00, 4, 'Zientzia-Fikzioa/Distopikoa', '127d8f811f372b2e81e105ebc874c64e.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nan` varchar(10) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `nan`, `telefono`, `fecha_nacimiento`, `email`, `password`) VALUES
(5, 'Asier ferber', '79051093-R', '688826321', '2003-11-26', 'ferberasi@gmail.com', '$2y$10$tqF025fAgeJC3M6/Z1mXROUc9S9a8g1ggL8/zY73Q9aIyesmnGmXi');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bazkide_liburuak`
--
ALTER TABLE `bazkide_liburuak`
  ADD PRIMARY KEY (`bazkide_id`,`liburu_id`),
  ADD KEY `liburu_id` (`liburu_id`);

--
-- Indices de la tabla `elementuak`
--
ALTER TABLE `elementuak`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nan` (`nan`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `elementuak`
--
ALTER TABLE `elementuak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bazkide_liburuak`
--
ALTER TABLE `bazkide_liburuak`
  ADD CONSTRAINT `bazkide_liburuak_ibfk_1` FOREIGN KEY (`bazkide_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bazkide_liburuak_ibfk_2` FOREIGN KEY (`liburu_id`) REFERENCES `elementuak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
