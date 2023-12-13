-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 13-12-2023 a las 01:00:45
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
  `n_name` text NOT NULL,
  `f_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `f_updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`k_client`, `n_name`, `f_created_at`, `f_updated_at`) VALUES
(2, '3M', '2023-11-23 09:04:36', NULL),
(3, 'CENIT', '2023-11-23 09:04:56', NULL),
(4, 'CONSORCIO CANALES NACIONALES PRIVADOS', '2023-11-23 09:05:17', NULL),
(5, 'CUSTOMER INTELLIGENCE COLOMBIA S.A.S.', '2023-11-23 09:05:26', NULL),
(6, 'CUSTOMER INTELLIGENCE INC', '2023-11-23 09:05:40', NULL),
(7, 'ELANCO COLOMBIA', '2023-11-23 09:05:57', NULL),
(8, 'FTA INTERNATIONAL LLC', '2023-11-23 09:06:09', NULL),
(9, 'FUNDACION SANTA FE DE BOGOTA', '2023-11-23 09:06:18', NULL),
(10, 'GLOBAL WINE & SPIRITS LTDA', '2023-11-23 09:06:31', NULL),
(11, 'KPMG SHARED SERVICES SAS', '2023-11-23 09:07:00', NULL),
(12, 'MOOD', '2023-11-23 09:07:11', NULL),
(13, 'PUMA ENERGY', '2023-11-23 09:07:30', NULL),
(14, 'RADIO TELEVISION NACIONAL DE COLOMBIA RTVC', '2023-11-23 09:07:43', NULL),
(15, 'S.C JOHNSON COLOMBIA', '2023-11-23 09:08:05', NULL),
(16, 'S.C JOHNSON PERU', '2023-11-23 09:08:11', NULL),
(17, 'S.C JOHNSON ECUADOR', '2023-11-23 09:08:16', NULL),
(18, 'Green Yellow', '2023-11-23 09:09:17', NULL),
(19, 'PORK COLOMBIA', '2023-11-23 09:09:35', NULL),
(20, 'ITAU', '2023-11-23 09:09:49', NULL),
(21, 'SOCIAL EXPERIENCE', '2023-11-23 09:10:25', NULL),
(23, 'DINGO', '2023-11-24 08:23:33', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects`
--

CREATE TABLE `projects` (
  `k_project` bigint NOT NULL,
  `n_name` text COLLATE utf8mb4_general_ci NOT NULL,
  `n_description` text COLLATE utf8mb4_general_ci NOT NULL,
  `i_closed` int NOT NULL,
  `fk_user` bigint NOT NULL,
  `fk_client` bigint NOT NULL,
  `f_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `f_updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `projects`
--

INSERT INTO `projects` (`k_project`, `n_name`, `n_description`, `i_closed`, `fk_user`, `fk_client`, `f_created_at`, `f_updated_at`) VALUES
(2, 'Estrategia Mac Center', 'Diseño - Producción - Comercial', 0, 1, 12, '2023-11-23 09:12:01', NULL),
(3, 'Estrategia TDT 2024', 'Estrategia - Diseño', 0, 1, 4, '2023-11-23 15:30:13', NULL),
(4, 'FEE SCJ NOV', 'DISEÑO', 0, 1, 15, '2023-11-23 22:09:00', NULL),
(5, 'Kpm', 'Fiesta fin de año', 0, 10, 11, '2023-11-24 06:29:46', NULL),
(6, 'Fiestas fin año kpmg 23', 'Produccion', 0, 1, 11, '2023-11-24 07:36:49', NULL),
(7, 'S.E Estratégico', 'Estrategias Agencia', 0, 1, 21, '2023-11-24 08:39:35', NULL),
(8, 'SE Administrativo ', 'Acciones administrativas agencia', 0, 1, 21, '2023-11-24 08:40:32', NULL),
(9, 'RTVC 360', 'Producción - Diseño', 0, 1, 14, '2023-11-24 08:41:08', NULL),
(10, 'Elanco Noviembre', 'Diseño', 0, 13, 7, '2023-11-24 09:47:27', NULL),
(11, 'Americas Expo ', 'Audiovisual ', 1, 5, 8, '2023-11-24 10:10:55', NULL),
(12, 'WAC 2023-2024', 'Diseño- Producción', 0, 5, 8, '2023-11-24 11:13:29', NULL),
(13, 'Solicitud 108- Feria Canábica, lanzamiento plataforma MICC', 'Producción- Audiovisual ', 0, 5, 14, '2023-11-24 11:23:12', NULL),
(14, 'Solicitud 77- Museo Nacional', 'Producción', 0, 5, 14, '2023-11-24 11:24:52', NULL),
(15, 'Visitas Oficinas Itaú ', 'Producción', 0, 5, 20, '2023-11-24 11:31:41', NULL),
(16, 'Envio Correo Masivo TDT', 'Diseño - Programación', 0, 1, 4, '2023-11-24 13:31:11', NULL),
(17, 'WAC Noviembre FY24', 'Producción', 0, 1, 8, '2023-11-24 13:34:04', NULL),
(18, 'WAC Diciembre FY24', 'Producción', 0, 1, 8, '2023-11-24 13:34:28', NULL),
(19, 'Plataformas Mincultura_Streamyard', 'Cuentas', 0, 5, 14, '2023-11-24 17:34:55', NULL),
(20, 'FERIAS MARMA ', 'RECOGER MATERIA SCJ', 0, 10, 15, '2023-11-27 06:09:16', NULL),
(21, 'RTVC INTERNO ', 'VISITA TECNICA HOTEL HILTON CORFERIAS', 0, 10, 14, '2023-11-27 06:18:10', NULL),
(22, 'Holiday Program Oficinas', 'Producción-Audiovisual', 1, 5, 15, '2023-11-27 09:28:20', NULL),
(23, 'APP FUNDACIÓN SANTA FE DE BOGOTÁ', 'Diseño', 0, 5, 9, '2023-11-27 09:43:48', NULL),
(24, 'Plataformas Minambiente_Envato V2', 'Cuentas aaaa', 1, 1, 14, '2023-11-27 09:58:15', NULL),
(25, 'Prueba', 'dfhsdjksdf', 1, 1, 3, '2023-11-27 19:33:52', NULL),
(26, 'Pruebaaaa #2', 'sdfsdfsd', 0, 1, 2, '2023-12-05 19:23:03', NULL);

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

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`k_role`, `n_name`, `f_created_at`, `f_updated_at`) VALUES
(1, 'Administrador', '2023-09-14 22:54:54', NULL),
(2, 'Director', '2023-10-22 14:22:54', NULL),
(3, 'Diseño', '2023-10-22 14:23:14', NULL),
(4, 'Producción', '2023-11-21 10:20:39', NULL),
(5, 'Ejecutivo(a)', '2023-11-21 10:20:39', NULL);

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

--
-- Volcado de datos para la tabla `tasks`
--

INSERT INTO `tasks` (`k_task`, `n_description`, `fk_project`, `f_start`, `f_end`, `fk_status`, `fk_user_creator`, `fk_user_responsible`, `f_created_at`, `f_updated_at`) VALUES
(1, 'Reunión Estrategia', 2, '2023-11-23 11:00:00', '2023-11-23 12:00:19', 1, 1, 1, '2023-11-23 09:13:38', NULL),
(2, 'Entrega estrategia de contenidos en PPT ', 3, '2023-11-28 13:00:00', '2023-11-28 14:00:49', 1, 5, 5, '2023-11-23 15:33:17', NULL),
(3, 'Fiesta cali', 5, '2023-11-24 00:00:00', '2023-11-24 06:30:41', 1, 10, 10, '2023-11-24 06:30:45', NULL),
(4, 'Renders y propuesta Mood - Mac Center ', 2, '2023-11-24 09:00:00', '2023-11-24 18:00:57', 1, 5, 8, '2023-11-24 08:33:23', NULL),
(5, 'Diseño plantilla 360 ', 9, '2023-11-24 09:00:00', '2023-11-24 10:20:08', 1, 6, 6, '2023-11-24 08:42:33', NULL),
(6, 'terminar de subir documentación a gespro, ', 8, '2023-11-24 09:30:00', '2023-11-24 10:30:40', 1, 12, 12, '2023-11-24 09:30:05', NULL),
(7, 'LEGALIZACIONES TARJETAS Y TIQUETES ', 8, '2023-11-24 09:00:00', '2023-11-27 18:00:29', 1, 9, 9, '2023-11-24 09:33:24', NULL),
(8, 'informes Informe solicitud 77 Museo Nacional, Informe RTVC Amazonas. ', 8, '2023-11-24 10:00:00', '2023-11-24 13:00:28', 1, 11, 11, '2023-11-24 09:33:42', NULL),
(10, 'PERMISO LABORAL POR GRADO ', 8, '2023-12-14 00:00:00', '2023-12-14 00:00:36', 1, 9, 9, '2023-11-24 09:42:11', NULL),
(11, 'Estructura PPT Estrategia TDT', 3, '2023-11-24 12:00:00', '2023-11-24 18:00:45', 1, 13, 13, '2023-11-24 09:44:22', NULL),
(12, 'Desarrollo de renders de la propuesta presentada por MOOD a Mac Center\n\nRenders:\n1. Batalla de DJ´s\n2. Espacio estudio\n3. co-working bus Mac Center', 2, '2023-11-24 09:00:00', '2023-11-24 23:59:05', 1, 8, 8, '2023-11-24 09:49:12', NULL),
(13, 'Revisión RRSS Elanco.', 10, '2023-11-24 09:00:00', '2023-11-24 10:00:11', 1, 13, 13, '2023-11-24 09:49:43', NULL),
(14, 'Entrega cuentas proyecto RTVC Amazonas \nEntrega de cuentas proyecto solicitud 77 Museo Nacional', 8, '2023-11-24 14:15:00', '2023-11-24 16:15:27', 1, 11, 11, '2023-11-24 10:04:40', NULL),
(15, 'Entrega cuentas tarjeta clara 7724, mes noviembre.', 8, '2023-11-29 09:00:00', '2023-11-29 10:00:52', 1, 11, 11, '2023-11-24 10:07:27', NULL),
(16, 'Historia Instagram SE', 7, '2023-11-24 10:00:00', '2023-11-24 11:00:14', 1, 13, 13, '2023-11-24 10:10:46', NULL),
(18, 'revisar factura hotel dan carlton Medellín con cotización valores no coinciden ', 8, '2023-11-24 10:30:00', '2023-11-24 11:30:10', 1, 12, 12, '2023-11-24 10:16:51', NULL),
(19, 'Elaboración video evento Americas Expo', 11, '2023-11-24 10:20:00', '2023-11-24 18:00:45', 1, 6, 6, '2023-11-24 10:55:12', NULL),
(20, 'Terminar Informes WAC', 12, '2023-11-24 11:00:00', '2023-11-24 12:00:25', 1, 5, 5, '2023-11-24 11:14:33', NULL),
(21, 'Realización estrategia TDT 2024', 3, '2023-11-24 12:30:00', '2023-11-24 16:00:12', 1, 5, 5, '2023-11-24 11:15:43', NULL),
(22, 'Revisión diaria de instalaciones y activaciones WAC. Subir fotos a carpetas y enviar a grupo', 17, '2023-11-24 16:00:00', '2023-11-24 17:00:32', 1, 5, 5, '2023-11-24 11:16:54', NULL),
(23, 'Cita Médica', 8, '2023-11-24 09:00:00', '2023-11-24 10:00:02', 1, 5, 5, '2023-11-24 11:18:24', NULL),
(24, 'Storie feria cannábica', 13, '2023-11-27 16:40:00', '2023-11-27 18:00:16', 1, 6, 6, '2023-11-24 11:24:54', NULL),
(25, 'Reunión Tráfico Semanal FTA', 12, '2023-11-28 10:30:00', '2023-11-24 11:30:26', 1, 5, 5, '2023-11-24 11:32:48', NULL),
(26, 'Mailing TDT (2h)\n\n- (10) Recibir material\n- (15) leer feedback\n\n- (45) Diseño de la información\n- (25) Animación\n- (10) Render\n- (10) conversión a gif\n- (15) exportar en \"imágenes en cascada\"', 16, '2023-11-24 14:30:00', '2023-11-24 15:30:04', 1, 5, 7, '2023-11-24 11:35:58', NULL),
(27, 'Revisión videos americas expo ', 11, '2023-11-24 12:00:00', '2023-11-24 12:30:44', 1, 5, 5, '2023-11-24 11:49:57', NULL),
(28, 'CRIS - arte finalizar vallas RAID \n\n\nCRIS - arte finalizar Pop Scale Event (deposito Medellín) ', 4, '2023-11-24 09:00:00', '2023-11-24 14:14:14', 1, 7, 7, '2023-11-24 15:14:27', NULL),
(29, 'PIPE - revisar Propuesta Van Social (detalles)\n', 7, '2023-11-27 09:00:00', '2023-11-27 10:15:44', 1, 7, 7, '2023-11-24 15:17:28', NULL),
(30, 'MARY - MAILINGS TDT', 16, '2023-11-24 15:30:00', '2023-11-24 15:22:45', 1, 7, 7, '2023-11-24 15:23:06', NULL),
(31, 'Enviar información ITAÚ ', 15, '2023-11-24 17:00:00', '2023-11-24 17:30:53', 1, 5, 5, '2023-11-24 15:57:06', NULL),
(32, 'permiso Jairo Esquivel  solicitado a hans y felipe  ', 8, '2023-11-30 09:00:00', '2023-12-01 17:05:12', 1, 11, 11, '2023-11-24 17:05:35', NULL),
(33, 'App frame 360 para photobooth', 9, '2023-11-28 14:00:00', '2023-11-28 14:30:22', 1, 6, 6, '2023-11-24 17:13:37', NULL),
(34, 'Edición video Americas Expo', 11, '2023-11-27 09:10:00', '2023-11-27 16:30:12', 1, 6, 6, '2023-11-24 17:20:23', NULL),
(35, 'Compras plataformas Mincultura', 19, '2023-11-24 17:30:00', '2023-11-24 18:00:24', 1, 5, 5, '2023-11-24 17:35:38', NULL),
(37, 'Revisión diaria de instalaciones y activaciones WAC. Subir fotos a carpetas y enviar a grupo', 17, '2023-11-27 16:00:00', '2023-11-27 17:00:28', 1, 5, 5, '2023-11-24 17:42:41', NULL),
(38, 'Entrega informe visitas ITAÚ', 15, '2023-11-27 10:00:00', '2023-11-27 11:00:07', 1, 5, 5, '2023-11-24 17:44:25', NULL),
(39, 'Revisión diaria de instalaciones y activaciones WAC. Subir fotos a carpetas y enviar a grupo', 17, '2023-11-28 16:00:00', '2023-11-28 17:00:11', 1, 5, 5, '2023-11-24 17:45:25', NULL),
(40, 'Revisar estilo de texto y Cortar mails', 3, '2023-11-27 12:00:00', '2023-11-27 16:41:13', 1, 7, 7, '2023-11-24 18:41:31', NULL),
(41, 'RECOGER MATERIAL  OFICINA SCJ', 20, '2023-11-27 22:00:00', '2023-11-27 06:10:03', 1, 10, 10, '2023-11-27 06:10:12', NULL),
(42, 'MONTAJE COPIDROGAS CORFERIAS ', 20, '2023-11-27 10:00:00', '2023-11-27 06:11:56', 1, 10, 10, '2023-11-27 06:12:03', NULL),
(43, 'VISTA TECNICA ', 21, '2023-11-27 16:00:00', '2023-11-27 06:19:22', 1, 10, 10, '2023-11-27 06:19:29', NULL),
(44, 'RECOGER MATERIAL SCJ PARA FERIA FARMA', 20, '2023-11-27 08:30:00', '2023-11-27 06:20:04', 1, 10, 10, '2023-11-27 06:20:10', NULL),
(45, 'Informe final', 14, '2023-11-27 09:00:00', '2023-11-27 12:00:19', 1, 11, 11, '2023-11-27 09:05:52', NULL),
(46, 'Entrega tarjeta clara mes noviembre ', 8, '2023-11-27 09:00:00', '2023-11-27 12:00:04', 1, 11, 11, '2023-11-27 09:06:50', NULL),
(47, 'Desarrollo de renders de la propuesta presentada por MOOD a Mac Center\n\nRenders:\n1. Batalla de DJ´s\n2. Espacio estudio\n3. co-working bus Mac Center', 2, '2023-11-27 09:00:00', '2023-11-27 18:00:54', 1, 8, 8, '2023-11-27 09:15:15', NULL),
(48, 'Reunión video Glade oficinas', 22, '2023-11-27 11:00:00', '2023-11-27 11:10:50', 1, 6, 6, '2023-11-27 09:32:05', NULL),
(49, 'Carpetas FTA- In store, instalaciones', 17, '2023-11-27 11:00:00', '2023-11-27 12:00:08', 1, 5, 5, '2023-11-27 09:40:19', NULL),
(51, 'Pasos de la opción pagos de la app.', 23, '2023-11-24 15:00:00', '2023-11-24 16:00:50', 1, 13, 13, '2023-11-27 09:45:28', NULL),
(52, 'Revisión RRSS Elanco', 10, '2023-11-27 09:00:00', '2023-11-27 10:00:39', 1, 13, 13, '2023-11-27 09:47:17', NULL),
(53, 'Complemento de RRSS', 10, '2023-11-27 10:00:00', '2023-11-27 13:00:37', 1, 13, 13, '2023-11-27 09:48:16', NULL),
(54, 'Compra plataformas, organización ppts', 24, '2023-11-27 12:00:00', '2023-11-27 13:00:46', 1, 5, 5, '2023-11-27 09:59:01', NULL),
(55, 'Arte final Valla Deposito Girardot Bogotá', 4, '2023-11-27 14:00:00', '2023-11-27 15:00:16', 1, 3, 7, '2023-11-27 10:04:29', NULL),
(56, 'Enviar Mailings TDT', 16, '2023-11-27 14:00:00', '2023-11-27 15:00:41', 1, 5, 5, '2023-11-27 10:04:50', NULL),
(57, 'Estrategia TDT', 3, '2023-11-27 16:00:00', '2023-11-27 17:00:35', 1, 3, 3, '2023-11-27 10:44:59', NULL),
(58, 'Reunión: Cierre de Servicio Elanco.', 10, '2023-11-29 14:00:00', '2023-11-29 16:00:51', 1, 13, 1, '2023-11-27 10:46:29', NULL),
(59, 'Reunión: Cierre de Servicio Elanco.', 10, '2023-11-29 14:00:00', '2023-11-29 16:00:25', 1, 13, 2, '2023-11-27 10:47:58', NULL),
(60, 'Reunión: Cierre de Servicio Elanco.', 10, '2023-11-29 14:00:00', '2023-11-29 16:00:11', 1, 13, 3, '2023-11-27 10:48:46', NULL),
(61, 'Reunión: Cierre de Servicio Elanco.', 10, '2023-11-29 14:00:00', '2023-11-29 16:00:48', 1, 13, 5, '2023-11-27 10:49:22', NULL),
(62, 'Reunión: Cierre de Servicio Elanco.', 10, '2023-11-29 14:00:00', '2023-11-29 16:00:31', 1, 13, 13, '2023-11-27 10:50:03', NULL),
(64, 'Edición video Holiday COL-PER-ECU', 22, '2023-11-28 09:10:00', '2023-11-28 18:00:18', 1, 6, 6, '2023-11-27 11:05:43', NULL),
(65, 'Edición video Holiday COL-PER-ECU (Para entrega)', 22, '2023-11-29 09:10:00', '2023-11-29 16:00:05', 1, 6, 6, '2023-11-27 11:06:48', NULL),
(66, 'Artes Mood - Mac Center', 2, '2023-11-27 12:00:00', '2023-11-27 12:44:33', 1, 3, 3, '2023-11-27 12:44:49', NULL),
(67, 'Organización tráfico', 7, '2023-11-27 09:27:00', '2023-11-27 10:33:12', 1, 3, 3, '2023-11-27 12:45:50', NULL),
(68, 'sdfgsddf', 24, '2023-12-01 00:00:00', '2023-12-06 19:04:42', 1, 1, 1, '2023-11-27 19:05:00', NULL),
(69, 'aaaa', 24, '2023-11-28 09:00:00', '2023-11-28 14:00:22', 1, 14, 1, '2023-11-27 19:08:43', NULL),
(70, 'Pruebaaaaaa', 23, '2023-12-05 00:00:00', '2023-12-12 18:55:14', 1, 14, 14, '2023-12-05 18:55:23', NULL),
(71, 'Prueba', 10, '2023-12-13 00:00:00', '2023-12-06 18:57:56', 1, 14, 1, '2023-12-05 18:58:09', NULL),
(72, 'Pruebaaaa multi user', 23, '2023-12-26 19:20:23', '2023-12-31 19:20:24', 1, 14, 1, '2023-12-05 19:20:30', NULL),
(73, 'Pruebaaaa multi user', 23, '2023-12-26 19:20:23', '2023-12-31 19:20:24', 1, 14, 2, '2023-12-05 19:20:30', NULL),
(74, 'Pruebaaaa multi user', 23, '2023-12-26 19:20:23', '2023-12-31 19:20:24', 1, 14, 3, '2023-12-05 19:20:30', NULL),
(75, 'Pruebaaaa multi user', 23, '2023-12-26 19:20:23', '2023-12-31 19:20:24', 1, 14, 4, '2023-12-05 19:20:30', NULL);

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

--
-- Volcado de datos para la tabla `task_status`
--

INSERT INTO `task_status` (`k_status`, `n_name`, `f_created_at`, `f_updated_at`) VALUES
(1, 'En proceso', '2023-11-21 10:22:10', NULL);

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

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`k_user`, `n_name`, `n_last_name`, `n_email`, `n_password`, `f_created_at`, `f_updated_at`) VALUES
(1, 'Hans', 'Vargas', 'hans@socialexperience.com.co', '$2b$10$JdQw5/H68sgS5FcVaMC2heLxzJqFfnI6OcYCMY58sZ9K2sWDkm5vS', '2023-11-21 10:25:02', NULL),
(2, 'Felipe', 'Aguillon', 'felipe@socialexperience.com.co', '$2b$10$weCyO75h6KJuicSDN0XVAeuMtKdWh8FoD1UN5aGlzYHdzS05dqA2C', '2023-11-23 11:30:18', NULL),
(3, 'Crisitan ', 'Fajardo', 'cristian.fajardo@socialexperience.com.co', '$2b$10$iPz6G5BwuzVc.jOavrK3lOUulHMSHEWmODNiVUiiPUGD7jCN.uJNy', '2023-11-23 11:31:29', NULL),
(4, 'Francisco', 'Cardenas', 'francisco.cardenas@socialexperience.com.co', '$2b$10$nRmYc3bZO9CzrkmX5N2p8uBo5EIxRUamNAedGD145yc2ZgEzB0Rke', '2023-11-23 11:32:55', NULL),
(5, 'Mariana', 'Santander', 'mariana.santander@socialexperience.com.co', '$2b$10$vU9dSpqpNgQbfPawJSzH0.2IvZOOzVQYiYsNrXzvMTB362zvZA2Mm', '2023-11-23 11:39:35', NULL),
(6, 'Ginna', 'Quintero', 'ginna.quintero@socialexperience.com.co', '$2b$10$y83xqtONEoLO1p6aajocReqfgUV40U.K/m3OMagx4CwgceD5QXj8O', '2023-11-23 18:23:49', NULL),
(7, 'Luis', 'Soste', 'luis.soste@socialexperience.com.co', '$2b$10$7z3ay56.wqyGrgZknYJpsOjKQ7Nz.3cmfS4gHvkMudetPdVoU2HDy', '2023-11-23 18:24:45', NULL),
(8, 'Jonathan', 'Rodriguez', 'Jonathan.rodriguez@socialexperience.com.co', '$2b$10$wCzn8O9UI4OQ23XGgeV8le6ZMJwlpuvHA9NioBzh/05lBUjeecro6', '2023-11-23 18:26:05', NULL),
(9, 'Viviana', 'Quintero', 'VIVIANA.QUINTERO@socialexperience.com.co', '$2b$10$RjnK8yxX9zi8TqK9DDhi9uXIEdQNatKU16g7wg5xPOoZdpgobPoyy', '2023-11-23 18:27:17', NULL),
(10, 'Fabian', 'Soriano', 'fabian.soriano@socialexperience.com.co', '$2b$10$1gV7b/TsKKlqQtQ77SdtyOAfJNq.xmFgiMwLRSvBBCGO55o7vHnm2', '2023-11-23 18:28:30', NULL),
(11, 'Jairo', 'Esquivel', 'jairo.esquivel@socialexperience.com.co', '$2b$10$9qMpwpVim5fV9Y7SYGWmAeD50EUy7eqHvuRu.FxZ7Q7dqWWsX9YlW', '2023-11-23 18:29:15', NULL),
(12, 'Andres', 'Arellano', 'andres.arellano@socialexperience.com.co', '$2b$10$TZuISUi9uOvtbsvIQlyIXeG3CyF4vpQls1ogwdliBTNdJblhLLiba', '2023-11-23 18:30:01', NULL),
(13, 'Natalia', 'Lancheros', 'natalia.lancheros@socialexperience.com.co', '$2b$10$qO4xo/2nv9k/ujArCOZsseItbDg1.wM74U8gud9.y0y6rKy8LEXYK', '2023-11-23 22:10:11', NULL),
(14, 'sebastian', 'Jimenez', 'sebastianjimenez0397@gmail.com', '$2b$10$iBvLnlgEIFZo7ENEoXrjheb4EPwXST5Uj7Ni08qk74MidDSeQkCPC', '2023-11-27 17:41:56', NULL);

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
-- Volcado de datos para la tabla `user_role`
--

INSERT INTO `user_role` (`k_user_role`, `fk_user`, `fk_role`) VALUES
(1, 1, 1),
(7, 2, 1),
(8, 3, 2),
(9, 4, 2),
(23, 14, 2),
(11, 6, 3),
(12, 7, 3),
(13, 8, 3),
(18, 13, 3),
(14, 9, 4),
(15, 10, 4),
(16, 11, 4),
(17, 12, 4),
(10, 5, 5);

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
  MODIFY `k_client` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `projects`
--
ALTER TABLE `projects`
  MODIFY `k_project` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `k_role` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tasks`
--
ALTER TABLE `tasks`
  MODIFY `k_task` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de la tabla `task_status`
--
ALTER TABLE `task_status`
  MODIFY `k_status` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `k_user` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `user_role`
--
ALTER TABLE `user_role`
  MODIFY `k_user_role` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
