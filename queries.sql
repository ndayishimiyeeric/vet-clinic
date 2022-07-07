/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals 
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals 
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals 
WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete_ditto;
UPDATE animals 
SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT delete_animal;
UPDATE animals 
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals  WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals ON animals.owner_id = owners.id;

SELECT species.name, COUNT(*) FROM species JOIN animals ON animals.species_id = species.id GROUP BY species.name;

SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Jennifer Orwell' AND animals.name LIKE '%mon';

SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.name) FROM owners LEFT JOIN animals ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY COUNT(animals.name) DESC;

-- Who was the last animal seen by William Tatcher?
SELECT animals.name, visits.date_of_visit FROM visits
JOIN animals 
ON animals.id = visits.animal_id
JOIN vets 
ON vets.id = visits.vet_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT DISTINCT animals.name FROM visits
JOIN animals 
ON animals.id = visits.animal_id
JOIN vets 
ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name as vet_name, species.name as specialities FROM vets
JOIN specializations 
ON vets.id = specializations.vet_id OR vets.id != specializations.vet_id
JOIN species 
ON specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name, visits.date_of_visit FROM visits
JOIN animals 
ON animals.id = visits.animal_id
JOIN vets 
ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez' 
AND date_of_visit > '2020-04-01' 
AND date_of_visit < '2020-08-30';

-- What animal has the most visits to vets?
SELECT animals.name, count(animals.name) FROM visits
JOIN animals 
ON animals.id = visits.animal_id
GROUP BY (animals.name)
ORDER BY count(animals.name) DESC;

-- Who was Maisy Smith's first visit?
SELECT animals.name, visits.date_of_visit FROM visits
JOIN animals 
ON animals.id = visits.animal_id
JOIN vets 
ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit ASC
LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.*, vets.*, visits.date_of_visit FROM visits
JOIN animals 
ON animals.id = visits.animal_id
JOIN vets 
ON vets.id = visits.vet_id
ORDER BY visits.date_of_visit DESC
LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT count(*) FROM visits
JOIN animals 
ON animals.id = visits.animal_id
JOIN vets 
ON vets.id = visits.vet_id
WHERE animals.species_id NOT IN (SELECT species_id FROM specializations WHERE vet_id = vets.id);

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name as speciality, count(*) FROM visits
JOIN animals 
ON animals.id = visits.animal_id
JOIN species 
ON animals.species_id = species.id
JOIN vets 
ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name;
