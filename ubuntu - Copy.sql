-- --------------------------------------------------------
-- Host:                         161.132.37.62
-- Server version:               11.2.2-MariaDB-1:11.2.2+maria~ubu2004 - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for dbidiomify
CREATE DATABASE IF NOT EXISTS `dbidiomify` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `dbidiomify`;

-- Dumping structure for table dbidiomify.tbAdministradores
CREATE TABLE IF NOT EXISTS `tbAdministradores` (
  `dni` varchar(10) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(120) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `genero` enum('Masculino','Femenino','Otro') NOT NULL DEFAULT 'Otro',
  `pais` varchar(80) NOT NULL,
  `ciudad` varchar(80) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` int(11) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  `rol` enum('Administrador','Lectura','Superadministrador') NOT NULL DEFAULT 'Lectura',
  `fechaRegistro` timestamp NULL DEFAULT current_timestamp(),
  `fechaActualizacion` datetime DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `fotoPerfil` text DEFAULT 'fotodefault.png',
  PRIMARY KEY (`dni`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbidiomify.tbAdministradores: ~1 rows (approximately)
INSERT INTO `tbAdministradores` (`dni`, `nombre`, `apellido`, `fechaNacimiento`, `genero`, `pais`, `ciudad`, `email`, `telefono`, `passwordHash`, `rol`, `fechaRegistro`, `fechaActualizacion`, `estado`, `fotoPerfil`) VALUES
	('75841355', 'Mirian', 'Cuadros Garcia', '1096-01-15', 'Femenino', 'Peru', 'Tacna', 'cmiriang@gmail.com', 914261200, '$2a$12$9oM9Z5I7nIeVQlj4K1cVo.AYuRJrCI6RcsfjEIEf/fivZqdgRku6W', 'Superadministrador', '2023-12-04 19:34:26', NULL, 1, 'fotodefault.png'),
	('9510358', 'Celso', 'Franciscano', '2001-08-12', 'Masculino', 'Bolivia', 'Cochabamba', 'celsofranciscano00@gmail.com', 71701743, '$2a$12$9oM9Z5I7nIeVQlj4K1cVo.wt2ld1FDzTopT77orrAwbG9IdOE5I32', 'Superadministrador', '2023-12-04 07:53:14', NULL, 1, 'elonmu.jpg');

-- Dumping structure for table dbidiomify.tbAuditoria
CREATE TABLE IF NOT EXISTS `tbAuditoria` (
  `idRegistro` int(11) NOT NULL AUTO_INCREMENT,
  `FKidAdmin` int(11) NOT NULL,
  `accion` varchar(255) NOT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idRegistro`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbidiomify.tbAuditoria: ~1 rows (approximately)
INSERT INTO `tbAuditoria` (`idRegistro`, `FKidAdmin`, `accion`, `fecha`) VALUES
	(1, 9510358, 'registrarAdministrador', '2023-12-04 19:34:26');

-- Dumping structure for table dbidiomify.tbCursos
CREATE TABLE IF NOT EXISTS `tbCursos` (
  `idCurso` varchar(6) NOT NULL,
  `FKidIdioma` int(11) NOT NULL,
  `urlBanner` text NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idCurso`),
  KEY `FKidIdioma` (`FKidIdioma`),
  CONSTRAINT `tbCursos_ibfk_1` FOREIGN KEY (`FKidIdioma`) REFERENCES `tbIdiomas` (`idIdioma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbidiomify.tbCursos: ~5 rows (approximately)
INSERT INTO `tbCursos` (`idCurso`, `FKidIdioma`, `urlBanner`, `nombre`, `descripcion`) VALUES
	('AYM-01', 2, 'https://peib.mineduc.cl/wp-content/uploads/2019/10/diccionario-aymara.jpg', 'Nivel Básico Aymara A1', 'Este curso de Aymara nivel A1 es ideal para principiantes. Aprenderás conceptos básicos para comunicarte en situaciones cotidianas, incluyendo saludos, presentaciones y preguntas fundamentales.'),
	('ENG-01', 3, 'https://akacenter.com/wp-content/uploads/2021/12/ingles-a1-oxford.jpg', 'Nivel Básico Inglés A1', 'Empieza tu viaje en el idioma Inglés con nuestro curso de nivel A1. Aprenderás lo esencial para la comunicación diaria, incluyendo saludos, presentaciones y estructuras básicas.'),
	('QUE-01', 1, 'https://c.files.bbci.co.uk/FB4F/production/_103253346_gettyimages-864589956.jpg', 'Nivel Basico Quechua A1', 'Este curso de quechua nivel A1 es perfecto para quienes están dando sus primeros pasos en este hermoso idioma. Aprenderás lo básico para comunicarte en situaciones cotidianas, como saludar, presentarte y hacer preguntas sencillas.'),
	('QUE-02', 1, 'https://grupokankun.com/wp-content/uploads/2020/07/aprender-idiomas2.jpg', 'Nivel Basico Quechua A2', 'Avanza en tu aprendizaje del quechua con nuestro curso de nivel A2. En este nivel, ampliarás tus habilidades lingüísticas para hablar sobre temas más variados, como la familia, la comida y las actividades diarias.'),
	('QUE-03', 1, 'https://wp.growproexperience.com/wp-content/uploads/2022/06/Beneficios-de-aprender-un-idioma-front.jpg', 'Nivel Intermedio Quechua B1', 'Nuestro curso de quechua nivel B1 te llevará al siguiente nivel de fluidez. Aprenderás a expresar tus ideas de manera más detallada y a participar en conversaciones más profundas sobre temas como la cultura quechua, las tradiciones y la historia.');

-- Dumping structure for table dbidiomify.tbEmail
CREATE TABLE IF NOT EXISTS `tbEmail` (
  `idEmail` int(11) NOT NULL AUTO_INCREMENT,
  `FKidUsuario` int(11) NOT NULL,
  `FKidRemitente` varchar(10) NOT NULL,
  `asunto` varchar(255) DEFAULT NULL,
  `mensaje` text NOT NULL,
  `fechaEnvio` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idEmail`),
  KEY `FKidUsuario` (`FKidUsuario`),
  KEY `FKidRemitente` (`FKidRemitente`),
  CONSTRAINT `tbEmail_ibfk_1` FOREIGN KEY (`FKidUsuario`) REFERENCES `tbUsuarios` (`idUsuario`),
  CONSTRAINT `tbEmail_ibfk_2` FOREIGN KEY (`FKidRemitente`) REFERENCES `tbAdministradores` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbidiomify.tbEmail: ~0 rows (approximately)

-- Dumping structure for table dbidiomify.tbHistorialUsuario
CREATE TABLE IF NOT EXISTS `tbHistorialUsuario` (
  `idHistorial` int(11) NOT NULL AUTO_INCREMENT,
  `FKidUsuario` int(11) NOT NULL,
  `FKidLeccion` varchar(9) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idHistorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbidiomify.tbHistorialUsuario: ~0 rows (approximately)

-- Dumping structure for table dbidiomify.tbIdiomas
CREATE TABLE IF NOT EXISTS `tbIdiomas` (
  `idIdioma` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `urlBanner` text NOT NULL,
  PRIMARY KEY (`idIdioma`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbidiomify.tbIdiomas: ~2 rows (approximately)
INSERT INTO `tbIdiomas` (`idIdioma`, `nombre`, `descripcion`, `urlBanner`) VALUES
	(1, 'Quechua', 'Aprende el Idioma Quechua en nuestra plataforma,Este curso te sumergirá en la belleza y la diversidad de esta lengua', 'https://bonuscursos.com/wp-content/uploads/2020/05/cursos-online-idiomas.jpg'),
	(2, 'Aymara', 'Aprende el Idioma Aymara en nuestra plataforma. Este curso te sumergirá en la belleza y la diversidad de esta lengua ancestral', 'https://0701.static.prezi.com/preview/v2/qqviuvafc22567onsxhuncmeph6jc3sachvcdoaizecfr3dnitcq_3_0.png'),
	(3, 'Inglés', 'Aprende el idioma Inglés y expande tus horizontes. Este curso ofrece una inmersión profunda en el idioma más hablado a nivel global', 'https://www.conmishijos.com/uploads/tareas_escolares/textosinglesprimaria-g.jpg');

-- Dumping structure for table dbidiomify.tbLecciones
CREATE TABLE IF NOT EXISTS `tbLecciones` (
  `idLeccion` varchar(9) NOT NULL,
  `FKidCurso` varchar(6) NOT NULL,
  `FKidIdioma` int(11) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `urlBanner` text NOT NULL,
  PRIMARY KEY (`idLeccion`),
  KEY `FKidCurso` (`FKidCurso`),
  KEY `FKidIdioma` (`FKidIdioma`),
  CONSTRAINT `tbLecciones_ibfk_1` FOREIGN KEY (`FKidCurso`) REFERENCES `tbCursos` (`idCurso`),
  CONSTRAINT `tbLecciones_ibfk_2` FOREIGN KEY (`FKidIdioma`) REFERENCES `tbIdiomas` (`idIdioma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbidiomify.tbLecciones: ~11 rows (approximately)
INSERT INTO `tbLecciones` (`idLeccion`, `FKidCurso`, `FKidIdioma`, `titulo`, `urlBanner`) VALUES
	('AYM-A1-01', 'AYM-01', 2, 'Los Numeros', 'https://i.ibb.co/5hxcGQV/numeros.png'),
	('ENG-A1-01', 'ENG-01', 3, 'Los Numeros', 'https://i.ibb.co/5hxcGQV/numeros.png'),
	('QUE-A1-01', 'QUE-01', 1, 'Los Numeros', 'https://i.ibb.co/5hxcGQV/numeros.png'),
	('QUE-A1-02', 'QUE-01', 1, 'Saludos', 'https://i.ibb.co/vPw43jJ/hola.png'),
	('QUE-A1-03', 'QUE-01', 1, 'Colores', 'https://i.ibb.co/fpFz5Vm/diagrama-de-venn.png'),
	('QUE-A2-01', 'QUE-02', 1, 'Identificar ¿Donde estas?', 'https://i.ibb.co/XZw9Jc6/mapa.png'),
	('QUE-A2-02', 'QUE-02', 1, 'Los Verbos', 'https://i.ibb.co/L1p4cJ6/demostrador.png'),
	('QUE-A2-03', 'QUE-02', 1, 'Alguna Oraciones', 'https://i.ibb.co/G0kksQz/oracion.png'),
	('QUE-B1-01', 'QUE-03', 1, 'Conjugaciones', 'https://i.ibb.co/pKgCz7P/plan-estrategico.png'),
	('QUE-B1-02', 'QUE-03', 1, 'El tiempo', 'https://i.ibb.co/LzBvcMD/hora.png'),
	('QUE-B1-03', 'QUE-03', 1, 'Sintomas y enfermedades', 'https://i.ibb.co/vVjy1hC/debilidad.png');

-- Dumping structure for table dbidiomify.tbPreguntas
CREATE TABLE IF NOT EXISTS `tbPreguntas` (
  `idPregunta` int(11) NOT NULL,
  `FKidLeccion` varchar(9) NOT NULL,
  `enunciado` text NOT NULL,
  `actividad` text NOT NULL,
  `respuesta` varchar(250) NOT NULL,
  `urlIlustracion` text DEFAULT NULL,
  `urlAudio` text DEFAULT NULL,
  PRIMARY KEY (`idPregunta`),
  KEY `FKidLeccion` (`FKidLeccion`),
  CONSTRAINT `tbPreguntas_ibfk_1` FOREIGN KEY (`FKidLeccion`) REFERENCES `tbLecciones` (`idLeccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbidiomify.tbPreguntas: ~107 rows (approximately)
INSERT INTO `tbPreguntas` (`idPregunta`, `FKidLeccion`, `enunciado`, `actividad`, `respuesta`, `urlIlustracion`, `urlAudio`) VALUES
	(1, 'QUE-A1-01', 'Traduce al quechua este número:', 'Uno', 'Huk', 'https://i.ibb.co/dB977Yc/1.png', 'https://drive.google.com/uc?export=download&id=1NWQZpz89ghekt_Gh12yMxk7ym0CUVrQD'),
	(2, 'QUE-A1-01', 'Traduce al quechua este número:', 'Dos', 'Iskay', 'https://i.ibb.co/8s4WHPg/2.png', 'https://drive.google.com/uc?export=download&id=1VQni2fSxNUEVOb2Frjt6OsiKVneufBE8'),
	(3, 'QUE-A1-01', 'Traduce al quechua este número:', 'Tres', 'Kinsa', 'https://i.ibb.co/YB4mJcg/3.png', 'https://drive.google.com/uc?export=download&id=1nlV5NwZet04vQd_sEBDlYl860auzvc7r'),
	(4, 'QUE-A1-01', 'Traduce al quechua este número:', 'Cuatro', 'Tawa', 'https://i.ibb.co/tYw1tMN/4.png', 'https://drive.google.com/uc?export=download&id=194rA2CvA9O-lg8RV8SQvcRxg4mQ3C0Gq'),
	(5, 'QUE-A1-01', 'Traduce al quechua este número:', 'Cinco', 'Pisqa', 'https://i.ibb.co/MBwctFL/5.png', 'https://drive.google.com/uc?export=download&id=1pnvDvJH-Jb5x5LT21Vg-2U7QI1kcohC8'),
	(6, 'QUE-A1-01', 'Traduce al quechua este número:', 'Seis', 'Soqta', 'https://i.ibb.co/FWp5BMF/6.png', 'https://drive.google.com/uc?export=download&id=1uMZfQAJxdNRxZph-dyMhmsy4h6gu_Hio'),
	(7, 'QUE-A1-01', 'Traduce al quechua este número:', 'Siete', 'Qanchis', 'https://i.ibb.co/d7Ht3vB/7.png', 'https://drive.google.com/uc?export=download&id=1Y8_2rT8RuemkQCx-TsZvCPtF1U3HjLAp'),
	(8, 'QUE-A1-01', 'Traduce al quechua este número:', 'Ocho', 'Pusaq', 'https://i.ibb.co/wYngXzX/8.png', 'https://drive.google.com/uc?export=download&id=1QXkxQnRwPL0MDHLrkoPmOi4MWo-5skIC'),
	(9, 'QUE-A1-01', 'Traduce al quechua este número:', 'Nueve', 'Esqon', 'https://i.ibb.co/jf8NCcz/9.png', 'https://drive.google.com/uc?export=download&id=136-ppV2oXuh44eOk01by4iGTAT1hqerC'),
	(10, 'QUE-A1-01', 'Traduce al quechua este número:', 'Diez', 'Chunka', 'https://i.ibb.co/mDFPKKW/10.png', 'https://drive.google.com/uc?export=download&id=1CfxrXIha8eySu5aEBUXOOU9ZNDNA_hSz'),
	(11, 'QUE-A1-02', 'Traduce al quechua el siguiente saludo:', '¡Buenos días!', 'Allin P’unchay', 'https://i.ibb.co/CVynqKY/reloj.png', 'https://drive.google.com/uc?export=download&id=16xJ4KGX42vRGPf1OiWDAwEaSfc2E3_sR'),
	(12, 'QUE-A1-02', 'Traduce al quechua el siguiente saludo:', '¡Buenas tardes!', 'Allin Sukha', 'https://i.ibb.co/xLkky6F/corriendo.png', 'https://drive.google.com/uc?export=download&id=1Qn4vEE2-NbGn0CaA_zXGLv9qYaEzmrGn'),
	(13, 'QUE-A1-02', 'Traduce al quechua el siguiente saludo:', '¡Buenas noches!', 'Allin tuta', 'https://i.ibb.co/645FFR5/adios.png', 'https://drive.google.com/uc?export=download&id=15UMPRj5xXFoKgODQi9JJWLlt9mSsMGi9'),
	(14, 'QUE-A1-02', 'Traduce al quechua el siguiente saludo:', '¡Hasta mañana!', 'Paqarin kama', 'https://i.ibb.co/gtp17Th/mano-que-saluda.png', 'https://drive.google.com/uc?export=download&id=1qb5cVCCUSEO6zkZBKIcJbvGJbCZAK-fp'),
	(15, 'QUE-A1-02', 'Traduce al quechua el siguiente saludo:', '¡Hasta pasado mañana!', 'Minchhakama', 'https://i.ibb.co/RBrSXz2/diciendo-adios.png', 'https://drive.google.com/uc?export=download&id=1aX5NQkBbYXO_hF5oC7qMCVqDgXXOT5En'),
	(16, 'QUE-A1-02', 'Traduce al quechua el siguiente saludo:', '¡Hasta nuestro próximo encuentro!', ' ', 'https://i.ibb.co/kg1QCdD/adios-1.png', 'https://drive.google.com/uc?export=download&id=1cX56cj4OsDEDNM_D5-jerLvTiBWFEe7N'),
	(17, 'QUE-A1-02', 'Traduce al quechua el siguiente saludo:', '¡Hasta luego!', 'Asllakama', 'https://i.ibb.co/DVd7qJz/adios-2.png', 'https://drive.google.com/uc?export=download&id=1GogWGPJYl8F23NO6favPsXIjryGUhSAS'),
	(18, 'QUE-A1-02', 'Traduce al quechua el siguiente saludo:', '¡Hasta otro día!', 'Hoq P’unchaykama', 'https://i.ibb.co/sPpG8xG/adios-3.png', 'https://drive.google.com/uc?export=download&id=1tw4xQyuc9d4d1_SXOgPd8VS-0Llz7S0I'),
	(19, 'QUE-A1-02', 'Traduce al quechua el siguiente saludo:', '¡Hasta el próximo año!', 'Q’aya watakama', 'https://i.ibb.co/TH8Fjyd/mujer.png', 'https://drive.google.com/uc?export=download&id=1_KP5xWs_vMwLKs0uWoicIGiw4WyRuE4Y'),
	(20, 'QUE-A1-02', 'Traduce al quechua el siguiente saludo:', '¡Adios!', 'tupananchis kama', 'https://i.ibb.co/K2XxFXb/adios-4.png', 'https://drive.google.com/uc?export=download&id=1Ri4Lwa45W_1pVv9R7jzy63_b70Bj4SiV'),
	(21, 'QUE-A1-03', 'Traduce al quechua:', 'Rojo', 'Pukak', 'https://i.ibb.co/G2DWqFW/rojo.png', 'https://drive.google.com/uc?export=download&id=1lmZum5c4gDjZTsJ5-saN3ELIOdkisggo'),
	(22, 'QUE-A1-03', 'Traduce al quechua:', 'Azul', 'Anqas', 'https://i.ibb.co/gS2fvp3/color-de-agua.png', 'https://drive.google.com/uc?export=download&id=1GCcJnxD1j7qjUSun2zWG4koQv-DsCwbV'),
	(23, 'QUE-A1-03', 'Traduce al quechua:', 'Amarillo', 'K’umir', 'https://i.ibb.co/TRcYz1N/tarjeta-amarilla-1.png', 'https://drive.google.com/uc?export=download&id=1M8XCDV1AE7fyQ6jAEPxcITrfI11uw3PQ'),
	(24, 'QUE-A1-03', 'Traduce al quechua:', 'Verde', 'Q’umir', 'https://i.ibb.co/ZYCz9nn/manzana.png', 'https://drive.google.com/uc?export=download&id=1TWKjsWrriXXTSpq9R-QXDu-UaKSUa26h'),
	(25, 'QUE-A1-03', 'Traduce al quechua:', 'Blanco', 'Yuraq', 'https://i.ibb.co/193KcVg/bandera-blanca.png', 'https://drive.google.com/uc?export=download&id=1-o3fk-9ZvvJ_04fiHTllPlhAvlhB9wJf'),
	(26, 'QUE-A1-03', 'Traduce al quechua:', 'Negro', 'Yana', 'https://i.ibb.co/hCrgfSV/forma-de-corazon-negro.png', 'https://drive.google.com/uc?export=download&id=1c9sgn8yrWmky4Ek0FzXT6DkP42gaLo4B'),
	(27, 'QUE-A1-03', 'Traduce al quechua:', 'Gris', 'Pitiq', 'https://i.ibb.co/SfnT96t/colores.png', 'https://drive.google.com/uc?export=download&id=1llOOmG2CH276i6pqyo8gyCNHFWCfZxTg'),
	(28, 'QUE-A1-03', 'Traduce al quechua:', 'café', 'Wiraq’ocha', 'https://i.ibb.co/hWps2V9/granos-de-cafe.png', 'https://drive.google.com/uc?export=download&id=198nG7auL5oguu_rYp56XTopoEopUsNEG'),
	(29, 'QUE-A1-03', 'Traduce al quechua:', 'Rosa', 'Q’ara', 'https://i.ibb.co/GRDzpcZ/rosa.png', 'https://drive.google.com/uc?export=download&id=1ampTWgCsRu0qhLiohn7m_XeSWni9XKuk'),
	(30, 'QUE-A1-03', 'Traduce al quechua:', 'Morado', 'Wila', 'https://i.ibb.co/yYy43Vt/mora.png', 'https://drive.google.com/uc?export=download&id=1g37y77ADYS9vrYLfMtKZdynPN9w4d-Kf'),
	(31, 'QUE-B1-01', 'Traduce al quechua la siguiente conjugación:', 'Yo comeré', 'Iñuka miqusaq', 'https://i.ibb.co/HhK65Cz/mujer.png', 'https://drive.google.com/uc?export=download&id=1nsDoWVp_Ny8YeFPLBO13ZAqHIAax3fIL'),
	(32, 'QUE-B1-01', 'Traduce al quechua la siguiente conjugación:', 'Tú comerás', 'Qam mikunki', 'https://i.ibb.co/YjRX0f1/mesa-del-comedor.png', 'https://drive.google.com/uc?export=download&id=1CaPoTe_fxUwXWo789GecC0IqNtH1fj5x'),
	(33, 'QUE-B1-01', 'Traduce al quechua la siguiente conjugación:', 'El comerá', 'Pay mikunqa', 'https://i.ibb.co/W5cTsv7/mesa-de-comedor.png', 'https://drive.google.com/uc?export=download&id=1kruV_NHI81eXGXy6FuGhdZzjYXOFB3Cx '),
	(34, 'QUE-B1-01', 'Traduce al quechua la siguiente conjugación:', 'Nosotros comeremos', 'ñuqayku miqusaqku', 'https://i.ibb.co/G2y38cM/mesa-del-comedor-1.png', 'https://drive.google.com/uc?export=download&id=1_DxQ56GK5PI6j0HvPzA8QZEy_9p_k39p'),
	(35, 'QUE-B1-01', 'Traduce al quechua la siguiente conjugación:', 'Ustedes comeran', 'Qamkuna mikunkichik', 'https://i.ibb.co/8BvTtcy/familia.png', 'https://drive.google.com/uc?export=download&id=11UurYXamJ_VPY0moJ3Ycf9GQEIQE_hOV'),
	(36, 'QUE-B1-01', 'Traduce al quechua la siguiente pregunta:', '¿Que haras mañana?', '¿Imataq paqarin ruranki?', 'https://i.ibb.co/wp8p5NJ/horario-de-trabajo.png', 'https://drive.google.com/uc?export=download&id=1fPyfRV8s0b-bGzN_cNc9d0jsCXnIk9TJ'),
	(37, 'QUE-B1-01', 'Traduce al quechua la siguiente pregunta:', '¿Qué harás el próximo lunes?', '¿Imatataq ruranki hamuq lunesta ?', 'https://i.ibb.co/LgqwGg6/lunes.png', 'https://drive.google.com/uc?export=download&id=1UKfvd6Ej57h78iYtBka-WtqnwhUvNmDY'),
	(38, 'QUE-B1-01', 'Traduce al quechua la siguiente pregunta:', '¿Qué harás la próxima semana?', '¿imatataq ruranki hamuq semanata ?', 'https://i.ibb.co/NY8tW4w/calendario.png', 'https://drive.google.com/uc?export=download&id=1jU35AYAaBA1XymLfRfKWwnQ5CyCk01Jw'),
	(39, 'QUE-B1-01', 'Traduce al quechua la siguiente pregunta:', '¿Qué harás para el próximo mes?', '¿Imataq ruranki hamuq killata ?', 'https://i.ibb.co/zPChT3x/mayo.png', 'https://drive.google.com/uc?export=download&id=1Yt1JHtObd6WEOxPqfMS90_oFv1EyEbiv'),
	(40, 'QUE-B1-01', 'Traduce al quechua la siguiente pregunta:', '¿Qué vas a hacer el próximo año?', '¿Imataq runankichik hamuq watata ?', 'https://i.ibb.co/JHYybqn/calendario-1.png', 'https://drive.google.com/uc?export=download&id=1QtcptYCZClwIlSmkwKX7eu9h-p-VGISH'),
	(41, 'QUE-B1-02', 'Traduce al quechua la siguiente medida de tiempo:', '1 hora', 'Kuk pacham ', 'https://i.ibb.co/0BRp2Bk/1-hora.png', 'https://drive.google.com/uc?export=download&id=18W8LdrJud7sCaVPaVnm0F0YD1VkWDWQ0'),
	(42, 'QUE-B1-02', 'Traduce al quechua la siguiente medida de tiempo:', '2 horas', 'Iskay pacham', 'https://i.ibb.co/cQyWvG5/cuenta-regresiva.png', 'https://drive.google.com/uc?export=download&id=1NtHG76G4prjg9jsO3hfT06NShcO-cecm'),
	(43, 'QUE-B1-02', 'Traduce al quechua la siguiente medida de tiempo:', '3 horas', 'Kimsa pacham', 'https://i.ibb.co/LCVVrHL/reloj.png', 'https://drive.google.com/uc?export=download&id=1Mz-CNMmVxMPqm0Mu7Po9iwZGikW8H_Xz'),
	(44, 'QUE-B1-02', 'Traduce al quechua la siguiente medida de tiempo:', '4 horas', 'Tawa pacham', 'https://i.ibb.co/MMppDpF/cuatro.png', 'https://drive.google.com/uc?export=download&id=1DCd_eU2qB6vHlD7ghxRLso4qFH12cwcP'),
	(45, 'QUE-B1-02', 'Traduce al quechua la siguiente medida de tiempo:', '5 horas', 'Pichqa pacham', 'https://i.ibb.co/NtdWvss/5-minutos.png', 'https://drive.google.com/uc?export=download&id=1QGNNHxn5Qh6oAwAKXWllHCkQbqYW3ubX'),
	(46, 'QUE-B1-02', 'Traduce al quechua la siguiente pregunta:', '¿Qué hora es?', '¿Ima pachataq?', 'https://i.ibb.co/b6pV6tv/reloj-1.png', 'https://drive.google.com/uc?export=download&id=1IhRVvq9ihqMnLC5HwnDqzOwUm0-EJ0aQ'),
	(47, 'QUE-B1-02', 'Traduce al quechua la siguiente pregunta:', '¿Qué hora es?', '¿Ima pachañataq kachkan?', 'https://i.ibb.co/VDsvvzm/24-horas.png', 'https://drive.google.com/uc?export=download&id=1gfnC9iZ-p6d2lY-xhmHQ9-wzU60jJO0I'),
	(48, 'QUE-B1-02', 'Traduce al quechua el siguiente enunciado:', 'Me levantaré a las 7', 'Qanchis pachatam hatarisaq', 'https://i.ibb.co/hYSqGQ7/reloj-digital.png', 'https://drive.google.com/uc?export=download&id=1D3xXxyKZrstu8t4bHUbZTU9f0Z0eSXes'),
	(49, 'QUE-B1-02', 'Traduce al quechua el siguiente enunciado:', 'A que hora de la mañana', 'Ima pacha tutapaynin', 'https://i.ibb.co/Qcd1B5Y/reloj-2.png', 'https://drive.google.com/uc?export=download&id=1U380oUA4Sm4Pk9oV-X99N92ntWBkcbCV'),
	(50, 'QUE-B1-02', 'Traduce al quechua el siguiente enunciado:', 'A que hora de la tarde', 'Ima pacha chisinpaynin', 'https://i.ibb.co/Jy8gBqk/pm.png', 'https://drive.google.com/uc?export=download&id=1woTij3IQjLrGNvnMjgTynnnKe_aJlxRy'),
	(51, 'QUE-B1-03', 'Traduce al quechua el siguiente sintoma:', 'Fiebre', 'Rupay unquy', 'https://i.ibb.co/vhZRph8/fiebre.png', 'https://drive.google.com/uc?export=download&id=1xPitIxMV90luoCzIQCJoetL6usoD2oW8'),
	(52, 'QUE-B1-03', 'Traduce al quechua el siguiente sintoma:', 'Fatiga', 'Pisipay', 'https://i.ibb.co/ScwjMqG/fatiga.png', 'https://drive.google.com/uc?export=download&id=1ajCj7SItmPHKfAtVWcktzjbx---QkEe6'),
	(53, 'QUE-B1-03', 'Traduce al quechua el siguiente sintoma:', 'Resfriado', 'Huk', 'https://i.ibb.co/Kx3nhhp/estornudos.png', 'https://drive.google.com/uc?export=download&id=1VOQ0Y_-zC7hhY5pMHPO7vsGzlTw-GS-t'),
	(54, 'QUE-B1-03', 'Traduce al quechua el siguiente sintoma:', 'Me duele cuando estoy agachado', 'Qiwispam nanawachkan', 'https://i.ibb.co/Dtx3SPd/dolor.png', 'https://drive.google.com/uc?export=download&id=157Z6cOoT_Dl03tx9RfSUhgkekxUYWpTz'),
	(55, 'QUE-B1-03', 'Traduce al quechua el siguiente sintoma:', 'Es tembloroso y doloroso', 'Katatataspan nanawachskan', 'https://i.ibb.co/jJvLCFb/temblor.png', 'https://drive.google.com/uc?export=download&id=1JG5I4JgsfhzerKmmk4QKZL1Na2sbyoXt'),
	(56, 'QUE-B1-03', 'Traduce al quechua el siguiente sintoma:', 'Arde y duele', 'Qiwispam nanawachkan', 'https://i.ibb.co/ZT84n8j/dolor-1.png', 'https://drive.google.com/uc?export=download&id=1CievKgL_CoqGIx46qI7MRJo-WDb4HLIr'),
	(57, 'QUE-B1-03', 'Traduce al quechua el siguiente sintoma:', 'Duele estar cansado', 'Nanawachkan utispam ', 'https://i.ibb.co/D83QzGj/debilidad.png', 'https://drive.google.com/uc?export=download&id=1KKNUuVAnGdEAnHLL3KVPOiCk2KWURDmp'),
	(58, 'QUE-A2-01', 'Identifica ¿Donde se encuentra?. ', 'Arriba', 'Hanay', 'https://i.ibb.co/Gds6KsJ/flecha-arriba.png', 'https://drive.google.com/uc?export=download&id=1Ze28-farBdvIcrCRk705kPnkCTW5jb9X'),
	(59, 'QUE-A2-01', 'Identifica ¿Donde se encuentra?. ', 'Abajo', 'Uray', 'https://i.ibb.co/gF990X1/flecha-hacia-abajo.png', 'https://drive.google.com/uc?export=download&id=1hnf-x9PoImLRWJuM7N8heuFVffegf6u5'),
	(60, 'QUE-A2-01', 'Identifica ¿Donde se encuentra?. ', 'Derecha', 'Alliq', 'https://i.ibb.co/ZSBP1v7/flecha-correcta.png', 'https://drive.google.com/uc?export=download&id=1ZZL5CpnicVEVHPr9uUHtiaTaCfdmT-W4'),
	(61, 'QUE-A2-01', 'Identifica ¿Donde se encuentra?. ', 'Izquierda', 'Lloque', 'https://i.ibb.co/DY4VjFK/flecha-izquierda.png', 'https://drive.google.com/uc?export=download&id=1hC_fxBURn6NLD2dStvcECA9FdvbTalWx'),
	(62, 'QUE-A2-01', 'Identifica ¿Donde se encuentra?. ', 'Encima', 'Hawanpi', 'https://i.ibb.co/VWx6DLD/lineas.png', 'https://drive.google.com/uc?export=download&id=1JxrocJLkh9tX9kVO5n-5ex-MgqfwISgm'),
	(63, 'QUE-A2-01', 'Identifica ¿Donde se encuentra?. ', 'Adentro', 'Ukupi', 'https://i.ibb.co/BcMxshw/adentro.png', 'https://drive.google.com/uc?export=download&id=1FvGSMeuW8nTZf1SR4T5GEQpkLWDuv9a3'),
	(64, 'QUE-A2-01', 'Identifica ¿Donde se encuentra?. ', 'Centro', 'Chawpi', 'https://i.ibb.co/pn0WF9k/flechas-hacia-el-centro.png', 'https://drive.google.com/uc?export=download&id=15yug579toZX-qy2t9PB_j_qIODTXMsKL'),
	(65, 'QUE-A2-01', 'Identifica ¿Donde se encuentra?. ', 'Atras', 'Qipa', 'https://i.ibb.co/wSxnVDQ/flecha-hacia-atras.png', 'https://drive.google.com/uc?export=download&id=1amTKubDqUGEggfZHTW72rhCsM4m8p7jQ'),
	(66, 'QUE-A2-01', 'Identifica ¿Donde se encuentra?. ', 'Subida', 'Wichay', 'https://i.ibb.co/vXQHYMq/escalera.png', 'https://drive.google.com/uc?export=download&id=1N2cIy6wDk7TGU89ibIppnRkCPJyg7jQv'),
	(67, 'QUE-A2-01', 'Identifica ¿Donde se encuentra?. ', 'Al frente', 'Chimpapi', 'https://i.ibb.co/tBDhBhh/dos.png', 'https://drive.google.com/uc?export=download&id=1BL1fSZw8j6OEnNuNPYL0ElJRQMqR9z6P'),
	(68, 'QUE-A2-02', 'Aprendemos algunos verbos', 'Hablar', 'Rimay', 'https://i.ibb.co/k9M7TzW/boca-a-boca.png', 'https://drive.google.com/uc?export=download&id=1N9Gwb4FTzKL46m5lRvJQ--J6VBqVU3n5'),
	(69, 'QUE-A2-02', 'Aprendemos algunos verbos', 'Bailar', 'Tusuy', 'https://i.ibb.co/z8gV5xt/baile.png', 'https://drive.google.com/uc?export=download&id=1YC4tLdpmvBKOv1E6xjJ0YR9GN9I7sgQG'),
	(70, 'QUE-A2-02', 'Aprendemos algunos verbos', 'Cantar', 'Takiy', 'https://i.ibb.co/YQbfhzf/cantando.png', 'https://drive.google.com/uc?export=download&id=1fe2aQvLfa3pPn8uXtSWo7PP8GLIrAuLK'),
	(71, 'QUE-A2-02', 'Aprendemos algunos verbos', 'Trabajar', 'Llamkay', 'https://i.ibb.co/d7q7xGR/coordinador.png', 'https://drive.google.com/uc?export=download&id=1QUc5AF8MLNP563LpcTrY_JOyHYkSYRSY'),
	(72, 'QUE-A2-02', 'Aprendemos algunos verbos', 'Dormir', 'Puñuy', 'https://i.ibb.co/xhJ5JSW/dormido.png', 'https://drive.google.com/uc?export=download&id=1VK7RpHd-i6cb5UZTugOYyUItzYFP7qLw'),
	(73, 'QUE-A2-02', 'Aprendemos algunos verbos', 'Caminar', 'Puriy', 'https://i.ibb.co/vsRw7fc/caminar.png', 'https://drive.google.com/uc?export=download&id=1il2QJkwlT2GCKfz-HY_936sm-foWyZON'),
	(75, 'QUE-A2-02', 'Aprendemos algunos verbos', 'Comer', 'Mikuy', 'https://i.ibb.co/xDXVHvr/vegetariano.png', 'https://drive.google.com/uc?export=download&id=1UXZ9P_xqrKjJoYjhJBiSlHXrhh7nD8Ql'),
	(76, 'QUE-A2-02', 'Aprendemos algunos verbos', 'Dar', 'Quy', 'https://i.ibb.co/9hrgzdr/dar-dinero.png', 'https://drive.google.com/uc?export=download&id=18Xop4cq1bimHUTZfGaywE_yS9TjQz3xt'),
	(77, 'QUE-A2-02', 'Aprendemos algunos verbos', 'Volver', 'Kutiy', 'https://i.ibb.co/N2gRbSH/regreso.png', 'https://drive.google.com/uc?export=download&id=1Xo0F_53J-l-GcYXVX_GqM7HAAYcgT-TE'),
	(78, 'QUE-A2-02', 'Aprendemos algunos verbos', 'Llegar', 'Chayay', 'https://i.ibb.co/zHDQn3b/llegado.png', 'https://drive.google.com/uc?export=download&id=18t2vPo4gTYk6rq-VTS4kcF2ekJF4gNCf'),
	(79, 'QUE-A2-03', 'Escucha y Escribe', 'Yo hablo Quechua.', ' Ñuqapas runasimita rimani.', 'https://i.ibb.co/9y5khgY/hombre.png', 'https://drive.google.com/uc?export=download&id=1ZTYPIfKeyAhu4L9zQpkHiTkZUGmXFO9H'),
	(80, 'QUE-A2-03', 'Escucha y Escribe', 'Bailo cuando estoy feliz.', 'Kusisqa kaspaymi tusuni.', 'https://i.ibb.co/LgsDcsD/bailes-latinoamericanos.png', 'https://drive.google.com/uc?export=download&id=1q_rbFzCJ00rlsQQWfPAQ1eaLoAF44Yzv'),
	(81, 'QUE-A2-03', 'Escucha y Escribe', 'Me gusta cantar.', ' Munani takiyta.', 'https://i.ibb.co/9vPrQfS/celebracion.png', 'https://drive.google.com/uc?export=download&id=121vQKG_HPC7OpI6dX9tpqEVVTjecqwk1'),
	(82, 'QUE-A2-03', 'Escucha y Escribe', 'Quiero dormir.', 'Puñuyta munani.', 'https://i.ibb.co/VgWXg7h/la-privacion-del-sueno.png', 'https://drive.google.com/uc?export=download&id=1A6WCvTMZqyAZSrFL9Yw8JdaBBgdqDPT6'),
	(83, 'QUE-A2-03', 'Escucha y Escribe', '¿Caminaste mucho hoy?.', '¿Kunan llumpayta purirunki ?', 'https://i.ibb.co/rGWk5xR/caminando.png', 'https://drive.google.com/uc?export=download&id=10Abe7NuhA-kzrpSsA4bPmEGA5UvutFtD'),
	(84, 'QUE-A2-03', 'Escucha y Escribe', 'Me gusta comer.', 'Mikuyman kani munani.', 'https://i.ibb.co/DGpg62w/desorden-alimenticio.png', 'https://drive.google.com/uc?export=download&id=1PvneAoGLDgjnZ8diU_39-rhHRXj8Zq_x'),
	(85, 'QUE-A2-03', 'Escucha y Escribe', '¿Vas a volver temprano?.', 'Tutatutam hampunki ?.', 'https://i.ibb.co/KxGkZhC/madrugada.png', 'https://drive.google.com/uc?export=download&id=1XIO_y7gO74dHe8UC1QUu68QmhkZ2XL3P'),
	(86, 'QUE-A2-03', 'Escucha y Escribe', 'Llegaré más tarde.', 'Tumpamanñam chayaykamuchkasaq.', 'https://i.ibb.co/xY1hDdK/corriendo.png', 'https://drive.google.com/uc?export=download&id=1scBM9ApHMYc_2T9iiDw0I2_wZnrOMqv9'),
	(87, 'QUE-A2-03', 'Escucha y Escribe', 'Estoy mirando la televisión.', 'Rikchay qawachitam qawaykuchkani', 'https://i.ibb.co/5R5p5JB/reloj-1.png', 'https://drive.google.com/uc?export=download&id=1HBB_rZxmM1ltjJdFVBYadnfAwUTldnaW'),
	(88, 'QUE-A2-03', 'Escucha y Escribe', 'Me gusta jugar futbol.', 'Haytacuypi pukllyta munani', 'https://i.ibb.co/V9dL4rD/jugadores-de-futbol.png', 'https://drive.google.com/uc?export=download&id=1RTpanvNXHcmfZe-RL5Y75V9IgW7xC0Nx'),
	(89, 'AYM-A1-01', 'Traduce al idioma Aymara', 'Uno', 'Maya', 'https://i.ibb.co/dB977Yc/1.png', 'https://drive.google.com/uc?export=download&id=1JCWmzQWW-I-DS8SoCsVC4HLuxSZ8BQgC'),
	(90, 'AYM-A1-01', 'Traduce al idioma Aymara', 'Dos', 'Paya', 'https://i.ibb.co/8s4WHPg/2.png', 'https://drive.google.com/uc?export=download&id=1oMGT5Fn6oeFG4s91GIWTDrIKPXT_4VSr'),
	(91, 'AYM-A1-01', 'Traduce al idioma Aymara', 'Tres', 'Kimsa', 'https://i.ibb.co/YB4mJcg/3.png', 'https://drive.google.com/uc?export=download&id=1V4lwX5ZqGdVPIyOE36frNIrQUKHjwuzp'),
	(92, 'AYM-A1-01', 'Traduce al idioma Aymara', 'Cuatro', 'Pusy', 'https://i.ibb.co/tYw1tMN/4.png', 'https://drive.google.com/uc?export=download&id=1AnwlWbr_vW8bg_J_Es04twca57jdwM8Y'),
	(93, 'AYM-A1-01', 'Traduce al idioma Aymara', 'Cinco', 'Phisqa', 'https://i.ibb.co/MBwctFL/5.png', 'https://drive.google.com/uc?export=download&id=1a7_X-DJmp4ryR1T6f0ETWh3kzts11nCY'),
	(94, 'AYM-A1-01', 'Traduce al idioma Aymara', 'Seis', 'Soqta', 'https://i.ibb.co/FWp5BMF/6.png', 'https://drive.google.com/uc?export=download&id=1lNOXmu3iJFEyPECQAXPqL7zwQbgMDgdA'),
	(95, 'AYM-A1-01', 'Traduce al idioma Aymara', 'Siete', 'Pakalqu', 'https://i.ibb.co/d7Ht3vB/7.png', 'https://drive.google.com/uc?export=download&id=1VRc4M5NV3-FFhqm3r4cUM5iEDZ4YBWv8'),
	(96, 'AYM-A1-01', 'Traduce al idioma Aymara', 'Ocho', 'Kimsakalqu', 'https://i.ibb.co/wYngXzX/8.png', 'https://drive.google.com/uc?export=download&id=1jyPZJZakcYE4-zH3HFcOcOUtW_YilchX'),
	(97, 'AYM-A1-01', 'Traduce al idioma Aymara', 'Nueve', 'Llatunka', 'https://i.ibb.co/jf8NCcz/9.png', 'https://drive.google.com/uc?export=download&id=1hgUQklfoU9cQT0tTVCVAYwRf4eNKjkHp'),
	(98, 'AYM-A1-01', 'Traduce al idioma Aymara', 'Diez', 'Tunka', 'https://i.ibb.co/mDFPKKW/10.png', 'https://drive.google.com/uc?export=download&id=1iWbs6Wloxr6yY6BdX-K2ejTv1abJtKfx'),
	(99, 'ENG-A1-01', 'Traduce al idioma Ingles', 'Uno', 'One', 'https://i.ibb.co/dB977Yc/1.png', 'https://drive.google.com/uc?export=download&id=1hf2vKe4kfv6l1e4BLYyQKO3XC2xNwHq6'),
	(100, 'ENG-A1-01', 'Traduce al idioma Ingles', 'Dos', 'Two', 'https://i.ibb.co/8s4WHPg/2.png', 'https://drive.google.com/uc?export=download&id=1iezefh89-v0RgAo2zTtiX-iMOXEUW5Ew'),
	(101, 'ENG-A1-01', 'Traduce al idioma Ingles', 'Tres', 'Three', 'https://i.ibb.co/YB4mJcg/3.png', 'https://drive.google.com/uc?export=download&id=1DS8Grfr3igz5-_cEXCi1Bu0qbFSy76rF'),
	(102, 'ENG-A1-01', 'Traduce al idioma Ingles', 'Cuatro', 'For', 'https://i.ibb.co/tYw1tMN/4.png', 'https://drive.google.com/uc?export=download&id=1kooeNi68_zaXx9iN_3Yk48JEqKOiDDjf'),
	(103, 'ENG-A1-01', 'Traduce al idioma Ingles', 'Cinco', 'Five', 'https://i.ibb.co/MBwctFL/5.png', 'https://drive.google.com/uc?export=download&id=1dGdPt69uezvkGVtNJdAcCsm-uQkz3nAJ'),
	(104, 'ENG-A1-01', 'Traduce al idioma Ingles', 'Seis', 'Six', 'https://i.ibb.co/FWp5BMF/6.png', 'https://drive.google.com/uc?export=download&id=16l_6ufwr2VivuNTIKsVztwaU35XtjJ3b'),
	(105, 'ENG-A1-01', 'Traduce al idioma Ingles', 'Siete', 'Seven', 'https://i.ibb.co/d7Ht3vB/7.png', 'https://drive.google.com/uc?export=download&id=1cjuq9oo55VNOPu2O43GsFdmeAfiUf4bj'),
	(106, 'ENG-A1-01', 'Traduce al idioma Ingles', 'Ocho', 'Eight', 'https://i.ibb.co/wYngXzX/8.png', 'https://drive.google.com/uc?export=download&id=1veiihuOeT24Ey9V28pK1arUtdlOHQ4fS'),
	(107, 'ENG-A1-01', 'Traduce al idioma Ingles', 'Nueve', 'Nine', 'https://i.ibb.co/jf8NCcz/9.png', 'https://drive.google.com/uc?export=download&id=1mH-XeAyuoI-lTQ3F1ACAiShVoDhlHSbq'),
	(108, 'ENG-A1-01', 'Traduce al idioma Ingles', 'Diez', 'Ten', 'https://i.ibb.co/mDFPKKW/10.png', 'https://drive.google.com/uc?export=download&id=1oPzX8I2KSzffC5Dti7t16QbWZjUihoAV');

-- Dumping structure for table dbidiomify.tbProgreso
CREATE TABLE IF NOT EXISTS `tbProgreso` (
  `idProgreso` int(11) NOT NULL AUTO_INCREMENT,
  `FKidUsuario` int(11) NOT NULL,
  `FKidIdioma` int(11) NOT NULL,
  `FKidCurso` varchar(6) NOT NULL,
  `FKidLeccion` varchar(9) NOT NULL,
  `fechaProgreso` timestamp NULL DEFAULT current_timestamp(),
  `puntuacion` int(11) DEFAULT 0,
  PRIMARY KEY (`idProgreso`),
  KEY `FKidUsuario` (`FKidUsuario`),
  KEY `FKidIdioma` (`FKidIdioma`),
  KEY `FKidCurso` (`FKidCurso`),
  KEY `FKidLeccion` (`FKidLeccion`),
  CONSTRAINT `tbProgreso_ibfk_1` FOREIGN KEY (`FKidUsuario`) REFERENCES `tbUsuarios` (`idUsuario`),
  CONSTRAINT `tbProgreso_ibfk_2` FOREIGN KEY (`FKidIdioma`) REFERENCES `tbIdiomas` (`idIdioma`),
  CONSTRAINT `tbProgreso_ibfk_3` FOREIGN KEY (`FKidCurso`) REFERENCES `tbCursos` (`idCurso`),
  CONSTRAINT `tbProgreso_ibfk_4` FOREIGN KEY (`FKidLeccion`) REFERENCES `tbLecciones` (`idLeccion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbidiomify.tbProgreso: ~0 rows (approximately)
INSERT INTO `tbProgreso` (`idProgreso`, `FKidUsuario`, `FKidIdioma`, `FKidCurso`, `FKidLeccion`, `fechaProgreso`, `puntuacion`) VALUES
	(1, 2, 1, 'QUE-01', 'QUE-A1-01', '2023-12-04 22:36:32', 20);

-- Dumping structure for table dbidiomify.tbUsuarios
CREATE TABLE IF NOT EXISTS `tbUsuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(120) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `genero` enum('Masculino','Femenino','Otro') NOT NULL DEFAULT 'Otro',
  `pais` varchar(80) NOT NULL,
  `ciudad` varchar(80) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  `fechaRegistro` timestamp NULL DEFAULT current_timestamp(),
  `fechaActualizacion` datetime DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `fotoPerfil` text DEFAULT 'fotodefault.png',
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbidiomify.tbUsuarios: ~2 rows (approximately)
INSERT INTO `tbUsuarios` (`idUsuario`, `nombre`, `apellido`, `fechaNacimiento`, `genero`, `pais`, `ciudad`, `email`, `passwordHash`, `fechaRegistro`, `fechaActualizacion`, `estado`, `fotoPerfil`) VALUES
	(1, 'Mirian', 'Cuadros Garcia', '2002-01-15', 'Femenino', 'Perú', 'Lima', 'cmiriang@gmail.com', '$2a$12$9oM9Z5I7nIeVQlj4K1cVo.KBwHbktju2mukzX/jJDW/US2i.H1mLK', '2023-12-04 16:34:07', '2023-12-04 11:49:31', 1, '_GIO1169.jpg'),
	(2, 'Celso', 'Franciscano', '2001-08-12', 'Masculino', 'Bolivia', 'Cochabamba', 'celsofranciscano00@gmail.com', '$2a$12$9oM9Z5I7nIeVQlj4K1cVo.wt2ld1FDzTopT77orrAwbG9IdOE5I32', '2023-12-04 21:07:35', '2023-12-04 17:37:26', 1, 'elon-musk-portada.jpg'),
	(3, 'Juan', 'Pérez', '1990-05-15', 'Masculino', 'Argentina', 'Buenos Aires', 'gabrielfarimelendezhuarachi@gmail.com', '$2a$12$9oM9Z5I7nIeVQlj4K1cVo.wt2ld1FDzTopT77orrAwbG9IdOE5I32', '2023-12-04 21:21:30', '2023-01-15 08:30:00', 1, 'fotodefault.png'),
	(4, 'María', 'Gómez', '1985-09-22', 'Femenino', 'México', 'Ciudad de México', 'gm2021070311@virtual.upt.pe', '$2a$12$9oM9Z5I7nIeVQlj4K1cVo.wt2ld1FDzTopT77orrAwbG9IdOE5I32', '2023-12-04 21:21:30', '2023-01-15 09:45:00', 1, 'fotodefault.png'),
	(5, 'Carlos', 'López', '1982-11-10', 'Masculino', 'España', 'Madrid', 'gabonciooo@gmail.com', '$2a$12$9oM9Z5I7nIeVQlj4K1cVo.wt2ld1FDzTopT77orrAwbG9IdOE5I32', '2023-12-04 21:21:30', '2023-01-15 10:15:00', 1, 'fotodefault.png'),
	(6, 'Ana', 'Martínez', '1995-03-08', 'Femenino', 'Colombia', 'Bogotá', 'gabriel-fari2015@hotmail.com', '$2a$12$9oM9Z5I7nIeVQlj4K1cVo.wt2ld1FDzTopT77orrAwbG9IdOE5I32', '2023-12-04 21:21:30', '2023-01-15 11:30:00', 1, 'fotodefault.png');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
