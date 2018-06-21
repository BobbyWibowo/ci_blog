-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 21, 2018 at 04:05 PM
-- Server version: 10.2.15-MariaDB-10.2.15+maria~xenial
-- PHP Version: 7.2.6-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `user_id`, `post_id`, `comment`, `date_added`) VALUES
(5, 1, 11, 'Test new comment. Nothing special either. Just some plain text stuff.', '2018-06-20 17:28:41'),
(6, 8, 11, 'A test comment from a demo user account.', '2018-06-20 17:29:35'),
(7, 9, 12, 'Yeah.', '2018-06-20 17:30:15'),
(8, 9, 11, 'Hi there.', '2018-06-20 17:30:21'),
(9, 1, 13, 'New comment.', '2018-06-20 22:18:30'),
(10, 1, 13, 'Oh hi.', '2018-06-20 22:25:53'),
(11, 11, 16, 'Hmm.', '2018-06-20 22:48:28'),
(12, 11, 13, 'https://www.youtube.com/watch?v=ZUT2tGIOzKg', '2018-06-20 22:48:59'),
(13, 9, 17, 'What you gonna do bout it.', '2018-06-20 22:53:08'),
(14, 1, 20, 'Hello there.', '2018-06-21 00:16:36'),
(15, 8, 19, 'Noice.', '2018-06-21 00:17:18');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT 1,
  `comments` tinyint(1) NOT NULL DEFAULT 1,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `title`, `description`, `public`, `comments`, `date_added`, `user_id`) VALUES
(13, 'Lorem ipsum (edited)', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ac ipsum porttitor urna malesuada elementum id eget felis. Aliquam dapibus mollis diam a suscipit. Cras quis metus porta, ultricies nibh ut, hendrerit magna. Nam posuere ac lacus varius vehicula. Morbi rhoncus purus a lacus fermentum interdum. Vestibulum sollicitudin luctus nisi, vel faucibus magna tincidunt non. Nullam sed turpis ante. Suspendisse quis commodo tellus, id suscipit nulla. Phasellus fringilla tellus at ante mollis imperdiet. Aliquam a luctus sapien. Maecenas porttitor ut enim quis efficitur. Morbi rutrum eros quis turpis suscipit fermentum. Proin vel dui bibendum quam feugiat imperdiet.', 1, 1, '2018-06-20 21:10:15', 1),
(16, 'Another new post.', 'Sed tempor varius sapien vitae porta.<br>\r\nNam vitae metus non tortor tempor laoreet.<br>\r\nAenean blandit diam in euismod pellentesque.<br>\r\nVivamus sodales, leo vitae vehicula imperdiet, est tellus iaculis velit, in sodales risus metus quis nulla.<br>\r\nOrci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.<br>\r\nSed ullamcorper, nisi non sagittis viverra, metus ante vehicula nisl, quis imperdiet est orci a urna.<br>\r\nNulla facilisi.<br>\r\nCras pretium pulvinar dignissim. Aenean maximus in ligula imperdiet cursus.', 1, 1, '2018-06-20 22:27:29', 1),
(17, 'A test post by test_author', 'Hummu.<br>\r\nThat\'s right.', 1, 1, '2018-06-20 22:52:59', 9),
(18, 'Huh.', '<b>Bold text.</b><br>\r\n<i>Italic text.</i><br>\r\n<u>Underlined text.</u>', 1, 1, '2018-06-20 22:56:53', 1),
(19, 'Testing image', '<img src=\"http://localhost/ci_blog/public/images/Plum_trees_Kitano_Tenmangu.jpg\"><br>\r\n<br>\r\nImages can only be added with pure HTML btw.', 1, 1, '2018-06-20 22:58:07', 1),
(20, 'Yet another lipsum post (edited)', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur facilisis eleifend nibh, non luctus lectus. Duis dictum ex ex, a blandit tellus tempus nec. Aliquam eget arcu orci. Curabitur egestas sapien at varius placerat. Ut sed bibendum nunc.<br>\r\n<br>\r\nInteger ut convallis enim, et tincidunt ex. Aliquam volutpat, ex ut varius ullamcorper, ipsum lorem pulvinar mauris, at semper neque leo et ante. Duis posuere sodales massa, eget ultricies lorem interdum eu. Nulla mollis ut lectus id viverra. Cras mattis tellus lacus, et dignissim velit lobortis sed. Duis maximus, ex nec malesuada lacinia, neque libero pellentesque nisl, non hendrerit mauris nibh quis lorem. Quisque a mollis urna.', 1, 1, '2018-06-20 23:01:46', 1),
(21, 'About Me', '<p align=\"center\">\r\n    <img src=\"http://localhost/ci_blog/public/images/about_me.png\" alt=\"About Me\">\r\n</p>\r\n<p>\r\n    <table class=\"table is-fullwidth is-striped is-hoverable\">\r\n        <tbody>\r\n            <tr>\r\n                <th>Name:</th>\r\n                <td>Bobby Wibowo Banjarnahor</td>\r\n            </tr>\r\n            <tr>\r\n                <th>Date of birth:</th>\r\n                <td>19 April 1998</td>\r\n            </tr>\r\n            <tr>\r\n                <th>Place of birth:</th>\r\n                <td>Dolok Sanggul, SU, ID</td>\r\n            </tr>\r\n            <tr>\r\n                <th>Phone:</th>\r\n                <td>+62 821-6695-7511</td>\r\n            </tr>\r\n            <tr>\r\n                <th>Email:</th>\r\n                <td><a href=\"mailto:bobby@fiery.me\">bobby@fiery.me</a></td>\r\n            </tr>\r\n            <tr>\r\n                <th>Homepage:</th>\r\n                <td><a href=\"https://fiery.me/\" target=\"_blank\" rel=\"noopener\">https://fiery.me/</a></td>\r\n            </tr>\r\n            <tr>\r\n                <th>GitHub:</th>\r\n                <td><a href=\"https://github.com/BobbyWibowo\" target=\"_blank\" rel=\"noopener\">BobbyWibowo</a></td>\r\n            </tr>\r\n            <tr>\r\n                <th>School:</th>\r\n                <td>University of North Sumatera</td>\r\n            </tr>\r\n            <tr>\r\n                <th>Degree:</th>\r\n                <td>Bachelor\'s degree</td>\r\n            </tr>\r\n            <tr>\r\n                <th>Field of study:</th>\r\n                <td>Computer Science</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n</p>', 0, 0, '2018-06-21 07:57:28', 1),
(22, 'Hello World', '<h3>Hello World</h3>\r\n<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>\r\n<h3>Third level</h3>\r\n<p>Curabitur accumsan turpis pharetra <strong>augue tincidunt</strong> blandit. Quisque condimentum maximus mi, sit amet commodo arcu rutrum id. Proin pretium urna vel cursus venenatis. Suspendisse potenti. Etiam mattis sem rhoncus lacus dapibus facilisis. Donec at dignissim dui. Ut et neque nisl.</p>\r\n<ul>\r\n  <li>In fermentum leo eu lectus mollis, quis dictum mi aliquet.</li>\r\n  <li>Morbi eu nulla lobortis, lobortis est in, fringilla felis.</li>\r\n  <li>Aliquam nec felis in sapien venenatis viverra fermentum nec lectus.</li>\r\n  <li>Ut non enim metus.</li>\r\n</ul>\r\n<h4>Fourth level</h4>\r\n<p>Quisque ante lacus, malesuada ac auctor vitae, congue <a href=\"#\">non ante</a>. Phasellus lacus ex, semper ac tortor nec, fringilla condimentum orci. Fusce eu rutrum tellus.</p>\r\n<ol>\r\n  <li>Donec blandit a lorem id convallis.</li>\r\n  <li>Cras gravida arcu at diam gravida gravida.</li>\r\n  <li>Integer in volutpat libero.</li>\r\n  <li>Donec a diam tellus.</li>\r\n  <li>Aenean nec tortor orci.</li>\r\n  <li>Quisque aliquam cursus urna, non bibendum massa viverra eget.</li>\r\n  <li>Vivamus maximus ultricies pulvinar.</li>\r\n</ol>\r\n<blockquote>Ut venenatis, nisl scelerisque sollicitudin fermentum, quam libero hendrerit ipsum, ut blandit est tellus sit amet turpis.</blockquote>\r\n<p>Quisque at semper enim, eu hendrerit odio. Etiam auctor nisl et <em>justo sodales</em> elementum. Maecenas ultrices lacus quis neque consectetur, et lobortis nisi molestie.</p>\r\n<p>Sed sagittis enim ac tortor maximus rutrum. Nulla facilisi. Donec mattis vulputate risus in luctus. Maecenas vestibulum interdum commodo.</p>\r\n<dl>\r\n  <dt>Web</dt>\r\n  <dd>The part of the Internet that contains websites and web pages</dd>\r\n  <dt>HTML</dt>\r\n  <dd>A markup language for creating web pages</dd>\r\n  <dt>CSS</dt>\r\n  <dd>A technology to make HTML look better</dd>\r\n</dl>\r\n<p>Suspendisse egestas sapien non felis placerat elementum. Morbi tortor nisl, suscipit sed mi sit amet, mollis malesuada nulla. Nulla facilisi. Nullam ac erat ante.</p>\r\n<h5>Fifth level</h5>\r\n<p>Nulla efficitur eleifend nisi, sit amet bibendum sapien fringilla ac. Mauris euismod metus a tellus laoreet, at elementum ex efficitur.</p>\r\n<pre>\r\n&lt;!DOCTYPE html&gt;\r\n&lt;html&gt;\r\n&lt;head&gt;\r\n  &lt;title&gt;Hello World&lt;/title&gt;\r\n&lt;/head&gt;\r\n&lt;body&gt;\r\n  &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec viverra nec nulla vitae mollis.&lt;/p&gt;\r\n&lt;/body&gt;\r\n&lt;/html&gt;\r\n</pre>\r\n<p>Maecenas eleifend sollicitudin dui, faucibus sollicitudin augue cursus non. Ut finibus eleifend arcu ut vehicula. Mauris eu est maximus est porta condimentum in eu justo. Nulla id iaculis sapien.</p>\r\n<table>\r\n  <thead>\r\n    <tr>\r\n      <th>One</th>\r\n      <th>Two</th>\r\n    </tr>\r\n  </thead>\r\n  <tbody>\r\n    <tr>\r\n      <td>Three</td>\r\n      <td>Four</td>\r\n    </tr>\r\n    <tr>\r\n      <td>Five</td>\r\n      <td>Six</td>\r\n    </tr>\r\n    <tr>\r\n      <td>Seven</td>\r\n      <td>Eight</td>\r\n    </tr>\r\n    <tr>\r\n      <td>Nine</td>\r\n      <td>Ten</td>\r\n    </tr>\r\n    <tr>\r\n      <td>Eleven</td>\r\n      <td>Twelve</td>\r\n    </tr>\r\n  </tbody>\r\n</table>\r\n<p>Phasellus porttitor enim id metus volutpat ultricies. Ut nisi nunc, blandit sed dapibus at, vestibulum in felis. Etiam iaculis lorem ac nibh bibendum rhoncus. Nam interdum efficitur ligula sit amet ullamcorper. Etiam tristique, leo vitae porta faucibus, mi lacus laoreet metus, at cursus leo est vel tellus. Sed ac posuere est. Nunc ultricies nunc neque, vitae ultricies ex sodales quis. Aliquam eu nibh in libero accumsan pulvinar. Nullam nec nisl placerat, pretium metus vel, euismod ipsum. Proin tempor cursus nisl vel condimentum. Nam pharetra varius metus non pellentesque.</p>\r\n<h6>Sixth level</h6>\r\n<p>Aliquam sagittis rhoncus vulputate. Cras non luctus sem, sed tincidunt ligula. Vestibulum at nunc elit. Praesent aliquet ligula mi, in luctus elit volutpat porta. Phasellus molestie diam vel nisi sodales, a eleifend augue laoreet. Sed nec eleifend justo. Nam et sollicitudin odio.</p>\r\n<figure>\r\n  <img src=\"http://localhost/ci_blog/public/images/256px.png\">\r\n  <img src=\"http://localhost/ci_blog/public/images/256px.png\">\r\n  <figcaption>\r\n    Figure 1: Some beautiful placeholders\r\n  </figcaption>\r\n</figure>\r\n<p>Cras in nibh lacinia, venenatis nisi et, auctor urna. Donec pulvinar lacus sed diam dignissim, ut eleifend eros accumsan. Phasellus non tortor eros. Ut sed rutrum lacus. Etiam purus nunc, scelerisque quis enim vitae, malesuada ultrices turpis. Nunc vitae maximus purus, nec consectetur dui. Suspendisse euismod, elit vel rutrum commodo, ipsum tortor maximus dui, sed varius sapien odio vitae est. Etiam at cursus metus.</p>', 1, 1, '2018-06-21 09:01:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(4) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('admin','author','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `username`, `password`, `user_type`) VALUES
(1, 'bobby@fiery.me', 'bobby123', '7c222fb2927d828af22f592134e8932480637c0d', 'admin'),
(8, 'demo@fiery.me', 'demo', '7c222fb2927d828af22f592134e8932480637c0d', 'user'),
(9, 'test_author@fiery.me', 'test_author', '7c222fb2927d828af22f592134e8932480637c0d', 'author'),
(10, 'new_account@fiery.me', 'new_account', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'user'),
(11, 'test@test.com', 'test', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
