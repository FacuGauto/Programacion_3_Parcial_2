-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-12-2019 a las 20:44:56
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parcial_2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos`
--

CREATE TABLE `egresos` (
  `id` int(11) NOT NULL,
  `usuario` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `legajo` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `egresos`
--

INSERT INTO `egresos` (`id`, `usuario`, `legajo`, `created_at`, `updated_at`) VALUES
(1, 'irma@gmail.com', 52, '2019-12-10 21:08:10', '2019-12-10 21:08:10'),
(2, 'irma@gmail.com', 52, '2019-12-10 21:10:46', '2019-12-10 21:10:46'),
(3, 'alicia@gmail.com', 54, '2019-12-10 21:12:59', '2019-12-10 21:12:59'),
(4, 'fermin@gmail.com', 110, '2019-12-10 21:46:47', '2019-12-10 21:46:47'),
(5, 'fermin@gmail.com', 110, '2019-12-10 21:46:55', '2019-12-10 21:46:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` int(11) NOT NULL,
  `usuario` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `legajo` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`id`, `usuario`, `legajo`, `created_at`, `updated_at`) VALUES
(1, 'bruno@gmail.com', 53, '2019-12-10 15:42:58', '2019-12-10 15:42:58'),
(2, 'irma@gmail.com', 52, '2019-12-10 21:08:02', '2019-12-10 21:08:02'),
(3, 'irma@gmail.com', 52, '2019-12-10 21:10:35', '2019-12-10 21:10:35'),
(4, 'alicia@gmail.com', 54, '2019-12-10 21:12:53', '2019-12-10 21:12:53'),
(5, 'alicia@gmail.com', 54, '2019-12-10 21:13:11', '2019-12-10 21:13:11'),
(6, 'fermin@gmail.com', 110, '2019-12-10 21:45:48', '2019-12-10 21:45:48'),
(7, 'fermin@gmail.com', 110, '2019-12-10 21:46:52', '2019-12-10 21:46:52'),
(8, 'fermin@gmail.com', 110, '2019-12-10 22:54:07', '2019-12-10 22:54:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `clave` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `legajo` int(11) NOT NULL,
  `foto1` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `foto2` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `clave`, `legajo`, `foto1`, `foto2`, `created_at`, `updated_at`) VALUES
(1, 'facundo@yahoo.com.ar', '1234', 45, './images/users/facundo@yahoo.com.ar1.jpg', './images/users/facundo@yahoo.com.ar2.jpg', '2019-12-08 19:04:47', '2019-12-08 19:04:47'),
(2, 'federico@yahoo.com.ar', '1234', 46, './images/users/federico@yahoo.com.ar1.jpg', './images/users/federico@yahoo.com.ar2.jpg', '2019-12-08 19:04:47', '2019-12-08 19:04:47'),
(3, 'damian@yahoo.com.ar', '1234', 47, './images/users/damian@yahoo.com.ar1.jpg', './images/users/damian@yahoo.com.ar2.jpg', '2019-12-08 19:04:47', '2019-12-08 19:04:47'),
(4, 'melina@gmail.com', '1234', 48, './images/users/melina@gmail.com1.jpg', './images/users/melina@gmail.com2.jpg', '2019-12-08 23:27:43', '2019-12-08 23:27:43'),
(5, 'dario@gmail.com', '1234', 49, './images/users/dario@gmail.com1.jpg', './images/users/dario@gmail.com2.jpg', '2019-12-10 17:17:17', '2019-12-10 17:17:17'),
(6, 'marisa@gmail.com', '1234', 50, './images/users/marisa@gmail.com1.jpg', './images/users/marisa@gmail.com2.jpg', '2019-12-10 17:19:49', '2019-12-10 17:19:49'),
(7, 'luiza@gmail.com', '1234', 51, './images/users/luiza@gmail.com1.jpg', './images/users/luiza@gmail.com2.jpg', '2019-12-10 17:30:27', '2019-12-10 17:30:27'),
(8, 'irma@gmail.com', 'stbu3CrK.J7XE', 52, './images/users/irma@gmail.com1.jpg', './images/users/irma@gmail.com2.jpg', '2019-12-10 18:12:14', '2019-12-10 18:12:14'),
(9, 'bruno@gmail.com', 'stbu3CrK.J7XE', 53, './images/users/bruno@gmail.com1.jpg', './images/users/bruno@gmail.com2.jpg', '2019-12-10 18:40:53', '2019-12-10 18:40:53'),
(10, 'alicia@gmail.com', 'stbu3CrK.J7XE', 54, './images/users/alicia@gmail.com1.jpg', './images/users/alicia@gmail.com2.jpg', '2019-12-10 21:12:24', '2019-12-10 21:12:24'),
(11, 'fermin@gmail.com', 'stbu3CrK.J7XE', 110, './images/users/fermin@gmail.com1.jpg', './images/users/fermin@gmail.com2.jpg', '2019-12-10 21:45:20', '2019-12-10 21:45:20');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `egresos`
--
ALTER TABLE `egresos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `egresos`
--
ALTER TABLE `egresos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
