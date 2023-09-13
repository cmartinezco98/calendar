-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 12-09-2023 a las 03:52:52
-- Versión del servidor: 8.0.28
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `calendar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `k_client` bigint NOT NULL,
  `n_name` text COLLATE utf8mb4_general_ci NOT NULL,
  `f_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `f_updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects`
--

CREATE TABLE `projects` (
  `k_project` bigint NOT NULL,
  `n_name` text COLLATE utf8mb4_general_ci NOT NULL,
  `n_description` text COLLATE utf8mb4_general_ci NOT NULL,
  `fk_user` bigint NOT NULL,
  `fk_client` bigint NOT NULL,
  `f_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `f_updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `k_role` bigint NOT NULL,
  `n_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `f_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `f_updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

CREATE TABLE `tasks` (
  `k_task` bigint NOT NULL,
  `n_description` text COLLATE utf8mb4_general_ci NOT NULL,
  `fk_project` bigint NOT NULL,
  `f_start` datetime NOT NULL,
  `f_end` datetime NOT NULL,
  `fk_status` bigint NOT NULL,
  `fk_user_creator` bigint NOT NULL,
  `fk_user_responsible` bigint NOT NULL,
  `f_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `f_updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task_status`
--

CREATE TABLE `task_status` (
  `k_status` bigint NOT NULL,
  `n_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `f_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `f_updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `k_user` bigint NOT NULL,
  `n_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `n_last_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `n_email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `n_password` text COLLATE utf8mb4_general_ci NOT NULL,
  `f_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `f_updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_role`
--

CREATE TABLE `user_role` (
  `k_user_role` bigint NOT NULL,
  `fk_user` bigint NOT NULL,
  `fk_role` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`k_client`);

--
-- Indices de la tabla `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`k_project`),
  ADD KEY `fk_user` (`fk_user`),
  ADD KEY `fk_client` (`fk_client`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`k_role`);

--
-- Indices de la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`k_task`),
  ADD KEY `fk_project` (`fk_project`),
  ADD KEY `fk_status` (`fk_status`),
  ADD KEY `fk_user_creator` (`fk_user_creator`),
  ADD KEY `fk_user_responsible` (`fk_user_responsible`);

--
-- Indices de la tabla `task_status`
--
ALTER TABLE `task_status`
  ADD PRIMARY KEY (`k_status`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`k_user`) USING BTREE;

--
-- Indices de la tabla `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`k_user_role`),
  ADD KEY `fk_role_user` (`fk_role`,`fk_user`) USING BTREE,
  ADD KEY `fk_user` (`fk_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `k_client` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `projects`
--
ALTER TABLE `projects`
  MODIFY `k_project` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `k_role` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tasks`
--
ALTER TABLE `tasks`
  MODIFY `k_task` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `task_status`
--
ALTER TABLE `task_status`
  MODIFY `k_status` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `k_user` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_role`
--
ALTER TABLE `user_role`
  MODIFY `k_user_role` bigint NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`fk_client`) REFERENCES `clients` (`k_client`) ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`fk_user`) REFERENCES `users` (`k_user`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`fk_status`) REFERENCES `task_status` (`k_status`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`fk_user_creator`) REFERENCES `users` (`k_user`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`fk_project`) REFERENCES `projects` (`k_project`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_4` FOREIGN KEY (`fk_user_responsible`) REFERENCES `users` (`k_user`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`fk_user`) REFERENCES `users` (`k_user`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`fk_role`) REFERENCES `roles` (`k_role`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
