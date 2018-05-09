-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 09 mai 2018 à 16:03
-- Version du serveur :  10.1.28-MariaDB
-- Version de PHP :  7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gsb-cr`
--

-- --------------------------------------------------------

--
-- Structure de la table `activitecompl`
--

CREATE TABLE `activitecompl` (
  `acNum` int(11) NOT NULL,
  `acDate` datetime DEFAULT NULL,
  `acLieu` varchar(25) DEFAULT NULL,
  `acTheme` varchar(10) DEFAULT NULL,
  `acMotif` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `composant`
--

CREATE TABLE `composant` (
  `cmpCode` varchar(4) NOT NULL,
  `cmpLibelle` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `constituer`
--

CREATE TABLE `constituer` (
  `id` int(11) NOT NULL,
  `cmpCode` varchar(4) NOT NULL,
  `medDepotlegal` varchar(10) NOT NULL,
  `cstQte` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `dosage`
--

CREATE TABLE `dosage` (
  `dosCode` varchar(10) NOT NULL,
  `dosQuantite` varchar(10) DEFAULT NULL,
  `dosUnite` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `famille`
--

CREATE TABLE `famille` (
  `famCode` varchar(3) NOT NULL,
  `famLibelle` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `famille`
--

INSERT INTO `famille` (`famCode`, `famLibelle`) VALUES
('AA', 'Antalgiques en association'),
('AAA', 'Antalgiques antipyrÃ©tiques en association'),
('AAC', 'AntidÃ©presseur d\'action centrale'),
('AAH', 'Antivertigineux antihistaminique H1'),
('ABA', 'Antibiotique antituberculeux'),
('ABC', 'Antibiotique antiacnÃ©ique local'),
('ABP', 'Antibiotique de la famille des bÃ©ta-lactamines (pÃ©nicilline A)'),
('AFC', 'Antibiotique de la famille des cyclines'),
('AFM', 'Antibiotique de la famille des macrolides'),
('AH', 'Antihistaminique H1 local'),
('AIM', 'AntidÃ©presseur imipraminique (tricyclique)'),
('AIN', 'AntidÃ©presseur inhibiteur sÃ©lectif de la recapture de la sÃ©rotonine'),
('ALO', 'Antibiotique local (ORL)'),
('ANS', 'AntidÃ©presseur IMAO non sÃ©lectif'),
('AO', 'Antibiotique ophtalmique'),
('AP', 'Antipsychotique normothymique'),
('AUM', 'Antibiotique urinaire minute'),
('CRT', 'CorticoÃ¯de, antibiotique et antifongique Ã   usage local'),
('HYP', 'Hypnotique antihistaminique'),
('PSA', 'Psychostimulant, antiasthÃ©nique');

-- --------------------------------------------------------

--
-- Structure de la table `formuler`
--

CREATE TABLE `formuler` (
  `id` int(11) NOT NULL,
  `preCode` varchar(2) NOT NULL,
  `medDepotlegal` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `interagir`
--

CREATE TABLE `interagir` (
  `id` int(11) NOT NULL,
  `medMeddepotlegal` varchar(10) NOT NULL,
  `medDepotlegal` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `inviter`
--

CREATE TABLE `inviter` (
  `id` int(11) NOT NULL,
  `acNum` int(11) NOT NULL,
  `praNum` int(11) NOT NULL,
  `specialisteon` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `labo`
--

CREATE TABLE `labo` (
  `labCode` varchar(2) NOT NULL,
  `labNom` varchar(10) DEFAULT NULL,
  `labChefvente` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `labo`
--

INSERT INTO `labo` (`labCode`, `labNom`, `labChefvente`) VALUES
('BC', 'Bichat', 'Suzanne Terminus'),
('GY', 'Gyverny', 'Marcel MacDouglas'),
('SW', 'Swiss Kane', 'Alain Poutre');

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE `medicament` (
  `medDepotlegal` varchar(10) NOT NULL,
  `medNomcommercial` varchar(25) DEFAULT NULL,
  `famCode` varchar(3) NOT NULL,
  `medComposition` varchar(255) DEFAULT NULL,
  `medEffets` varchar(255) DEFAULT NULL,
  `medContreindic` varchar(255) DEFAULT NULL,
  `medPrixechantillon` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`medDepotlegal`, `medNomcommercial`, `famCode`, `medComposition`, `medEffets`, `medContreindic`, `medPrixechantillon`) VALUES
('3MYC7', 'TRIMYCINE', 'CRT', 'Triamcinolone (acÃ©tonide) + NÃ©omycine + Nystatine', 'Ce mÃ©dicament est un corticoÃ¯de Ã   activitÃ© forte ou trÃ¨s forte associÃ© Ã   un antibiotique et un antifongique, utilisÃ© en application locale dans certaines atteintes cutanÃ©es surinfectÃ©es.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie Ã   l\'un des constituants, d\'infections de la peau ou de parasitisme non traitÃ©s, d\'acnÃ©. Ne pas appliquer sur une plaie, ni sous un pansement occlusif.', NULL),
('ADIMOL9', 'ADIMOL', 'ABP', 'Amoxicilline + Acide clavulanique', 'Ce mÃ©dicament, plus puissant que les pÃ©nicillines simples, est utilisÃ© pour traiter des infections bactÃ©riennes spÃ©cifiques.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie aux pÃ©nicillines ou aux cÃ©phalosporines.', NULL),
('AMOPIL7', 'AMOPIL', 'ABP', 'Amoxicilline', 'Ce mÃ©dicament, plus puissant que les pÃ©nicillines simples, est utilisÃ© pour traiter des infections bactÃ©riennes spÃ©cifiques.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie aux pÃ©nicillines. Il doit Ãªtre administrÃ© avec prudence en cas d\'allergie aux cÃ©phalosporines.', NULL),
('AMOX45', 'AMOXAR', 'ABP', 'Amoxicilline', 'Ce mÃ©dicament, plus puissant que les pÃ©nicillines simples, est utilisÃ© pour traiter des infections bactÃ©riennes spÃ©cifiques.', 'La prise de ce mÃ©dicament peut rendre positifs les tests de dÃ©pistage du dopage.', NULL),
('AMOXIG12', 'AMOXI GÃ©', 'ABP', 'Amoxicilline', 'Ce mÃ©dicament, plus puissant que les pÃ©nicillines simples, est utilisÃ© pour traiter des infections bactÃ©riennes spÃ©cifiques.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie aux pÃ©nicillines. Il doit Ãªtre administrÃ© avec prudence en cas d\'allergie aux cÃ©phalosporines.', NULL),
('APATOUX22', 'APATOUX Vitamine C', 'ALO', 'Tyrothricine + TÃ©tracaÃ¯ne + Acide ascorbique (Vitamine C)', 'Ce mÃ©dicament est utilisÃ© pour traiter les affections de la bouche et de la gorge.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie Ã   l\'un des constituants, en cas de phÃ©nylcÃ©tonurie et chez l\'enfant de moins de 6 ans.', NULL),
('BACTIG10', 'BACTIGEL', 'ABC', 'Erythromycine', 'Ce mÃ©dicament est utilisÃ© en application locale pour traiter l\'acnÃ© et les infections cutanÃ©es bactÃ©riennes associÃ©es.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie aux antibiotiques de la famille des macrolides ou des lincosanides.', NULL),
('BACTIV13', 'BACTIVIL', 'AFM', 'Erythromycine', 'Ce mÃ©dicament est utilisÃ© pour traiter des infections bactÃ©riennes spÃ©cifiques.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie aux macrolides (dont le chef de file est l\'Ã©rythromycine).', NULL),
('BITALV', 'BIVALIC', 'AAA', 'DextropropoxyphÃ¨ne + ParacÃ©tamol', 'Ce mÃ©dicament est utilisÃ© pour traiter les douleurs d\'intensitÃ© modÃ©rÃ©e ou intense.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie aux mÃ©dicaments de cette famille, d\'insuffisance hÃ©patique ou d\'insuffisance rÃ©nale.', NULL),
('CARTION6', 'CARTION', 'AAA', 'Acide acÃ©tylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + ParacÃ©tamol', 'Ce mÃ©dicament est utilisÃ© dans le traitement symptomatique de la douleur ou de la fiÃ¨vre.', 'Ce mÃ©dicament est contre-indiquÃ© en cas de troubles de la coagulation (tendances aux hÃ©morragies), d\'ulcÃ¨re gastroduodÃ©nal, maladies graves du foie.', NULL),
('CLAZER6', 'CLAZER', 'AFM', 'Clarithromycine', 'Ce mÃ©dicament est utilisÃ© pour traiter des infections bactÃ©riennes spÃ©cifiques. Il est Ã©galement utilisÃ© dans le traitement de l\'ulcÃ¨re gastro-duodÃ©nal, en association avec d\'autres mÃ©dicaments.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie aux macrolides (dont le chef de file est l\'Ã©rythromycine).', NULL),
('DEPRIL9', 'DEPRAMIL', 'AIM', 'Clomipramine', 'Ce mÃ©dicament est utilisÃ© pour traiter les Ã©pisodes dÃ©pressifs sÃ©vÃ¨res, certaines douleurs rebelles, les troubles obsessionnels compulsifs et certaines Ã©nurÃ©sies chez l\'enfant.', 'Ce mÃ©dicament est contre-indiquÃ© en cas de glaucome ou d\'adÃ©nome de la prostate, d\'infarctus rÃ©cent, ou si vous avez reÃ Â§u un traitement par IMAO durant les 2 semaines prÃ©cÃ©dentes ou en cas d\'allergie aux antidÃ©presseurs imipraminiques.', NULL),
('DIMIRTAM6', 'DIMIRTAM', 'AAC', 'Mirtazapine', 'Ce mÃ©dicament est utilisÃ© pour traiter les Ã©pisodes dÃ©pressifs sÃ©vÃ¨res.', 'La prise de ce produit est contre-indiquÃ©e en cas de d\'allergie Ã   l\'un des constituants.', NULL),
('DOLRIL7', 'DOLORIL', 'AAA', 'Acide acÃ©tylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + ParacÃ©tamol', 'Ce mÃ©dicament est utilisÃ© dans le traitement symptomatique de la douleur ou de la fiÃ¨vre.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie au paracÃ©tamol ou aux salicylates.', NULL),
('DORNOM8', 'NORMADOR', 'HYP', 'Doxylamine', 'Ce mÃ©dicament est utilisÃ© pour traiter l\'insomnie chez l\'adulte.', 'Ce mÃ©dicament est contre-indiquÃ© en cas de glaucome, de certains troubles urinaires (rÃ©tention urinaire) et chez l\'enfant de moins de 15 ans.', NULL),
('EQUILARX6', 'EQUILAR', 'AAH', 'MÃ©clozine', 'Ce mÃ©dicament est utilisÃ© pour traiter les vertiges et pour prÃ©venir le mal des transports.', 'Ce mÃ©dicament ne doit pas Ãªtre utilisÃ© en cas d\'allergie au produit, en cas de glaucome ou de rÃ©tention urinaire.', NULL),
('EVILR7', 'EVEILLOR', 'PSA', 'Adrafinil', 'Ce mÃ©dicament est utilisÃ© pour traiter les troubles de la vigilance et certains symptomes neurologiques chez le sujet agÃ©.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie Ã   l\'un des constituants.', NULL),
('INSXT5', 'INSECTIL', 'AH', 'DiphÃ©nydramine', 'Ce mÃ©dicament est utilisÃ© en application locale sur les piqÃ»res d\'insecte et l\'urticaire.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie aux antihistaminiques.', NULL),
('JOVAI8', 'JOVENIL', 'AFM', 'Josamycine', 'Ce mÃ©dicament est utilisÃ© pour traiter des infections bactÃ©riennes spÃ©cifiques.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie aux macrolides (dont le chef de file est l\'Ã©rythromycine).', NULL),
('LIDOXY23', 'LIDOXYTRACINE', 'AFC', 'OxytÃ©tracycline +LidocaÃ¯ne', 'Ce mÃ©dicament est utilisÃ© en injection intramusculaire pour traiter certaines infections spÃ©cifiques.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie Ã   l\'un des constituants. Il ne doit pas Ãªtre associÃ© aux rÃ©tinoÃ¯des.', NULL),
('LITHOR12', 'LITHORINE', 'AP', 'Lithium', 'Ce mÃ©dicament est indiquÃ© dans la prÃ©vention des psychoses maniaco-dÃ©pressives ou pour traiter les Ã©tats maniaques.', 'Ce mÃ©dicament ne doit pas Ãªtre utilisÃ© si vous Ãªtes allergique au lithium. Avant de prendre ce traitement, signalez Ã   votre mÃ©decin traitant si vous souffrez d\'insuffisance rÃ©nale, ou si vous avez un rÃ©gime sans sel.', NULL),
('PARMOL16', 'PARMOCODEINE', 'AA', 'CodÃ©ine + ParacÃ©tamol', 'Ce mÃ©dicament est utilisÃ© pour le traitement des douleurs lorsque des antalgiques simples ne sont pas assez efficaces.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie Ã   l\'un des constituants, chez l\'enfant de moins de 15 Kg, en cas d\'insuffisance hÃ©patique ou respiratoire, d\'asthme, de phÃ©nylcÃ©tonurie et chez la femme qui allaite.', NULL),
('PHYSOI8', 'PHYSICOR', 'PSA', 'Sulbutiamine', 'Ce mÃ©dicament est utilisÃ© pour traiter les baisses d\'activitÃ© physique ou psychique, souvent dans un contexte de dÃ©pression.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie Ã   l\'un des constituants.', NULL),
('PIRIZ8', 'PIRIZAN', 'ABA', 'Pyrazinamide', 'Ce mÃ©dicament est utilisÃ©, en association Ã   d\'autres antibiotiques, pour traiter la tuberculose.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie Ã   l\'un des constituants, d\'insuffisance rÃ©nale ou hÃ©patique, d\'hyperuricÃ©mie ou de porphyrie.', NULL),
('POMDI20', 'POMADINE', 'AO', 'Bacitracine', 'Ce mÃ©dicament est utilisÃ© pour traiter les infections oculaires de la surface de l\'oeil.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie aux antibiotiques appliquÃ©s localement.', NULL),
('TROXT21', 'TROXADET', 'AIN', 'ParoxÃ©tine', 'Ce mÃ©dicament est utilisÃ© pour traiter la dÃ©pression et les troubles obsessionnels compulsifs. Il peut Ã©galement Ãªtre utilisÃ© en prÃ©vention des crises de panique avec ou sans agoraphobie.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie au produit.', NULL),
('TXISOL22', 'TOUXISOL Vitamine C', 'ALO', 'Tyrothricine + Acide ascorbique (Vitamine C)', 'Ce mÃ©dicament est utilisÃ© pour traiter les affections de la bouche et de la gorge.', 'Ce mÃ©dicament est contre-indiquÃ© en cas d\'allergie Ã   l\'un des constituants et chez l\'enfant de moins de 6 ans.', NULL),
('URIEG6', 'URIREGUL', 'AUM', 'Fosfomycine tromÃ©tamol', 'Ce mÃ©dicament est utilisÃ© pour traiter les infections urinaires simples chez la femme de moins de 65 ans.', 'La prise de ce mÃ©dicament est contre-indiquÃ©e en cas d\'allergie Ã   l\'un des constituants et d\'insuffisance rÃ©nale.', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `offrir`
--

CREATE TABLE `offrir` (
  `id` int(11) NOT NULL,
  `visMatricule` varchar(10) NOT NULL,
  `rapNum` int(11) NOT NULL,
  `medDepotlegal` varchar(10) NOT NULL,
  `offQte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `offrir`
--

INSERT INTO `offrir` (`id`, `visMatricule`, `rapNum`, `medDepotlegal`, `offQte`) VALUES
(1, 'a17', 4, '3MYC7', 3),
(2, 'a17', 4, 'AMOX45', 12);

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

CREATE TABLE `posseder` (
  `id` int(11) NOT NULL,
  `speCode` varchar(5) NOT NULL,
  `praNum` int(11) NOT NULL,
  `posDiplome` varchar(10) DEFAULT NULL,
  `posCoefprescription` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `praticien`
--

CREATE TABLE `praticien` (
  `praNum` int(11) NOT NULL,
  `praNom` varchar(25) DEFAULT NULL,
  `praPrenom` varchar(30) DEFAULT NULL,
  `praAdresse` varchar(50) DEFAULT NULL,
  `praCp` varchar(5) DEFAULT NULL,
  `praVille` varchar(25) DEFAULT NULL,
  `praCoefnotoriete` float DEFAULT NULL,
  `typCode` varchar(3) NOT NULL,
  `Remplacement` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `praticien`
--

INSERT INTO `praticien` (`praNum`, `praNom`, `praPrenom`, `praAdresse`, `praCp`, `praVille`, `praCoefnotoriete`, `typCode`, `Remplacement`) VALUES
(1, 'Notini', 'Alain', '114 r Authie', '85000', 'LA ROCHE SUR YON', 290.03, 'MH', 0),
(2, 'Gosselin', 'Albert', '13 r Devon', '41000', 'BLOIS', 307.49, 'MV', 0),
(3, 'Delahaye', 'AndrÃ©', '36 av 6 Juin', '25000', 'BESANCON', 185.79, 'PS', 0),
(4, 'Leroux', 'AndrÃ©', '47 av Robert Schuman', '60000', 'BEAUVAIS', 172.04, 'PH', 0),
(5, 'Desmoulins', 'Anne', '31 r St Jean', '30000', 'NIMES', 94.75, 'PO', 0),
(6, 'Mouel', 'Anne', '27 r Auvergne', '80000', 'AMIENS', 45.2, 'MH', 0),
(7, 'Desgranges-Lentz', 'Antoine', '1 r Albert de Mun', '29000', 'MORLAIX', 20.07, 'MV', 0),
(8, 'Marcouiller', 'Arnaud', '31 r St Jean', '68000', 'MULHOUSE', 396.52, 'PS', 0),
(9, 'Dupuy', 'Benoit', '9 r Demolombe', '34000', 'MONTPELLIER', 395.66, 'PH', 0),
(10, 'Lerat', 'Bernard', '31 r St Jean', '59000', 'LILLE', 257.79, 'PO', 0),
(11, 'MarÃ§ais-Lefebvre', 'Bertrand', '86Bis r Basse', '67000', 'STRASBOURG', 450.96, 'MH', 0),
(12, 'Boscher', 'Bruno', '94 r Falaise', '10000', 'TROYES', 356.14, 'MV', 0),
(13, 'Morel', 'Catherine', '21 r Chateaubriand', '75000', 'PARIS', 379.57, 'PS', 0),
(14, 'Guivarch', 'Chantal', '4 av GÃ©n Laperrine', '45000', 'ORLEANS', 114.56, 'PH', 0),
(15, 'Bessin-Grosdoit', 'Christophe', '92 r Falaise', '6000', 'NICE', 222.06, 'PO', 0),
(16, 'Rossa', 'Claire', '14 av ThiÃ¨s', '6000', 'NICE', 529.78, 'MH', 0),
(17, 'Cauchy', 'Denis', '5 av Ste ThÃ©rÃ¨se', '11000', 'NARBONNE', 458.82, 'MV', 0),
(18, 'GaffÃ©', 'Dominique', '9 av 1Ã¨re ArmÃ©e FranÃ§aise', '35000', 'RENNES', 213.4, 'PS', 0),
(19, 'Guenon', 'Dominique', '98 bd Mar Lyautey', '44000', 'NANTES', 175.89, 'PH', 0),
(20, 'PrÃ©vot', 'Dominique', '29 r Lucien Nelle', '87000', 'LIMOGES', 151.36, 'PO', 0),
(21, 'Houchard', 'Eliane', '9 r Demolombe', '49100', 'ANGERS', 436.96, 'MH', 0),
(22, 'Desmons', 'Elisabeth', '51 r BerniÃ¨res', '29000', 'QUIMPER', 281.17, 'MV', 0),
(23, 'Flament', 'Elisabeth', '11 r Pasteur', '35000', 'RENNES', 315.6, 'PS', 0),
(24, 'Goussard', 'Emmanuel', '9 r Demolombe', '41000', 'BLOIS', 40.72, 'PH', 0),
(25, 'Desprez', 'Eric', '9 r Vaucelles', '33000', 'BORDEAUX', 406.85, 'PO', 0),
(26, 'Coste', 'Evelyne', '29 r Lucien Nelle', '19000', 'TULLE', 441.87, 'MH', 0),
(27, 'Lefebvre', 'FrÃ©dÃ©ric', '2 pl Wurzburg', '55000', 'VERDUN', 573.63, 'MV', 0),
(28, 'LemÃ©e', 'FrÃ©dÃ©ric', '29 av 6 Juin', '56000', 'VANNES', 326.4, 'PS', 0),
(29, 'Martin', 'FrÃ©dÃ©ric', 'BÃ¢t A 90 r Bayeux', '70000', 'VESOUL', 506.06, 'PH', 0),
(30, 'Marie', 'FrÃ©dÃ©rique', '172 r CaponiÃ¨re', '70000', 'VESOUL', 313.31, 'PO', 0),
(31, 'Rosenstech', 'GeneviÃ¨ve', '27 r Auvergne', '75000', 'PARIS', 366.82, 'MH', 0),
(32, 'Pontavice', 'Ghislaine', '8 r Gaillon', '86000', 'POITIERS', 265.58, 'MV', 0),
(33, 'Leveneur-Mosquet', 'Guillaume', '47 av Robert Schuman', '64000', 'PAU', 184.97, 'PS', 0),
(34, 'Blanchais', 'Guy', '30 r Authie', '8000', 'SEDAN', 502.48, 'PH', 0),
(35, 'Leveneur', 'Hugues', '7 pl St Gilles', '62000', 'ARRAS', 7.39, 'PO', 0),
(36, 'Mosquet', 'Isabelle', '22 r Jules Verne', '76000', 'ROUEN', 77.1, 'MH', 0),
(37, 'Giraudon', 'Jean-Christophe', '1 r Albert de Mun', '38100', 'VIENNE', 92.62, 'MV', 0),
(38, 'Marie', 'Jean-Claude', '26 r HÃ©rouville', '69000', 'LYON', 120.1, 'PS', 0),
(39, 'Maury', 'Jean-FranÃ§ois', '5 r Pierre Girard', '71000', 'CHALON SUR SAONE', 13.73, 'PH', 0),
(40, 'Dennel', 'Jean-Louis', '7 pl St Gilles', '28000', 'CHARTRES', 550.69, 'PO', 0),
(41, 'Ain', 'Jean-Pierre', '4 rÃ©sid Olympia', '2000', 'LAON', 5.59, 'MH', 0),
(42, 'Chemery', 'Jean-Pierre', '51 pl Ancienne Boucherie', '14000', 'CAEN', 396.58, 'MV', 0),
(43, 'Comoz', 'Jean-Pierre', '35 r Auguste Lechesne', '18000', 'BOURGES', 340.35, 'PS', 0),
(44, 'Desfaudais', 'Jean-Pierre', '7 pl St Gilles', '29000', 'BREST', 71.76, 'PH', 0),
(45, 'Phan', 'JÃ©rÃƒÂ´me', '9 r Clos Caillet', '79000', 'NIORT', 451.61, 'PO', 0),
(46, 'Riou', 'Line', '43 bd GÃ©n Vanier', '77000', 'MARNE LA VALLEE', 193.25, 'MH', 0),
(47, 'Chubilleau', 'Louis', '46 r Eglise', '17000', 'SAINTES', 202.07, 'MV', 0),
(48, 'Lebrun', 'Lucette', '178 r Auge', '54000', 'NANCY', 410.41, 'PS', 0),
(49, 'Goessens', 'Marc', '6 av 6 Juin', '39000', 'DOLE', 548.57, 'PH', 0),
(50, 'Laforge', 'Marc', '5 rÃ©sid Prairie', '50000', 'SAINT LO', 265.05, 'PO', 0),
(51, 'Millereau', 'Marc', '36 av 6 Juin', '72000', 'LA FERTE BERNARD', 430.42, 'MH', 0),
(52, 'Dauverne', 'Marie-Christine', '69 av Charlemagne', '21000', 'DIJON', 281.05, 'MV', 0),
(53, 'Vittorio', 'Myriam', '3 pl Champlain', '94000', 'BOISSY SAINT LEGER', 356.23, 'PS', 0),
(54, 'Lapasset', 'Nhieu', '31 av 6 Juin', '52000', 'CHAUMONT', 107, 'PH', 0),
(55, 'Plantet-Besnier', 'Nicole', '10 av 1Ã¨re ArmÃ©e FranÃ§aise', '86000', 'CHATELLEREAULT', 369.94, 'PO', 0),
(56, 'Chubilleau', 'Pascal', '3 r Hastings', '15000', 'AURRILLAC', 290.75, 'MH', 0),
(57, 'Robert', 'Pascal', '31 r St Jean', '93000', 'BOBIGNY', 162.41, 'MV', 0),
(58, 'Jean', 'Pascale', '114 r Authie', '49100', 'SAUMUR', 375.52, 'PS', 0),
(59, 'Chanteloube', 'Patrice', '14 av ThiÃ¨s', '13000', 'MARSEILLE', 478.01, 'PH', 0),
(60, 'Lecuirot', 'Patrice', 'rÃ©sid St PÃ¨res 55 r PigaciÃ¨re', '54000', 'NANCY', 239.66, 'PO', 0),
(61, 'Gandon', 'Patrick', '47 av Robert Schuman', '37000', 'TOURS', 599.06, 'MH', 0),
(62, 'Mirouf', 'Patrick', '22 r Puits Picard', '74000', 'ANNECY', 458.42, 'MV', 0),
(63, 'Boireaux', 'Philippe', '14 av ThiÃ¨s', '10000', 'CHALON EN CHAMPAGNE', 454.48, 'PS', 0),
(64, 'Cendrier', 'Philippe', '7 pl St Gilles', '12000', 'RODEZ', 164.16, 'PH', 0),
(65, 'Duhamel', 'Philippe', '114 r Authie', '34000', 'MONTPELLIER', 98.62, 'PO', 0),
(66, 'Grigy', 'Philippe', '15 r MÃ©lingue', '44000', 'CLISSON', 285.1, 'MH', 0),
(67, 'Linard', 'Philippe', '1 r Albert de Mun', '81000', 'ALBI', 486.3, 'MV', 0),
(68, 'Lozier', 'Philippe', '8 r Gaillon', '31000', 'TOULOUSE', 48.4, 'PS', 0),
(69, 'DechÃ¢tre', 'Pierre', '63 av ThiÃ¨s', '23000', 'MONTLUCON', 253.75, 'PH', 0),
(70, 'Goessens', 'Pierre', '22 r Jean Romain', '40000', 'MONT DE MARSAN', 426.19, 'PO', 0),
(71, 'LemÃ©nager', 'Pierre', '39 av 6 Juin', '57000', 'METZ', 118.7, 'MH', 0),
(72, 'NÃ©e', 'Pierre', '39 av 6 Juin', '82000', 'MONTAUBAN', 72.54, 'MV', 0),
(73, 'Guyot', 'Pierre-Laurent', '43 bd GÃ©n Vanier', '48000', 'MENDE', 352.31, 'PS', 0),
(74, 'Chauchard', 'Roger', '9 r Vaucelles', '13000', 'MARSEILLE', 552.19, 'PH', 0),
(75, 'Mabire', 'Roland', '11 r Boutiques', '67000', 'STRASBOURG', 422.39, 'PO', 0),
(76, 'Leroy', 'Soazig', '45 r Boutiques', '61000', 'ALENCON', 570.67, 'MH', 0),
(77, 'Guyot', 'StÃ©phane', '26 r HÃ©rouville', '46000', 'FIGEAC', 28.85, 'MV', 0),
(78, 'Delposen', 'Sylvain', '39 av 6 Juin', '27000', 'DREUX', 292.01, 'PS', 0),
(79, 'Rault', 'Sylvie', '15 bd Richemond', '2000', 'SOISSON', 526.6, 'PH', 0),
(80, 'Renouf', 'Sylvie', '98 bd Mar Lyautey', '88000', 'EPINAL', 425.24, 'PO', 0),
(81, 'Alliet-Grach', 'Thierry', '14 av ThiÃ¨s', '7000', 'PRIVAS', 451.31, 'MH', 0),
(82, 'Bayard', 'Thierry', '92 r Falaise', '42000', 'SAINT ETIENNE', 271.71, 'MV', 0),
(83, 'Gauchet', 'Thierry', '7 r Desmoueux', '38100', 'GRENOBLE', 406.1, 'PS', 0),
(84, 'Bobichon', 'Tristan', '219 r CaponiÃ¨re', '9000', 'FOIX', 218.36, 'PH', 0),
(85, 'Duchemin-Laniel', 'VÃ©ronique', '130 r St Jean', '33000', 'LIBOURNE', 265.61, 'PO', 0),
(86, 'Laurent', 'YounÃ¨s', '34 r Demolombe', '53000', 'MAYENNE', 496.1, 'MH', 0);

-- --------------------------------------------------------

--
-- Structure de la table `prescrire`
--

CREATE TABLE `prescrire` (
  `id` int(11) NOT NULL,
  `medDepotlegal` varchar(10) NOT NULL,
  `tinCode` varchar(5) NOT NULL,
  `dosCode` varchar(10) NOT NULL,
  `prePosologie` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `presentation`
--

CREATE TABLE `presentation` (
  `preCode` varchar(2) NOT NULL,
  `preLibelle` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `presenter`
--

CREATE TABLE `presenter` (
  `rapNumP` int(11) NOT NULL,
  `medDepotlegal` varchar(10) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rapportvisite`
--

CREATE TABLE `rapportvisite` (
  `id` int(11) NOT NULL,
  `visMatricule` varchar(10) NOT NULL,
  `rapNum` int(11) NOT NULL,
  `praNum` int(11) NOT NULL,
  `rapDate` datetime DEFAULT NULL,
  `rapBilan` varchar(255) DEFAULT NULL,
  `rapMotif` varchar(255) DEFAULT NULL,
  `CoeffCOnf` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rapportvisite`
--

INSERT INTO `rapportvisite` (`id`, `visMatricule`, `rapNum`, `praNum`, `rapDate`, `rapBilan`, `rapMotif`, `CoeffCOnf`) VALUES
(1, 'a131', 3, 23, '2002-04-18 00:00:00', 'MÃ©decin curieux, Ã  recontacer en dÃ©cembre pour rÃ©union', 'Actualisation annuelle', 0),
(2, 'a131', 7, 41, '2003-03-23 00:00:00', 'RAS\r\nChangement de tel : 05 89 89 89 89', 'Rapport Annuel', 0),
(3, 'a17', 4, 4, '2003-05-21 00:00:00', 'Changement de direction, redÃ©finition de la politique mÃ©dicamenteuse, recours au gÃ©nÃ©rique', 'Baisse activitÃ©', 0);

-- --------------------------------------------------------

--
-- Structure de la table `realiser`
--

CREATE TABLE `realiser` (
  `id` int(11) NOT NULL,
  `acNum` int(11) NOT NULL,
  `visMatricule` varchar(10) NOT NULL,
  `reaMttfrais` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE `region` (
  `regCode` varchar(2) NOT NULL,
  `secCode` varchar(1) NOT NULL,
  `regNom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`regCode`, `secCode`, `regNom`) VALUES
('AL', 'E', 'Alsace Lorraine'),
('AQ', 'S', 'Aquitaine'),
('AU', 'P', 'Auvergne'),
('BG', 'O', 'Bretagne'),
('BN', 'O', 'Basse Normandie'),
('BO', 'E', 'Bourgogne'),
('CA', 'N', 'Champagne Ardennes'),
('CE', 'P', 'Centre'),
('FC', 'E', 'Franche ComtÃ©'),
('HN', 'N', 'Haute Normandie'),
('IF', 'P', 'Ile de France'),
('LG', 'S', 'Languedoc'),
('LI', 'P', 'Limousin'),
('MP', 'S', 'Midi PyrÃ©nÃ©e'),
('NP', 'N', 'Nord Pas de Calais'),
('PA', 'S', 'Provence Alpes Cote d\'Azur'),
('PC', 'O', 'Poitou Charente'),
('PI', 'N', 'Picardie'),
('PL', 'O', 'Pays de Loire'),
('RA', 'E', 'Rhone Alpes'),
('RO', 'S', 'Roussilon'),
('VD', 'O', 'VendÃ©e');

-- --------------------------------------------------------

--
-- Structure de la table `secteur`
--

CREATE TABLE `secteur` (
  `secCode` varchar(1) NOT NULL,
  `secLibelle` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `secteur`
--

INSERT INTO `secteur` (`secCode`, `secLibelle`) VALUES
('E', 'Est'),
('N', 'Nord'),
('O', 'Ouest'),
('P', 'Paris centre'),
('S', 'Sud');

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE `specialite` (
  `speCode` varchar(5) NOT NULL,
  `speLibelle` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `specialite`
--

INSERT INTO `specialite` (`speCode`, `speLibelle`) VALUES
('ACP', 'anatomie et cytologie pathologiques'),
('AMV', 'angÃ©iologie, mÃ©decine vasculaire'),
('ARC', 'anesthÃ©siologie et rÃ©animation chirurgicale'),
('BM', 'biologie mÃ©dicale'),
('CAC', 'cardiologie et affections cardio-vasculaires'),
('CCT', 'chirurgie cardio-vasculaire et thoracique'),
('CG', 'chirurgie gÃ©nÃ©rale'),
('CMF', 'chirurgie maxillo-faciale'),
('COM', 'cancÃ©rologie, oncologie mÃ©dicale'),
('COT', 'chirurgie orthopÃ©dique et traumatologie'),
('CPR', 'chirurgie plastique reconstructrice et esthÃ©tique'),
('CU', 'chirurgie urologique'),
('CV', 'chirurgie vasculaire'),
('DN', 'diabÃ©tologie-nutrition, nutrition'),
('DV', 'dermatologie et vÃ©nÃ©rÃ©ologie'),
('EM', 'endocrinologie et mÃ©tabolismes'),
('ETD', 'Ã©valuation et traitement de la douleur'),
('GEH', 'gastro-entÃ©rologie et hÃ©patologie (appareil digestif)'),
('GMO', 'gynÃ©cologie mÃ©dicale, obstÃ©trique'),
('GO', 'gynÃ©cologie-obstÃ©trique'),
('HEM', 'maladies du sang (hÃ©matologie)'),
('MBS', 'mÃ©decine et biologie du sport'),
('MDT', 'mÃ©decine du travail'),
('MMO', 'mÃ©decine manuelle - ostÃ©opathie'),
('MN', 'mÃ©decine nuclÃ©aire'),
('MPR', 'mÃ©decine physique et de rÃ©adaptation'),
('MTR', 'mÃ©decine tropicale, pathologie infectieuse et tropicale'),
('NEP', 'nÃ©phrologie'),
('NRC', 'neurochirurgie'),
('NRL', 'neurologie'),
('ODM', 'orthopÃ©die dento maxillo-faciale'),
('OPH', 'ophtalmologie'),
('ORL', 'oto-rhino-laryngologie'),
('PEA', 'psychiatrie de l\'enfant et de l\'adolescent'),
('PME', 'pÃ©diatrie maladies des enfants'),
('PNM', 'pneumologie'),
('PSC', 'psychiatrie'),
('RAD', 'radiologie (radiodiagnostic et imagerie mÃ©dicale)'),
('RDT', 'radiothÃ©rapie (oncologie option radiothÃ©rapie)'),
('RGM', 'reproduction et gynÃ©cologie mÃ©dicale'),
('RHU', 'rhumatologie'),
('STO', 'stomatologie'),
('SXL', 'sexologie'),
('TXA', 'toxicomanie et alcoologie');

-- --------------------------------------------------------

--
-- Structure de la table `travailler`
--

CREATE TABLE `travailler` (
  `id` int(11) NOT NULL,
  `visMatricule` varchar(10) NOT NULL,
  `jJMMAA` datetime NOT NULL,
  `regCode` varchar(2) NOT NULL,
  `traRole` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `travailler`
--

INSERT INTO `travailler` (`id`, `visMatricule`, `jJMMAA`, `regCode`, `traRole`) VALUES
(1, 'p49', '1977-10-03 00:00:00', 'CE', 'Visiteur'),
(2, 'k53', '1983-03-23 00:00:00', 'CA', 'Visiteur'),
(3, 'r24', '1984-07-29 00:00:00', 'BN', 'Visiteur'),
(4, 'g53', '1985-10-02 00:00:00', 'BG', 'Visiteur'),
(5, 'a55', '1987-07-17 00:00:00', 'MP', 'Visiteur'),
(6, 'm35', '1987-10-06 00:00:00', 'MP', 'Visiteur'),
(7, 'e39', '1988-04-26 00:00:00', 'IF', 'Visiteur'),
(8, 'c14', '1989-02-01 00:00:00', 'PA', 'Visiteur'),
(9, 'e22', '1989-03-24 00:00:00', 'AL', 'Visiteur'),
(10, 'p7', '1990-03-01 00:00:00', 'RO', 'Visiteur'),
(11, 'r58', '1990-06-30 00:00:00', 'BG', 'Visiteur'),
(12, 'm45', '1990-10-13 00:00:00', 'AL', 'Visiteur'),
(13, 'e5', '1990-11-27 00:00:00', 'MP', 'Visiteur'),
(14, 't60', '1991-03-29 00:00:00', 'CE', 'Visiteur'),
(15, 'c54', '1991-04-09 00:00:00', 'AL', 'Visiteur'),
(16, 'p8', '1991-06-23 00:00:00', 'BO', 'Visiteur'),
(17, 'a17', '1991-08-26 00:00:00', 'RA', 'Visiteur'),
(18, 'e52', '1991-10-31 00:00:00', 'HN', 'Visiteur'),
(19, 'd13', '1991-12-05 00:00:00', 'PL', 'Visiteur'),
(20, 'k53', '1992-04-03 00:00:00', 'AL', 'DÃ©lÃ©guÃ©'),
(21, 'c3', '1992-05-05 00:00:00', 'CA', 'Visiteur'),
(22, 'n58', '1992-08-30 00:00:00', 'CE', 'Visiteur'),
(23, 's21', '1992-09-25 00:00:00', 'LI', 'Visiteur'),
(24, 'h40', '1992-11-01 00:00:00', 'CA', 'Visiteur'),
(25, 'a131', '1992-12-11 00:00:00', 'BN', 'Visiteur'),
(26, 'p40', '1992-12-14 00:00:00', 'BN', 'DÃ©lÃ©guÃ©'),
(27, 'j50', '1992-12-16 00:00:00', 'NP', 'Visiteur'),
(28, 'p32', '1992-12-24 00:00:00', 'IF', 'Visiteur'),
(29, 'h13', '1993-05-08 00:00:00', 'LI', 'Visiteur'),
(30, 'e24', '1993-05-17 00:00:00', 'AL', 'DÃ©lÃ©guÃ©'),
(31, 'f21', '1993-06-08 00:00:00', 'RA', 'Visiteur'),
(32, 'h35', '1993-08-26 00:00:00', 'AU', 'Visiteur'),
(33, 'b34', '1993-12-06 00:00:00', 'CE', 'DÃ©lÃ©guÃ©'),
(34, 'f4', '1994-05-03 00:00:00', 'MP', 'Visiteur'),
(35, 'b25', '1994-07-03 00:00:00', 'PL', 'Visiteur'),
(36, 't55', '1994-11-29 00:00:00', 'MP', 'Visiteur'),
(37, 'p42', '1994-12-12 00:00:00', 'PI', 'Visiteur'),
(38, 'n59', '1994-12-19 00:00:00', 'PI', 'Visiteur'),
(39, 'o26', '1995-01-05 00:00:00', 'LG', 'Visiteur'),
(40, 'l14', '1995-02-02 00:00:00', 'PL', 'Visiteur'),
(41, 't43', '1995-03-09 00:00:00', 'BO', 'Visiteur'),
(42, 'a55', '1995-05-19 00:00:00', 'RO', 'Visiteur'),
(43, 'l23', '1995-06-05 00:00:00', 'PC', 'Visiteur'),
(44, 'b59', '1995-10-21 00:00:00', 'RA', 'Visiteur'),
(45, 's10', '1995-11-14 00:00:00', 'FC', 'Visiteur'),
(46, 'e5', '1995-11-27 00:00:00', 'MP', 'DÃ©lÃ©guÃ©'),
(47, 'g7', '1996-01-13 00:00:00', 'LI', 'Visiteur'),
(48, 'g19', '1996-01-18 00:00:00', 'IF', 'Visiteur'),
(49, 'e49', '1996-02-19 00:00:00', 'MP', 'Visiteur'),
(50, 'l56', '1996-02-27 00:00:00', 'FC', 'Visiteur'),
(51, 'n42', '1996-03-06 00:00:00', 'HN', 'Visiteur'),
(52, 'b13', '1996-03-11 00:00:00', 'AL', 'Visiteur'),
(53, 'a131', '1996-05-27 00:00:00', 'BG', 'Visiteur'),
(54, 'k4', '1996-11-21 00:00:00', 'LG', 'Visiteur'),
(55, 'l46', '1997-01-24 00:00:00', 'PL', 'Visiteur'),
(56, 'c14', '1997-02-01 00:00:00', 'PA', 'DÃ©lÃ©guÃ©'),
(57, 'f39', '1997-02-15 00:00:00', 'RA', 'Visiteur'),
(58, 'b16', '1997-03-21 00:00:00', 'BG', 'Visiteur'),
(59, 'p6', '1997-03-30 00:00:00', 'AQ', 'Visiteur'),
(60, 't47', '1997-08-29 00:00:00', 'PI', 'Visiteur'),
(61, 'q17', '1997-09-06 00:00:00', 'BN', 'Visiteur'),
(62, 'a17', '1997-09-19 00:00:00', 'RA', 'DÃ©lÃ©guÃ©'),
(63, 'b4', '1997-09-25 00:00:00', 'AQ', 'Visiteur'),
(64, 'd51', '1997-11-18 00:00:00', 'FC', 'DÃ©lÃ©guÃ©'),
(65, 'b50', '1998-01-18 00:00:00', 'PA', 'Visiteur'),
(66, 'j45', '1998-02-25 00:00:00', 'CA', 'Responsable'),
(67, 'h30', '1998-04-26 00:00:00', 'IF', 'Visiteur'),
(68, 'r24', '1998-05-25 00:00:00', 'BN', 'Responsable'),
(69, 'j8', '1998-06-18 00:00:00', 'IF', 'Responsable'),
(70, 'p41', '1998-07-27 00:00:00', 'PC', 'Visiteur'),
(71, 'a93', '1999-01-02 00:00:00', 'PC', 'Visiteur'),
(72, 'b19', '1999-01-31 00:00:00', 'PL', 'Visiteur'),
(73, 'g30', '1999-03-27 00:00:00', 'PI', 'DÃ©lÃ©guÃ©'),
(74, 'm45', '1999-04-08 00:00:00', 'AL', 'DÃ©lÃ©guÃ©'),
(75, 'b34', '1999-06-18 00:00:00', 'CE', 'Responsable'),
(76, 'p40', '1999-07-17 00:00:00', 'BN', 'Responsable'),
(77, 'a55', '1999-08-21 00:00:00', 'RO', 'DÃ©lÃ©guÃ©'),
(78, 'b25', '2000-01-01 00:00:00', 'PL', 'DÃ©lÃ©guÃ©'),
(79, 'e24', '2000-02-29 00:00:00', 'AL', 'Responsable'),
(80, 'b28', '2000-08-02 00:00:00', 'LG', 'Visiteur'),
(81, 'g30', '2000-10-31 00:00:00', 'PI', 'Responsable'),
(82, 'e5', '2000-11-27 00:00:00', 'AQ', 'Responsable'),
(83, 'c14', '2001-03-03 00:00:00', 'PA', 'Responsable'),
(84, 'd51', '2002-03-20 00:00:00', 'FC', 'Responsable');

-- --------------------------------------------------------

--
-- Structure de la table `typeindividu`
--

CREATE TABLE `typeindividu` (
  `tinCode` varchar(5) NOT NULL,
  `tinLibelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `typepraticien`
--

CREATE TABLE `typepraticien` (
  `typCode` varchar(3) NOT NULL,
  `typLibelle` varchar(25) DEFAULT NULL,
  `typLieu` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `typepraticien`
--

INSERT INTO `typepraticien` (`typCode`, `typLibelle`, `typLieu`) VALUES
('MH', 'MÃ©decin Hospitalier', 'Hopital ou clinique'),
('MV', 'MÃ©decine de Ville', 'Cabinet'),
('PH', 'Pharmacien Hospitalier', 'Hopital ou clinique'),
('PO', 'Pharmacien Officine', 'Pharmacie'),
('PS', 'Personnel de santÃ©', 'Centre paramÃ©dical');

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE `visiteur` (
  `visMatricule` varchar(10) NOT NULL,
  `visNom` varchar(25) DEFAULT NULL,
  `visPrenom` varchar(50) DEFAULT NULL,
  `visAdresse` varchar(50) DEFAULT NULL,
  `visCp` varchar(5) DEFAULT NULL,
  `visVille` varchar(30) DEFAULT NULL,
  `visDateembauche` datetime DEFAULT NULL,
  `secCode` varchar(1) DEFAULT NULL,
  `labCode` varchar(2) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `visiteur`
--

INSERT INTO `visiteur` (`visMatricule`, `visNom`, `visPrenom`, `visAdresse`, `visCp`, `visVille`, `visDateembauche`, `secCode`, `labCode`, `password`) VALUES
('a131', 'Villechalane', 'Louis', '8 cours Lafontaine', '29000', 'BREST', '1992-12-11 00:00:00', NULL, 'SW', 'Villelou'),
('a17', 'Andre', 'David', '1 r Aimon de ChissÃ©e', '38100', 'GRENOBLE', '1991-08-26 00:00:00', NULL, 'GY', 'A12hJx56'),
('a55', 'Bedos', 'Christian', '1 r BÃ©nÃ©dictins', '65000', 'TARBES', '1987-07-17 00:00:00', NULL, 'GY', '8g8bB7Nm'),
('a93', 'Tusseau', 'Louis', '22 r Renou', '86000', 'POITIERS', '1999-01-02 00:00:00', NULL, 'SW', 'wmw6WM77'),
('b13', 'Bentot', 'Pascal', '11 av 6 Juin', '67000', 'STRASBOURG', '1996-03-11 00:00:00', NULL, 'GY', 'a5gH59yD'),
('b16', 'Bioret', 'Luc', '1 r Linne', '35000', 'RENNES', '1997-03-21 00:00:00', NULL, 'SW', 'aL2cN54r'),
('b19', 'Bunisset', 'Francis', '10 r Nicolas Chorier', '85000', 'LA ROCHE SUR YON', '1999-01-31 00:00:00', NULL, 'GY', '78NN7wvq'),
('b25', 'Bunisset', 'Denise', '1 r Lionne', '49100', 'ANGERS', '1994-07-03 00:00:00', NULL, 'SW', 'DpJzh623'),
('b28', 'Cacheux', 'Bernard', '114 r Authie', '34000', 'MONTPELLIER', '2000-08-02 00:00:00', NULL, 'GY', 'z5duPE54'),
('b34', 'Cadic', 'Eric', '123 r CaponiÃ¨re', '41000', 'BLOIS', '1993-12-06 00:00:00', 'P', 'SW', '5hM74hTu'),
('b4', 'Charoze', 'Catherine', '100 pl GÃ©ants', '33000', 'BORDEAUX', '1997-09-25 00:00:00', NULL, 'SW', 'Tp5Gme39'),
('b50', 'Clepkens', 'Christophe', '12 r FÃ©dÃ©rico Garcia Lorca', '13000', 'MARSEILLE', '1998-01-18 00:00:00', NULL, 'SW', '92uwPDg5'),
('b59', 'Cottin', 'Vincenne', '36 sq Capucins', '5000', 'GAP', '1995-10-21 00:00:00', NULL, 'GY', '3i2rF4Qk'),
('c14', 'Daburon', 'FranÃ§ois', '13 r Champs ElysÃ©es', '6000', 'NICE', '1989-02-01 00:00:00', 'S', 'SW', 'd4A79vxE'),
('c3', 'De', 'Philippe', '13 r Charles Peguy', '10000', 'TROYES', '1992-05-05 00:00:00', NULL, 'SW', 'J663mhRv'),
('c54', 'Debelle', 'Michel', '181 r CaponiÃ¨re', '88000', 'EPINAL', '1991-04-09 00:00:00', NULL, 'SW', 'y7R4Enq8'),
('d13', 'Debelle', 'Jeanne', '134 r Stalingrad', '44000', 'NANTES', '1991-12-05 00:00:00', NULL, 'SW', 'a34v2iLH'),
('d51', 'Debroise', 'Michel', '2 av 6 Juin', '70000', 'VESOUL', '1997-11-18 00:00:00', 'E', 'GY', '96NjX9jc'),
('e22', 'Desmarquest', 'Nathalie', '14 r FÃ©dÃ©rico Garcia Lorca', '54000', 'NANCY', '1989-03-24 00:00:00', NULL, 'GY', '3G4j9dNc'),
('e24', 'Desnost', 'Pierre', '16 r Barral de Montferrat', '55000', 'VERDUN', '1993-05-17 00:00:00', 'E', 'SW', 'Tnz36t4U'),
('e39', 'Dudouit', 'FrÃ©dÃ©ric', '18 quai Xavier Jouvin', '75000', 'PARIS', '1988-04-26 00:00:00', NULL, 'GY', 'fNm8Pw67'),
('e49', 'Duncombe', 'Claude', '19 av Alsace Lorraine', '9000', 'FOIX', '1996-02-19 00:00:00', NULL, 'GY', 'D479zsEq'),
('e5', 'Enault-Pascreau', 'CÃ©line', '25B r Stalingrad', '40000', 'MONT DE MARSAN', '1990-11-27 00:00:00', 'S', 'GY', 'D8k97tcR'),
('e52', 'Eynde', 'ValÃ©rie', '3 r Henri Moissan', '76000', 'ROUEN', '1991-10-31 00:00:00', NULL, 'GY', '67EjH5nv'),
('f21', 'Finck', 'Jacques', 'rte Montreuil Bellay', '74000', 'ANNECY', '1993-06-08 00:00:00', NULL, 'SW', 'D3mYr6p6'),
('f39', 'FrÃ©mont', 'Fernande', '4 r Jean Giono', '69000', 'LYON', '1997-02-15 00:00:00', NULL, 'GY', ''),
('f4', 'Gest', 'Alain', '30 r Authie', '46000', 'FIGEAC', '1994-05-03 00:00:00', NULL, 'GY', ''),
('g19', 'Gheysen', 'Galassus', '32 bd Mar Foch', '75000', 'PARIS', '1996-01-18 00:00:00', NULL, 'SW', ''),
('g30', 'Girard', 'Yvon', '31 av 6 Juin', '80000', 'AMIENS', '1999-03-27 00:00:00', 'N', 'GY', ''),
('g53', 'Gombert', 'Luc', '32 r Emile Gueymard', '56000', 'VANNES', '1985-10-02 00:00:00', NULL, 'GY', ''),
('g7', 'Guindon', 'Caroline', '40 r Mar Montgomery', '87000', 'LIMOGES', '1996-01-13 00:00:00', NULL, 'GY', ''),
('h13', 'Guindon', 'FranÃ§ois', '44 r PicotiÃ¨re', '19000', 'TULLE', '1993-05-08 00:00:00', NULL, 'SW', ''),
('h30', 'Igigabel', 'Guy', '33 gal Arlequin', '94000', 'CRETEIL', '1998-04-26 00:00:00', NULL, 'SW', ''),
('h35', 'Jourdren', 'Pierre', '34 av Jean Perrot', '15000', 'AURRILLAC', '1993-08-26 00:00:00', NULL, 'GY', ''),
('h40', 'Juttard', 'Pierre-Raoul', '34 cours Jean JaurÃ¨s', '8000', 'SEDAN', '1992-11-01 00:00:00', NULL, 'GY', ''),
('j45', 'LabourÃ©-Morel', 'Saout', '38 cours Berriat', '52000', 'CHAUMONT', '1998-02-25 00:00:00', 'N', 'SW', ''),
('j50', 'LandrÃ©', 'Philippe', '4 av GÃ©n Laperrine', '59000', 'LILLE', '1992-12-16 00:00:00', NULL, 'GY', ''),
('j8', 'Langeard', 'Hugues', '39 av Jean Perrot', '93000', 'BAGNOLET', '1998-06-18 00:00:00', 'P', 'GY', ''),
('k4', 'Lanne', 'Bernard', '4 r Bayeux', '30000', 'NIMES', '1996-11-21 00:00:00', NULL, 'SW', ''),
('k53', 'Le', 'NoÃ«l', '4 av Beauvert', '68000', 'MULHOUSE', '1983-03-23 00:00:00', NULL, 'SW', ''),
('l14', 'Le', 'Jean', '39 r Raspail', '53000', 'LAVAL', '1995-02-02 00:00:00', NULL, 'SW', ''),
('l23', 'Leclercq', 'Servane', '11 r Quinconce', '18000', 'BOURGES', '1995-06-05 00:00:00', NULL, 'SW', ''),
('l46', 'Lecornu', 'Jean-Bernard', '4 bd Mar Foch', '72000', 'LA FERTE BERNARD', '1997-01-24 00:00:00', NULL, 'GY', ''),
('l56', 'Lecornu', 'Ludovic', '4 r Abel Servien', '25000', 'BESANCON', '1996-02-27 00:00:00', NULL, 'SW', ''),
('m35', 'Lejard', 'AgnÃ¨s', '4 r Anthoard', '82000', 'MONTAUBAN', '1987-10-06 00:00:00', NULL, 'SW', ''),
('m45', 'Lesaulnier', 'Pascal', '47 r Thiers', '57000', 'METZ', '1990-10-13 00:00:00', NULL, 'SW', ''),
('n42', 'Letessier', 'StÃ©phane', '5 chem Capuche', '27000', 'EVREUX', '1996-03-06 00:00:00', NULL, 'GY', ''),
('n58', 'Loirat', 'Didier', 'Les PÃªchers citÃ© Bourg la Croix', '45000', 'ORLEANS', '1992-08-30 00:00:00', NULL, 'GY', ''),
('n59', 'Maffezzoli', 'Thibaud', '5 r Chateaubriand', '2000', 'LAON', '1994-12-19 00:00:00', NULL, 'SW', ''),
('o26', 'Mancini', 'Anne', '5 r D\'Agier', '48000', 'MENDE', '1995-01-05 00:00:00', NULL, 'GY', ''),
('p32', 'Marcouiller', 'GÃ©rard', '7 pl St Gilles', '91000', 'ISSY LES MOULINEAUX', '1992-12-24 00:00:00', NULL, 'GY', ''),
('p40', 'Michel', 'Jean-Claude', '5 r Gabriel PÃ©ri', '61000', 'FLERS', '1992-12-14 00:00:00', 'O', 'SW', ''),
('p41', 'Montecot', 'FranÃ§oise', '6 r Paul ValÃ©ry', '17000', 'SAINTES', '1998-07-27 00:00:00', NULL, 'GY', ''),
('p42', 'Notini', 'Veronique', '5 r Lieut Chabal', '60000', 'BEAUVAIS', '1994-12-12 00:00:00', NULL, 'SW', ''),
('p49', 'Onfroy', 'Den', '5 r Sidonie Jacolin', '37000', 'TOURS', '1977-10-03 00:00:00', NULL, 'GY', ''),
('p6', 'Pascreau', 'Charles', '57 bd Mar Foch', '64000', 'PAU', '1997-03-30 00:00:00', NULL, 'SW', ''),
('p7', 'Pernot', 'Claude-NoÃ«l', '6 r Alexandre 1 de Yougoslavie', '11000', 'NARBONNE', '1990-03-01 00:00:00', NULL, 'SW', ''),
('p8', 'Perrier', 'MaÃ®tre', '6 r Aubert Dubayet', '71000', 'CHALON SUR SAONE', '1991-06-23 00:00:00', NULL, 'GY', ''),
('q17', 'Petit', 'Jean-Louis', '7 r Ernest Renan', '50000', 'SAINT LO', '1997-09-06 00:00:00', NULL, 'GY', ''),
('r24', 'Piquery', 'Patrick', '9 r Vaucelles', '14000', 'CAEN', '1984-07-29 00:00:00', 'O', 'GY', ''),
('r58', 'Quiquandon', 'JoÃ«l', '7 r Ernest Renan', '29000', 'QUIMPER', '1990-06-30 00:00:00', NULL, 'GY', ''),
('s10', 'Retailleau', 'Josselin', '88Bis r Saumuroise', '39000', 'DOLE', '1995-11-14 00:00:00', NULL, 'SW', ''),
('s21', 'Retailleau', 'Pascal', '32 bd Ayrault', '23000', 'MONTLUCON', '1992-09-25 00:00:00', NULL, 'SW', ''),
('t43', 'Souron', 'Maryse', '7B r Gay Lussac', '21000', 'DIJON', '1995-03-09 00:00:00', NULL, 'SW', ''),
('t47', 'Tiphagne', 'Patrick', '7B r Gay Lussac', '62000', 'ARRAS', '1997-08-29 00:00:00', NULL, 'SW', ''),
('t55', 'TrÃ©het', 'Alain', '7D chem Barral', '12000', 'RODEZ', '1994-11-29 00:00:00', NULL, 'SW', ''),
('t60', 'Tusseau', 'Josselin', '63 r Bon Repos', '28000', 'CHARTRES', '1991-03-29 00:00:00', NULL, 'GY', ''),
('zzz', 'swiss', 'bourdin', NULL, NULL, NULL, '2003-06-18 00:00:00', NULL, 'BC', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activitecompl`
--
ALTER TABLE `activitecompl`
  ADD PRIMARY KEY (`acNum`);

--
-- Index pour la table `composant`
--
ALTER TABLE `composant`
  ADD PRIMARY KEY (`cmpCode`);

--
-- Index pour la table `constituer`
--
ALTER TABLE `constituer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_{C117FEE7-AA81-4F86-B5FE-F201F9F80B0D}` (`medDepotlegal`),
  ADD KEY `FK_{71FD2D72-0D6A-43C1-963B-3633406D704D}` (`cmpCode`);

--
-- Index pour la table `dosage`
--
ALTER TABLE `dosage`
  ADD PRIMARY KEY (`dosCode`);

--
-- Index pour la table `famille`
--
ALTER TABLE `famille`
  ADD PRIMARY KEY (`famCode`);

--
-- Index pour la table `formuler`
--
ALTER TABLE `formuler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_{1FA0425F-A30D-420E-9142-AB9EEA79ABAF}` (`medDepotlegal`),
  ADD KEY `FK_{35254FCA-17C5-4BED-ACE9-7A61C0B36749}` (`preCode`);

--
-- Index pour la table `interagir`
--
ALTER TABLE `interagir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_{C1208A3D-F928-4436-AACF-376DDC7DA8F9}` (`medDepotlegal`),
  ADD KEY `FK_{F32A801A-44C2-4AEB-8A0E-51396C6F3020}` (`medMeddepotlegal`);

--
-- Index pour la table `inviter`
--
ALTER TABLE `inviter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_{DEB1742C-B963-41D9-9F12-F7F65DC9FC18}` (`praNum`),
  ADD KEY `FK_{194BCE92-A8C4-4683-91C2-7B1CC0E48F1B}` (`acNum`);

--
-- Index pour la table `labo`
--
ALTER TABLE `labo`
  ADD PRIMARY KEY (`labCode`);

--
-- Index pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`medDepotlegal`),
  ADD KEY `FK_{413a5d7485a845e7b320df5e9396baed}` (`famCode`);

--
-- Index pour la table `offrir`
--
ALTER TABLE `offrir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_{212870AC-D285-4251-9654-14A416149517}` (`medDepotlegal`),
  ADD KEY `FK_{3A261F4F-9FED-418E-8FEE-E91583119C7E}` (`visMatricule`,`rapNum`);

--
-- Index pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_{99960067-C04E-44F3-95AF-6F4F392F6347}` (`praNum`),
  ADD KEY `FK_{6F32033E-99CD-4486-8CE2-84644754DE3F}` (`speCode`);

--
-- Index pour la table `praticien`
--
ALTER TABLE `praticien`
  ADD PRIMARY KEY (`praNum`),
  ADD KEY `FK_{1dd782ab506c441b9e6d7263fd1c1eaf}` (`typCode`);

--
-- Index pour la table `prescrire`
--
ALTER TABLE `prescrire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_{2551EBD9-3594-4572-9B70-C3ADA46DC4AE}` (`tinCode`),
  ADD KEY `FK_{C90A61AD-D8EF-48C0-8F11-39ADCC0CB9E6}` (`dosCode`),
  ADD KEY `FK_{02233D94-7C64-4199-B94D-8E272446F5A6}` (`medDepotlegal`);

--
-- Index pour la table `presentation`
--
ALTER TABLE `presentation`
  ADD PRIMARY KEY (`preCode`);

--
-- Index pour la table `presenter`
--
ALTER TABLE `presenter`
  ADD PRIMARY KEY (`rapNumP`,`medDepotlegal`),
  ADD KEY `medDepotlegal` (`medDepotlegal`);

--
-- Index pour la table `rapportvisite`
--
ALTER TABLE `rapportvisite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_{8ee7b4b5e5094735b4df9ef80ac6fa90}` (`praNum`),
  ADD KEY `FK_{c0c347fc964646199e2a572232ab4654}` (`visMatricule`);

--
-- Index pour la table `realiser`
--
ALTER TABLE `realiser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_{E097CD3C-C67D-41B2-9249-8689FD140E16}` (`visMatricule`),
  ADD KEY `FK_{D1B87024-4384-43BC-9EC9-870194D4BD7B}` (`acNum`);

--
-- Index pour la table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`regCode`),
  ADD KEY `FK_{2a8a348f6d52456bb96a7b966468977e}` (`secCode`);

--
-- Index pour la table `secteur`
--
ALTER TABLE `secteur`
  ADD PRIMARY KEY (`secCode`);

--
-- Index pour la table `specialite`
--
ALTER TABLE `specialite`
  ADD PRIMARY KEY (`speCode`);

--
-- Index pour la table `travailler`
--
ALTER TABLE `travailler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_{a35e8696cf024ba8bd16753cd7e91075}` (`visMatricule`),
  ADD KEY `FK_{4019f059649a477cb52b8191ca9e7ad2}` (`regCode`);

--
-- Index pour la table `typeindividu`
--
ALTER TABLE `typeindividu`
  ADD PRIMARY KEY (`tinCode`);

--
-- Index pour la table `typepraticien`
--
ALTER TABLE `typepraticien`
  ADD PRIMARY KEY (`typCode`);

--
-- Index pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD PRIMARY KEY (`visMatricule`),
  ADD KEY `FK_{8d9c46f626434448b5559e5c85169ba4}` (`labCode`),
  ADD KEY `FK_{e2a4ea82136a4528a19a094497a7bbe0}` (`secCode`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activitecompl`
--
ALTER TABLE `activitecompl`
  MODIFY `acNum` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `constituer`
--
ALTER TABLE `constituer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `formuler`
--
ALTER TABLE `formuler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `interagir`
--
ALTER TABLE `interagir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `inviter`
--
ALTER TABLE `inviter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `offrir`
--
ALTER TABLE `offrir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `posseder`
--
ALTER TABLE `posseder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `prescrire`
--
ALTER TABLE `prescrire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rapportvisite`
--
ALTER TABLE `rapportvisite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `realiser`
--
ALTER TABLE `realiser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `travailler`
--
ALTER TABLE `travailler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `constituer`
--
ALTER TABLE `constituer`
  ADD CONSTRAINT `FK_{71FD2D72-0D6A-43C1-963B-3633406D704D}` FOREIGN KEY (`cmpCode`) REFERENCES `composant` (`cmpCode`),
  ADD CONSTRAINT `FK_{C117FEE7-AA81-4F86-B5FE-F201F9F80B0D}` FOREIGN KEY (`medDepotlegal`) REFERENCES `medicament` (`medDepotlegal`);

--
-- Contraintes pour la table `formuler`
--
ALTER TABLE `formuler`
  ADD CONSTRAINT `FK_{1FA0425F-A30D-420E-9142-AB9EEA79ABAF}` FOREIGN KEY (`medDepotlegal`) REFERENCES `medicament` (`medDepotlegal`),
  ADD CONSTRAINT `FK_{35254FCA-17C5-4BED-ACE9-7A61C0B36749}` FOREIGN KEY (`preCode`) REFERENCES `presentation` (`preCode`);

--
-- Contraintes pour la table `interagir`
--
ALTER TABLE `interagir`
  ADD CONSTRAINT `FK_{C1208A3D-F928-4436-AACF-376DDC7DA8F9}` FOREIGN KEY (`medDepotlegal`) REFERENCES `medicament` (`medDepotlegal`),
  ADD CONSTRAINT `FK_{F32A801A-44C2-4AEB-8A0E-51396C6F3020}` FOREIGN KEY (`medMeddepotlegal`) REFERENCES `medicament` (`medDepotlegal`);

--
-- Contraintes pour la table `inviter`
--
ALTER TABLE `inviter`
  ADD CONSTRAINT `FK_{194BCE92-A8C4-4683-91C2-7B1CC0E48F1B}` FOREIGN KEY (`acNum`) REFERENCES `activitecompl` (`acNum`),
  ADD CONSTRAINT `FK_{DEB1742C-B963-41D9-9F12-F7F65DC9FC18}` FOREIGN KEY (`praNum`) REFERENCES `praticien` (`praNum`);

--
-- Contraintes pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD CONSTRAINT `FK_{413a5d7485a845e7b320df5e9396baed}` FOREIGN KEY (`famCode`) REFERENCES `famille` (`famCode`);

--
-- Contraintes pour la table `offrir`
--
ALTER TABLE `offrir`
  ADD CONSTRAINT `offrir_ibfk_1` FOREIGN KEY (`visMatricule`) REFERENCES `visiteur` (`visMatricule`),
  ADD CONSTRAINT `offrir_ibfk_2` FOREIGN KEY (`medDepotlegal`) REFERENCES `medicament` (`medDepotlegal`);

--
-- Contraintes pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD CONSTRAINT `FK_{6F32033E-99CD-4486-8CE2-84644754DE3F}` FOREIGN KEY (`speCode`) REFERENCES `specialite` (`speCode`),
  ADD CONSTRAINT `FK_{99960067-C04E-44F3-95AF-6F4F392F6347}` FOREIGN KEY (`praNum`) REFERENCES `praticien` (`praNum`);

--
-- Contraintes pour la table `praticien`
--
ALTER TABLE `praticien`
  ADD CONSTRAINT `FK_{1dd782ab506c441b9e6d7263fd1c1eaf}` FOREIGN KEY (`typCode`) REFERENCES `typepraticien` (`typCode`);

--
-- Contraintes pour la table `prescrire`
--
ALTER TABLE `prescrire`
  ADD CONSTRAINT `FK_{02233D94-7C64-4199-B94D-8E272446F5A6}` FOREIGN KEY (`medDepotlegal`) REFERENCES `medicament` (`medDepotlegal`),
  ADD CONSTRAINT `FK_{2551EBD9-3594-4572-9B70-C3ADA46DC4AE}` FOREIGN KEY (`tinCode`) REFERENCES `typeindividu` (`tinCode`),
  ADD CONSTRAINT `FK_{C90A61AD-D8EF-48C0-8F11-39ADCC0CB9E6}` FOREIGN KEY (`dosCode`) REFERENCES `dosage` (`dosCode`);

--
-- Contraintes pour la table `presenter`
--
ALTER TABLE `presenter`
  ADD CONSTRAINT `presenter_ibfk_1` FOREIGN KEY (`rapNumP`) REFERENCES `rapportvisite` (`id`),
  ADD CONSTRAINT `presenter_ibfk_2` FOREIGN KEY (`medDepotlegal`) REFERENCES `medicament` (`medDepotlegal`);

--
-- Contraintes pour la table `rapportvisite`
--
ALTER TABLE `rapportvisite`
  ADD CONSTRAINT `FK_{8ee7b4b5e5094735b4df9ef80ac6fa90}` FOREIGN KEY (`praNum`) REFERENCES `praticien` (`praNum`),
  ADD CONSTRAINT `FK_{c0c347fc964646199e2a572232ab4654}` FOREIGN KEY (`visMatricule`) REFERENCES `visiteur` (`visMatricule`);

--
-- Contraintes pour la table `realiser`
--
ALTER TABLE `realiser`
  ADD CONSTRAINT `FK_{D1B87024-4384-43BC-9EC9-870194D4BD7B}` FOREIGN KEY (`acNum`) REFERENCES `activitecompl` (`acNum`),
  ADD CONSTRAINT `FK_{E097CD3C-C67D-41B2-9249-8689FD140E16}` FOREIGN KEY (`visMatricule`) REFERENCES `visiteur` (`visMatricule`);

--
-- Contraintes pour la table `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `FK_{2a8a348f6d52456bb96a7b966468977e}` FOREIGN KEY (`secCode`) REFERENCES `secteur` (`secCode`);

--
-- Contraintes pour la table `travailler`
--
ALTER TABLE `travailler`
  ADD CONSTRAINT `FK_{4019f059649a477cb52b8191ca9e7ad2}` FOREIGN KEY (`regCode`) REFERENCES `region` (`regCode`),
  ADD CONSTRAINT `FK_{a35e8696cf024ba8bd16753cd7e91075}` FOREIGN KEY (`visMatricule`) REFERENCES `visiteur` (`visMatricule`);

--
-- Contraintes pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD CONSTRAINT `FK_{8d9c46f626434448b5559e5c85169ba4}` FOREIGN KEY (`labCode`) REFERENCES `labo` (`labCode`),
  ADD CONSTRAINT `FK_{e2a4ea82136a4528a19a094497a7bbe0}` FOREIGN KEY (`secCode`) REFERENCES `secteur` (`secCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
