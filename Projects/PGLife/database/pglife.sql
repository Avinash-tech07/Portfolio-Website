CREATE TABLE IF NOT EXISTS users (
  id INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  full_name VARCHAR(100) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  gender ENUM('male', 'female') NOT NULL,
  college_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY email (email)
);

CREATE TABLE IF NOT EXISTS cities (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS properties (
  id INT NOT NULL AUTO_INCREMENT,
  city_id INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(255) NOT NULL,
  description LONGTEXT NOT NULL,
  gender ENUM('male', 'female', 'unisex') NOT NULL,
  rent INT NOT NULL,
  rating_clean FLOAT(2,1) NOT NULL,
  rating_food FLOAT(2,1) NOT NULL,
  rating_safety FLOAT(2,1) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (city_id) REFERENCES cities(id)
);

CREATE TABLE IF NOT EXISTS amenities (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  type VARCHAR(100) NOT NULL,
  icon VARCHAR(30) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS properties_amenities (
  id INT NOT NULL AUTO_INCREMENT,
  property_id INT NOT NULL,
  amenity_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (property_id) REFERENCES properties(id),
  FOREIGN KEY (amenity_id) REFERENCES amenities(id)
);

CREATE TABLE IF NOT EXISTS testimonials (
  id INT NOT NULL AUTO_INCREMENT,
  property_id INT NOT NULL,
  user_name VARCHAR(100) NOT NULL,
  content LONGTEXT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (property_id) REFERENCES properties(id)
);

CREATE TABLE IF NOT EXISTS interested_users_properties (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  property_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (property_id) REFERENCES properties(id)
);

INSERT INTO cities (id, name) VALUES
(1, 'Delhi'),
(2, 'Mumbai'),
(3, 'Bengaluru'),
(4, 'Hyderabad');

INSERT INTO properties (id, city_id, name, address, description, gender, rent, rating_clean, rating_food, rating_safety) VALUES
(1, 1, 'Saxena''s Paying Guest', 'H.No. 3958 Kaseru Walan, Pahar Ganj, New Delhi, Delhi 110055', 'Furnished studio apartment - share it with close friends! Located in a well-connected neighbourhood with metro, cafes, and markets nearby.', 'male', 5000, 4.3, 3.4, 4.8),
(2, 1, 'Navrang PG Home', '644-C, Mohalla Baoli 6 Tooti Chowk, Paharganj, New Delhi, Delhi 110055', 'Furnished studio apartment - share it with close friends! Choose a private room or a shared one and make it your own abode.', 'unisex', 6000, 2.9, 3.4, 3.8),
(3, 2, 'Navkar Paying Guest', '44, Juhu Scheme, Juhu, Mumbai, Maharashtra 400058', 'Furnished PG in Juhu with a common living area and shared kitchen. Close to cafes, markets, and public transport.', 'female', 9500, 3.9, 3.8, 4.9),
(4, 2, 'PG for Girls Borivali West', 'Plot no.258/D4, Gorai no.2, Borivali West, Mumbai, Maharashtra 400092', 'Safe and well-maintained PG for girls with essential amenities and easy access to local trains.', 'female', 8000, 4.2, 4.1, 4.5),
(5, 2, 'Ganpati Paying Guest', 'Police Beat, Sainath Complex, Besides SV Rd, Daulat Nagar, Borivali East, Mumbai - 400066', 'Comfortable PG for boys with food, WiFi, and power backup in a convenient Mumbai neighbourhood.', 'male', 8500, 4.2, 3.9, 4.6),
(6, 3, 'Koramangala Student Stay', '12th Main, 4th Block, Koramangala, Bengaluru, Karnataka 560034', 'Modern PG near cafes and offices. Shared kitchen, high-speed WiFi, and easy bus connectivity.', 'unisex', 9000, 4.1, 3.7, 4.4),
(7, 4, 'Gachibowli Scholars PG', 'Near Wipro Circle, Gachibowli, Hyderabad, Telangana 500032', 'Spacious PG close to IT parks with dining, parking, and 24x7 security.', 'male', 7500, 4.0, 3.9, 4.6);

INSERT INTO testimonials (id, property_id, user_name, content) VALUES
(1, 1, 'Ashutosh Gowariker', 'You just have to arrive at the place, it''s fully furnished and stocked with all basic amenities and services and even your friends are welcome.'),
(2, 1, 'Karan Johar', 'You just have to arrive at the place, it''s fully furnished and stocked with all basic amenities and services and even your friends are welcome.'),
(3, 2, 'Zoya Akhtar', 'You just have to arrive at the place, it''s fully furnished and stocked with all basic amenities and services and even your friends are welcome.'),
(4, 2, 'Farhan Akhtar', 'You just have to arrive at the place, it''s fully furnished and stocked with all basic amenities and services and even your friends are welcome.'),
(5, 2, 'Anurag Kashyap', 'You just have to arrive at the place, it''s fully furnished and stocked with all basic amenities and services and even your friends are welcome.'),
(6, 3, 'Mira Nair', 'You just have to arrive at the place, it''s fully furnished and stocked with all basic amenities and services and even your friends are welcome.'),
(7, 3, 'Meghna Gulzar', 'You just have to arrive at the place, it''s fully furnished and stocked with all basic amenities and services and even your friends are welcome.'),
(8, 4, 'Farah Khan', 'You just have to arrive at the place, it''s fully furnished and stocked with all basic amenities and services and even your friends are welcome.'),
(9, 5, 'Rajkumar Hirani', 'You just have to arrive at the place, it''s fully furnished and stocked with all basic amenities and services and even your friends are welcome.'),
(10, 5, 'Sanjay Leela Bhansali', 'You just have to arrive at the place, it''s fully furnished and stocked with all basic amenities and services and even your friends are welcome.'),
(11, 6, 'Anjali Rao', 'Great location in Koramangala. Clean rooms and helpful caretaker.'),
(12, 7, 'Rohit Verma', 'Close to office parks and the food is consistent. Would stay again.');

INSERT INTO users (id, email, password, full_name, phone, gender, college_name) VALUES
(1, 'anuj.kalbalia@gmail.com', 'b1b3773a05c0ed0176787a4f1574ff0075f7521e', 'Anuj Kalbalia', '9535100112', 'male', 'NITD'),
(2, 'shadab@gmail.com', 'b1b3773a05c0ed0176787a4f1574ff0075f7521e', 'Shadab Alam', '9876543210', 'male', 'NITJ'),
(3, 'aditya@gmail.com', 'b1b3773a05c0ed0176787a4f1574ff0075f7521e', 'Aditya Sood', '9876543210', 'male', 'Chandigarh University'),
(4, 'radhika@gmail.com', 'b1b3773a05c0ed0176787a4f1574ff0075f7521e', 'Radhika Bhatia', '9876543210', 'female', 'Delhi University');

INSERT INTO interested_users_properties (id, user_id, property_id) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 5),
(4, 2, 1),
(5, 2, 5),
(6, 3, 1),
(7, 3, 2),
(8, 3, 5),
(9, 4, 2),
(10, 4, 3),
(11, 4, 4);

INSERT INTO amenities (id, name, type, icon) VALUES
(1, 'Wifi', 'Common Area', 'wifi'),
(2, 'Power Backup', 'Building', 'powerbackup'),
(3, 'Fire Extinguisher', 'Building', 'fireext'),
(4, 'TV', 'Common Area', 'tv'),
(5, 'Bed with Mattress', 'Bedroom', 'bed'),
(6, 'Parking', 'Building', 'parking'),
(7, 'Water Purifier', 'Common Area', 'rowater'),
(8, 'Dining', 'Common Area', 'dining'),
(9, 'Air Conditioner', 'Bedroom', 'ac'),
(10, 'Washing Machine', 'Common Area', 'washingmachine'),
(11, 'Lift', 'Building', 'lift'),
(12, 'CCTV', 'Building', 'cctv'),
(13, 'Geyser', 'Washroom', 'geyser');

INSERT INTO properties_amenities (id, property_id, amenity_id) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 4),
(4, 1, 5),
(5, 1, 7),
(6, 1, 8),
(7, 1, 9),
(8, 1, 10),
(9, 1, 11),
(10, 1, 13),
(11, 2, 1),
(12, 2, 2),
(13, 2, 3),
(14, 2, 4),
(15, 2, 5),
(16, 2, 7),
(17, 2, 8),
(18, 2, 9),
(19, 2, 10),
(20, 2, 11),
(21, 2, 13),
(22, 3, 1),
(23, 3, 2),
(24, 3, 3),
(25, 3, 4),
(26, 3, 5),
(27, 3, 7),
(28, 3, 8),
(29, 3, 10),
(30, 3, 11),
(31, 3, 12),
(32, 3, 13),
(33, 4, 1),
(34, 4, 3),
(35, 4, 4),
(36, 4, 5),
(37, 4, 7),
(38, 4, 8),
(39, 4, 10),
(40, 4, 11),
(41, 4, 12),
(42, 4, 13),
(43, 5, 1),
(44, 5, 3),
(45, 5, 4),
(46, 5, 5),
(47, 5, 7),
(48, 5, 8),
(49, 5, 10),
(50, 5, 11),
(51, 5, 12),
(52, 5, 13),
(53, 6, 1),
(54, 6, 2),
(55, 6, 5),
(56, 6, 9),
(57, 6, 11),
(58, 6, 12),
(59, 7, 1),
(60, 7, 2),
(61, 7, 5),
(62, 7, 6),
(63, 7, 8),
(64, 7, 13);
