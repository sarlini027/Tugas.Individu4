-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2023 at 05:35 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pyramid-tugasmovie`
--

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `id_movie` int(10) NOT NULL,
  `title` varchar(25) NOT NULL,
  `desk` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`id_movie`, `title`, `desk`) VALUES
(1, 'Reptile', 'Tom Nichols is a hardened New England detective, unflinching in his pursuit of a case where nothing is as it seems and it begins to dismantle the illusions in his own life.'),
(2, 'Fair Play', 'An unexpected promotion at a cutthroat hedge fund pushes a young couple\'s relationship to the brink, threatening to unravel far more than their recent engagement.'),
(3, ' Totally Killer', 'When the infamous \"Sweet Sixteen Killer\" returns 35 years after his first murder spree to claim another victim, 17-year-old Jamie accidentally travels back in time to 1987, determined to stop the killer before he can start.'),
(4, 'The Exorcist: Believer', 'When two girls disappear into the woods and return three days later with no memory of what happened to them, the father of one girl seeks out Chris MacNeil, who\'s been forever altered by what happened to her daughter fifty years ago.'),
(5, ' The Creator', 'Against the backdrop of a war between humans and robots with artificial intelligence, a former soldier finds the secret weapon, a robot in the form of a young child.'),
(6, 'Killers of the Flower Moo', 'When oil is discovered in 1920s Oklahoma under Osage Nation land, the Osage people are murdered one by one - until the FBI steps in to unravel the mystery.'),
(7, ' Haunted Mansion', 'A single mom named Gabbie hires a tour guide, a psychic, a priest and a historian to help exorcise her newly bought mansion after discovering it is inhabited by ghosts.'),
(8, ' Nowhere (II)', 'A young pregnant woman named Mia escapes from a country at war by hiding in a maritime container aboard a cargo ship. After a violent storm, Mia gives birth to her child while lost at sea, where she must fight to survive.'),
(9, 'The Iron Claw', 'The true story of the inseparable Von Erich brothers, who made history in the intensely competitive world of professional wrestling in the early 1980s.'),
(10, ' Mission: Impossible - De', 'Ethan Hunt and his IMF team must track down a dangerous weapon before it falls into the wrong hands.');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `jwt_token` text NOT NULL,
  `refresh_token` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `jwt_token`, `refresh_token`, `created_at`) VALUES
(1, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk4NzIxNn0.jQfK0nA-t1cO0UoH-tYJ4niQ3NxvhNVtcFIHO6QjqF4', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk4NTQ3Nn0.aC1e7MCmBzj8BiFl2uj8CcCxvs5uFO2QJP1yR6-avW4', '2023-10-22 14:36:56'),
(2, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk4NzIyNH0.p8UJQlwYEX4Zqfap6_4mtseduUoSvOOV5sMul9Ob2eg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk4NTQ4NH0.CZCVzLDJbj86_NIUyTUYWKGf3kiA1H3kmB-Lq0mWcCE', '2023-10-22 14:37:04'),
(3, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk4NzIzNH0.dVoT4j04BT6mmt_ujFjb7jIa757-_QgUnBBVCtafw34', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk4NTQ5NH0.ioAv1Jt1jC-6cA0pu5jyaR_TQ9hhq_lLGljfIuGmv3w', '2023-10-22 14:37:14'),
(4, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk4NzI0MH0.oncOWitgNOQN-cHNjdKrzcIK5M26BVBnnALK57yTCVg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk4NTUwMH0.E6-OfOCrTo8r_EXDV8bTFJ2Dm5GYxmM017rqbqH0RDY', '2023-10-22 14:37:20'),
(5, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk4NzM1NX0.0kzxvsyucxG1zIIvwlhXCzTG22UInUXJLbejjjw5te8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk4NTYxNX0.cjHpZLRd4c7P4GNxjAIvOw2IHgpOi_Rlw3bFWpYOsE8', '2023-10-22 14:39:15'),
(6, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk4NzM5OX0.UInVsvGa_sEhwcEA6MQgOugqRKSYShXJ8MFBaGeT2LI', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk4NTY1OX0.Iw6P8od9o4QCeayAfvV7pqbG1b_869s0T5y-vAbeUGQ', '2023-10-22 14:39:59'),
(7, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk4NzQzMn0.43mK1yOJKavPL-6daBYEjPoAFbiXsJxoHjC5wftN_tM', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImV4cCI6MTY5Nzk4NTY5Mn0.6bkV7fION2cY9scDECu2OA3feNKRgSo_t7NzX7QX7t0', '2023-10-22 14:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'anggrndewi', '12345678');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id_movie`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `id_movie` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
