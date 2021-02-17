-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2020 年 12 月 26 日 13:56
-- サーバのバージョン： 5.7.28-0ubuntu0.18.04.4
-- PHP のバージョン: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `AIBANK`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `account_138`
--

CREATE TABLE `account_138` (
  `number` char(7) NOT NULL,
  `type` char(1) NOT NULL,
  `name_full` varchar(30) NOT NULL,
  `name_kana` varchar(30) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flg_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `account_138`
--

INSERT INTO `account_138` (`number`, `type`, `name_full`, `name_kana`, `create_date`, `flg_active`) VALUES
('1648853', '1', '山田花子', 'ヤマダハナコ', '2020-12-21 00:09:52', 1),
('2554930', '1', '鳥手羽', 'トリテショウ', '2020-12-21 00:14:23', 1),
('3214991', '1', '川村裕太', 'カワムラユウタ', '2020-12-21 00:10:50', 1),
('3573120', '1', '鈴木拓哉', 'スズキタクヤ', '2020-12-21 00:09:33', 1),
('3982373', '1', '林米', 'ハヤシライス', '2020-12-21 00:06:07', 1),
('5747127', '1', '雷中', 'ライチュウ', '2020-12-26 13:30:52', 1),
('6599500', '1', '佐々木祐希', 'ササキユウキ', '2020-12-21 00:10:21', 1),
('7071073', '1', '田中太郎', 'タナカタロウ', '2020-12-21 00:08:58', 1),
('7981757', '1', '及川猛', 'オイカワタケル', '2020-12-21 00:11:40', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `CDSHITEN` char(3) NOT NULL,
  `CDnumber` char(7) NOT NULL,
  `timestamp` datetime NOT NULL,
  `type` tinyint(4) NOT NULL,
  `remarks` varchar(30) DEFAULT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `transaction`
--

INSERT INTO `transaction` (`id`, `CDSHITEN`, `CDnumber`, `timestamp`, `type`, `remarks`, `amount`) VALUES
(1, '138', '1648853', '2020-12-26 12:35:08', 1, NULL, 123),
(2, '138', '1648853', '2020-12-26 12:36:36', 1, '', 123),
(3, '138', '1648853', '2020-12-26 13:31:07', 1, '', 12345);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `account_138`
--
ALTER TABLE `account_138`
  ADD PRIMARY KEY (`number`);

--
-- テーブルのインデックス `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルのAUTO_INCREMENT
--

--
-- テーブルのAUTO_INCREMENT `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
