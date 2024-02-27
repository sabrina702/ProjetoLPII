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


-- Copiando estrutura do banco de dados para clinicacrud_bd
DROP DATABASE IF EXISTS `clinicacrud_bd`;
CREATE DATABASE IF NOT EXISTS `clinicacrud_bd` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `clinicacrud_bd`;

-- Copiando estrutura para tabela clinicacrud_bd.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `codigoCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`codigoCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela clinicacrud_bd.categoria: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`codigoCategoria`, `nome`) VALUES
	(2, 'Rosto'),
	(3, 'Boca'),
	(5, 'Nariz');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela clinicacrud_bd.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `codigoCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `dataNascimento` date NOT NULL,
  PRIMARY KEY (`codigoCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela clinicacrud_bd.cliente: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`codigoCliente`, `nome`, `dataNascimento`) VALUES
	(1, 'Sabrina ', '2004-06-29'),
	(2, 'Luiz Felype', '1986-03-12');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela clinicacrud_bd.consulta
DROP TABLE IF EXISTS `consulta`;
CREATE TABLE IF NOT EXISTS `consulta` (
  `idConsulta` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double NOT NULL,
  `cliente` int(11) NOT NULL,
  `funcionario` int(11) NOT NULL,
  `procedimento` int(11) NOT NULL,
  `data` date NOT NULL,
  `hora` varchar(50) NOT NULL,
  PRIMARY KEY (`idConsulta`),
  KEY `FK1_consulta_cliente` (`cliente`),
  KEY `FK2_consulta_funcionario` (`funcionario`),
  KEY `FK3_consulta_procedimento` (`procedimento`),
  CONSTRAINT `FK1_consulta_cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`codigoCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2_consulta_funcionario` FOREIGN KEY (`funcionario`) REFERENCES `funcionario` (`codigoFuncionario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK3_consulta_procedimento` FOREIGN KEY (`procedimento`) REFERENCES `procedimento` (`codigoProcedimento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela clinicacrud_bd.consulta: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` (`idConsulta`, `valor`, `cliente`, `funcionario`, `procedimento`, `data`, `hora`) VALUES
	(1, 300, 1, 1, 1, '2023-06-26', '12:20'),
	(4, 10250, 2, 4, 3, '2023-07-24', '08:00'),
	(6, 10000, 2, 4, 1, '1111-11-11', '11');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;

-- Copiando estrutura para tabela clinicacrud_bd.funcionario
DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE IF NOT EXISTS `funcionario` (
  `codigoFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `salario` double NOT NULL,
  `dataNascimento` date NOT NULL,
  PRIMARY KEY (`codigoFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela clinicacrud_bd.funcionario: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` (`codigoFuncionario`, `nome`, `salario`, `dataNascimento`) VALUES
	(1, 'Safira Pereira', 1200, '2003-06-19'),
	(2, 'Lucas Borges', 1200, '1986-02-19'),
	(4, 'André ', 1200, '2003-11-24'),
	(5, 'teste', 0, '1986-03-21');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;

-- Copiando estrutura para tabela clinicacrud_bd.procedimento
DROP TABLE IF EXISTS `procedimento`;
CREATE TABLE IF NOT EXISTS `procedimento` (
  `codigoProcedimento` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `categoria` int(11) NOT NULL,
  PRIMARY KEY (`codigoProcedimento`),
  KEY `FK1_procedimento_categoria` (`categoria`),
  CONSTRAINT `FK1_procedimento_categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`codigoCategoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela clinicacrud_bd.procedimento: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `procedimento` DISABLE KEYS */;
INSERT INTO `procedimento` (`codigoProcedimento`, `nome`, `categoria`) VALUES
	(1, 'Botox', 2),
	(2, 'Preenchimento', 3),
	(3, 'Rinoplastía', 5);
/*!40000 ALTER TABLE `procedimento` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
