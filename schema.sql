/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
id INT GENERATED ALWAYS AS IDENTITY,
name varchar(100),
date_of_birth DATE,
escape_attempts INT,
neutered BOOLEAN,
weight_kg DECIMAL,
PRIMARY KEY(id));

ALTER TABLE animals ADD species varchar(200);

CREATE TABLE owners(
id INT GENERATED ALWAYS AS IDENTITY,
full_name varchar(250),
age INT,
PRIMARY KEY(id));

CREATE TABLE species(
id INT GENERATED ALWAYS AS IDENTITY,
name varchar(200),
PRIMARY KEY(id));

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD species_id INT;

ALTER TABLE animals
ADD CONSTRAINT species_key
FOREIGN KEY (species_id)
REFERENCES species(id);

ALTER TABLE animals
ADD owner_id INT;

ALTER TABLE animals
ADD CONSTRAINT owners_key
FOREIGN KEY (owner_id)
REFERENCES owners(id);

CREATE TABLE vets(
id INT GENERATED ALWAYS AS IDENTITY,
name varchar(200),
age INT,
date_of_graduation DATE,
PRIMARY KEY(id));

CREATE TABLE specializations(
species_id INT,
vet_id INT);

ALTER TABLE specializations
ADD CONSTRAINT species_key
FOREIGN KEY (species_id)
REFERENCES species(id);

ALTER TABLE specializations
ADD CONSTRAINT vet_key
FOREIGN KEY (vet_id)
REFERENCES vets(id);

CREATE TABLE visits(
animal_id INT,
vet_id INT,
date_of_visit DATE);

ALTER TABLE visits
ADD CONSTRAINT animal_key
FOREIGN KEY (animal_id)
REFERENCES animals(id);

ALTER TABLE visits
ADD CONSTRAINT vet_key
FOREIGN KEY (vet_id)
REFERENCES vets(id);
