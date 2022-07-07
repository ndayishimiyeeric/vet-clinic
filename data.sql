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

INSERT INTO vets(name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations(species_id, vet_id)
VALUES (1, 1),
(2, 3),
(1, 3),
(2, 4);

INSERT INTO visits(animal_id, vet_id, date_of_visit)
VALUES (1, 1, '2020-05-24'),
(1, 3, '2020-07-22'),
(2, 4, '2021-02-02'),
(3, 2, '2020-01-05'),
(3, 2, '2020-03-08'),
(3, 2, '2020-05-14'),
(4, 3, '2021-05-04'),
(5, 4, '2021-02-24'),
(6, 2, '2019-12-21'),
(6, 1, '2020-08-10'),
(6, 2, '2021-04-07'),
(7, 3, '2019-09-29'),
(8, 4, '2020-10-03'),
(8, 4, '2020-11-04'),
(9, 2, '2019-01-24'),
(9, 2, '2019-05-15'),
(9, 2, '2020-02-27'),
(9, 2, '2020-08-03'),
(10, 3, '2020-05-24'),
(10, 1, '2021-01-11');
