/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT date_of_birth FROM animals WHERE name IN ('Pikachu', 'Agumon');
SELECT (name, escape_attempts) FROM animals WHERE weight_kg > 10.5;
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
BEGIN;
UPDATE animals SET species = 'undefined';
ROLLBACK;
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';
COMMIT;
BEGIN;
DELETE FROM animals;
ROLLBACK;
BEGIN;
DELETE FROM animals WHERE date_of_birth < '01-Jan-2020';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

UPDATE animals SET species_id = 1 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 2 WHERE name NOT LIKE '%mon';
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

SELECT full_name, species_id, name, owners.id FROM owners INNER JOIN animals ON owner_id = owners.id WHERE full_name = 'Melody Pond';
SELECT animals.name, species_id, species.name, species.id FROM animals INNER JOIN species ON species_id = species.id WHERE species.name = 'Pokemon';
SELECT full_name, owners.id, animals.name, owner_id FROM owners LEFT JOIN animals ON owner_id = owners.id;
SELECT animals.name, species.name FROM animals INNER JOIN species ON species_id = species.id;
SELECT animals.name, owners.full_name FROM animals INNER JOIN owners ON owner_id = owners.id WHERE species_id = 1 AND owners.full_name = 'Jennifer Orwell';
SELECT animals.name FROM animals INNER JOIN owners ON owner_id = owners.id WHERE full_name = 'Dean Winchester' AND escape_attempts = 0;
SELECT full_name, COUNT(animals) FROM animals INNER JOIN owners ON owners.id = owner_id GROUP BY full_name ORDER BY COUNT(animals) LIMIT 1;