-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 21, 2018 at 07:28 AM
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
  `active` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `title`, `description`, `active`, `date_added`, `user_id`) VALUES
(13, 'Lorem ipsum (edited)', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ac ipsum porttitor urna malesuada elementum id eget felis. Aliquam dapibus mollis diam a suscipit. Cras quis metus porta, ultricies nibh ut, hendrerit magna. Nam posuere ac lacus varius vehicula. Morbi rhoncus purus a lacus fermentum interdum. Vestibulum sollicitudin luctus nisi, vel faucibus magna tincidunt non. Nullam sed turpis ante. Suspendisse quis commodo tellus, id suscipit nulla. Phasellus fringilla tellus at ante mollis imperdiet. Aliquam a luctus sapien. Maecenas porttitor ut enim quis efficitur. Morbi rutrum eros quis turpis suscipit fermentum. Proin vel dui bibendum quam feugiat imperdiet.', 1, '2018-06-20 21:10:15', 1),
(16, 'Another new post.', 'Sed tempor varius sapien vitae porta. Nam vitae metus non tortor tempor laoreet. Aenean blandit diam in euismod pellentesque. Vivamus sodales, leo vitae vehicula imperdiet, est tellus iaculis velit, in sodales risus metus quis nulla. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed ullamcorper, nisi non sagittis viverra, metus ante vehicula nisl, quis imperdiet est orci a urna. Nulla facilisi. Cras pretium pulvinar dignissim. Aenean maximus in ligula imperdiet cursus.', 1, '2018-06-20 22:27:29', 1),
(17, 'A test post by test_author', 'Hummu. That\'s right.', 1, '2018-06-20 22:52:59', 9),
(18, 'Huh.', '<b>Bold text.</b>', 1, '2018-06-20 22:56:53', 1),
(19, 'Testing image', '<img src=\"http://localhost/ci_blog/public/images/Plum_trees_Kitano_Tenmangu.jpg\"><br>\r\n<br>\r\nImages can only be added with pure HTML btw.', 1, '2018-06-20 22:58:07', 1),
(20, 'Yet another lipsum post (edited)', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur facilisis eleifend nibh, non luctus lectus. Duis dictum ex ex, a blandit tellus tempus nec. Aliquam eget arcu orci. Curabitur egestas sapien at varius placerat. Ut sed bibendum nunc.<br>\r\n<br>\r\nInteger ut convallis enim, et tincidunt ex. Aliquam volutpat, ex ut varius ullamcorper, ipsum lorem pulvinar mauris, at semper neque leo et ante. Duis posuere sodales massa, eget ultricies lorem interdum eu. Nulla mollis ut lectus id viverra. Cras mattis tellus lacus, et dignissim velit lobortis sed. Duis maximus, ex nec malesuada lacinia, neque libero pellentesque nisl, non hendrerit mauris nibh quis lorem. Quisque a mollis urna.', 1, '2018-06-20 23:01:46', 1);

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
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
