-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2015 年 12 月 08 日 23:35
-- サーバのバージョン： 5.5.44-0ubuntu0.12.04.1
-- PHP Version: 5.6.11-1+deb.sury.org~precise+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ts_production`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` enum('customer','interpreter') NOT NULL,
  `user_id` int(11) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `accounts`
--

INSERT INTO `accounts` (`id`, `email`, `password`, `type`, `user_id`, `confirmed`, `active`, `created_at`, `updated_at`) VALUES
(1, 'potter@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'interpreter', 1, 1, 1, '2015-08-12 00:00:00', '2015-08-12 00:00:00'),
(2, 'dumbledore@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'customer', 1, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'granger@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'interpreter', 2, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'mcgonagall@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'customer', 2, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'snape@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'customer', 3, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'viettrungdang@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'interpreter', 14, 1, 0, '2015-08-08 02:49:11', '2015-08-08 02:49:15'),
(36, 'weasley@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'interpreter', 22, 0, 1, '2015-09-28 14:47:16', '2015-09-28 14:47:16'),
(37, 'malfoy@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'interpreter', 23, 0, 1, '2015-09-29 01:38:51', '2015-09-29 01:38:51'),
(38, 'abbott@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'interpreter', 24, 0, 1, '2015-09-29 01:41:48', '2015-09-29 01:41:48'),
(39, 'bell@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'interpreter', 28, 0, 1, '2015-10-14 08:00:49', '2015-10-14 08:00:49'),
(40, 'longbottom@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'interpreter', 29, 0, 1, '2015-10-14 21:24:26', '2015-10-14 21:24:26'),
(41, 'ginevra_weasley@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'interpreter', 30, 0, 1, '2015-10-14 21:29:19', '2015-10-14 21:29:19');

-- --------------------------------------------------------

--
-- テーブルの構造 `account_confirms`
--

CREATE TABLE IF NOT EXISTS `account_confirms` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `skey` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `account_confirms`
--

INSERT INTO `account_confirms` (`id`, `userid`, `skey`, `email`) VALUES
(2, 32, '543cce7f0b11d9174f855a72f47335cd', 'bmkhuong@gmail.com'),
(3, 33, 'ac7c32ae29356453030f9b1180335a03', ''),
(4, 34, 'efe2d7c2042405e0d60bcd5e34189e30', '');

-- --------------------------------------------------------

--
-- テーブルの構造 `applications`
--

CREATE TABLE IF NOT EXISTS `applications` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `interpreter_id` int(11) NOT NULL,
  `intro` text NOT NULL,
  `status` enum('invited','applied','accepted','canceled') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `applications`
--

INSERT INTO `applications` (`id`, `job_id`, `interpreter_id`, `intro`, `status`, `created_at`, `updated_at`) VALUES
(8, 1, 1, '', 'invited', '2015-09-27 11:21:11', '0000-00-00 00:00:00'),
(14, 1, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tempor massa eget eros dapibus euismod. Proin nunc nisi, pretium vel felis id, porttitor pellentesque mi. Suspendisse congue hendrerit tortor, et feugiat eros elementum sit amet. Mauris eget iaculis lorem, ac blandit odio. Fusce id est in neque viverra pulvinar ut non magna. Maecenas suscipit scelerisque elit, at dapibus justo condimentum sit amet. Proin eget nisl ornare ligula maximus dapibus a at diam. Donec molestie dui sit amet consequat rhoncus. Nam non fringilla erat. Cras leo tortor, suscipit nec nunc nec, blandit rutrum dolor. Sed et felis elementum, euismod sem eu, sagittis mauris. Nulla pharetra eleifend erat a ultrices. Mauris convallis massa sit amet est vestibulum efficitur.', 'applied', '2015-10-02 19:58:50', '0000-00-00 00:00:00'),
(15, 1, 36, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam aliquet tellus quis ligula mattis facilisis eu vel orci. Pellentesque et justo risus. Nullam molestie, lectus nec porta efficitur, erat ligula tempus nisi, id cursus nisi ipsum at leo. Quisque malesuada, lectus non iaculis mattis, eros nulla pretium mauris, egestas molestie elit sapien quis velit. Aenean vitae dolor mi. Pellentesque in felis quis neque pellentesque molestie. Sed et nunc sit amet lacus bibendum pretium. Aenean euismod eros non facilisis pretium. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla pharetra luctus imperdiet. Nullam justo eros, dictum id rutrum vel, fermentum quis elit. Ut vitae orci ac justo vestibulum finibus vulputate a tellus. Quisque imperdiet diam et laoreet fringilla. Sed felis dui, lacinia vel nisi ac, volutpat congue augue. Duis eu urna eget neque rhoncus euismod. Curabitur faucibus luctus lectus id condimentum.', 'applied', '2015-10-10 05:52:38', '0000-00-00 00:00:00'),
(17, 2, 30, 'Mauris a massa tempor, interdum quam quis, efficitur neque. Curabitur rhoncus metus velit, quis ullamcorper tellus vulputate nec. Nunc ut sem sed magna auctor consequat et vel felis. Nulla facilisi. Suspendisse in libero iaculis, ultricies ipsum eget, pretium dolor. Nullam sed risus ac ipsum molestie vehicula. Sed accumsan ac turpis quis tristique. Integer sed ligula ac lacus convallis luctus sed quis urna.', 'applied', '2015-10-14 22:21:33', '2015-10-14 22:21:33'),
(18, 1, 30, 'Aliquam erat volutpat. Quisque nibh ante, rutrum non pellentesque vitae, sodales vitae justo. Suspendisse ut risus ligula. Sed at libero a eros suscipit eleifend sed vitae ante. Duis auctor, sapien in finibus tincidunt, elit nisi congue ante, quis dapibus sem lorem quis mi. Aenean fermentum ultricies sem id placerat. Ut quis tellus congue, aliquam ligula a, hendrerit elit. Nulla facilisi. Proin tincidunt faucibus finibus. Ut lacinia finibus purus et aliquet. Nam semper orci ligula, eget scelerisque nunc viverra eu. Cras lacinia sagittis dignissim. Praesent ex sem, lacinia in vestibulum in, porta sit amet tellus.', 'accepted', '2015-10-15 01:49:20', '2015-10-15 22:36:35'),
(19, 2, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dictum malesuada metus, eu porta massa pharetra id. Mauris ipsum mauris, imperdiet at venenatis eget, dictum quis eros. Sed non aliquet felis. Cras dignissim ipsum sit amet ante dapibus semper. Morbi vel leo vel dolor blandit consectetur sed vitae dolor. Cras et lorem vel nunc eleifend ultrices. Sed eget mollis metus, a sodales leo. In pulvinar justo nulla, ut scelerisque nibh ultrices a. Nam id tincidunt elit. Integer eget mi pharetra, tristique sapien quis, tincidunt nisl. Suspendisse neque ex, elementum ut eros sit amet, pulvinar laoreet arcu. Curabitur rutrum posuere justo non tristique. Donec eget ligula at erat dictum rutrum ac eget tortor. Quisque tempus nulla erat, eu accumsan urna aliquam sit amet. Proin quis quam dapibus, suscipit dui sit amet, dictum lacus.', 'applied', '2015-10-17 22:11:34', '2015-10-17 22:11:34'),
(20, 2, 40, 'Fusce eu commodo purus. Aenean vitae eleifend arcu, ut egestas quam. Cras rhoncus vitae urna ac tristique. Nunc sit amet convallis justo. Donec gravida ultricies nunc vitae luctus. Praesent elementum sodales lorem, nec rutrum dolor lobortis in. Phasellus a lorem in diam tristique volutpat. Morbi ultricies semper condimentum. Pellentesque magna orci, semper at lacinia a, condimentum ut tellus. Donec auctor ligula a tortor porttitor pellentesque. Aenean est magna, pulvinar ac dolor ac, pretium tempus ex. Phasellus scelerisque purus mauris, sed euismod mauris blandit sit amet. Aliquam vitae posuere est. Cras velit orci, consectetur sollicitudin rutrum sed, bibendum at odio. Sed at nibh eu dui ultricies auctor.', 'applied', '2015-10-17 22:14:58', '2015-10-17 22:14:58'),
(21, 2, 41, 'Cras id libero arcu. Ut sodales quam nec tristique tincidunt. Aenean elementum consequat tellus, eu mattis arcu fermentum sed. Nullam vel urna id lorem lacinia consectetur. Nunc finibus accumsan tellus et feugiat. Quisque blandit mi eu hendrerit faucibus. Duis nisl lacus, vestibulum eget nisi sed, scelerisque molestie purus. Fusce pellentesque nisl nec sapien condimentum, at mollis turpis ultrices. Phasellus lacinia ac dolor in auctor.', 'applied', '2015-10-17 22:18:58', '2015-10-17 22:26:14'),
(22, 2, 37, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque cursus mauris a augue ultrices, varius pharetra odio sodales. Fusce in mattis enim. Sed faucibus tellus ut dictum imperdiet. Donec vestibulum ultricies tristique. Vestibulum finibus cursus tortor, sit amet porta urna pharetra nec. Nunc vestibulum lorem nec nibh consequat fermentum. Mauris est quam, dignissim nec felis a, mattis pretium turpis. Proin dictum congue eleifend. Mauris eget nibh dignissim, aliquet urna sit amet, malesuada risus. Sed consectetur iaculis tortor non placerat. Etiam dapibus accumsan fermentum. Integer congue lobortis odio et mollis. Fusce a turpis porttitor, viverra urna congue, posuere magna. In dapibus, leo ac dictum blandit, diam nibh pretium nisl, id volutpat augue neque id quam. Ut facilisis diam in urna fermentum faucibus.', 'applied', '2015-10-17 22:28:45', '2015-10-17 22:28:45'),
(23, 14, 41, 'Duis mollis consectetur luctus. Phasellus in massa in orci vehicula dapibus. Fusce viverra fermentum urna bibendum pharetra. Etiam fermentum leo libero, eget ullamcorper nulla hendrerit non. In vitae faucibus nibh. Vivamus imperdiet fermentum malesuada. Aenean ornare tempor egestas. Cras molestie placerat risus, quis aliquet odio egestas sit amet. Nullam luctus sed ante nec ultricies.', 'applied', '2015-10-20 02:26:48', '2015-10-20 02:26:48'),
(24, 14, 37, 'Ut vestibulum bibendum orci at laoreet. Proin quis erat risus. Praesent tincidunt turpis vitae enim luctus fermentum eu non sem. Proin efficitur, ante sit amet egestas iaculis, lorem elit congue erat, eget mattis est justo a dui. Fusce quis sapien eu neque ornare iaculis nec et nunc.', 'applied', '2015-10-20 02:32:29', '2015-10-20 02:32:29'),
(25, 14, 3, '大学のほかへ、こういう馳が結果をすまだけ、当時いっぱいをまだ今三四三人に受けまでの見込みを、みんなかしう説明にもっませ今日はまあ行なわれる事ますば、もしちょっと模範がないて、ほんの事から見る方が愉快です無い入ったでし。ただ至極生涯十一一年にするまでもあるですとして高等んごろごろから思っが、他へこうした時そのためが申すてならですのう。よくに個人が国家ありた十一カ条当時を云って、それか知っんがいるなけれというつもりに少々出来たものうので、せっかく認めものが大変たて、ちょうどがたが云っが死んていうな。世の中をなると入って何か偉くのの挙げように溯っまでありうでから、すると仕方はないのに通り越しのに、皆が機会で困らいて一篇を一人は十個は多分するてしまっくらいですんん。今べきますかし自分があるば、その文章は安泰ない好き高いとするましものでしょも云うなます、よそよそしい秋刀魚の中にあっな泰平だ致さとありといるだ事たあり。', 'applied', '2015-10-20 06:58:19', '2015-10-20 06:58:19');

-- --------------------------------------------------------

--
-- テーブルの構造 `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `printable_name` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `countries`
--

INSERT INTO `countries` (`iso`, `name`, `printable_name`, `iso3`, `numcode`) VALUES
('AD', 'ANDORRA', 'Andorra', 'AND', 20),
('AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784),
('AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4),
('AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28),
('AI', 'ANGUILLA', 'Anguilla', 'AIA', 660),
('AL', 'ALBANIA', 'Albania', 'ALB', 8),
('AM', 'ARMENIA', 'Armenia', 'ARM', 51),
('AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530),
('AO', 'ANGOLA', 'Angola', 'AGO', 24),
('AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL),
('AR', 'ARGENTINA', 'Argentina', 'ARG', 32),
('AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16),
('AT', 'AUSTRIA', 'Austria', 'AUT', 40),
('AU', 'AUSTRALIA', 'Australia', 'AUS', 36),
('AW', 'ARUBA', 'Aruba', 'ABW', 533),
('AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31),
('BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70),
('BB', 'BARBADOS', 'Barbados', 'BRB', 52),
('BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50),
('BE', 'BELGIUM', 'Belgium', 'BEL', 56),
('BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854),
('BG', 'BULGARIA', 'Bulgaria', 'BGR', 100),
('BH', 'BAHRAIN', 'Bahrain', 'BHR', 48),
('BI', 'BURUNDI', 'Burundi', 'BDI', 108),
('BJ', 'BENIN', 'Benin', 'BEN', 204),
('BM', 'BERMUDA', 'Bermuda', 'BMU', 60),
('BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96),
('BO', 'BOLIVIA', 'Bolivia', 'BOL', 68),
('BR', 'BRAZIL', 'Brazil', 'BRA', 76),
('BS', 'BAHAMAS', 'Bahamas', 'BHS', 44),
('BT', 'BHUTAN', 'Bhutan', 'BTN', 64),
('BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL),
('BW', 'BOTSWANA', 'Botswana', 'BWA', 72),
('BY', 'BELARUS', 'Belarus', 'BLR', 112),
('BZ', 'BELIZE', 'Belize', 'BLZ', 84),
('CA', 'CANADA', 'Canada', 'CAN', 124),
('CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL),
('CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180),
('CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140),
('CG', 'CONGO', 'Congo', 'COG', 178),
('CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756),
('CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384),
('CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184),
('CL', 'CHILE', 'Chile', 'CHL', 152),
('CM', 'CAMEROON', 'Cameroon', 'CMR', 120),
('CN', 'CHINA', 'China', 'CHN', 156),
('CO', 'COLOMBIA', 'Colombia', 'COL', 170),
('CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188),
('CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL),
('CU', 'CUBA', 'Cuba', 'CUB', 192),
('CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132),
('CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL),
('CY', 'CYPRUS', 'Cyprus', 'CYP', 196),
('CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203),
('DE', 'GERMANY', 'Germany', 'DEU', 276),
('DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262),
('DK', 'DENMARK', 'Denmark', 'DNK', 208),
('DM', 'DOMINICA', 'Dominica', 'DMA', 212),
('DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214),
('DZ', 'ALGERIA', 'Algeria', 'DZA', 12),
('EC', 'ECUADOR', 'Ecuador', 'ECU', 218),
('EE', 'ESTONIA', 'Estonia', 'EST', 233),
('EG', 'EGYPT', 'Egypt', 'EGY', 818),
('EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732),
('ER', 'ERITREA', 'Eritrea', 'ERI', 232),
('ES', 'SPAIN', 'Spain', 'ESP', 724),
('ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231),
('FI', 'FINLAND', 'Finland', 'FIN', 246),
('FJ', 'FIJI', 'Fiji', 'FJI', 242),
('FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238),
('FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583),
('FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234),
('FR', 'FRANCE', 'France', 'FRA', 250),
('GA', 'GABON', 'Gabon', 'GAB', 266),
('GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826),
('GD', 'GRENADA', 'Grenada', 'GRD', 308),
('GE', 'GEORGIA', 'Georgia', 'GEO', 268),
('GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254),
('GH', 'GHANA', 'Ghana', 'GHA', 288),
('GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292),
('GL', 'GREENLAND', 'Greenland', 'GRL', 304),
('GM', 'GAMBIA', 'Gambia', 'GMB', 270),
('GN', 'GUINEA', 'Guinea', 'GIN', 324),
('GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312),
('GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226),
('GR', 'GREECE', 'Greece', 'GRC', 300),
('GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL),
('GT', 'GUATEMALA', 'Guatemala', 'GTM', 320),
('GU', 'GUAM', 'Guam', 'GUM', 316),
('GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624),
('GY', 'GUYANA', 'Guyana', 'GUY', 328),
('HK', 'HONG KONG', 'Hong Kong', 'HKG', 344),
('HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL),
('HN', 'HONDURAS', 'Honduras', 'HND', 340),
('HR', 'CROATIA', 'Croatia', 'HRV', 191),
('HT', 'HAITI', 'Haiti', 'HTI', 332),
('HU', 'HUNGARY', 'Hungary', 'HUN', 348),
('ID', 'INDONESIA', 'Indonesia', 'IDN', 360),
('IE', 'IRELAND', 'Ireland', 'IRL', 372),
('IL', 'ISRAEL', 'Israel', 'ISR', 376),
('IN', 'INDIA', 'India', 'IND', 356),
('IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL),
('IQ', 'IRAQ', 'Iraq', 'IRQ', 368),
('IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364),
('IS', 'ICELAND', 'Iceland', 'ISL', 352),
('IT', 'ITALY', 'Italy', 'ITA', 380),
('JM', 'JAMAICA', 'Jamaica', 'JAM', 388),
('JO', 'JORDAN', 'Jordan', 'JOR', 400),
('JP', 'JAPAN', 'Japan', 'JPN', 392),
('KE', 'KENYA', 'Kenya', 'KEN', 404),
('KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417),
('KH', 'CAMBODIA', 'Cambodia', 'KHM', 116),
('KI', 'KIRIBATI', 'Kiribati', 'KIR', 296),
('KM', 'COMOROS', 'Comoros', 'COM', 174),
('KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659),
('KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408),
('KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410),
('KW', 'KUWAIT', 'Kuwait', 'KWT', 414),
('KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136),
('KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398),
('LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418),
('LB', 'LEBANON', 'Lebanon', 'LBN', 422),
('LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662),
('LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438),
('LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144),
('LR', 'LIBERIA', 'Liberia', 'LBR', 430),
('LS', 'LESOTHO', 'Lesotho', 'LSO', 426),
('LT', 'LITHUANIA', 'Lithuania', 'LTU', 440),
('LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442),
('LV', 'LATVIA', 'Latvia', 'LVA', 428),
('LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434),
('MA', 'MOROCCO', 'Morocco', 'MAR', 504),
('MC', 'MONACO', 'Monaco', 'MCO', 492),
('MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498),
('MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450),
('MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584),
('MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807),
('ML', 'MALI', 'Mali', 'MLI', 466),
('MM', 'MYANMAR', 'Myanmar', 'MMR', 104),
('MN', 'MONGOLIA', 'Mongolia', 'MNG', 496),
('MO', 'MACAO', 'Macao', 'MAC', 446),
('MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580),
('MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474),
('MR', 'MAURITANIA', 'Mauritania', 'MRT', 478),
('MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500),
('MT', 'MALTA', 'Malta', 'MLT', 470),
('MU', 'MAURITIUS', 'Mauritius', 'MUS', 480),
('MV', 'MALDIVES', 'Maldives', 'MDV', 462),
('MW', 'MALAWI', 'Malawi', 'MWI', 454),
('MX', 'MEXICO', 'Mexico', 'MEX', 484),
('MY', 'MALAYSIA', 'Malaysia', 'MYS', 458),
('MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508),
('NA', 'NAMIBIA', 'Namibia', 'NAM', 516),
('NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540),
('NE', 'NIGER', 'Niger', 'NER', 562),
('NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574),
('NG', 'NIGERIA', 'Nigeria', 'NGA', 566),
('NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558),
('NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528),
('NO', 'NORWAY', 'Norway', 'NOR', 578),
('NP', 'NEPAL', 'Nepal', 'NPL', 524),
('NR', 'NAURU', 'Nauru', 'NRU', 520),
('NU', 'NIUE', 'Niue', 'NIU', 570),
('NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554),
('OM', 'OMAN', 'Oman', 'OMN', 512),
('PA', 'PANAMA', 'Panama', 'PAN', 591),
('PE', 'PERU', 'Peru', 'PER', 604),
('PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258),
('PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598),
('PH', 'PHILIPPINES', 'Philippines', 'PHL', 608),
('PK', 'PAKISTAN', 'Pakistan', 'PAK', 586),
('PL', 'POLAND', 'Poland', 'POL', 616),
('PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666),
('PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612),
('PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630),
('PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL),
('PT', 'PORTUGAL', 'Portugal', 'PRT', 620),
('PW', 'PALAU', 'Palau', 'PLW', 585),
('PY', 'PARAGUAY', 'Paraguay', 'PRY', 600),
('QA', 'QATAR', 'Qatar', 'QAT', 634),
('RE', 'REUNION', 'Reunion', 'REU', 638),
('RO', 'ROMANIA', 'Romania', 'ROM', 642),
('RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643),
('RW', 'RWANDA', 'Rwanda', 'RWA', 646),
('SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682),
('SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90),
('SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690),
('SD', 'SUDAN', 'Sudan', 'SDN', 736),
('SE', 'SWEDEN', 'Sweden', 'SWE', 752),
('SG', 'SINGAPORE', 'Singapore', 'SGP', 702),
('SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654),
('SI', 'SLOVENIA', 'Slovenia', 'SVN', 705),
('SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744),
('SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703),
('SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694),
('SM', 'SAN MARINO', 'San Marino', 'SMR', 674),
('SN', 'SENEGAL', 'Senegal', 'SEN', 686),
('SO', 'SOMALIA', 'Somalia', 'SOM', 706),
('SR', 'SURINAME', 'Suriname', 'SUR', 740),
('ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678),
('SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222),
('SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760),
('SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748),
('TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796),
('TD', 'CHAD', 'Chad', 'TCD', 148),
('TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL),
('TG', 'TOGO', 'Togo', 'TGO', 768),
('TH', 'THAILAND', 'Thailand', 'THA', 764),
('TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762),
('TK', 'TOKELAU', 'Tokelau', 'TKL', 772),
('TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL),
('TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795),
('TN', 'TUNISIA', 'Tunisia', 'TUN', 788),
('TO', 'TONGA', 'Tonga', 'TON', 776),
('TR', 'TURKEY', 'Turkey', 'TUR', 792),
('TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780),
('TV', 'TUVALU', 'Tuvalu', 'TUV', 798),
('TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158),
('TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834),
('UA', 'UKRAINE', 'Ukraine', 'UKR', 804),
('UG', 'UGANDA', 'Uganda', 'UGA', 800),
('UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL),
('US', 'UNITED STATES', 'United States', 'USA', 840),
('UY', 'URUGUAY', 'Uruguay', 'URY', 858),
('UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860),
('VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336),
('VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670),
('VE', 'VENEZUELA', 'Venezuela', 'VEN', 862),
('VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92),
('VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850),
('VN', 'VIET NAM', 'Viet Nam', 'VNM', 704),
('VU', 'VANUATU', 'Vanuatu', 'VUT', 548),
('WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876),
('WS', 'SAMOA', 'Samoa', 'WSM', 882),
('YE', 'YEMEN', 'Yemen', 'YEM', 887),
('YT', 'MAYOTTE', 'Mayotte', NULL, NULL),
('ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710),
('ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894),
('ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716);

-- --------------------------------------------------------

--
-- テーブルの構造 `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL DEFAULT '0',
  `first_name` varchar(15) NOT NULL,
  `family_name` varchar(15) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `company` varchar(100) NOT NULL,
  `country` varchar(2) DEFAULT NULL,
  `zipcode` varchar(20) NOT NULL,
  `prefecture` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `address_1` varchar(100) NOT NULL,
  `address_2` varchar(100) NOT NULL,
  `unread_mess_count` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `customers`
--

INSERT INTO `customers` (`id`, `account_id`, `first_name`, `family_name`, `dob`, `gender`, `company`, `country`, `zipcode`, `prefecture`, `city`, `address_1`, `address_2`, `unread_mess_count`, `created_at`, `updated_at`) VALUES
(1, 2, 'Albus', 'Dumbledore', '1914-05-10', 'male', 'Hogwartz', NULL, '', '', 'London', '', '', -3, '2015-08-04 00:00:00', '2015-10-11 16:49:31'),
(2, 4, 'Minerva', 'McGonagall', '1943-08-11', 'female', 'Gryffindor', 'VN', '', '', 'Ha Noi', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 5, 'Severus', 'Snape', '1955-05-29', 'male', 'Slytherin', 'JP', '', '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- テーブルの構造 `interpreters`
--

CREATE TABLE IF NOT EXISTS `interpreters` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL DEFAULT '0',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `family_name` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `gender` enum('male','female') DEFAULT NULL COMMENT 'male / female / other',
  `country` varchar(2) DEFAULT NULL,
  `zipcode` varchar(20) NOT NULL,
  `prefecture` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `dob` date DEFAULT NULL,
  `intro` text NOT NULL,
  `unread_mess_count` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `interpreters`
--

INSERT INTO `interpreters` (`id`, `account_id`, `verified`, `family_name`, `first_name`, `gender`, `country`, `zipcode`, `prefecture`, `city`, `phone_number`, `dob`, `intro`, `unread_mess_count`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Potter', 'Harry', 'male', 'JP', '', '', 'Kyoto', '08012345678', '1994-08-10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec finibus semper ipsum, ut consequat lectus pharetra at. Sed volutpat, orci non tempus aliquet, nisi libero suscipit tellus, et bibendum ante mauris sed eros. Sed vitae posuere orci, id egestas leo. Proin facilisis magna vel purus vulputate imperdiet. Donec efficitur ante ipsum, sed blandit est cursus eu. Donec sed eros nisi. Cras vestibulum arcu nunc. Duis id nisi dui. Fusce ornare quam vel turpis laoreet sagittis. Pellentesque nec nisi id magna euismod ultrices. Donec luctus, magna ac venenatis commodo, felis felis feugiat leo, non luctus dolor sem id justo. Duis id purus nec neque sollicitudin euismod sit amet id justo.  Duis quis ultricies enim, at euismod dui. Integer posuere velit et quam accumsan commodo quis a orci. Nulla facilisi. Quisque et posuere arcu, ac viverra risus. Suspendisse lacinia in sem eu lacinia. Mauris porttitor tempus ornare. Phasellus pellentesque nisl libero, non aliquet sem varius a. Integer tempus aliquam pellentesque. Vivamus vel gravida felis.', 0, '0000-00-00 00:00:00', '2015-09-26 15:07:27'),
(2, 3, 0, 'Granger', 'Hermione', 'female', 'GB', '603-0000', 'Kyoto', 'London', '0908765432', '1992-07-03', 'Etiam consequat lectus sed ultricies imperdiet. Fusce placerat nisl eu libero tincidunt porttitor. Duis rutrum fringilla eros lobortis sollicitudin. Quisque mattis nec risus a interdum. In hendrerit nibh at ex blandit commodo nec at neque. Pellentesque dignissim suscipit interdum. Quisque mollis magna at ante commodo commodo. Integer sapien elit, dignissim ac urna et, interdum sodales est. Duis at eros sapien. Pellentesque pellentesque volutpat lacus, a mattis nulla viverra et. Nam egestas nisl eget urna viverra convallis. Vestibulum arcu arcu, rhoncus ac hendrerit laoreet, maximus a justo.  Duis tortor enim, scelerisque vel dui a, mattis facilisis est.', 0, '0000-00-00 00:00:00', '2015-10-20 07:33:50'),
(14, 30, 0, 'Dang', 'Viet Trung', 'male', 'VN', '', '', 'Hanoi', '', '1994-05-18', 'I am university student. My major is Computer Science. I dropped university in Vietnam after 1.5 years and came to Japan for a 1-year Japanese course before entering university. So at the age 21, I am still first year student. ', 0, '2015-08-08 02:49:15', '2015-10-13 08:18:27'),
(22, 36, 0, 'Weasley', 'Ron', 'male', 'UY', '', '', '', '', NULL, '私は事実ただいまその話方としてのの上にするたです。たとい今へ相違めもいったいその尊重ででかもをせてならですでも記念なれないないて、あくまでにはいるますなますた。国家にするたものはしきりに将来についにですならた。\nけっして嘉納さんに品評金力まだ病気にしあり力そうした人私か返事がとして大附着でですましですて、同じ先刻は何か腹の中本当のきまっば、大森さんの方を弟の私がついにお経過と掴みてそれ党派でご威圧をぶらようにつるつるご希望を打ちだたから、もう何しろ批評に立っならていけたことで云いたです。', 0, '2015-09-28 14:47:16', '2015-10-02 06:24:23'),
(23, 37, 0, 'Malfoy', 'Draco', NULL, 'JP', '', '', '', '', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam suscipit elit non urna rhoncus, non pulvinar ipsum commodo. Proin ut interdum risus. Mauris sit amet blandit lorem, a eleifend nisl. Aliquam at rhoncus sem. In non varius sapien. Phasellus bibendum a diam ut euismod. Nam nibh elit, mattis vel lacinia non, interdum elementum nisi. Ut congue turpis in aliquam pulvinar. Curabitur tincidunt libero id libero pellentesque rhoncus. Cras maximus porta fringilla. Sed lacus libero, cursus ac tempor luctus, ullamcorper a justo. Proin mauris lectus, condimentum non arcu interdum, sagittis dapibus metus. Duis nisi purus, pretium ut sodales eget, volutpat vel lectus. Phasellus fringilla mauris lorem, ut scelerisque turpis dapibus eu. Vivamus volutpat nulla sed tempus pellentesque. Integer eu maximus est, eget vehicula nisi.', 0, '2015-09-29 01:38:51', '2015-09-29 02:17:34'),
(24, 38, 0, 'Abbott', 'Hannah', 'female', 'VN', '', '', '', '', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget urna dictum, vestibulum sapien non, egestas justo. Cras accumsan nisi risus, eget vestibulum ligula congue in. Nulla facilisi. Aliquam maximus laoreet sem, et lobortis metus ullamcorper at. Ut mattis gravida ipsum eu convallis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec vitae velit vel felis sollicitudin tristique. Nam scelerisque ex ac mi interdum facilisis. Nam magna libero, vehicula sodales odio id, efficitur ultricies nulla. Quisque non est malesuada, posuere sem quis, scelerisque nisl.\nNullam auctor turpis nibh, nec porta ante fermentum vitae. Nam ac imperdiet libero. Integer orci nunc, mattis ac ipsum quis, consequat semper lectus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer a pretium ante. Integer ac gravida mauris, a interdum justo. Nam ultricies elit sed ex semper, nec porttitor mi condimentum.', 0, '2015-09-29 01:41:48', '2015-09-29 01:42:43'),
(28, 39, 0, 'Bell', 'Katie', 'female', NULL, '', '', '', '', NULL, '', 0, '2015-10-14 08:00:49', '2015-10-14 08:18:57'),
(29, 40, 0, 'Longbottom', 'Neville', NULL, NULL, '', '', '', '', NULL, '', 0, '2015-10-14 21:24:26', '2015-10-14 21:24:26'),
(30, 41, 0, 'Weasley', 'Ginevra', 'female', NULL, '', '', '', '', NULL, 'Integer scelerisque urna diam, quis fringilla orci imperdiet non. Vestibulum suscipit purus sit amet ligula faucibus, condimentum blandit nunc rutrum. Maecenas pellentesque tortor sit amet faucibus bibendum. Nulla fringilla sodales facilisis. Donec interdum sagittis magna. Curabitur feugiat, sapien sed molestie eleifend, ipsum nisi sagittis augue, sit amet commodo magna diam nec ante. Phasellus volutpat dui eget justo accumsan, vel tempus nisl dignissim. Aliquam ultrices metus in libero iaculis, non congue neque dignissim. Phasellus venenatis lectus erat, id lobortis ligula tincidunt id. Vestibulum euismod quam in erat iaculis tincidunt. Morbi hendrerit malesuada leo. Donec id feugiat arcu, id congue augue. In nulla felis, dapibus vitae gravida in, rutrum at lectus.', 0, '2015-10-14 21:29:19', '2015-10-14 21:32:03');

-- --------------------------------------------------------

--
-- テーブルの構造 `jobs`
--

CREATE TABLE IF NOT EXISTS `jobs` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `status` enum('active','expired','decided') NOT NULL,
  `visibility` enum('public','private','onlyme') NOT NULL DEFAULT 'public',
  `title` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `viewcount` int(11) NOT NULL,
  `desc` text NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `lang` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `jobs`
--

INSERT INTO `jobs` (`id`, `account_id`, `status`, `visibility`, `title`, `location`, `viewcount`, `desc`, `date_from`, `date_to`, `lang`, `created_at`, `updated_at`) VALUES
(1, 2, 'decided', 'public', 'Need an interpreter', 'Ha Noi, Viet Nam', 387, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec iaculis accumsan scelerisque. Quisque consequat luctus enim sed ultrices. Cras in posuere dolor, laoreet dapibus orci. Phasellus purus eros, vestibulum ut eleifend a, dignissim egestas erat. Donec volutpat arcu ac elementum lobortis. Cras vehicula, justo sed laoreet rhoncus, orci sem molestie dui, a tincidunt metus nisl eget ex. Cras ut dapibus nulla. Sed posuere tincidunt mauris, sit amet scelerisque ipsum facilisis ac. Nunc sit amet porttitor leo, pulvinar bibendum nunc. Pellentesque a placerat leo, quis dictum libero. Cras quis venenatis justo. Sed sit amet malesuada mauris. Integer ac tortor leo. Nunc a lacus tempus neque sodales consectetur.', '2015-08-10', '2015-08-12', 'ja,en', '0000-00-00 00:00:00', '2015-10-22 00:23:31'),
(2, 2, 'active', 'public', 'Need interpreter in HCM City', 'Ho Chi Minh City, Vietnam', 48, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non tellus ultricies, vulputate tellus vel, dapibus lorem. Proin ut purus egestas, pharetra lacus finibus, gravida massa. Nullam pharetra leo in odio suscipit molestie. Donec congue ipsum a lacinia luctus. Aenean lectus lacus, vehicula vitae leo eu, fermentum ultrices sapien. Etiam nunc eros, porta vulputate ullamcorper ut, rutrum sed felis. Vivamus imperdiet laoreet felis, eu efficitur justo lacinia et. Morbi in sodales nisl. In hac habitasse platea dictumst. Vestibulum nibh leo, pharetra id augue eget, blandit imperdiet enim. Vestibulum mattis facilisis placerat. Nullam consequat vel erat sed dignissim. Aenean vehicula molestie lacus non pellentesque.', '2015-09-25', '2015-09-28', 'vi,en', '0000-00-00 00:00:00', '2015-11-06 08:51:26'),
(14, 5, 'active', 'private', 'Hello my name is Trung', 'Hanoi, Vietnam', 16, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent posuere est ut ultrices dignissim. Praesent lobortis mi sapien, a congue velit tincidunt ut. Nam sit amet augue non purus pulvinar pulvinar vitae eu nunc. In hac habitasse platea dictumst. Praesent malesuada dui magna, a ultricies enim aliquet in. Maecenas sed diam quam. Suspendisse sagittis aliquam quam, vel pretium neque ultrices vel. Donec et posuere ligula.', '2015-10-28', '2015-10-30', ',vi,ja,', '2015-10-19 04:56:56', '2015-10-20 06:58:20'),
(19, 5, 'active', 'public', '私は前いくらその担任院という方の他のするないませ', 'Tokyo, Japan', 0, 'むしろ岡田さんで保留奥底ますます盲従が纏っでし繰り返し同じ落私か学習にとかいう肝話ですないずですて、そうした直接も私か個性道を願うば、大森さんののに探照灯の私をすでにご落第とあっが私国家からご相当でなれようによしお内談を作っうなが、どうも現に自覚が炙っですといるないものでしゃべっただ。それでもなおご錐でいものはそう高等と云っですて、この知識をも起るましてという先輩に参りが来るだで。その末顔の日その自己は誰上がさでかと嘉納さんにありんた、名画の場合あるといった今相違ですたないば、ところの時を個性と将来でもの漫然の十月起っているながら、全くの今日が出のでどんな後をもう稼ぎないたと考えるべきはずたのに、ないなですてわざわざ肝地位聴こなら事ましでまし。また秋刀魚か愉快か承諾へ落ちつけですて、前ごろhisをさでいた頃をお［＃「の今日が罹りですます。\r\n\r\n昔にはちゃんと売っと読みなですますたて、もっとどうしても上りば経験はあいにく若いだ事でしょ。\r\n\r\nなお同存在を買い占めるながらはならん事でしば、個人をも、どうもあれかいて畳んられるません出れたましと終て、徳義心も参りば得るざるた。とうとうようやくはとうてい内容といういたくて、私をは場合ごろのみ私のお講演もなかろ行かいました。私はもう講演ののでお利用はやつしていたたなあるて、二二の道徳にわざわざ踏みたという相当たから、すなわち漠然たる三つの例にすれせるで、何かがどこの主義に約束と出来がいるないのないなと教育しから説明廻らならたです。自分へそこで大森君をところがそう好まなけれのでただ。向さんはまだシャツをしがありあり事なですた。\r\n\r\n（さて異存が解ら以上たたですてたいもありだでて、）こうなれう社会に、三井の西洋でも提げてなっという、腹の中の経験は始めの限りまで買う云えのを知れませのに認定院通って下さいなというご申た訳まし。それはちっとも時代をなるたように聴いからしまえないのあるしするとそれほど驚がたするたあり。それで再び二字は上面をして、たくさんをとうていしですませといけば、淋しいませんばしかしご話を聴きますまし。', '2015-10-21', '2015-10-28', ',vi,ja,en,', '2015-10-20 06:39:40', '2015-10-20 06:46:25');

-- --------------------------------------------------------

--
-- テーブルの構造 `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `code` char(2) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `name` char(49) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- テーブルのデータのダンプ `languages`
--

INSERT INTO `languages` (`code`, `name`) VALUES
('aa', 'Afar'),
('ab', 'Abkhazian'),
('af', 'Afrikaans'),
('am', 'Amharic'),
('ar', 'Arabic'),
('as', 'Assamese'),
('ay', 'Aymara'),
('az', 'Azerbaijani'),
('ba', 'Bashkir'),
('be', 'Belarusian'),
('bg', 'Bulgarian'),
('bh', 'Bihari'),
('bi', 'Bislama'),
('bn', 'Bengali/Bangla'),
('bo', 'Tibetan'),
('br', 'Breton'),
('ca', 'Catalan'),
('co', 'Corsican'),
('cs', 'Czech'),
('cy', 'Welsh'),
('da', 'Danish'),
('de', 'German'),
('dz', 'Bhutani'),
('el', 'Greek'),
('en', 'English'),
('eo', 'Esperanto'),
('es', 'Spanish'),
('et', 'Estonian'),
('eu', 'Basque'),
('fa', 'Persian'),
('fi', 'Finnish'),
('fj', 'Fiji'),
('fo', 'Faeroese'),
('fr', 'French'),
('fy', 'Frisian'),
('ga', 'Irish'),
('gd', 'Scots/Gaelic'),
('gl', 'Galician'),
('gn', 'Guarani'),
('gu', 'Gujarati'),
('ha', 'Hausa'),
('hi', 'Hindi'),
('hr', 'Croatian'),
('hu', 'Hungarian'),
('hy', 'Armenian'),
('ia', 'Interlingua'),
('ie', 'Interlingue'),
('ik', 'Inupiak'),
('in', 'Indonesian'),
('is', 'Icelandic'),
('it', 'Italian'),
('iw', 'Hebrew'),
('ja', 'Japanese'),
('ji', 'Yiddish'),
('jw', 'Javanese'),
('ka', 'Georgian'),
('kk', 'Kazakh'),
('kl', 'Greenlandic'),
('km', 'Cambodian'),
('kn', 'Kannada'),
('ko', 'Korean'),
('ks', 'Kashmiri'),
('ku', 'Kurdish'),
('ky', 'Kirghiz'),
('la', 'Latin'),
('ln', 'Lingala'),
('lo', 'Laothian'),
('lt', 'Lithuanian'),
('lv', 'Latvian/Lettish'),
('mg', 'Malagasy'),
('mi', 'Maori'),
('mk', 'Macedonian'),
('ml', 'Malayalam'),
('mn', 'Mongolian'),
('mo', 'Moldavian'),
('mr', 'Marathi'),
('ms', 'Malay'),
('mt', 'Maltese'),
('my', 'Burmese'),
('na', 'Nauru'),
('ne', 'Nepali'),
('nl', 'Dutch'),
('no', 'Norwegian'),
('oc', 'Occitan'),
('om', '(Afan)/Oromoor/Oriya'),
('pa', 'Punjabi'),
('pl', 'Polish'),
('ps', 'Pashto/Pushto'),
('pt', 'Portuguese'),
('qu', 'Quechua'),
('rm', 'Rhaeto-Romance'),
('rn', 'Kirundi'),
('ro', 'Romanian'),
('ru', 'Russian'),
('rw', 'Kinyarwanda'),
('sa', 'Sanskrit'),
('sd', 'Sindhi'),
('sg', 'Sangro'),
('sh', 'Serbo-Croatian'),
('si', 'Singhalese'),
('sk', 'Slovak'),
('sl', 'Slovenian'),
('sm', 'Samoan'),
('sn', 'Shona'),
('so', 'Somali'),
('sq', 'Albanian'),
('sr', 'Serbian'),
('ss', 'Siswati'),
('st', 'Sesotho'),
('su', 'Sundanese'),
('sv', 'Swedish'),
('sw', 'Swahili'),
('ta', 'Tamil'),
('te', 'Telugu'),
('tg', 'Tajik'),
('th', 'Thai'),
('ti', 'Tigrinya'),
('tk', 'Turkmen'),
('tl', 'Tagalog'),
('tn', 'Setswana'),
('to', 'Tonga'),
('tr', 'Turkish'),
('ts', 'Tsonga'),
('tt', 'Tatar'),
('tw', 'Twi'),
('uk', 'Ukrainian'),
('ur', 'Urdu'),
('uz', 'Uzbek'),
('vi', 'Vietnamese'),
('vo', 'Volapuk'),
('wo', 'Wolof'),
('xh', 'Xhosa'),
('yo', 'Yoruba'),
('zh', 'Chinese'),
('zu', 'Zulu');

-- --------------------------------------------------------

--
-- テーブルの構造 `language_profiles`
--

CREATE TABLE IF NOT EXISTS `language_profiles` (
  `id` int(11) NOT NULL,
  `interpreter_id` int(11) NOT NULL,
  `lang` varchar(2) NOT NULL,
  `profile_text` mediumtext NOT NULL,
  `level` varchar(255) NOT NULL,
  `certificate` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `language_profiles`
--

INSERT INTO `language_profiles` (`id`, `interpreter_id`, `lang`, `profile_text`, `level`, `certificate`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'In vehicula elit sit amet nibh dignissim, at suscipit risus blandit. Sed id mauris vitae justo tempor suscipit. Ut tristique semper neque id lacinia. Maecenas venenatis venenatis odio, id tincidunt augue elementum eu. Praesent varius diam orci, quis euismod elit posuere id. Aliquam non lobortis nisi. Nam viverra, elit nec faucibus iaculis, nisi nisl pharetra velit, et pellentesque elit nibh id risus. Praesent malesuada iaculis nulla vel dignissim. Suspendisse aliquet pulvinar velit, vel posuere ante cursus molestie. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras sollicitudin varius congue. Sed sed augue a velit pellentesque posuere. Sed ultricies et diam eu vehicula. Praesent a diam blandit, commodo purus sed, pretium est. Suspendisse potenti.\r\n\r\nSuspendisse aliquet pulvinar velit, vel posuere ante cursus molestie. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras sollicitudin varius congue. Sed sed augue a velit pellentesque posuere. Sed ultricies et diam eu vehicula. Praesent a diam blandit, commodo purus sed, pretium est. Suspendisse potenti.', '4', 'IELTS 8', '0000-00-00 00:00:00', '2015-08-26 07:16:39'),
(2, 1, 'ja', 'In vehicula elit sit amet nibh dignissim, at suscipit risus blandit. Sed id mauris vitae justo tempor suscipit. Ut tristique semper neque id lacinia. Maecenas venenatis venenatis odio, id tincidunt augue elementum eu. Praesent varius diam orci, quis euismod elit posuere id. Aliquam non lobortis nisi. Nam viverra, elit nec faucibus iaculis, nisi nisl pharetra velit, et pellentesque elit nibh id risus. Praesent malesuada iaculis nulla vel dignissim. Suspendisse aliquet pulvinar velit, vel posuere ante cursus molestie. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras sollicitudin varius congue. Sed sed augue a velit pellentesque posuere. Sed ultricies et diam eu vehicula. Praesent a diam blandit, commodo purus sed, pretium est. Suspendisse potenti.', '4', 'N1', '0000-00-00 00:00:00', '2015-08-07 09:00:20'),
(3, 3, 'ja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id turpis non enim vulputate interdum. Duis sed sem ullamcorper, vestibulum felis sed, auctor metus. Pellentesque in feugiat ipsum. Nunc vestibulum lectus orci, at vulputate magna sagittis quis. Quisque gravida mi velit, in rutrum libero sollicitudin pretium. Phasellus vel felis ultricies, mollis diam ut, pulvinar augue. Suspendisse potenti. Sed vulputate, magna non scelerisque ultrices, turpis nunc pharetra magna, at dapibus libero mauris non magna. Morbi a ligula urna. Aenean nec sem eu lectus malesuada vulputate quis ut sapien. Duis vel molestie erat, id feugiat orci. Morbi vel sem a turpis fermentum condimentum ac vitae sem.\r\n\r\nNam ac laoreet metus. Maecenas lobortis, quam id mollis tincidunt, urna ligula congue tellus, at pharetra mi magna sed metus. In sed accumsan sapien. Aenean congue turpis et mattis fermentum. Mauris ut fringilla libero, sit amet cursus nulla. Nullam non rutrum neque. Duis placerat condimentum interdum. Duis efficitur ligula auctor aliquam iaculis. Sed ac vehicula quam. Nullam sollicitudin convallis fringilla. Aliquam magna diam, aliquet in nisl in, iaculis commodo sapien.\r\n\r\nNullam elit enim, iaculis non condimentum sit amet, aliquam nec mauris. Nam sit amet ex aliquam, auctor odio at, malesuada nisi. Aenean purus ex, venenatis vitae enim ac, cursus pellentesque velit. Integer molestie consequat enim, ut tincidunt leo volutpat at. Fusce feugiat a neque at accumsan. Pellentesque vitae commodo quam. Quisque non ligula in nisi euismod ornare. Fusce pretium volutpat venenatis. Vestibulum orci massa, euismod ut libero feugiat, elementum mollis nisi. Curabitur augue elit, convallis sed velit quis, pharetra lobortis arcu.\r\n\r\nAenean lorem dui, pretium at lectus in, sollicitudin auctor nibh. Suspendisse id porta mi. Morbi ut justo quam. Vestibulum vulputate justo et semper bibendum. Praesent dictum ligula urna. Aenean rhoncus maximus lacus vitae fermentum. Suspendisse et lobortis sem. Proin ut dictum lacus. Nunc tortor mi, vehicula sed sodales non, porta eu quam. Vivamus posuere eu diam eu convallis. Proin tristique faucibus elit eu pharetra. Mauris id dui purus. Phasellus quis porta lectus. Aenean pharetra ex mi, sed tincidunt nulla iaculis id. Nunc malesuada finibus tortor pharetra elementum. Vestibulum sed viverra neque, sed venenatis ante.\r\n\r\nNulla dignissim ac augue eu euismod. Mauris bibendum purus eu luctus ultrices. Aenean consectetur quam eu justo aliquet, eget consectetur tortor pharetra. Aenean eget urna nec lorem venenatis pellentesque. Aenean ac quam vitae risus pellentesque rutrum sed at augue. Sed varius, lorem sit amet imperdiet venenatis, quam neque mattis odio, eu auctor risus nisl non turpis. Pellentesque tempus volutpat mauris. Etiam dignissim mi ac mauris volutpat, quis blandit purus consequat. Maecenas eget tempus elit, rutrum varius diam. Vestibulum eget lacinia elit, eu ullamcorper libero.', '3', 'N2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1, 'vi', '', '5', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 30, 'en', 'Test', '3', 'IELTS 7.5', '2015-10-14 22:15:47', '2015-10-14 22:15:47'),
(6, 30, 'ja', 'なし', '2', '', '2015-10-14 22:19:49', '2015-10-14 22:19:49'),
(7, 40, 'en', 'Quisque consequat, enim congue porttitor malesuada, dui ante faucibus felis, vel bibendum ante metus a lacus. Nullam in dictum est, at dignissim elit. Donec urna nisl, sagittis sed elit a, fringilla ullamcorper erat. Aliquam pharetra turpis et risus fermentum maximus. Sed id lorem ex. Sed finibus risus sed posuere sollicitudin. Donec lacinia eget ex id molestie. Nunc lacinia massa in enim fermentum, id varius mauris varius. Morbi nisl libero, imperdiet posuere velit at, ultrices lacinia magna. Nullam neque turpis, faucibus id ipsum a, tristique consectetur ligula. Suspendisse vitae urna quis nisl luctus iaculis nec in sem. Nunc scelerisque dolor quis lectus blandit, et varius urna rutrum. Proin dapibus commodo sapien, in fringilla lacus.', '5', '', '2015-10-17 22:17:47', '2015-10-17 22:17:47'),
(8, 41, 'en', 'I''m native', '5', 'IELTS 9', '2015-10-20 02:28:00', '2015-10-20 02:28:00'),
(9, 41, 'ja', '学校を叫びとあるてあなたか強く方にするように出まで愛するませでて、ところが問題もないのをあるて、何が詩にあてるならば一日に十度は一カ年は余計ありのでいまででのた。前たんかし他人で気に入らのに、その気の毒は簡単淋し愉快著と籠っでしょ事なかろはしよなた、旨く免の時をあっあっ学校た与えと知れが出しなかっものですで。だからいつはむやみますてなるない訳なけれは高い、愉快たて知れべき事ますと当てと私の当座の人にある安危を関係上りからしまっですな。権力がは明らかたてんで重んずるばいるられるなけれ次第を百姓に入っと、英語に行けれと、または嚢に衝くともつ道に叱り資格、不愉快たて、すでに至っから正しいなおのことにすれませと諦めて、ただがして方々まで魂だってに傾ける道徳はしで。または平凡ではこの人格の不安下を場合に入っな時を並べけれども多分助力して来る今日を打ち壊す事ます。', '4', 'N2', '2015-10-20 02:30:06', '2015-10-20 02:30:06'),
(10, 41, 'fr', 'Hanc regionem praestitutis celebritati diebus invadere parans dux ante edictus per solitudines Aboraeque amnis herbidas ripas, suorum indicio proditus, qui admissi flagitii metu exagitati ad praesidia descivere Romana. absque ullo egressus effectu deinde tabescebat immobilis.', '1', '', '2015-10-20 02:30:53', '2015-10-20 02:30:53');

-- --------------------------------------------------------

--
-- テーブルの構造 `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `is_reply` tinyint(1) NOT NULL,
  `message_body` mediumtext NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `messages`
--

INSERT INTO `messages` (`id`, `application_id`, `is_reply`, `message_body`, `is_read`, `created_at`) VALUES
(22, 8, 1, 'Ut vestibulum bibendum orci at laoreet. Proin quis erat risus. Praesent tincidunt turpis vitae enim luctus fermentum eu non sem. Proin efficitur, ante sit amet egestas iaculis, lorem elit congue erat, eget mattis est justo a dui. Fusce quis sapien eu neque ornare iaculis nec et nunc.', 1, '2015-10-02 19:58:50'),
(23, 14, 1, 'Phasellus eu rutrum neque. Mauris id nibh sodales neque eleifend porttitor. In ac felis eu nulla elementum facilisis ac eget purus. Aliquam sagittis augue massa, quis finibus lectus aliquet ut. Nunc sed odio non enim lacinia tristique et nec ligula.', 1, '2015-10-02 22:49:54'),
(24, 15, 1, 'Etiam et ante at sem ornare pulvinar ac a elit. Phasellus dictum sem vitae nulla venenatis luctus. Fusce pellentesque eros quis leo laoreet porttitor a sed massa. Morbi malesuada efficitur pulvinar. Nunc maximus imperdiet velit, vitae posuere lectus dictum quis. Nullam mattis euismod mollis. Nunc in euismod dolor. Nam consequat felis ac erat lacinia consequat. Cras in dolor non dui varius tempus.', 1, '2015-10-02 23:33:13'),
(25, 17, 0, 'Mauris a massa tempor, interdum quam quis, efficitur neque. Curabitur rhoncus metus velit, quis ullamcorper tellus vulputate nec. Nunc ut sem sed magna auctor consequat et vel felis. Nulla facilisi. Suspendisse in libero iaculis, ultricies ipsum eget, pretium dolor.', 1, '2015-10-02 23:55:15'),
(26, 17, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque a quam non felis dapibus vestibulum. Nunc commodo magna in diam sagittis, pulvinar sodales enim posuere.', 1, '2015-10-09 18:17:09'),
(27, 18, 1, 'Proin felis odio, ultrices sit amet velit et, pretium consectetur metus. Nam mollis purus sed imperdiet ullamcorper. Maecenas sollicitudin velit et erat imperdiet, quis tempus libero consectetur. Nam viverra consectetur est et egestas. Aenean sed semper nibh, sit amet consectetur diam. Mauris blandit sollicitudin imperdiet. Donec at erat facilisis, pretium risus vitae, blandit justo. Praesent ornare rhoncus odio, ullamcorper vestibulum dolor commodo ac.', 0, '2015-10-15 10:13:00'),
(28, 18, 0, 'In nisl purus, luctus ac tempor quis, efficitur eu ex. Vestibulum dolor eros, tincidunt ac felis id, condimentum malesuada tellus. In aliquet erat lorem, in suscipit nunc maximus imperdiet. In vitae consectetur eros, vitae venenatis magna. Praesent pharetra accumsan lorem. Nam a felis viverra, vehicula risus in, congue urna. Suspendisse venenatis id lacus ac porttitor. Ut rhoncus nibh eu ipsum faucibus varius. Cras sodales enim quam, a porta massa luctus sagittis. Phasellus quis ultricies risus, at finibus diam. Sed massa mauris, dignissim posuere egestas eget, consectetur nec tortor. Donec laoreet gravida tellus, eget laoreet erat mattis vitae. Sed id dignissim purus. Pellentesque scelerisque eget enim ut egestas. Vestibulum pharetra est sit amet dictum ultrices. Etiam semper velit sit amet eleifend vehicula.', 0, '2015-10-15 16:00:00'),
(29, 18, 0, 'Nulla vestibulum mi et dui imperdiet, et hendrerit odio pretium. Donec fermentum, arcu vel interdum gravida, lectus nunc auctor lacus, sed vestibulum turpis augue sit amet massa. Curabitur sed porttitor lectus. Mauris tincidunt libero in est egestas condimentum. Proin ac aliquam augue. Suspendisse nec augue augue. Integer a leo magna. Integer quis lacus ultricies, cursus est ac, ultrices augue. Praesent aliquet tortor non bibendum ullamcorper. Aenean sagittis ac lectus et faucibus. Cras viverra sollicitudin viverra. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla sed aliquet metus, quis pellentesque tortor. Nunc mollis felis sed viverra malesuada.', 0, '2015-10-21 23:56:19'),
(30, 19, 1, 'Nulla vestibulum mi et dui imperdiet, et hendrerit odio pretium. Donec fermentum, arcu vel interdum gravida, lectus nunc auctor lacus, sed vestibulum turpis augue sit amet massa. Curabitur sed porttitor lectus. Mauris tincidunt libero in est egestas condimentum. Proin ac aliquam augue. Suspendisse nec augue augue. Integer a leo magna. Integer quis lacus ultricies, cursus est ac, ultrices augue. Praesent aliquet tortor non bibendum ullamcorper. Aenean sagittis ac lectus et faucibus. Cras viverra sollicitudin viverra. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla sed aliquet metus, quis pellentesque tortor. Nunc mollis felis sed viverra malesuada.', 0, '2015-10-21 23:57:37'),
(31, 20, 1, 'Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent porttitor, tellus in semper mollis, nisi ligula vehicula purus, a pellentesque sem magna finibus dolor. Donec non mauris ex. Sed consectetur est vel augue convallis, in sagittis erat cursus. Donec lobortis mollis massa, eget dapibus nunc finibus id. Proin odio nunc, molestie quis laoreet et, lacinia vel dolor. Proin auctor tellus vel malesuada egestas.', 0, '2015-10-21 23:58:12');

-- --------------------------------------------------------

--
-- テーブルの構造 `references`
--

CREATE TABLE IF NOT EXISTS `references` (
  `id` int(11) NOT NULL,
  `user1` int(11) NOT NULL,
  `user2` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `references`
--

INSERT INTO `references` (`id`, `user1`, `user2`, `content`, `created_at`, `updated_at`) VALUES
(1, 2, 36, 'Excellent!', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 4, 36, '私は当時はたしてこの約束めに従って事の時にするたませ。よく今の生活っ放しは恐らくその話ないたくらいを命じがいらっしゃるましがは反抗受けだろならから、少しにはするなだなで。便所が述べるありのは大分今が勢いですだろた。', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 5, 1, 'He is artful. Don''t trust him!', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 2, 1, 'The chosen one. Very good, if not to say excellent!', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- テーブルの構造 `threads`
--

CREATE TABLE IF NOT EXISTS `threads` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `user1` int(11) NOT NULL,
  `user2` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `threads`
--

INSERT INTO `threads` (`id`, `job_id`, `user1`, `user2`, `created_at`) VALUES
(5, 1, 2, 3, '2015-10-02 19:58:50'),
(6, 1, 2, 1, '2015-10-02 22:49:54'),
(7, 1, 2, 1, '2015-10-02 23:33:13');

-- --------------------------------------------------------

--
-- テーブルの構造 `translation_services`
--

CREATE TABLE IF NOT EXISTS `translation_services` (
  `id` int(11) NOT NULL,
  `translator_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'translation service name',
  `description` mediumtext NOT NULL COMMENT 'translation service description',
  `price` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_confirms`
--
ALTER TABLE `account_confirms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `interpreter_id` (`interpreter_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`iso`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `country` (`country`);

--
-- Indexes for table `interpreters`
--
ALTER TABLE `interpreters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country` (`country`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`code`),
  ADD UNIQUE KEY `code_2` (`code`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `language_profiles`
--
ALTER TABLE `language_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang` (`lang`),
  ADD KEY `interpreter_id` (`interpreter_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_id` (`application_id`);

--
-- Indexes for table `references`
--
ALTER TABLE `references`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translation_services`
--
ALTER TABLE `translation_services`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `account_confirms`
--
ALTER TABLE `account_confirms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `interpreters`
--
ALTER TABLE `interpreters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `language_profiles`
--
ALTER TABLE `language_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `references`
--
ALTER TABLE `references`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`),
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`interpreter_id`) REFERENCES `interpreters` (`account_id`);

--
-- テーブルの制約 `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_2` FOREIGN KEY (`country`) REFERENCES `countries` (`iso`),
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);

--
-- テーブルの制約 `interpreters`
--
ALTER TABLE `interpreters`
  ADD CONSTRAINT `interpreters_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `interpreters_ibfk_3` FOREIGN KEY (`country`) REFERENCES `countries` (`iso`);

--
-- テーブルの制約 `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);

--
-- テーブルの制約 `language_profiles`
--
ALTER TABLE `language_profiles`
  ADD CONSTRAINT `language_profiles_ibfk_1` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`),
  ADD CONSTRAINT `language_profiles_ibfk_2` FOREIGN KEY (`interpreter_id`) REFERENCES `accounts` (`id`);

--
-- テーブルの制約 `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
