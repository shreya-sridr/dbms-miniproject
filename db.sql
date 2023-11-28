CREATE DATABASE IF NOT EXISTS MilkyWay;
USE MilkyWay;

CREATE TABLE IF NOT EXISTS Users(
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL
);

INSERT INTO Users (Username, PasswordHash) VALUES
('admin', 'admin_password'),
('user1', 'abc'),
('user2', '123');

CREATE TABLE IF NOT EXISTS stars (
    star_id INT PRIMARY KEY AUTO_INCREMENT,
    star_name VARCHAR(255) NOT NULL,
	star_type VARCHAR(255),
    star_distance VARCHAR(255),
    star_age VARCHAR(255)
);
INSERT INTO stars (star_name, star_type, star_distance, star_age) VALUES
('Sun', 'yellow dwarf', '148 mil km', '4.38 B'),
('Proxima Centauri', 'Red Dwarf', '4.24 LY', '4.85 Gyr'),
('Rigil Kentaurus', 'G2V', '4.36 LY', '4.85 Gyr');

CREATE TABLE IF NOT EXISTS star_clusters (
    sc_id INT PRIMARY KEY AUTO_INCREMENT,
    sc_name VARCHAR(255) NOT NULL,
    star_id INT,
    FOREIGN KEY (star_id) REFERENCES stars(star_id)
);

INSERT INTO star_clusters (sc_name, star_id) VALUES
('Alpha Centauri', 2),
('Alpha Centauri', 3);

CREATE TABLE IF NOT EXISTS planets (
    planet_id INT PRIMARY KEY AUTO_INCREMENT,
    planet_name VARCHAR(255) NOT NULL,
    planet_type VARCHAR(255),
    planet_size VARCHAR(255),
    planet_distance VARCHAR(255),
    star_id INT,
    FOREIGN KEY (star_id) REFERENCES stars(star_id)
);

INSERT INTO planets (planet_name, planet_type, planet_size, planet_distance, star_id) VALUES
('Mercury', 'Terrestrial', '74.8 mil sq.km', '77 mil km', 1),
('Earth', 'Rocky', '510 mil sq.km', '0', 1),
('Mars', 'Terrestrial', '144.4 mil sq.km', '225 mil km', 1);

CREATE TABLE IF NOT EXISTS moons (
    moon_id INT PRIMARY KEY AUTO_INCREMENT,
    moon_name VARCHAR(255) NOT NULL,
    moon_size VARCHAR(255),
    moon_distance VARCHAR(255),
    planet_id INT,
    FOREIGN KEY (planet_id) REFERENCES planets(planet_id)
);

INSERT INTO moons (moon_name, moon_size, moon_distance, planet_id) VALUES
('Moon', '38 mil sq.km', '384400 km', 2),
('Phobos', '1640 sq.km', '77.79 mil sq.km', 3),
('Deimos', '522 sq.km', '77.79 mil sq.km', 3);

CREATE TABLE IF NOT EXISTS asteroid_belts (
    asteroid_belt_id INT PRIMARY KEY AUTO_INCREMENT,
    belt_name VARCHAR(255) NOT NULL,
    star_id INT,
    FOREIGN KEY (star_id) REFERENCES stars(star_id)
);

INSERT INTO asteroid_belts (belt_name, star_id) VALUES
('Main Belt', 1);

CREATE TABLE IF NOT EXISTS asteroids (
    asteroid_id INT PRIMARY KEY AUTO_INCREMENT,
    asteroid_name VARCHAR(255) NOT NULL,
    asteroid_belt_id INT,
    FOREIGN KEY (asteroid_belt_id) REFERENCES asteroid_belts(asteroid_belt_id)
);

INSERT INTO asteroids (asteroid_name, asteroid_belt_id) VALUES
('Ceres', 1);

-- Create the 'comets' table to store information about comets
CREATE TABLE IF NOT EXISTS comets (
    comet_id INT PRIMARY KEY AUTO_INCREMENT,
    comet_name VARCHAR(255) NOT NULL,
    star_id INT,
    FOREIGN KEY (star_id) REFERENCES stars(star_id)
);

INSERT INTO comets (comet_name, star_id) VALUES
('Halley comet', 1);