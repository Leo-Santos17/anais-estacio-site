-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/11/2024 às 03:54
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `anais-estacio`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `anais`
--

CREATE TABLE `anais` (
  `id_anais` int(11) NOT NULL,
  `instituicao` varchar(255) NOT NULL,
  `evento` varchar(255) NOT NULL,
  `tema` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `fk_id_docente` int(11) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ano` year(4) NOT NULL,
  `file_path` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `anais`
--

INSERT INTO `anais` (`id_anais`, `instituicao`, `evento`, `tema`, `descricao`, `isbn`, `fk_id_docente`, `create_at`, `ano`, `file_path`) VALUES
(1, 'ifpa', '30 reaus', 'tecnologia', 'este evento teve como propósito a apresentação de trabalho da área de Tecnologia da Informação...', '954654654', NULL, '2024-11-22 02:23:53', '2024', 'C:\\xampp\\htdocs\\anais-estacio-site\\src\\adm/uploads/anais/O Lado Bom da Vida - Matthew Quick.pdf');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cursos`
--

INSERT INTO `cursos` (`id_curso`, `nome`) VALUES
(1, 'análise e desenvolvimento de sistemas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `docentes`
--

CREATE TABLE `docentes` (
  `id_docente` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cod_docente` varchar(255) NOT NULL,
  `fk_id_curso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `docentes`
--

INSERT INTO `docentes` (`id_docente`, `nome`, `senha`, `cod_docente`, `fk_id_curso`) VALUES
(1, 'otto', '12345', '12345', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `anais`
--
ALTER TABLE `anais`
  ADD PRIMARY KEY (`id_anais`),
  ADD KEY `fk_id_docente` (`fk_id_docente`);

--
-- Índices de tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`);

--
-- Índices de tabela `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id_docente`),
  ADD KEY `fk_id_curso` (`fk_id_curso`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `anais`
--
ALTER TABLE `anais`
  MODIFY `id_anais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `docentes`
--
ALTER TABLE `docentes`
  MODIFY `id_docente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `anais`
--
ALTER TABLE `anais`
  ADD CONSTRAINT `anais_ibfk_1` FOREIGN KEY (`fk_id_docente`) REFERENCES `docentes` (`id_docente`);

--
-- Restrições para tabelas `docentes`
--
ALTER TABLE `docentes`
  ADD CONSTRAINT `docentes_ibfk_1` FOREIGN KEY (`fk_id_curso`) REFERENCES `cursos` (`id_curso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
