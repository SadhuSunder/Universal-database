Universe Database Project
Welcome to the Universe Database Project! This project is a comprehensive relational database design that models various celestial objects and their relationships. It features tables for galaxies, stars, planets, moons, and comets, each with relevant properties and constraints.

Project Highlights
Galaxy Table: Contains information about different galaxies, including their age, description, and whether they have a supermassive black hole.

Star Table: Stores data on stars, including their mass, luminosity, and which galaxy they belong to.

Planet Table: Provides details on planets, such as their mass, radius, and associated star.

Moon Table: Documents moons orbiting planets with properties like orbital period and habitability.

Comet Table: Lists comets with attributes such as orbit period, composition, and discovery date.

Features
Primary Keys: Each table has an automatically incrementing primary key.

Foreign Keys: Stars reference galaxies, planets reference stars, and moons reference planets.

Data Types: Extensive use of various SQL data types, including INT, NUMERIC, TEXT, BOOLEAN, and VARCHAR.

Constraints: Enforced uniqueness, non-null constraints, and relationships through foreign keys.

Sample Data: Includes realistic and diverse sample data for a rich exploration experience.

Installation
Clone the repository.

Run the provided SQL scripts to create the database and populate it with sample data.

Connect to the universe database and explore the cosmos through SQL queries!

Usage
sql
-- Connect to the universe database
\c universe

-- Sample query to find all planets in the Milky Way galaxy
SELECT p.name AS planet_name, s.name AS star_name, g.name AS galaxy_name
FROM planet p
JOIN star s ON p.star_id = s.star_id
JOIN galaxy g ON s.galaxy_id = g.galaxy_id
WHERE g.name = 'Milky Way';
Contributing
Contributions are welcome! Feel free to fork the repository, make improvements, and submit pull requests.

Take your first steps in exploring the universe from a database perspective! 🌌✨
