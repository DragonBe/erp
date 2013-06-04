-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 01, 2013 at 08:16 PM
-- Server version: 5.1.50
-- PHP Version: 5.3.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `erp`
--

-- --------------------------------------------------------

--
-- Table structure for table `Threads`
--

CREATE TABLE IF NOT EXISTS `Threads` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci DEFAULT 'Active',
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thread_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thread_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `composition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=293 ;

--
-- Dumping data for table `Threads`
--

INSERT INTO `Threads` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`, `code`, `name`, `thread_group`, `thread_color`, `composition`) VALUES
(1, NULL, NULL, NULL, NULL, 'Active', '1', '08/1 CO Cardado', 'CO-Card/Pent', NULL, '100% CO'),
(2, NULL, NULL, NULL, NULL, 'Active', '284', '08/1 CO Cardado OE', 'CO-Card/Pent', NULL, ''),
(3, NULL, NULL, NULL, NULL, 'Active', '281', '10/1 CO Cardado OE', 'CO-Card/Pent', NULL, ''),
(4, NULL, NULL, NULL, NULL, 'Active', '2', '12/1 CO Cardado', 'CO-Card/Pent', NULL, '100% CO'),
(5, NULL, NULL, NULL, NULL, 'Active', '3', '20/1 CO Cardado', 'CO-Card/Pent', NULL, '100% CO'),
(6, NULL, NULL, NULL, NULL, 'Active', '4', '20/1 CO Cardado OE', 'CO-Card/Pent', NULL, '100% CO'),
(7, NULL, NULL, NULL, NULL, 'Active', '5', '20/1 CO Penteado', 'CO-Card/Pent', NULL, '100% CO'),
(8, NULL, NULL, NULL, NULL, 'Active', '6', '24/1 CO Cardado ', 'CO-Card/Pent', NULL, '100% CO'),
(9, NULL, NULL, NULL, NULL, 'Active', '217', '24/1 CO Flame', 'CO-Card/Pent', NULL, ''),
(10, NULL, NULL, NULL, NULL, 'Active', '7', '26/1 CO Cardado ', 'CO-Card/Pent', NULL, '100% CO'),
(11, NULL, NULL, NULL, NULL, 'Active', '8', '26/1 CO Penteado', 'CO-Card/Pent', NULL, '100% CO'),
(12, NULL, NULL, NULL, NULL, 'Active', '271', '26/1 CO Penteado Safra Nova', 'CO-Card/Pent', NULL, ''),
(13, NULL, NULL, NULL, NULL, 'Active', '9', '30/1 CO Cardado ', 'CO-Card/Pent', NULL, '100% CO'),
(14, NULL, NULL, NULL, NULL, 'Active', '196', '30/1 CO Cardado OE', 'CO-Card/Pent', NULL, '100% CO'),
(15, NULL, NULL, NULL, NULL, 'Active', '210', '30/1 CO Cardado Safra Nova', 'CO-Card/Pent', NULL, ''),
(16, NULL, NULL, NULL, NULL, 'Active', '264', '30/1 CO Flame', 'CO-Card/Pent', NULL, ''),
(17, NULL, NULL, NULL, NULL, 'Active', '239', '30/1 CO Organico', 'CO-Card/Pent', NULL, ''),
(18, NULL, NULL, NULL, NULL, 'Active', '11', '30/1 CO Penteado ', 'CO-Card/Pent', NULL, '100% CO'),
(19, NULL, NULL, NULL, NULL, 'Active', '206', '30/1 CO Penteado Safra Nova', 'CO-Card/Pent', NULL, ''),
(20, NULL, NULL, NULL, NULL, 'Active', '249', '30/1 CO Topazio', 'CO-Card/Pent', NULL, ''),
(21, NULL, NULL, NULL, NULL, 'Active', '244', '40/1 CO Organico', 'CO-Card/Pent', NULL, ''),
(22, NULL, NULL, NULL, NULL, 'Active', '12', '40/1 CO Penteado ', 'CO-Card/Pent', NULL, '100% CO'),
(23, NULL, NULL, NULL, NULL, 'Active', '53', 'Elastano 20/1 NUA', 'Elastanos', NULL, '100% PUE'),
(24, NULL, NULL, NULL, NULL, 'Active', '54', 'Elastano 40/1 NUA', 'Elastanos', NULL, '100% PUE'),
(25, NULL, NULL, NULL, NULL, 'Active', '55', 'Elastano 70/1 NUA', 'Elastanos', NULL, '100% PUE'),
(26, NULL, NULL, NULL, NULL, 'Active', '57', '20/1 Mescla Cinza 50/38/12', 'Mesclas', NULL, ''),
(27, NULL, NULL, NULL, NULL, 'Active', '56', '20/1 Mescla Cinza 88/12', 'Mesclas', NULL, ''),
(28, NULL, NULL, NULL, NULL, 'Active', '58', '20/1 PA Mescla Preto 50/50', 'Mesclas', NULL, ''),
(29, NULL, NULL, NULL, NULL, 'Active', '198', '20/1 PA Mescla Cinza 85/15', 'Mesclas', NULL, ''),
(30, NULL, NULL, NULL, NULL, 'Active', '59', '24/1 Mescla Grafite PV', 'Mesclas', NULL, ''),
(31, NULL, NULL, NULL, NULL, 'Active', '60', '24/1 PA Mescla Cinza 88/12', 'Mesclas', NULL, ''),
(32, NULL, NULL, NULL, NULL, 'Active', '285', '24/1 SL APM Short', 'Mesclas', NULL, ''),
(33, NULL, NULL, NULL, NULL, 'Active', '224', '24/1 SL MOV CV/PES Flame', 'Mesclas', NULL, ''),
(34, NULL, NULL, NULL, NULL, 'Active', '225', '24/1 SL PA Cardado  CO/PES Flame', 'Mesclas', NULL, ''),
(35, NULL, NULL, NULL, NULL, 'Active', '222', '24/1 SL VP CV/PES Flame', 'Mesclas', NULL, ''),
(36, NULL, NULL, NULL, NULL, 'Active', '276', '30/1 ACBPM Star CO', 'Mesclas', NULL, ''),
(37, NULL, NULL, NULL, NULL, 'Active', '61', '30/1 ACLVBM Morisot Cotlin', 'Mesclas', NULL, ''),
(38, NULL, NULL, NULL, NULL, 'Active', '62', '30/1 ACPM Revival 50', 'Mesclas', NULL, ''),
(39, NULL, NULL, NULL, NULL, 'Active', '275', '30/1 ACPM White', 'Mesclas', NULL, ''),
(40, NULL, NULL, NULL, NULL, 'Active', '63', '30/1 ACVBPM Firenze 4', 'Mesclas', NULL, ''),
(41, NULL, NULL, NULL, NULL, 'Active', '64', '30/1 ACVBPM Star', 'Mesclas', NULL, ''),
(42, NULL, NULL, NULL, NULL, 'Active', '295', '30/1 CO Magic CLSD', 'Mesclas', NULL, ''),
(43, NULL, NULL, NULL, NULL, 'Active', '65', '30/1 CO MCL 003', 'Mesclas', NULL, ''),
(44, NULL, NULL, NULL, NULL, 'Active', '66', '30/1 CO MCL 013', 'Mesclas', NULL, ''),
(45, NULL, NULL, NULL, NULL, 'Active', '282', '30/1 CO Revival Black 14', 'Mesclas', NULL, ''),
(46, NULL, NULL, NULL, NULL, 'Active', '67', '30/1 CO Revival Black 17', 'Mesclas', NULL, ''),
(47, NULL, NULL, NULL, NULL, 'Active', '293', '30/1 CO Revival Light White 17', 'Mesclas', NULL, ''),
(48, NULL, NULL, NULL, NULL, 'Active', '251', '30/1 CO Rubi', 'Mesclas', NULL, ''),
(49, NULL, NULL, NULL, NULL, 'Active', '250', '30/1 CO Verde', 'Mesclas', NULL, ''),
(50, NULL, NULL, NULL, NULL, 'Active', '220', '30/1 CO/CV/PES Lumiere (Granulado)', 'Mesclas', NULL, ''),
(51, NULL, NULL, NULL, NULL, 'Active', '233', '30/1 CO/CV/PES Star', 'Mesclas', NULL, ''),
(52, NULL, NULL, NULL, NULL, 'Active', '238', '30/1 CO/PES Fenix Black', 'Mesclas', NULL, ''),
(53, NULL, NULL, NULL, NULL, 'Active', '235', '30/1 CO/PES Fenix Blue', 'Mesclas', NULL, ''),
(54, NULL, NULL, NULL, NULL, 'Active', '236', '30/1 CO/PES Fenix Green 2', 'Mesclas', NULL, ''),
(55, NULL, NULL, NULL, NULL, 'Active', '242', '30/1 CO/PES Fenix Light White', 'Mesclas', NULL, ''),
(56, NULL, NULL, NULL, NULL, 'Active', '237', '30/1 CO/PES Fenix Red', 'Mesclas', NULL, ''),
(57, NULL, NULL, NULL, NULL, 'Active', '', '30/1 CO/PES Revival 50 White', 'Mesclas', NULL, ''),
(58, NULL, NULL, NULL, NULL, 'Active', '193', '30/1 CV Brinel Color', 'Mesclas', NULL, ''),
(59, NULL, NULL, NULL, NULL, 'Active', '294', '30/1 CV Magic CLSD', 'Mesclas', NULL, ''),
(60, NULL, NULL, NULL, NULL, 'Active', '194', '30/1 CV Mystic Crystal', 'Mesclas', NULL, ''),
(61, NULL, NULL, NULL, NULL, 'Active', '68', '30/1 CV OE Mescla Preto/20', 'Mesclas', NULL, ''),
(62, NULL, NULL, NULL, NULL, 'Active', '69', '30/1 CV OE Mescla Preto/50', 'Mesclas', NULL, ''),
(63, NULL, NULL, NULL, NULL, 'Active', '70', '30/1 CV OE SPA Cardado Edye Arco Iris', 'Mesclas', NULL, ''),
(64, NULL, NULL, NULL, NULL, 'Active', '71', '30/1 CV OE SPA Cardado Edye Azul', 'Mesclas', NULL, ''),
(65, NULL, NULL, NULL, NULL, 'Active', '72', '30/1 CV OE SPA Cardado Edye Tutti Fruti', 'Mesclas', NULL, ''),
(66, NULL, NULL, NULL, NULL, 'Active', '218', '30/1 CV/ACR Chamonix', 'Mesclas', NULL, ''),
(67, NULL, NULL, NULL, NULL, 'Active', '73', '30/1 CV/ACR Color (Frisson)', 'Mesclas', NULL, ''),
(68, NULL, NULL, NULL, NULL, 'Active', '74', '30/1 CV/CL/PES Celebrite', 'Mesclas', NULL, ''),
(69, NULL, NULL, NULL, NULL, 'Active', '75', '30/1 CV/Linho/PES (Risque)', 'Mesclas', NULL, ''),
(70, NULL, NULL, NULL, NULL, 'Active', '195', '30/1 CV/PES Color (Confete)', 'Mesclas', NULL, ''),
(71, NULL, NULL, NULL, NULL, 'Active', '76', '30/1 CV/PES November Branco', 'Mesclas', NULL, ''),
(72, NULL, NULL, NULL, NULL, 'Active', '211', '30/1 CV/PES November Indigo', 'Mesclas', NULL, ''),
(73, NULL, NULL, NULL, NULL, 'Active', '227', '30/1 CV/PES Star Viscose', 'Mesclas', NULL, ''),
(74, NULL, NULL, NULL, NULL, 'Active', '230', '30/1 CV/PES Viscose Fluor', 'Mesclas', NULL, ''),
(75, NULL, NULL, NULL, NULL, 'Active', '77', '30/1 Mescla Algodao 98/2', 'Mesclas', NULL, ''),
(76, NULL, NULL, NULL, NULL, 'Active', '78', '30/1 Mescla Grafite PV', 'Mesclas', NULL, ''),
(77, NULL, NULL, NULL, NULL, 'Active', '270', '30/1 PA Mescla 88/12 Flame', 'Mesclas', NULL, ''),
(78, NULL, NULL, NULL, NULL, 'Active', '79', '30/1 PA Mescla Cinza 50/38/12', 'Mesclas', NULL, ''),
(79, NULL, NULL, NULL, NULL, 'Active', '80', '30/1 PA Mescla Cinza 85/15', 'Mesclas', NULL, ''),
(80, NULL, NULL, NULL, NULL, 'Active', '81', '30/1 PA Mescla Preto 50/50', 'Mesclas', NULL, ''),
(81, NULL, NULL, NULL, NULL, 'Active', '255', '30/1 PA Mescla Preto 70/30', 'Mesclas', NULL, ''),
(82, NULL, NULL, NULL, NULL, 'Active', '283', '30/1 PA Mescla Cinza 88/12', 'Mesclas', NULL, ''),
(83, NULL, NULL, NULL, NULL, 'Active', '257', '30/1 PA Penteado ', 'Mesclas', NULL, ''),
(84, NULL, NULL, NULL, NULL, 'Active', '259', '30/1 PA Cardado Moline Goiaba', 'Mesclas', NULL, ''),
(85, NULL, NULL, NULL, NULL, 'Active', '258', '30/1 PA Cardado Moline Preto', 'Mesclas', NULL, ''),
(86, NULL, NULL, NULL, NULL, 'Active', '219', '30/1 Poliester/Linho', 'Mesclas', NULL, ''),
(87, NULL, NULL, NULL, NULL, 'Active', '254', '30/1 PP Mescla Cinza 88/12', 'Mesclas', NULL, ''),
(88, NULL, NULL, NULL, NULL, 'Active', '253', '30/1 PV Botone Ball Color', 'Mesclas', NULL, ''),
(89, NULL, NULL, NULL, NULL, 'Active', '82', '30/1 PV Botone MIX Color', 'Mesclas', NULL, ''),
(90, NULL, NULL, NULL, NULL, 'Active', '83', '30/1 PV Mescla Preto', 'Mesclas', NULL, ''),
(91, NULL, NULL, NULL, NULL, 'Active', '84', '30/1 PV Preto Brinel', 'Mesclas', NULL, ''),
(92, NULL, NULL, NULL, NULL, 'Active', '221', '30/1 SL MCLS 022 Heavy Flame', 'Mesclas', NULL, ''),
(93, NULL, NULL, NULL, NULL, 'Active', '85', '30/1 SL MCLS 028 Heavy Flame', 'Mesclas', NULL, ''),
(94, NULL, NULL, NULL, NULL, 'Active', '212', '30/1 SL MCLS 030 Heavy Flame', 'Mesclas', NULL, ''),
(95, NULL, NULL, NULL, NULL, 'Active', '269', '30/1 SL VP CV/PES Flame', 'Mesclas', NULL, ''),
(96, NULL, NULL, NULL, NULL, 'Active', '216', '30/1 VBLPM Aurora Boreal', 'Mesclas', NULL, ''),
(97, NULL, NULL, NULL, NULL, 'Active', '86', '30/1 VBM Artif Flax', 'Mesclas', NULL, ''),
(98, NULL, NULL, NULL, NULL, 'Active', '87', '30/1 VBPM Celebrite', 'Mesclas', NULL, ''),
(99, NULL, NULL, NULL, NULL, 'Active', '88', '30/1 VBPM Viscose Ice', 'Mesclas', NULL, ''),
(100, NULL, NULL, NULL, NULL, 'Active', '89', '36/1 Poliester/Linho', 'Mesclas', NULL, ''),
(101, NULL, NULL, NULL, NULL, 'Active', '90', '36/1 SL VV Middle Flame', 'Mesclas', NULL, ''),
(102, NULL, NULL, NULL, NULL, 'Active', '226', 'SL MOX MCLS 045/AP CO/CV/PDA/PES', 'Mesclas', NULL, ''),
(103, NULL, NULL, NULL, NULL, 'Active', '267', '06/1 PA Cardado Flame', 'PA-Card/Pent', NULL, ''),
(104, NULL, NULL, NULL, NULL, 'Active', '13', '08/1 PA Cardado', 'PA-Card/Pent', NULL, '50% CO 50% PES'),
(105, NULL, NULL, NULL, NULL, 'Active', '14', '08/1 PA Cardado Flame', 'PA-Card/Pent', NULL, '50% CO 50% PES'),
(106, NULL, NULL, NULL, NULL, 'Active', '272', '08/1 PA Cardado OE', 'PA-Card/Pent', NULL, ''),
(107, NULL, NULL, NULL, NULL, 'Active', '279', '10/1 PA Cardado OE 50/50', 'PA-Card/Pent', NULL, ''),
(108, NULL, NULL, NULL, NULL, 'Active', '280', '10/1 PA Cardado OE 70/30', 'PA-Card/Pent', NULL, ''),
(109, NULL, NULL, NULL, NULL, 'Active', '15', '12/1 PA Cardado', 'PA-Card/Pent', NULL, '50% CO 50% PES'),
(110, NULL, NULL, NULL, NULL, 'Active', '16', '20/1 PA Mouline Cru', 'PA-Card/Pent', NULL, '50% CO 50% PES'),
(111, NULL, NULL, NULL, NULL, 'Active', '200', '20/1 PA Penteado', 'PA-Card/Pent', NULL, ''),
(112, NULL, NULL, NULL, NULL, 'Active', '17', '20/1 PA Cardado', 'PA-Card/Pent', NULL, '50% CO 50% PES'),
(113, NULL, NULL, NULL, NULL, 'Active', '18', '20/1 PA Cardado Flame', 'PA-Card/Pent', NULL, '50% CO 50% PES'),
(114, NULL, NULL, NULL, NULL, 'Active', '20', '24/1 PA Cardado', 'PA-Card/Pent', NULL, '50% CO 50% PES'),
(115, NULL, NULL, NULL, NULL, 'Active', '21', '24/1 PA Cardado Flame', 'PA-Card/Pent', NULL, '50% CO 50% PES'),
(116, NULL, NULL, NULL, NULL, 'Active', '266', '24/1 PA Cardado OE', 'PA-Card/Pent', NULL, ''),
(117, NULL, NULL, NULL, NULL, 'Active', '22', '30/1 PA Botone 20/80', 'PA-Card/Pent', NULL, '50% CO 50% PES'),
(118, NULL, NULL, NULL, NULL, 'Active', '23', '30/1 PA Botone 60/40', 'PA-Card/Pent', NULL, '50% CO 50% PES'),
(119, NULL, NULL, NULL, NULL, 'Active', '24', '30/1 PA Mouline Cru', 'PA-Card/Pent', NULL, '50% CO 50% PES'),
(120, NULL, NULL, NULL, NULL, 'Active', '232', '30/1 PA Mouline Turbo', 'PA-Card/Pent', NULL, ''),
(121, NULL, NULL, NULL, NULL, 'Active', '241', '30/1 PA Organico', 'PA-Card/Pent', NULL, ''),
(122, NULL, NULL, NULL, NULL, 'Active', '25', '30/1 PA Cardado ', 'PA-Card/Pent', NULL, '50% CO 50% PES'),
(123, NULL, NULL, NULL, NULL, 'Active', '26', '30/1 PA Cardado Flame', 'PA-Card/Pent', NULL, '50% CO 50% PES'),
(124, NULL, NULL, NULL, NULL, 'Active', '223', '30/1 PA Cardado Flame Invertido', 'PA-Card/Pent', NULL, ''),
(125, NULL, NULL, NULL, NULL, 'Active', '201', '30/1 PA Cardado Flame Nuvola', 'PA-Card/Pent', NULL, ''),
(126, NULL, NULL, NULL, NULL, 'Active', '287', '30/1 PA Cardado Morungaba', 'PA-Card/Pent', NULL, ''),
(127, NULL, NULL, NULL, NULL, 'Active', '286', '30/1 PA Cardado Nordeste', 'PA-Card/Pent', NULL, ''),
(128, NULL, NULL, NULL, NULL, 'Active', '27', '30/1 PA Cardado OE', 'PA-Card/Pent', NULL, '50% CO 50% PES'),
(129, NULL, NULL, NULL, NULL, 'Active', '28', '30/1 PA Cardado PET', 'PA-Card/Pent', NULL, '50% CO 50% PES'),
(130, NULL, NULL, NULL, NULL, 'Active', '240', '30/1 PA Penteado Flame', 'PA-Card/Pent', NULL, ''),
(131, NULL, NULL, NULL, NULL, 'Active', '29', '36/1 PA Penteado', 'PA-Card/Pent', NULL, '50% CO 50% PES'),
(132, NULL, NULL, NULL, NULL, 'Active', '243', '40/1 PA Organico', 'PA-Card/Pent', NULL, ''),
(133, NULL, NULL, NULL, NULL, 'Active', '30', '40/1 PA Penteado', 'PA-Card/Pent', NULL, '50% CO 50% PES'),
(134, NULL, NULL, NULL, NULL, 'Active', '39', '30/1 PP', 'PES-Text/Fiado', NULL, '100% PES'),
(135, NULL, NULL, NULL, NULL, 'Active', '40', '30/1 PP Flame', 'PES-Text/Fiado', NULL, '100% PES'),
(136, NULL, NULL, NULL, NULL, 'Active', '41', '30/1 PP OE', 'PES-Text/Fiado', NULL, '100% PES'),
(137, NULL, NULL, NULL, NULL, 'Active', '265', '30/1 PP PET', 'PES-Text/Fiado', NULL, ''),
(138, NULL, NULL, NULL, NULL, 'Active', '246', '40/1 PP', 'PES-Text/Fiado', NULL, ''),
(139, NULL, NULL, NULL, NULL, 'Active', '262', '40/1 PP Flame', 'PES-Text/Fiado', NULL, ''),
(140, NULL, NULL, NULL, NULL, 'Active', '291', 'PES 100/144 Tex OP', 'PES-Text/Fiado', NULL, ''),
(141, NULL, NULL, NULL, NULL, 'Active', '252', 'PES 100/96 Text', 'PES-Text/Fiado', NULL, ''),
(142, NULL, NULL, NULL, NULL, 'Active', '42', 'PES 110/48 Text S/OP Chuvisco', 'PES-Text/Fiado', NULL, '100% PES'),
(143, NULL, NULL, NULL, NULL, 'Active', '43', 'PES 150/108 Text OP', 'PES-Text/Fiado', NULL, '100% PES'),
(144, NULL, NULL, NULL, NULL, 'Active', '292', 'PES 150/144 Tex OP', 'PES-Text/Fiado', NULL, ''),
(145, NULL, NULL, NULL, NULL, 'Active', '44', 'PES 150/96 Text OP', 'PES-Text/Fiado', NULL, '100% PES'),
(146, NULL, NULL, NULL, NULL, 'Active', '274', 'PES 20/1 Monofil', 'PES-Text/Fiado', NULL, ''),
(147, NULL, NULL, NULL, NULL, 'Active', '277', 'PES 30/1 Monofil', 'PES-Text/Fiado', NULL, ''),
(148, NULL, NULL, NULL, NULL, 'Active', '45', 'PES 300/96 Text OP', 'PES-Text/Fiado', NULL, '100% PES'),
(149, NULL, NULL, NULL, NULL, 'Active', '46', 'PES 50/24 Liso S/OPA Cardado', 'PES-Text/Fiado', NULL, '100% PES'),
(150, NULL, NULL, NULL, NULL, 'Active', '289', 'PES 75/144 Tex OP', 'PES-Text/Fiado', NULL, ''),
(151, NULL, NULL, NULL, NULL, 'Active', '47', 'PES 75/34 Text OP', 'PES-Text/Fiado', NULL, '100% PES'),
(152, NULL, NULL, NULL, NULL, 'Active', '256', 'PES 75/36 Text OP', 'PES-Text/Fiado', NULL, ''),
(153, NULL, NULL, NULL, NULL, 'Active', '48', '30/1 PV', 'PV Cru', NULL, ''),
(154, NULL, NULL, NULL, NULL, 'Active', '49', '30/1 PV Firenze 3', 'PV Cru', NULL, ''),
(155, NULL, NULL, NULL, NULL, 'Active', '208', '30/1 PV Flame', 'PV Cru', NULL, ''),
(156, NULL, NULL, NULL, NULL, 'Active', '231', '30/1 PV Flame Nuvola', 'PV Cru', NULL, ''),
(157, NULL, NULL, NULL, NULL, 'Active', '50', '30/2 PV', 'PV Cru', NULL, ''),
(158, NULL, NULL, NULL, NULL, 'Active', '51', '30/3 PV', 'PV Cru', NULL, ''),
(159, NULL, NULL, NULL, NULL, 'Active', '52', '40/1 PV', 'PV Cru', NULL, ''),
(160, NULL, NULL, NULL, NULL, 'Active', '288', '40/1 PV 65/35', 'PV Cru', NULL, ''),
(161, NULL, NULL, NULL, NULL, 'Active', '91', '08/1 PA Cardado Flame Preto', 'Tintos', NULL, ''),
(162, NULL, NULL, NULL, NULL, 'Active', '213', '1/100 Lurex Ouro', 'Tintos', NULL, ''),
(163, NULL, NULL, NULL, NULL, 'Active', '199', '1/100 Lurex Prata', 'Tintos', NULL, ''),
(164, NULL, NULL, NULL, NULL, 'Active', '268', '1/110 Lurex Ouro', 'Tintos', NULL, ''),
(165, NULL, NULL, NULL, NULL, 'Active', '214', '1/110 Prata', 'Tintos', NULL, ''),
(166, NULL, NULL, NULL, NULL, 'Active', '202', '1/139 Ouro', 'Tintos', NULL, ''),
(167, NULL, NULL, NULL, NULL, 'Active', '203', '1/139 Prata', 'Tintos', NULL, ''),
(168, NULL, NULL, NULL, NULL, 'Active', '207', '14/1 Linho', 'Tintos', NULL, ''),
(169, NULL, NULL, NULL, NULL, 'Active', '92', '20/1 CO Cardado Branco', 'Tintos', NULL, ''),
(170, NULL, NULL, NULL, NULL, 'Active', '93', '20/1 CO Cardado Cancun', 'Tintos', NULL, ''),
(171, NULL, NULL, NULL, NULL, 'Active', '94', '20/1 CO Cardado Marinho', 'Tintos', NULL, ''),
(172, NULL, NULL, NULL, NULL, 'Active', '95', '20/1 CO Cardado Preto', 'Tintos', NULL, ''),
(173, NULL, NULL, NULL, NULL, 'Active', '96', '20/1 CO Cardado Tulipa', 'Tintos', NULL, ''),
(174, NULL, NULL, NULL, NULL, 'Active', '245', '20/1 PA Cardado Abacaxi', 'Tintos', NULL, ''),
(175, NULL, NULL, NULL, NULL, 'Active', '97', '20/1 PA Cardado Acqua', 'Tintos', NULL, ''),
(176, NULL, NULL, NULL, NULL, 'Active', '98', '20/1 PA Cardado Alcachofra', 'Tintos', NULL, ''),
(177, NULL, NULL, NULL, NULL, 'Active', '99', '20/1 PA Cardado Amarelo Neon', 'Tintos', NULL, ''),
(178, NULL, NULL, NULL, NULL, 'Active', '100', '20/1 PA Cardado Azul Lago', 'Tintos', NULL, ''),
(179, NULL, NULL, NULL, NULL, 'Active', '101', '20/1 PA Cardado Azul Pacifico', 'Tintos', NULL, ''),
(180, NULL, NULL, NULL, NULL, 'Active', '102', '20/1 PA Cardado Beringela', 'Tintos', NULL, ''),
(181, NULL, NULL, NULL, NULL, 'Active', '103', '20/1 PA Cardado Branco', 'Tintos', NULL, ''),
(182, NULL, NULL, NULL, NULL, 'Active', '104', '20/1 PA Cardado Cafe', 'Tintos', NULL, ''),
(183, NULL, NULL, NULL, NULL, 'Active', '105', '20/1 PA Cardado Cancun', 'Tintos', NULL, ''),
(184, NULL, NULL, NULL, NULL, 'Active', '263', '20/1 PA Cardado Cerejinha', 'Tintos', NULL, ''),
(185, NULL, NULL, NULL, NULL, 'Active', '106', '20/1 PA Cardado Chumbo', 'Tintos', NULL, ''),
(186, NULL, NULL, NULL, NULL, 'Active', '107', '20/1 PA Cardado Coral', 'Tintos', NULL, ''),
(187, NULL, NULL, NULL, NULL, 'Active', '108', '20/1 PA Cardado Estanho', 'Tintos', NULL, ''),
(188, NULL, NULL, NULL, NULL, 'Active', '109', '20/1 PA Cardado Flame Branco', 'Tintos', NULL, ''),
(189, NULL, NULL, NULL, NULL, 'Active', '110', '20/1 PA Cardado Framboesa', 'Tintos', NULL, ''),
(190, NULL, NULL, NULL, NULL, 'Active', '111', '20/1 PA Cardado Laranjina', 'Tintos', NULL, ''),
(191, NULL, NULL, NULL, NULL, 'Active', '112', '20/1 PA Cardado Lilas', 'Tintos', NULL, ''),
(192, NULL, NULL, NULL, NULL, 'Active', '113', '20/1 PA Cardado Marinho', 'Tintos', NULL, ''),
(193, NULL, NULL, NULL, NULL, 'Active', '209', '20/1 PA Cardado Militar', 'Tintos', NULL, ''),
(194, NULL, NULL, NULL, NULL, 'Active', '114', '20/1 PA Cardado Nautico', 'Tintos', NULL, ''),
(195, NULL, NULL, NULL, NULL, 'Active', '115', '20/1 PA Cardado Nivea', 'Tintos', NULL, ''),
(196, NULL, NULL, NULL, NULL, 'Active', '117', '20/1 PA Cardado Nuvem', 'Tintos', NULL, ''),
(197, NULL, NULL, NULL, NULL, 'Active', '118', '20/1 PA Cardado Ocean', 'Tintos', NULL, ''),
(198, NULL, NULL, NULL, NULL, 'Active', '119', '20/1 PA Cardado Orange', 'Tintos', NULL, ''),
(199, NULL, NULL, NULL, NULL, 'Active', '120', '20/1 PA Cardado Preto', 'Tintos', NULL, ''),
(200, NULL, NULL, NULL, NULL, 'Active', '116', '20/1 PA Cardado Red Fly', 'Tintos', NULL, ''),
(201, NULL, NULL, NULL, NULL, 'Active', '121', '20/1 PA Cardado RIce', 'Tintos', NULL, ''),
(202, NULL, NULL, NULL, NULL, 'Active', '122', '20/1 PA Cardado Rosa Petunia', 'Tintos', NULL, ''),
(203, NULL, NULL, NULL, NULL, 'Active', '123', '20/1 PA Cardado Rosa Pillow', 'Tintos', NULL, ''),
(204, NULL, NULL, NULL, NULL, 'Active', '248', '20/1 PA Cardado Roxo Primula', 'Tintos', NULL, ''),
(205, NULL, NULL, NULL, NULL, 'Active', '124', '20/1 PA Cardado Silver', 'Tintos', NULL, ''),
(206, NULL, NULL, NULL, NULL, 'Active', '125', '20/1 PA Cardado Tulipa', 'Tintos', NULL, ''),
(207, NULL, NULL, NULL, NULL, 'Active', '260', '20/1 PA Cardado Verde Alface', 'Tintos', NULL, ''),
(208, NULL, NULL, NULL, NULL, 'Active', '290', '20/1 PA Cardado Verde Folha', 'Tintos', NULL, ''),
(209, NULL, NULL, NULL, NULL, 'Active', '126', '20/1 PA Cardado Verde Island', 'Tintos', NULL, ''),
(210, NULL, NULL, NULL, NULL, 'Active', '127', '20/1 PA Cardado Verde Tropical', 'Tintos', NULL, ''),
(211, NULL, NULL, NULL, NULL, 'Active', '128', '20/1 PA Cardado Wine', 'Tintos', NULL, ''),
(212, NULL, NULL, NULL, NULL, 'Active', '129', '20/1 PP Mostarda', 'Tintos', NULL, ''),
(213, NULL, NULL, NULL, NULL, 'Active', '130', '24/1 PA Cardado Flame Branco', 'Tintos', NULL, ''),
(214, NULL, NULL, NULL, NULL, 'Active', '131', '24/1 PA Cardado Flame Preto', 'Tintos', NULL, ''),
(215, NULL, NULL, NULL, NULL, 'Active', '132', '30/1 CO Cardado Azul Cancun', 'Tintos', NULL, ''),
(216, NULL, NULL, NULL, NULL, 'Active', '133', '30/1 CO Cardado Branco', 'Tintos', NULL, ''),
(217, NULL, NULL, NULL, NULL, 'Active', '134', '30/1 CO Cardado Marinho', 'Tintos', NULL, ''),
(218, NULL, NULL, NULL, NULL, 'Active', '135', '30/1 CO Cardado Preto', 'Tintos', NULL, ''),
(219, NULL, NULL, NULL, NULL, 'Active', '136', '30/1 CO Cardado Tulipa', 'Tintos', NULL, ''),
(220, NULL, NULL, NULL, NULL, 'Active', '137', '30/1 CV Flame Preto', 'Tintos', NULL, ''),
(221, NULL, NULL, NULL, NULL, 'Active', '138', '30/1 CV OE Preto', 'Tintos', NULL, ''),
(222, NULL, NULL, NULL, NULL, 'Active', '205', '30/1 CV/PES/CO Brilhante', 'Tintos', NULL, ''),
(223, NULL, NULL, NULL, NULL, 'Active', '247', '30/1 PA Cardado Abacaxi', 'Tintos', NULL, ''),
(224, NULL, NULL, NULL, NULL, 'Active', '139', '30/1 PA Cardado Acqua', 'Tintos', NULL, ''),
(225, NULL, NULL, NULL, NULL, 'Active', '140', '30/1 PA Cardado Alcachofra', 'Tintos', NULL, ''),
(226, NULL, NULL, NULL, NULL, 'Active', '141', '30/1 PA Cardado Azul Beach', 'Tintos', NULL, ''),
(227, NULL, NULL, NULL, NULL, 'Active', '142', '30/1 PA Cardado Azul Lago', 'Tintos', NULL, ''),
(228, NULL, NULL, NULL, NULL, 'Active', '143', '30/1 PA Cardado Beringela', 'Tintos', NULL, ''),
(229, NULL, NULL, NULL, NULL, 'Active', '144', '30/1 PA Cardado Branco', 'Tintos', NULL, ''),
(230, NULL, NULL, NULL, NULL, 'Active', '145', '30/1 PA Cardado Cafe', 'Tintos', NULL, ''),
(231, NULL, NULL, NULL, NULL, 'Active', '273', '30/1 PA Cardado Cerejinha', 'Tintos', NULL, ''),
(232, NULL, NULL, NULL, NULL, 'Active', '146', '30/1 PA Cardado Chumbo', 'Tintos', NULL, ''),
(233, NULL, NULL, NULL, NULL, 'Active', '147', '30/1 PA Cardado Estanho', 'Tintos', NULL, ''),
(234, NULL, NULL, NULL, NULL, 'Active', '148', '30/1 PA Cardado Flame Branco', 'Tintos', NULL, ''),
(235, NULL, NULL, NULL, NULL, 'Active', '228', '30/1 PA Cardado Flame Preto', 'Tintos', NULL, ''),
(236, NULL, NULL, NULL, NULL, 'Active', '149', '30/1 PA Cardado Framboesa', 'Tintos', NULL, ''),
(237, NULL, NULL, NULL, NULL, 'Active', '150', '30/1 PA Cardado Lilas', 'Tintos', NULL, ''),
(238, NULL, NULL, NULL, NULL, 'Active', '151', '30/1 PA Cardado Marinho', 'Tintos', NULL, ''),
(239, NULL, NULL, NULL, NULL, 'Active', '152', '30/1 PA Cardado Militar', 'Tintos', NULL, ''),
(240, NULL, NULL, NULL, NULL, 'Active', '153', '30/1 PA Cardado Nautico', 'Tintos', NULL, ''),
(241, NULL, NULL, NULL, NULL, 'Active', '154', '30/1 PA Cardado Nivea', 'Tintos', NULL, ''),
(242, NULL, NULL, NULL, NULL, 'Active', '155', '30/1 PA Cardado Nuvem', 'Tintos', NULL, ''),
(243, NULL, NULL, NULL, NULL, 'Active', '156', '30/1 PA Cardado Ocean', 'Tintos', NULL, ''),
(244, NULL, NULL, NULL, NULL, 'Active', '157', '30/1 PA Cardado Preto', 'Tintos', NULL, ''),
(245, NULL, NULL, NULL, NULL, 'Active', '158', '30/1 PA Cardado Red Fly', 'Tintos', NULL, ''),
(246, NULL, NULL, NULL, NULL, 'Active', '159', '30/1 PA Cardado RIce', 'Tintos', NULL, ''),
(247, NULL, NULL, NULL, NULL, 'Active', '160', '30/1 PA Cardado Rosa Fantasia', 'Tintos', NULL, ''),
(248, NULL, NULL, NULL, NULL, 'Active', '215', '30/1 PA Cardado Rosa Maravilha', 'Tintos', NULL, ''),
(249, NULL, NULL, NULL, NULL, 'Active', '161', '30/1 PA Cardado Rosa Pillow', 'Tintos', NULL, ''),
(250, NULL, NULL, NULL, NULL, 'Active', '162', '30/1 PA Cardado Roxo Primula', 'Tintos', NULL, ''),
(251, NULL, NULL, NULL, NULL, 'Active', '163', '30/1 PA Cardado Silver', 'Tintos', NULL, ''),
(252, NULL, NULL, NULL, NULL, 'Active', '164', '30/1 PA Cardado Tulipa', 'Tintos', NULL, ''),
(253, NULL, NULL, NULL, NULL, 'Active', '165', '30/1 PA Cardado Verde Alface', 'Tintos', NULL, ''),
(254, NULL, NULL, NULL, NULL, 'Active', '278', '30/1 PA Cardado Verde Folha', 'Tintos', NULL, ''),
(255, NULL, NULL, NULL, NULL, 'Active', '166', '30/1 PA Cardado Verde Island', 'Tintos', NULL, ''),
(256, NULL, NULL, NULL, NULL, 'Active', '167', '30/1 PA Cardado Verde Tropical', 'Tintos', NULL, ''),
(257, NULL, NULL, NULL, NULL, 'Active', '168', '30/1 PA Cardado Wine', 'Tintos', NULL, ''),
(258, NULL, NULL, NULL, NULL, 'Active', '169', '30/1 PP Blue', 'Tintos', NULL, ''),
(259, NULL, NULL, NULL, NULL, 'Active', '170', '30/1 PP Cenoura CS', 'Tintos', NULL, ''),
(260, NULL, NULL, NULL, NULL, 'Active', '171', '30/1 PP Coral', 'Tintos', NULL, ''),
(261, NULL, NULL, NULL, NULL, 'Active', '172', '30/1 PP Green/Ever', 'Tintos', NULL, ''),
(262, NULL, NULL, NULL, NULL, 'Active', '173', '30/1 PP Preto', 'Tintos', NULL, ''),
(263, NULL, NULL, NULL, NULL, 'Active', '174', '30/1 PP Salmao/Ever', 'Tintos', NULL, ''),
(264, NULL, NULL, NULL, NULL, 'Active', '175', '30/1 PP Verde BB', 'Tintos', NULL, ''),
(265, NULL, NULL, NULL, NULL, 'Active', '176', '30/1 PV Alcachofra', 'Tintos', NULL, ''),
(266, NULL, NULL, NULL, NULL, 'Active', '177', '30/1 PV Amarelo Fluor', 'Tintos', NULL, ''),
(267, NULL, NULL, NULL, NULL, 'Active', '178', '30/1 PV Amarelo Neon', 'Tintos', NULL, ''),
(268, NULL, NULL, NULL, NULL, 'Active', '179', '30/1 PV Azul Neon', 'Tintos', NULL, ''),
(269, NULL, NULL, NULL, NULL, 'Active', '180', '30/1 PV Cafe', 'Tintos', NULL, ''),
(270, NULL, NULL, NULL, NULL, 'Active', '181', '30/1 PV Framboesa', 'Tintos', NULL, ''),
(271, NULL, NULL, NULL, NULL, 'Active', '182', '30/1 PV Laranja Neon', 'Tintos', NULL, ''),
(272, NULL, NULL, NULL, NULL, 'Active', '183', '30/1 PV Laranjina', 'Tintos', NULL, ''),
(273, NULL, NULL, NULL, NULL, 'Active', '184', '30/1 PV Nivea', 'Tintos', NULL, ''),
(274, NULL, NULL, NULL, NULL, 'Active', '185', '30/1 PV Pink Fluor', 'Tintos', NULL, ''),
(275, NULL, NULL, NULL, NULL, 'Active', '204', '30/1 PV Pink Neon', 'Tintos', NULL, ''),
(276, NULL, NULL, NULL, NULL, 'Active', '186', '30/1 PV Preto', 'Tintos', NULL, ''),
(277, NULL, NULL, NULL, NULL, 'Active', '187', '30/1 PV Rosa Fantasia', 'Tintos', NULL, ''),
(278, NULL, NULL, NULL, NULL, 'Active', '188', '30/1 PV Roxo Primula', 'Tintos', NULL, ''),
(279, NULL, NULL, NULL, NULL, 'Active', '189', '30/1 PV Verde Neon', 'Tintos', NULL, ''),
(280, NULL, NULL, NULL, NULL, 'Active', '190', 'PES 167/48 Text Amarelo Fluor', 'Tintos', NULL, ''),
(281, NULL, NULL, NULL, NULL, 'Active', '191', 'PES 167/48 Text Preto', 'Tintos', NULL, ''),
(282, NULL, NULL, NULL, NULL, 'Active', '192', 'PES 75/36 Text Preto', 'Tintos', NULL, ''),
(283, NULL, NULL, NULL, NULL, 'Active', '31', '08/1 CV Flame', 'Viscose', NULL, '100% CV'),
(284, NULL, NULL, NULL, NULL, 'Active', '32', '30/1 CV', 'Viscose', NULL, '100% CV'),
(285, NULL, NULL, NULL, NULL, 'Active', '33', '30/1 CV Flame', 'Viscose', NULL, '100% CV'),
(286, NULL, NULL, NULL, NULL, 'Active', '34', '30/1 CV Flame Invertido Quantum', 'Viscose', NULL, '100% CV'),
(287, NULL, NULL, NULL, NULL, 'Active', '35', '30/1 CV OE', 'Viscose', NULL, '100% CV'),
(288, NULL, NULL, NULL, NULL, 'Active', '36', '30/1 CV/LA', 'Viscose', NULL, ''),
(289, NULL, NULL, NULL, NULL, 'Active', '37', '30/1 CV/Linho', 'Viscose', NULL, ''),
(290, NULL, NULL, NULL, NULL, 'Active', '234', '30/1 Modal', 'Viscose', NULL, ''),
(291, NULL, NULL, NULL, NULL, 'Active', '261', '40/1 CV/Linho', 'Viscose', NULL, ''),
(292, NULL, NULL, NULL, NULL, 'Active', '38', '40/1 Modal/Linho', 'Viscose', NULL, '');