CREATE DATABASE myapp;
-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 29. Mai, 2020 02:46 AM
-- Tjener-versjon: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myapp`
--

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `name` varchar(240) COLLATE utf8_bin NOT NULL,
  `category` varchar(240) COLLATE utf8_bin NOT NULL,
  `title` varchar(240) COLLATE utf8_bin NOT NULL,
  `date` varchar(240) COLLATE utf8_bin NOT NULL,
  `extension` varchar(240) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dataark for tabell `files`
--

INSERT INTO `files` (`id`, `name`, `category`, `title`, `date`, `extension`) VALUES
(45, 'test.pdf', 'lawsandregulations', 'Pdf Example 1', '29.05 2020', 'pdf'),
(46, 'outrun-vaporwave-hd-wallpaper-thumb.jpg', 'lawsandregulations', 'Image Example 1', '29.05 2020', 'jpg'),
(47, 'Introduction.docx', 'lawsandregulations', 'Example Word ', '29.05 2020', 'docx');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `jsondoc`
--

CREATE TABLE `jsondoc` (
  `DocId` bigint(20) NOT NULL,
  `Data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`Data`)),
  `Name` varchar(240) COLLATE utf8_bin DEFAULT NULL,
  `Category` varchar(240) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dataark for tabell `jsondoc`
--

INSERT INTO `jsondoc` (`DocId`, `Data`, `Name`, `Category`) VALUES
(48, '{\"time\":1590703708797,\"blocks\":[{\"type\":\"header\",\"data\":{\"text\":\"Introduction\",\"level\":2}},{\"type\":\"header\",\"data\":{\"text\":\"Simple paragraph\",\"level\":3}},{\"type\":\"paragraph\",\"data\":{\"text\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\"}},{\"type\":\"header\",\"data\":{\"text\":\"Video embed from youtube\",\"level\":3}},{\"type\":\"embed\",\"data\":{\"service\":\"youtube\",\"source\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"embed\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"width\":580,\"height\":320,\"caption\":\"What is universal design?\"}},{\"type\":\"header\",\"data\":{\"text\":\"Preview of a link\",\"level\":3}},{\"type\":\"linkTool\",\"data\":{\"link\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"meta\":{\"site_name\":\"YouTube\",\"url\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"title\":\"What is Universal Design for Learning (UDL)?\",\"image\":{\"url\":\"https://i.ytimg.com/vi/AGQ_7K35ysA/maxresdefault.jpg\",\"width\":\"1280\",\"height\":\"720\"},\"description\":\"A video from AHEAD on Universal Design for Learning. What is it? How can it help to meet the needs of a diverse student base? www.ahead.ie\",\"type\":\"video.other\",\"video\":{\"url\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"secure_url\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"type\":\"text/html\",\"width\":\"1280\",\"height\":\"720\"}}}},{\"type\":\"checklist\",\"data\":{\"items\":[{\"text\":\"check list for your content&nbsp;\",\"checked\":true}]}}],\"version\":\"2.17.0\"}', 'Home', 'Home'),
(53, '{\"time\":1590704388254,\"blocks\":[{\"type\":\"header\",\"data\":{\"text\":\"Introduction\",\"level\":2}},{\"type\":\"header\",\"data\":{\"text\":\"Simple paragraph\",\"level\":3}},{\"type\":\"paragraph\",\"data\":{\"text\":\"For download&nbsp;<a href=\\\"http://localhost:3000/Files/Introduction.docx\\\">click here&nbsp;</a>\"}},{\"type\":\"paragraph\",\"data\":{\"text\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\"}},{\"type\":\"header\",\"data\":{\"text\":\"Video embed from youtube\",\"level\":3}},{\"type\":\"embed\",\"data\":{\"service\":\"youtube\",\"source\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"embed\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"width\":580,\"height\":320,\"caption\":\"What is universal design?\"}},{\"type\":\"header\",\"data\":{\"text\":\"Preview of a link\",\"level\":3}},{\"type\":\"linkTool\",\"data\":{\"link\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"meta\":{\"site_name\":\"YouTube\",\"url\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"title\":\"What is Universal Design for Learning (UDL)?\",\"image\":{\"url\":\"https://i.ytimg.com/vi/AGQ_7K35ysA/maxresdefault.jpg\",\"width\":\"1280\",\"height\":\"720\"},\"description\":\"A video from AHEAD on Universal Design for Learning. What is it? How can it help to meet the needs of a diverse student base? www.ahead.ie\",\"type\":\"video.other\",\"video\":{\"url\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"secure_url\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"type\":\"text/html\",\"width\":\"1280\",\"height\":\"720\"}}}},{\"type\":\"checklist\",\"data\":{\"items\":[{\"text\":\"check list for your content&nbsp;\",\"checked\":true}]}}],\"version\":\"2.17.0\"}', 'mainlawsandregulations', 'mainlawsandregulations'),
(54, '{\"time\":1590704742394,\"blocks\":[{\"type\":\"header\",\"data\":{\"text\":\"About us&nbsp;\",\"level\":2}},{\"type\":\"header\",\"data\":{\"text\":\"Simple paragraph\",\"level\":3}},{\"type\":\"paragraph\",\"data\":{\"text\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\"}}],\"version\":\"2.17.0\"}', 'Aboutus', 'Aboutus'),
(55, '{\"time\":1590703738772,\"blocks\":[{\"type\":\"header\",\"data\":{\"text\":\"Introduction\",\"level\":2}},{\"type\":\"header\",\"data\":{\"text\":\"Simple paragraph\",\"level\":3}},{\"type\":\"paragraph\",\"data\":{\"text\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\"}},{\"type\":\"header\",\"data\":{\"text\":\"Video embed from youtube\",\"level\":3}},{\"type\":\"embed\",\"data\":{\"service\":\"youtube\",\"source\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"embed\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"width\":580,\"height\":320,\"caption\":\"What is universal design?\"}},{\"type\":\"header\",\"data\":{\"text\":\"Preview of a link\",\"level\":3}},{\"type\":\"linkTool\",\"data\":{\"link\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"meta\":{\"site_name\":\"YouTube\",\"url\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"title\":\"What is Universal Design for Learning (UDL)?\",\"image\":{\"url\":\"https://i.ytimg.com/vi/AGQ_7K35ysA/maxresdefault.jpg\",\"width\":\"1280\",\"height\":\"720\"},\"description\":\"A video from AHEAD on Universal Design for Learning. What is it? How can it help to meet the needs of a diverse student base? www.ahead.ie\",\"type\":\"video.other\",\"video\":{\"url\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"secure_url\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"type\":\"text/html\",\"width\":\"1280\",\"height\":\"720\"}}}},{\"type\":\"checklist\",\"data\":{\"items\":[{\"text\":\"check list for your content&nbsp;\",\"checked\":true}]}}],\"version\":\"2.17.0\"}', 'mainonlinecourses', 'mainonlinecourses'),
(56, '{\"time\":1590703718910,\"blocks\":[{\"type\":\"header\",\"data\":{\"text\":\"Introduction\",\"level\":2}},{\"type\":\"header\",\"data\":{\"text\":\"Simple paragraph\",\"level\":3}},{\"type\":\"paragraph\",\"data\":{\"text\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\"}},{\"type\":\"header\",\"data\":{\"text\":\"Video embed from youtube\",\"level\":3}},{\"type\":\"embed\",\"data\":{\"service\":\"youtube\",\"source\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"embed\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"width\":580,\"height\":320,\"caption\":\"What is universal design?\"}},{\"type\":\"header\",\"data\":{\"text\":\"Preview of a link\",\"level\":3}},{\"type\":\"linkTool\",\"data\":{\"link\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"meta\":{\"site_name\":\"YouTube\",\"url\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"title\":\"What is Universal Design for Learning (UDL)?\",\"image\":{\"url\":\"https://i.ytimg.com/vi/AGQ_7K35ysA/maxresdefault.jpg\",\"width\":\"1280\",\"height\":\"720\"},\"description\":\"A video from AHEAD on Universal Design for Learning. What is it? How can it help to meet the needs of a diverse student base? www.ahead.ie\",\"type\":\"video.other\",\"video\":{\"url\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"secure_url\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"type\":\"text/html\",\"width\":\"1280\",\"height\":\"720\"}}}},{\"type\":\"checklist\",\"data\":{\"items\":[{\"text\":\"check list for your content&nbsp;\",\"checked\":true}]}}],\"version\":\"2.17.0\"}', 'mainaccessibledocument', 'mainaccessibledocument'),
(57, '{\"time\":1590703714207,\"blocks\":[{\"type\":\"header\",\"data\":{\"text\":\"Introduction\",\"level\":2}},{\"type\":\"header\",\"data\":{\"text\":\"Simple paragraph\",\"level\":3}},{\"type\":\"paragraph\",\"data\":{\"text\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\"}},{\"type\":\"header\",\"data\":{\"text\":\"Video embed from youtube\",\"level\":3}},{\"type\":\"embed\",\"data\":{\"service\":\"youtube\",\"source\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"embed\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"width\":580,\"height\":320,\"caption\":\"What is universal design?\"}},{\"type\":\"header\",\"data\":{\"text\":\"Preview of a link\",\"level\":3}},{\"type\":\"linkTool\",\"data\":{\"link\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"meta\":{\"site_name\":\"YouTube\",\"url\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"title\":\"What is Universal Design for Learning (UDL)?\",\"image\":{\"url\":\"https://i.ytimg.com/vi/AGQ_7K35ysA/maxresdefault.jpg\",\"width\":\"1280\",\"height\":\"720\"},\"description\":\"A video from AHEAD on Universal Design for Learning. What is it? How can it help to meet the needs of a diverse student base? www.ahead.ie\",\"type\":\"video.other\",\"video\":{\"url\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"secure_url\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"type\":\"text/html\",\"width\":\"1280\",\"height\":\"720\"}}}},{\"type\":\"checklist\",\"data\":{\"items\":[{\"text\":\"check list for your content&nbsp;\",\"checked\":true}]}}],\"version\":\"2.17.0\"}', 'mainaccessiblekiosk', 'mainaccessiblekiosk'),
(58, '{\"time\":1590703724340,\"blocks\":[{\"type\":\"header\",\"data\":{\"text\":\"Introduction\",\"level\":2}},{\"type\":\"header\",\"data\":{\"text\":\"Simple paragraph\",\"level\":3}},{\"type\":\"paragraph\",\"data\":{\"text\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\"}},{\"type\":\"header\",\"data\":{\"text\":\"Video embed from youtube\",\"level\":3}},{\"type\":\"embed\",\"data\":{\"service\":\"youtube\",\"source\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"embed\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"width\":580,\"height\":320,\"caption\":\"What is universal design?\"}},{\"type\":\"header\",\"data\":{\"text\":\"Preview of a link\",\"level\":3}},{\"type\":\"linkTool\",\"data\":{\"link\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"meta\":{\"site_name\":\"YouTube\",\"url\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"title\":\"What is Universal Design for Learning (UDL)?\",\"image\":{\"url\":\"https://i.ytimg.com/vi/AGQ_7K35ysA/maxresdefault.jpg\",\"width\":\"1280\",\"height\":\"720\"},\"description\":\"A video from AHEAD on Universal Design for Learning. What is it? How can it help to meet the needs of a diverse student base? www.ahead.ie\",\"type\":\"video.other\",\"video\":{\"url\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"secure_url\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"type\":\"text/html\",\"width\":\"1280\",\"height\":\"720\"}}}},{\"type\":\"checklist\",\"data\":{\"items\":[{\"text\":\"check list for your content&nbsp;\",\"checked\":true}]}}],\"version\":\"2.17.0\"}', 'mainaccessiblemobile', 'mainaccessiblemobile'),
(59, '{\"time\":1590703729517,\"blocks\":[{\"type\":\"header\",\"data\":{\"text\":\"Introduction\",\"level\":2}},{\"type\":\"header\",\"data\":{\"text\":\"Simple paragraph\",\"level\":3}},{\"type\":\"paragraph\",\"data\":{\"text\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\"}},{\"type\":\"header\",\"data\":{\"text\":\"Video embed from youtube\",\"level\":3}},{\"type\":\"embed\",\"data\":{\"service\":\"youtube\",\"source\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"embed\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"width\":580,\"height\":320,\"caption\":\"What is universal design?\"}},{\"type\":\"header\",\"data\":{\"text\":\"Preview of a link\",\"level\":3}},{\"type\":\"linkTool\",\"data\":{\"link\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"meta\":{\"site_name\":\"YouTube\",\"url\":\"https://www.youtube.com/watch?v=AGQ_7K35ysA\",\"title\":\"What is Universal Design for Learning (UDL)?\",\"image\":{\"url\":\"https://i.ytimg.com/vi/AGQ_7K35ysA/maxresdefault.jpg\",\"width\":\"1280\",\"height\":\"720\"},\"description\":\"A video from AHEAD on Universal Design for Learning. What is it? How can it help to meet the needs of a diverse student base? www.ahead.ie\",\"type\":\"video.other\",\"video\":{\"url\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"secure_url\":\"https://www.youtube.com/embed/AGQ_7K35ysA\",\"type\":\"text/html\",\"width\":\"1280\",\"height\":\"720\"}}}},{\"type\":\"checklist\",\"data\":{\"items\":[{\"text\":\"check list for your content&nbsp;\",\"checked\":true}]}}],\"version\":\"2.17.0\"}', 'mainaccessibleweb', 'mainaccessibleweb'),
(60, '{\"time\":1590704266117,\"blocks\":[{\"type\":\"header\",\"data\":{\"text\":\"What is Lorem Ipsum?\",\"level\":2}},{\"type\":\"paragraph\",\"data\":{\"text\":\"Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\"}},{\"type\":\"header\",\"data\":{\"text\":\"Why do we use it?\",\"level\":2}},{\"type\":\"paragraph\",\"data\":{\"text\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\"}},{\"type\":\"header\",\"data\":{\"text\":\"Where does it come from?\",\"level\":2}},{\"type\":\"paragraph\",\"data\":{\"text\":\"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.\"}},{\"type\":\"paragraph\",\"data\":{\"text\":\"The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\"}}],\"version\":\"2.17.0\"}', 'Page Example 1 ', 'lawsandregulations');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dataark for tabell `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('3ewc2iljxVIGoOIt1ZDCnGbVLl6A-ARS', 1748384215, '{\"cookie\":{\"originalMaxAge\":157680000000,\"expires\":\"2025-05-27T21:59:03.204Z\",\"httpOnly\":false,\"path\":\"/\"},\"userID\":1}'),
('E9tcdt-ehR5FKksXJDBn-Bpz-wyUQ0_0', 1748392956, '{\"cookie\":{\"originalMaxAge\":157680000000,\"expires\":\"2025-05-28T00:16:14.073Z\",\"httpOnly\":false,\"path\":\"/\"},\"userID\":1}'),
('dDbrDUG2ePNmUXVl8FJR9UHRVQlew1dX', 1748384354, '{\"cookie\":{\"originalMaxAge\":157680000000,\"expires\":\"2025-05-27T22:14:32.538Z\",\"httpOnly\":false,\"path\":\"/\"},\"userID\":1}'),
('wkycSFY43eHrgDKBA95l7Vl0hQFuzXRH', 1746532674, '{\"cookie\":{\"originalMaxAge\":157679999999,\"expires\":\"2025-05-06T03:56:46.277Z\",\"httpOnly\":false,\"path\":\"/\"},\"userID\":1}');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(240) COLLATE utf8_bin NOT NULL,
  `password` varchar(240) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dataark for tabell `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2b$09$qb5kDkSqOoC1IbU9mBoItudpezMOThiyj4DHVDmTqjXkV5gvTwM6W');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jsondoc`
--
ALTER TABLE `jsondoc`
  ADD PRIMARY KEY (`DocId`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `jsondoc`
--
ALTER TABLE `jsondoc`
  MODIFY `DocId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
