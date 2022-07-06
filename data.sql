/* Populate database with sample data. */

INSERT INTO animals(name, date_of_birth, neutered, weight_kg, escape_attempts)
VALUES ('Agumon', '2020-02-03', true, 10.23, 0),
('Gabumon', '2018-11-15', true, 8, 2),
('Pikachu', '2021-01-07', false, 15.04, 1),
('Devimon', '2017-05-12', true, 11, 5);

INSERT INTO animals(name, date_of_birth, neutered, weight_kg, escape_attempts)
VALUES ('Charmander', '2020-02-08', false, -11, 0),
('Plantmon', '2021-11-15', true, -5.7, 2),
('Squirtle', '1993-04-02', false, -12.13, 3),
('Angemon', '2005-06-12', true, -45, 1),
('Boarmon', '2005-06-07', true, 20.4, 7),
('Blossom', '1998-10-13', true, 17, 3),
('Ditto', '2022-05-14', true, 22, 4);

INSERT INTO owners(full_name, age)
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species(name)
VALUES ('Pokemon'),
('Digimon');

UPDATE animals
SET species_id = 1;

UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';

UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = 2
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owner_id = 3
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = 4
WHERE name = 'Charamander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = 5
WHERE name = 'Boarmon' OR name = 'Angemon';
