-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.20-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

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
