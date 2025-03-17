-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 31, 2023 at 08:16 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `privilege_escalation_attack_detection`
--
CREATE DATABASE IF NOT EXISTS `privilege_escalation_attack_detection` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `privilege_escalation_attack_detection`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add client register_ model', 7, 'add_clientregister_model'),
(20, 'Can change client register_ model', 7, 'change_clientregister_model'),
(21, 'Can delete client register_ model', 7, 'delete_clientregister_model'),
(22, 'Can add client posts_ model', 8, 'add_clientposts_model'),
(23, 'Can change client posts_ model', 8, 'change_clientposts_model'),
(24, 'Can delete client posts_ model', 8, 'delete_clientposts_model'),
(25, 'Can add feedbacks_ model', 9, 'add_feedbacks_model'),
(26, 'Can change feedbacks_ model', 9, 'change_feedbacks_model'),
(27, 'Can delete feedbacks_ model', 9, 'delete_feedbacks_model');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(8, 'Client_Site', 'clientposts_model'),
(7, 'Client_Site', 'clientregister_model'),
(9, 'Client_Site', 'feedbacks_model'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Remote_User', '0001_initial', '2019-04-23 07:01:48.050781'),
(2, 'contenttypes', '0001_initial', '2019-04-23 07:01:49.494140'),
(3, 'auth', '0001_initial', '2019-04-23 07:02:03.837890'),
(4, 'admin', '0001_initial', '2019-04-23 07:02:05.832031'),
(5, 'admin', '0002_logentry_remove_auto_add', '2019-04-23 07:02:05.863281'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-04-23 07:02:07.041015'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-04-23 07:02:07.839843'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-04-23 07:02:08.330078'),
(9, 'auth', '0004_alter_user_username_opts', '2019-04-23 07:02:08.361328'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-04-23 07:02:08.921875'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-04-23 07:02:08.953125'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-04-23 07:02:08.989257'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-04-23 07:02:09.785156'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-04-23 07:02:10.580078'),
(15, 'sessions', '0001_initial', '2019-04-23 07:02:11.764648'),
(16, 'Remote_User', '0002_clientposts_model', '2019-04-25 05:53:57.702132'),
(17, 'Remote_User', '0003_clientposts_model_usefulcounts', '2019-04-25 10:00:02.521468'),
(18, 'Remote_User', '0004_auto_20190429_1027', '2019-04-29 04:57:32.672296'),
(19, 'Remote_User', '0005_clientposts_model_dislikes', '2019-04-29 05:15:16.668390'),
(20, 'Remote_User', '0006_Review_model', '2019-04-29 05:19:26.382257'),
(21, 'Remote_User', '0007_clientposts_model_names', '2019-04-30 04:45:46.472656');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('08snhdsayx8ns06yhe19rdyvnabjn8iy', 'eyJ1c2VyaWQiOjF9:1oFx6B:3_h3tiP91115hfoAJl2N8umQpJF5Lg0b3BH7VQg2w4o', '2022-08-08 12:22:11.245658'),
('0doxd89lelsb62hh61y1u9xvhgis91ks', 'eyJ1c2VyaWQiOjE5fQ:1mDlBs:xxj-bSmT5wd80FZ0QPs9yzR1wUnf-8naNjRRmgbWt-4', '2021-08-25 10:10:28.069873'),
('0jpcgnd1gmwbp3e8tw54e6nxjylsogyo', 'YmM4NjE0MDQ2MzBmYWIxNzIzNTkxZjBiN2I5M2MxMzQyYTE0YmMxODp7InVzZXJpZCI6Mn0=', '2020-02-21 08:52:28.687500'),
('1avxwyhltuaclq2zfq40bjmwzxgup6hp', 'eyJ1c2VyaWQiOjJ9:1ml5JO:9_XIwCjkeG7Vu6-k169B1gbde6aRX-mqiwhgCKNqrRA', '2021-11-25 08:19:58.276708'),
('49qo7iki5uxczhyymi8ka7dnh6a2wva5', 'MmE4N2EzZmM3NTI1ODc3MjUxYjUxNWM3OWM4ZGExNWViMzRkN2MzYTp7Im5hbWUiOjF9', '2019-05-08 09:19:45.486328'),
('4df7s82pddaszour6twx23d86058ppjq', 'ZmNkODA5MmI1ZGQ0Yjk5MmZlNzEyNTcwNTcxNjk2ZWYxZTE3NThkMjp7InVzZXJpZCI6NX0=', '2020-11-23 11:49:21.396484'),
('4grzrcwuyo4ngah4h02e5k8fsmupoj7h', 'eyJ1c2VyaWQiOjJ9:1oOJDo:mkqqzP-gMEx1nDgLvA0T59DAs5zj_dUXZRblAgv5UEI', '2022-08-31 13:36:36.247322'),
('4io28d085qjfib7a5s2qbhc8qp4wfiva', 'eyJ1c2VyaWQiOjE2fQ:1mAtmi:oIUbcN3WzJiaWnxMBZ6eIGMTo8NS2y701JlpwqvzBUk', '2021-08-17 12:44:40.453750'),
('4x6b78w9rfcn34v650kd2j7oij6atr8p', 'Zjk0Y2RlYjc4OTJhNWMyZjQyNmM4ZGRhYTVjNmVlNDFhZGE4ZmU3NTp7InVzZXJpZCI6Nn0=', '2019-12-27 12:07:42.082031'),
('7ai80sml3hwq0jsvdfl1vm5m13x8d8k9', 'eyJ1c2VyaWQiOjF9:1mt5vR:3pScFzSqVCPEshZhoFMwZb-rfCX09_pAUFEuMV8fNKA', '2021-12-17 10:36:21.166280'),
('7ixdamflp4fqyjecn17bd7xfbsi7eowq', 'eyJ1c2VyaWQiOjEwfQ:1mBzQr:5DfHs08xtygiklJxfW3kZFCrxnrA_igxR5gbDcKt2e8', '2021-08-20 12:58:37.947486'),
('7ph664obz14m207786d3oubrzgjnisom', 'eyJ1c2VyaWQiOjN9:1ml5U2:RJ7eMbREY4fk71sBmCItxM6E3kDDc-R-clIp-QGiiuI', '2021-11-25 08:30:58.769500'),
('9vom7mmn5muyoiy8nytc9mxown1q1g2b', 'eyJ1c2VyaWQiOjE5fQ:1mDRHr:QCoJ_gmMMx_cxknA5j_5NlcTLnENHFouosRuxYZlYbI', '2021-08-24 12:55:19.038051'),
('au3tqhab9csr4r2g5p8wxgktebzxone0', 'eyJ1c2VyaWQiOjExfQ:1mexd7:BmPTZn93Z2602ApV03LTh7BmDypyoNMN2YRKctHrGF8', '2021-11-08 10:55:01.820399'),
('b9cu6cjsfqfm5mame5dy1ikpiiy7yn3w', 'OTk3NTk2YTE0NjM5MWQ0OGQ0MjY3NzBjNzdhOTc0ZWJhM2ZkMzdkMjp7InVzZXJpZCI6MX0=', '2019-05-09 11:00:08.480453'),
('bhfid9lacfwlfi5yu3rgdg1uo5fp2bq8', 'eyJ1c2VyaWQiOjE4fQ:1mBH4F:2wUorkPET_MGY07bWd-Zp-9HZUsjS3bGCHCu1j6BN-s', '2021-08-18 13:36:19.192796'),
('ct13q5fpn94zvnij8ekixwzcky2imc5e', 'YWUzM2IzMWJiYmQ3YmY2YzlkMGFlNTM1YmU5ZGM4YjQ0MmY1YTc0NTp7InVzZXJpZCI6NH0=', '2019-05-14 11:44:10.978515'),
('e07j4duysh402dedtomm8icctvs9ljgy', 'MmE4N2EzZmM3NTI1ODc3MjUxYjUxNWM3OWM4ZGExNWViMzRkN2MzYTp7Im5hbWUiOjF9', '2019-05-09 06:08:12.306625'),
('fq0czwxzas1e5bjz5cx5pr6ytm8uhejy', 'eyJ1c2VyaWQiOjExfQ:1mfKoD:eQbeRUgZ8NFqCleEdS6fE0NAoRs3zn6_B82CZb4YtiQ', '2021-11-09 11:40:01.472965'),
('gq3vdjxoy34hxkorw2d8nztdusdknegl', 'eyJ1c2VyaWQiOjF9:1mpUvs:Lry5yh51WzsY8judWu-ApNb05fEC5oHytMQ9bZSqbGU', '2021-12-07 12:29:56.098464'),
('gsqk7v1ei7yhuvcbxw6r8vxhgbuzz7zx', 'eyJ1c2VyaWQiOjJ9:1mkkhL:_T8wyqi-MJi-K7_a-0EPz-h6HRouyRfpeAhHqTS5N04', '2021-11-24 10:19:19.270816'),
('h2up0dvopjvwswxnvprj7id9lgrivhus', 'eyJ1c2VyaWQiOjIzfQ:1mfM3f:FAuAUdY-ly6qun6t571yt1pYKVGhXfjbjhiruld5rNs', '2021-11-09 13:00:03.703809'),
('hbv74sg6w6e4wp89vq807vw0xhkh5s1h', 'MzU0ZWYzNTQ3MjM4MWZlOTVjM2M1MWQ4MmE5ODE0OTlkNDRkNDkwMDp7InVzZXJpZCI6MX0=', '2020-01-10 07:40:38.067382'),
('hhtt48je70l9nzw6dee4ocuxxm9blqej', 'NGRhY2JkNmQ4ZTM4OTU0Y2UzMzFlZmZmOTgzYmE0MWVkOThiNjc2NTp7Im5hbWUiOjEsInVzZXJpZCI6MX0=', '2019-05-09 10:12:38.380843'),
('hsb5814on7cph0wvy0yls67ca94ngcq3', 'eyJ1c2VyaWQiOjE5fQ:1mBzgz:cug3sAkQKH-bQBkB9O5l0UsDJL-37eDV8mR9Qau3elA', '2021-08-20 13:15:17.195464'),
('i530ldontosd9c37rlmr7i190cc8j54c', 'eyJ1c2VyaWQiOjExfQ:1mfGFZ:PSpZPmdPYnGzwCScqY4tYBkDj8BMVATwweZjjxmG5dk', '2021-11-09 06:47:57.629900'),
('i77fui9jgj9yk7ncx7u4ph5d6kg0nl6c', 'eyJ1c2VyaWQiOjE5fQ:1mDPJC:kqt800XGsVGRjHS3TmeLFrJbrpIK4-GbH4ZirwIc7S4', '2021-08-24 10:48:34.860638'),
('ic3hqykgws5iy6fz5ns6h6f921jbjzmt', 'eyJ1c2VyaWQiOjExfQ:1kywHL:I_tahJ0VJb7myAbMbXpWZu9XrSaAMmduNxGd2x5gtmY', '2021-01-25 12:26:35.043761'),
('iz6wcyx97x1w6mpfc51g1tj72z2xghfn', 'eyJ1c2VyaWQiOjl9:1kwlIp:YKOKMwJARe6w057AKTGY1-GCuRcZAeAbJ0bdQao23wY', '2021-01-19 12:19:07.663490'),
('jgcbya9z2s6b6mmldfv28lm18imc73m8', 'eyJ1c2VyaWQiOjIxfQ:1mDnYP:GTRQ2I-UYLdsCCyA0-WsFSAVBNno1wLo6lk4M8JS0OU', '2021-08-25 12:41:53.312085'),
('jpkxxiej4bdjin5tpdjm0xqhdooexz9o', 'eyJ1c2VyaWQiOjExfQ:1mBEdk:YOk6fHHfBMmtt5ZvSyzgy13Az8JS59iXbU4LO1Ps1RI', '2021-08-18 11:00:48.423036'),
('k7dyn4irgrj5wb4jucb4po527iw724dp', 'eyJ1c2VyaWQiOjEzfQ:1l0JrY:2_TJ4L_XoHdOW51Zdp0MOdyBEZEzntk5pdXZFDmX9x4', '2021-01-29 07:49:40.202848'),
('ktjsa2dwmkzggkc8htfro0m1zf2kt78d', 'eyJ1c2VyaWQiOjI0fQ:1mfiev:rUgpc2VOr-8MQnmWwZsSVM_IqXQAA3Bacheqmp_LQ2o', '2021-11-10 13:08:01.503971'),
('kxla8qbe1hs1tb4a04ewpmdmi5fx1evc', 'eyJ1c2VyaWQiOjJ9:1mpVxM:dUv2r33P7CFNLdnAjy8jCk-OJOlisN07sHd5Rf7zCLg', '2021-12-07 13:35:32.342260'),
('lmbcyc1iyu4valrpmfiex8hwd7y2zo7a', 'eyJ1c2VyaWQiOjN9:1qbLk4:4jeo1I3NUGuFDX1r1hK2ZtlbTlm60ryiyrsCv1zvnFY', '2023-09-13 14:00:20.740663'),
('o7x1vhluuypdfmgv7fmv6nohgfn5ub55', 'NzMyZjlhNzFhZjk2ZGUzZmFiMmIzYjMwNTJkYTg5MDUzNmNlMDk4Mjp7InVzZXJpZCI6MTZ9', '2020-01-02 12:51:55.659179'),
('oc4pzt7ijx1rzj09m2ve6b6y5uwc6wt5', 'eyJ1c2VyaWQiOjF9:1mkk7W:6GDuPOPoLHMwOYLys3lXIgfM79Fq36HHW31-utzbeyk', '2021-11-24 09:42:18.649798'),
('owqt9fqa6pkheboduh6f4k5p4lkwj0yc', 'eyJ1c2VyaWQiOjExfQ:1mfiXk:Wzn12pygxu_2Z1TzCSC4bKDawuXj_i7_BFLhJjKx-10', '2021-11-10 13:00:36.684741'),
('phsprfvps36hozm4kuyb0cvwz63d1sbj', 'eyJ1c2VyaWQiOjF9:1qbKle:IIFmbZDJyJn4tkjMT7D5PXnvtjxJmSiZw1vD_HBDtCM', '2023-09-13 12:57:54.140734'),
('psdjoq42u7lfqwfodftic5x6z9ij34nk', 'eyJ1c2VyaWQiOjExfQ:1mAXDq:a8YYY1YJU3jPv03qo9-VcrjRHnDWRSqGseiR93n0GVM', '2021-08-16 12:39:10.518259'),
('q6hp9a2l9dbrclvox0o02x1aamx1ukj7', 'eyJ1c2VyaWQiOjIyfQ:1mfGz3:wkq7ZgyB738cK3Jugrc0viqb3eI1C0gWhyypHF_DE-A', '2021-11-09 07:34:57.860407'),
('qnaolidvfx6bu9ra3uyqvkgva7bv92f1', 'OTk3NTk2YTE0NjM5MWQ0OGQ0MjY3NzBjNzdhOTc0ZWJhM2ZkMzdkMjp7InVzZXJpZCI6MX0=', '2019-05-14 05:34:50.069335'),
('r9qk0kd407g591hugz99fhps8zofh69s', 'eyJ1c2VyaWQiOjE4fQ:1mBxnG:qkd9MTM_FhhghUpV90qngEkwkoSKYdLbfwRKBLhK7Qg', '2021-08-20 11:13:38.356475'),
('rfq3uvadj7qsqrz7qlcyie9wscsqz1nr', 'eyJ1c2VyaWQiOjI1fQ:1mk2vF:mTIne3EU3rECWccrUfyPmy7XxIwdAzxhig4S5oOngho', '2021-11-22 11:34:45.897995'),
('rmbealtgib7ra7bscjx8dwk1s2qeo8ld', 'eyJ1c2VyaWQiOjF9:1oOGd5:aBhqfwqxbu8LtF8EHCz73w6LFrTnyUXTU3hHYFFGIVg', '2022-08-31 10:50:31.615593'),
('rn48bwukkb2yv60kvkacr8nc0njr5xky', 'eyJ1c2VyaWQiOjExfQ:1mfggv:xsbmrrGzxtrEFgspA0Wp7oWTp9qDl0shDSlGG8fHJo4', '2021-11-10 11:01:57.519295'),
('s7ui2zx2cslubpch6dm7iaxlz2wlsdgg', 'eyJ1c2VyaWQiOjExfQ:1mk1Xz:fpol-krFazPxkK0b4gEoocpOXHcd-eaYoxg26CU420Q', '2021-11-22 10:06:39.923928'),
('sdcvtwp7s5yj8q1lb0mdvlg8nj5wujqo', 'eyJ1c2VyaWQiOjEyfQ:1kzJ3p:0g6nRuJv3TXWVpANqNgbJcrUv96ZU5UQwv3bgqBbL1I', '2021-01-26 12:46:09.538596'),
('tejgl09oettnyva23kqdbns5nfz5g8ug', 'OTk3NTk2YTE0NjM5MWQ0OGQ0MjY3NzBjNzdhOTc0ZWJhM2ZkMzdkMjp7InVzZXJpZCI6MX0=', '2019-05-09 11:19:24.387679'),
('tx26u0gjaebi1m6miqvms83dw452rw7c', 'eyJ1c2VyaWQiOjExfQ:1mg01H:i0OHhHK7t2WdfySWwMXXs92TaT7Vn1UQf2i0eZBO70s', '2021-11-11 07:40:15.053714'),
('u5icgvq3qt5nthdlv99go3r804ccghbo', 'MmE4N2EzZmM3NTI1ODc3MjUxYjUxNWM3OWM4ZGExNWViMzRkN2MzYTp7Im5hbWUiOjF9', '2019-05-09 06:00:13.573226'),
('ws2o4cq1jbqepe0e9s9v7n4erxatq9ic', 'eyJ1c2VyaWQiOjE1fQ:1l2CgI:SmlpAnZzplZhPTFJ_rkEJstnZRl2CYWyTcah7PHPv-M', '2021-02-03 12:33:50.352453'),
('x5tpr0r7bu57jws6fpdwhi841252o6o2', 'eyJ1c2VyaWQiOjJ9:1oFxxT:uvC1LIN0lwgSyiMgEmEl1yH9W_bC1GTe5QDFsBdOQqM', '2022-08-08 13:17:15.650911'),
('xc6si4gdotxq06mslnwwjtewdhzuyh44', 'eyJ1c2VyaWQiOjR9:1mnfuL:VMKdQ2gcb4wQppelEf-wAdfTSSkA6nWPCeQODqD3NOM', '2021-12-02 11:48:49.418566'),
('zega5sz46ivu1tb1o1mtmg3v2ysxog1w', 'eyJ1c2VyaWQiOjh9:1kuVm4:L7RizVvw4EC0IyYCYAIhGjC8lvZol_Z1abqVwdkdKkY', '2021-01-13 07:20:00.767751'),
('zq2idu1e3gkyelhzpa24k5jixqhj74da', 'eyJ1c2VyaWQiOjJ9:1mne5B:sOSzXh5WGI5se1746XNpUgE1_UZZw07Xzb03KIcZXfY', '2021-12-02 09:51:53.585889'),
('zqfzqdolomzyjb8lckwouaztv90i58gi', 'eyJ1c2VyaWQiOjJ9:1mt6QE:e6TQ4CyC7rlTpZA0HyGK2zrDnv_EbGQrGGZUzgCcnCM', '2021-12-17 11:08:10.160908');

-- --------------------------------------------------------

--
-- Table structure for table `remote_user_clientregister_model`
--

CREATE TABLE IF NOT EXISTS `remote_user_clientregister_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phoneno` varchar(50) NOT NULL,
  `country` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `address` varchar(3000) NOT NULL,
  `gender` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `remote_user_clientregister_model`
--

INSERT INTO `remote_user_clientregister_model` (`id`, `username`, `email`, `password`, `phoneno`, `country`, `state`, `city`, `address`, `gender`) VALUES
(1, 'Amarnath', 'Amarnath123@gmail.com', 'Amarnath', '9535866270', 'India', 'Karnataka', 'Bangalore', '', ''),
(2, 'Manjunath', 'tmksmanju19@gmail.com', 'Manjunath', '9535866270', 'India', 'Karnataka', 'Bangalore', '', ''),
(3, 'tmksmanju', 'tmksmanju19@gmail.com', 'tmksmanju', '9535866270', 'India', 'Karnataka', 'Bangalore', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `remote_user_detection_accuracy`
--

CREATE TABLE IF NOT EXISTS `remote_user_detection_accuracy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(300) NOT NULL,
  `ratio` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `remote_user_detection_accuracy`
--

INSERT INTO `remote_user_detection_accuracy` (`id`, `names`, `ratio`) VALUES
(16, 'KNeighborsClassifier', '95.31531531531532'),
(17, 'Random Forest Classifier', '97.65765765765767'),
(18, 'SVM', '98.1981981981982'),
(19, 'Decision Tree Classifier', '96.21621621621622'),
(20, 'GradientBoostingClassifier', '96.3963963963964');

-- --------------------------------------------------------

--
-- Table structure for table `remote_user_detection_ratio`
--

CREATE TABLE IF NOT EXISTS `remote_user_detection_ratio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(300) NOT NULL,
  `ratio` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `remote_user_detection_ratio`
--

INSERT INTO `remote_user_detection_ratio` (`id`, `names`, `ratio`) VALUES
(18, 'Escalation Attack not Found', '80.0'),
(19, 'Escalation Attack Found', '20.0');

-- --------------------------------------------------------

--
-- Table structure for table `remote_user_escalation_attack_detection`
--

CREATE TABLE IF NOT EXISTS `remote_user_escalation_attack_detection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(3000) NOT NULL,
  `email_message` varchar(3000) NOT NULL,
  `Prediction` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `remote_user_escalation_attack_detection`
--

INSERT INTO `remote_user_escalation_attack_detection` (`id`, `subject`, `email_message`, `Prediction`) VALUES
(1, 'fulbright announcement : please post / disseminate to lists\r\n', '"fulbright announcement : please post / disseminate to lists subject fulbright scholar program competition for 1996-97 : fulbright chairs in western europe and canada action : submissions due may 1 , 1995 info : dr . karen adams or ms . margo cunniffe council for international exchange of scholars 3007 tilden street , n . w . , suite 5m washington , dc 20008-3009 telephone : 202-686 - 6245 or 202 / 686-6242 fax : 202-362 - 3442 internet : we1 @ ciesnet . cies . org * * * * * * * * * * * * * * * * * * * * award descriptions : 1 . italy : venice chair department of philosophy and theory of sciences , university of venice . three months , between 2 / 97 and 6 / 97 . specialty : philosophy of language or theoretical linguistics . assignment : grantee will teach on both graduate and undergraduate levels and is to offer an advanced class in either contemporary theoretical linguistics ( theory of syntax and the syntax of logical form ) or contemporary philosophy of language ( theory of meaning , semantics of natural language , theory of predication , language and ontology ) . lecturing in english . 2 . italy : naples chair department of modern philology , university of naples . three months , between 3 / 1 / 97 and 5 / / 31 / 97 . specialty : american literature , american cultural studies , american language , or general linguistics . assignment : lecturing in english . occasional guest lectures at other cultural institutions in naples and elsewhere in italy .\r\n"\r\n', 'Escalation Attack not Found'),
(2, 'free stealth 3 . 0 bulk email software . . .\r\n', '"just released . . . 30 , 000 , 000 email addresses ! plus 12 bonuses . . . including free stealth 3 . 0 bulk email software these addresses are less than 21 days old . earn insane profits with the right formula if you have a product , service , or message that you would like to get out = = 20 to thousands , hundreds of thousands , or even millions of people , you = 20 have several options . traditional methods include print advertising , direc = t = 20 mail , radio , and television advertising . they are all effective , but they = all = 20 have two catches : they '' re expensive and time consuming . not = 20 only that , you only get one shot at making your message heard , by = 20 the right people . the internet , the "" global communications frontier "" has changed = 20 this dramatically , including making countless individuals wealthy . = 20 "" electronic marketing , "" as it ''s commonly referred to , has effectively = 20 leveled the playing fields of all types businesses . internet marketing group has been in the online marketing business = 20 for over 5 years . we can help make your goals come true . we have = 20 helped many individuals succeed in marketing their product = 20 effectively . it ''s very simple to do . in fact soon you will have the = 20 problem of what to do with all the cash you will make from sending = 20 out bulk email . = 20 here is just one of many true success stories we have seen . . . we did a mailing of 1 1 / 2 million emails for one of our customers . he = 20 was selling a home workers manual for $ 29 . 95 . his results are very = 20 typical and scary . he took in over 700 orders ! 700 x $ 29 . 95 = 3d $ 20 , 000 . = 20 this gentleman was so amazed , that after being skeptical , it had = 20 really happened to him , he made it , he found a niche . that niche = 20 was email ! he went on to buy our full list and will be set for life in le = ss = 20 than six months time . all this from selling a simple manual via e . mail . that was just one of the many success stories we hear everyday . = 20 it may all sound to good to be true . well , we can tell you this . it reall = y = 20 does work . why else are so many individuals doing it ? they are not = 20 just wasting their time . they are all making mega bucks . do n''t even hesitate on this one or you will miss out on the most = 20 effective way to market anywhere . . period ! = 20 here '' s the bottom line and what we can do for you here is what you get when you order today ! > > 30 million email addresses . . . 1 per line in simple text format on a cd = = 2e multiple files of 250 , 000 or greater ( no codes needed to open files ) . = 20 you will receive email addresses of the following domains . . . aol , = 20 prodigy , compuserve , delphi , genie , juno , pipeline , = 20 interamp , msn , mci , and 5 million other mixed email = 20 addresses ( . com , . net ) . all names listed above are seperated = 20 in files by domain name for your convenience . plus these bonus specials . . ', 'Escalation Attack Found'),
(3, 'seeking langacker reference\r\n', '"in a paper by ronald langacker entitled '' the symbolic nature of cognitive grammar : the meaning of _ of _ and of _ of _ - periphrasis '' ( in martin puetz ( ed ) 1992 _ thirty years of linguistic evolution _ . philadelphia : benjamins ) there is a reference to the following : langacker , r . w . [ 1992 ] [ to appear ] . possession and possessive constructions . i have not been able to find this item . can anyone tell me more about it ( such as , for example , has it appeared yet , and if so , where ) ? - dave scarratt davids @ cse . unsw . edu . au\r\n"\r\n', 'Escalation Attack not Found'),
(4, 'optimal artificial languages ( humour )\r\n', '"there has been a bit ( wee ) of discussion on this on sci . lang and , well , i could not resist the temptation . here is my contribution to the topic : > from jbm @ newsserver . trl . oz . au ( jacques guy ) date 27 jan 1995 15 : 29 : 06 + 1100 newsgroups sci . lang subject re : optimal artificial languages language being for communication ( not necessarily of truths , mark my words ) , an optimal artificial language should be designed so that its messages survive unscathed through the worst static . ergo , we want * maximal phonetic differentiation * ( tm ) of the vowels , we pick those maximally distant : a , i , u . of the consonants , ditto : a dental , a labial , a velar . having picked the most differentiated points of articulation we must also pick the most deifferentiated manners thereof . fricative , nasal , stop should do nicely . and let us use voicing to help along . that leaves us with * three maximally distant consonants * , which are : m , z , k . so far , so good . but we can do better still . let each consonant be associated with one , and only one , vowel , so that , if either consonant or vowel manages to get mangled in the transmission , you can restitute one from the other . naturally , we would match vowels and consonants to ensure least articulatory effort , lest speakers , tired by too much tongue and lip shifting , start slurring their words . there are n''t two ways about it : i goes with z , u with m , a with k . so there we have it , the perfect language for noise-free communication . it ''s cv , no consonant clusters , no diphthongs , and each syllable starts with exactly one consonant and has only one vowel . if the consonant is z the vowel is i , and so on ( how lazy can one get ! the list of possibilities is short indeed , yet i wrote "" and so on "" ) . ergo , it has only three possible syllables : zi , ka , mu , thereby being some 130 times easier than chinese ( with its 400 + possible syllables ) . and consider this sample vocabulary ( i leave the meanings to your imagination ) : zizi kaka mumu zizimu kakamu infants will learn it easily ! consider all its advantages : your children will speak fluently before they are two ! one of the first , because shortest , words they will learn will be . . . . . muzika ! thus ensuring the earliest possible development of their musical aptitude ! promote zikamu ( tm ) , the international language of to-morrow ! nb it has come to our attention that a renegade splinter group of the original zikamu ( tm ) movement is peddling a pale imitation of zikamu ( tm ) under the plagiarized name "" kazimu "" . do not be deceived ! the study and practice of their inferior product may cause brain damage ! insist on learning the one and only zikamu ( tm ) . join the official , approved zikamu foundation ( tm ) to day ! ( il y en a des qui vont encore se demander si c '' est du lard ou du cochon . c '' est du lard , bonnes gens , c '' est du lard ! )\r\n"\r\n', 'Escalation Attack not Found'),
(5, 're : 5 . 1500 comparative method , polarization & reviews\r\n', '"i am forwarding the following for posting at the request of robert rankin ( rankin @ ukanvm . cc . unkans . edu ) . i do not subscribe to this list and have no wish to join the fray at present , but when my name is mentioned sometimes the file is forwarded to me via e-mail . thus the following : andy anderson cites me on three points in a series of recent postings . i have known andy upwards of 30 years and do not feel that he would in - tentionally misrepresent my views , but i also feel a couple of things need clarification . first , i am uncomfortable about being formally cited as a ( secondary ) source of information on lyle campbell ''s paper from the boulder ( green - berg ) conference of ca . 1990 . if andy wishes to distribute an attack on the paper or its author in written form , he should first obtain an actual copy of it or , alternatively , await its publication . i guess i should n''t have brought it up in our conversation at the ssila / aaa meetings . second , i am said to have reported that the geneticists who have studied the mitochondrial dna ( mtdna ) of sundry native american and siberian peo - ples claim that there were / are "" two subgroups within amerind ( aside from the eskimo and athabaskans ) . "" this is not what i ( or the paper ''s authors wallace , torroni and schurr , et al . ) said . the authors did not address themselves to the linguistic problems and most certainly did n''t talk about "" subgroups "" . nor did i , since i do not regard the historicity of anything like "" amerind "" as even remotely established . the authors of the paper did posit at least four "" migrations "" . they do not discuss the most recent , eskomo - aleut , in their abstract , but i think they gave a time depth figure of about 6000 years bp ( before present ) for it orally - - do n''t quote me . from their abstract : for what they call na - dene their figure is 7000-10000 years bp . then they say they have evidence for at least two "" migrations "" preceding that . one comes between 12000-15000 bp and the earliest between 26000-34000 bp . figures as high as 40000 bp were mentioned orally , as i recall . they did not attempt to correlate their figures with our knowledge of periods of glaciation or the periodic existence of the land bridge in beringia . i leave it to readers to decide what this portends for the amerind hypo - thesis or its proposed ( glotto ) chronology , but a warning is in order in any event . note that i have written "" migration "" in quotes above . this is not because i wish to pejorate the term ; it is because geneticists use it in a very special way . for them it has to do solely with the ap - pearance of specific genetic material in american populations . they then assume a common ancestor and calculate the number of millennia by positing a uniform mutation rate for mtdna . the material and theories they work with force this definition of migration on them . all this says nothing about the situation "" on the ground . ', 'Escalation Attack not Found');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
