-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.20-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para crud_manager
DROP DATABASE IF EXISTS `crud_manager`;
CREATE DATABASE IF NOT EXISTS `crud_manager` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `crud_manager`;

-- Copiando estrutura para tabela crud_manager.companies
DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `role` varchar(128) NOT NULL,
  `start` date NOT NULL,
  `end` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela crud_manager.companies: ~1 rows (aproximadamente)
DELETE FROM `companies`;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` (`id`, `name`, `role`, `start`, `end`, `user_id`) VALUES
	(1, 'Google', 'Estagiária', '2024-07-01', NULL, 2),
	(2, 'IFSULDEMINAS', 'Professor', '2024-07-19', NULL, 1);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;

-- Copiando estrutura para tabela crud_manager.posts
DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `post_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela crud_manager.posts: ~8 rows (aproximadamente)
DELETE FROM `posts`;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `content`, `post_date`, `user_id`) VALUES
	(1, 'Olá do Emerson', '2024-07-05', 1),
	(2, 'Olá da Luiza', '2024-07-05', 2),
	(3, 'Olá da Denise', '2024-07-05', 3),
	(4, 'Olá do Noé', '2024-07-05', 4),
	(5, 'Olá da Rosânia', '2024-07-05', 5),
	(6, 'Olá da Rosânia 1', '2024-07-05', 5),
	(7, 'Olá da Rosânia 2', '2024-07-05', 5),
	(8, 'Olá da Rosânia 3', '2024-07-05', 5);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Copiando estrutura para tabela crud_manager.sellers
DROP TABLE IF EXISTS `sellers`;
CREATE TABLE IF NOT EXISTS `sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `fone` varchar(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `sellers_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela crud_manager.sellers: ~1 rows (aproximadamente)
DELETE FROM `sellers`;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` (`id`, `name`, `email`, `fone`, `company_id`) VALUES
	(1, 'Bill', 'bill@gmail.com', '3540028922', 1),
	(2, 'Gerson', 'gerson@gmail.com', '3540028922', 2);
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;

-- Copiando estrutura para tabela crud_manager.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela crud_manager.users: ~5 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `nome`, `sexo`, `email`) VALUES
	(1, 'Emerson Carvalho', 'M', 'emerson@mail.com'),
	(2, 'Luiza Carvalho', 'F', 'lu@mail.com'),
	(3, 'Elenice Carvalho', 'F', 'le@mail.com'),
	(4, 'Noé Carvalho', 'M', 'noe@mail.com'),
	(5, 'Rosânia Carvalho', 'F', 'ro@mail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Copiando estrutura para tabela crud_manager.partner_companies
DROP TABLE IF EXISTS `partner_companies`;
CREATE TABLE IF NOT EXISTS `partner_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `cnpj` varchar(18) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(128) NOT NULL,
  `product_offered` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `partner_companies_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela crud_manager.partner_companies: ~5 rows (aproximadamente)
DELETE FROM `partner_companies`;
/*!40000 ALTER TABLE `partner_companies` DISABLE KEYS */;
INSERT INTO `partner_companies` (`id`, `name`, `cnpj`, `address`, `contact`, `product_offered`, `company_id`) VALUES
    (1, 'Empresa Parceira 1', '12.345.678/0001-90', 'Rua das Flores, 123, São Paulo, SP', 'contato1@empresa1.com.br', 'Soluções em Software', 1),
    (2, 'Empresa Parceira 2', '98.765.432/0001-12', 'Avenida Brasil, 456, Rio de Janeiro, RJ', 'contato2@empresa2.com.br', 'Serviços de Consultoria', 2),
    (3, 'Empresa Parceira 3', '56.789.012/0001-34', 'Rua da Liberdade, 789, Belo Horizonte, MG', 'contato3@empresa3.com.br', 'Serviços em Nuvem', 1),
    (4, 'Empresa Parceira 4', '34.567.890/0001-56', 'Avenida Paulista, 101, São Paulo, SP', 'contato4@empresa4.com.br', 'Cibersegurança', 2),
    (5, 'Empresa Parceira 5', '78.901.234/0001-78', 'Rua XV de Novembro, 202, Curitiba, PR', 'contato5@empresa5.com.br', 'Soluções em E-commerce', 1);
/*!40000 ALTER TABLE `partner_companies` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
