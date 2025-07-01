-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2025 at 08:48 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cookbook`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `submission_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message_type` enum('General','Support','Feedback') NOT NULL,
  `message` text NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`submission_id`, `user_id`, `name`, `email`, `message_type`, `message`, `submission_date`) VALUES
(1, 1, 'CM', 'jollykham211@gmail.com', 'Feedback', 'I like it.', '2025-06-26 04:39:23');

-- --------------------------------------------------------

--
-- Table structure for table `educational_resources`
--

CREATE TABLE `educational_resources` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `pdf_path` varchar(255) DEFAULT NULL,
  `infographic_path` varchar(255) DEFAULT NULL,
  `video_path` varchar(255) DEFAULT NULL,
  `uploaded_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `educational_resources`
--

INSERT INTO `educational_resources` (`id`, `title`, `description`, `image_path`, `pdf_path`, `infographic_path`, `video_path`, `uploaded_at`) VALUES
(2, 'Renewable Energy Basics for Kitchens', 'Reduce energy costs in cooking and food preparation.Lower greenhouse gas emissions to fight climate change.Promote sustainable food systems for healthier communities. Inspire families to adopt clean cooking practices.', 'uploads/resources/solorcooking (1).jpg', 'uploads/resources/vegetarian-recipe.pdf', 'uploads/resources/1751272942_solorcooking.jpg', 'uploads/resources/1751273147_3. How to Turn Car - Chapter 10.1- Driving Car in Pygame Zero.mp4', '2025-06-30 21:17:04');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `recipe_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `cuisine_type` varchar(100) DEFAULT NULL,
  `dietary_preferences` varchar(100) DEFAULT NULL,
  `cooking_difficulty` enum('Easy','Medium','Hard') DEFAULT NULL,
  `ingredients` text DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`recipe_id`, `title`, `cuisine_type`, `dietary_preferences`, `cooking_difficulty`, `ingredients`, `instructions`, `image_url`, `description`, `user_id`, `created_at`) VALUES
(1, 'Vegan Spaghetti Bolognese', 'Italian', 'Vegan', 'Easy', 'Spaghetti, lentils, tomato paste, garlic, onion, olive oil, herbs', '1. Cook lentils\n2. Sauté onion and garlic\n3. Add tomato paste and herbs\n4. Combine with spaghetti', 'https://www.foodieexplorers.co.uk/wp-content/uploads/2025/03/foodie-explorers-vegan-spag-bol-4.jpg', 'A hearty vegan twist on the classic Italian dish.', 1, '2025-06-25 17:17:41'),
(2, 'Palak Paneer', 'Indian', 'Vegetarian', 'Medium', 'Spinach, paneer, onions, garlic, ginger, spices', '1. Blanch spinach\n2. Sauté onions and spices\n3. Add paneer and spinach puree\n4. Simmer until thick', 'https://static.toiimg.com/thumb/53093667.cms?imgsize=325892&width=800&height=800', 'Creamy spinach and paneer dish rich in Indian spices.', 2, '2025-06-25 17:17:41'),
(3, 'Chicken Teriyaki', 'Japanese', 'Non-Vegetarian', 'Medium', 'Chicken thighs, soy sauce, mirin, sugar, ginger, garlic', '1. Marinate chicken\n2. Pan fry until golden\n3. Add sauce and simmer\n4. Serve with rice', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo2eigr27t3ZB54zqH9YjuVsqto2gjswJLbw&s', 'A savory-sweet glazed chicken dish from Japan.', 3, '2025-06-25 17:17:41'),
(4, 'Vegan Pancakes', 'American', 'Vegan', 'Easy', 'Flour, almond milk, baking powder, maple syrup', '1. Mix ingredients\n2. Pour onto griddle\n3. Flip when bubbly\n4. Serve with fruit', 'https://cdn.loveandlemons.com/wp-content/uploads/2023/02/vegan-pancakes.jpg', 'Fluffy plant-based pancakes perfect for breakfast.', 1, '2025-06-25 17:17:41'),
(5, 'Ratatouille', 'French', 'Vegetarian', 'Hard', 'Zucchini, eggplant, tomatoes, bell pepper, herbs', '1. Slice vegetables\n2. Layer in dish\n3. Bake slowly\n4. Serve with crusty bread', 'https://www.howtocook.recipes/wp-content/uploads/2021/05/Ratatouille-recipe-500x500.jpg', 'A beautifully layered Provençal vegetable medley.', 2, '2025-06-25 17:17:41'),
(6, 'Green Curry Chicken', 'Thai', 'Non-Vegetarian', 'Medium', 'Chicken, green curry paste, coconut milk, Thai basil, bamboo shoots', '1. Sauté curry paste\n2. Add chicken and cook\n3. Add coconut milk and vegetables\n4. Simmer and serve', 'https://example.com/images/green_curry.jpg', 'Spicy and aromatic green curry with tender chicken.', 3, '2025-06-25 17:17:41');

-- --------------------------------------------------------

--
-- Table structure for table `recipes_communitypage`
--

CREATE TABLE `recipes_communitypage` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `rating` float DEFAULT 0,
  `rating_count` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes_communitypage`
--

INSERT INTO `recipes_communitypage` (`id`, `title`, `description`, `image`, `rating`, `rating_count`, `created_at`) VALUES
(8, 'Cake', 'Birthday Cake', 'uploads/cake2.jpg', 0, 0, '2025-06-26 04:28:30'),
(9, 'Burgar', 'My Creation', 'uploads/burger.jpg', 0, 0, '2025-06-26 04:29:11'),
(10, 'BirthdayCake', 'My Own creation', 'uploads/anime-girl-1920x1080-roses-25439.jpg', 0, 0, '2025-06-30 04:00:00'),
(11, 'BirthdayCake', 'My Own creation', 'uploads/anime-girl-1920x1080-roses-25439.jpg', 0, 0, '2025-06-30 04:00:37'),
(12, 'Cake', 'My own', 'uploads/anime-girl-2560x1440-fantasy-25366.jpg', 0, 0, '2025-06-30 04:01:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(300) NOT NULL,
  `failed_attempts` int(11) DEFAULT 0,
  `last_failed_attempt` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `failed_attempts`, `last_failed_attempt`, `created_at`, `updated_at`) VALUES
(1, 'Alice', 'Smith', 'alice@example.com', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 0, NULL, '2025-06-25 17:17:09', '2025-06-25 17:17:09'),
(2, 'Bob', 'Johnson', 'bob@example.com', 'fbb4a8a163ffa958b4f02bf9cabb30cfefb40de803f2c4c346a9d39b3be1b544', 0, NULL, '2025-06-25 17:17:09', '2025-06-25 17:17:09'),
(3, 'Charlie', 'Lee', 'charlie@example.com', 'a8056edfdc6b2b9a259c5c2976ce5b4e760f359749e1464c0fe6a107c650c259', 0, NULL, '2025-06-25 17:17:09', '2025-06-25 17:17:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`submission_id`);

--
-- Indexes for table `educational_resources`
--
ALTER TABLE `educational_resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`recipe_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `recipes_communitypage`
--
ALTER TABLE `recipes_communitypage`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `submission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `educational_resources`
--
ALTER TABLE `educational_resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `recipe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `recipes_communitypage`
--
ALTER TABLE `recipes_communitypage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes_communitypage` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
