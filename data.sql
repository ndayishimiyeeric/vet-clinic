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
