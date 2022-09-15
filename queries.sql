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
DELETE FROM animals WHERE date_of_birth > '01-Jan-2022';
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

SELECT full_name, name FROM owners INNER JOIN animals ON owner_id = owners.id WHERE full_name = 'Melody Pond';
SELECT animals.name FROM animals INNER JOIN species ON species_id = species.id WHERE species.name = 'Pokemon';
SELECT full_name, animals.name, FROM owners LEFT JOIN animals ON owner_id = owners.id;
SELECT COUNT(animals), species.name FROM animals INNER JOIN species ON species_id = species.id GROUP BY species.name;
SELECT animals.name FROM animals INNER JOIN owners ON owner_id = owners.id WHERE species_id = 1 AND owners.full_name = 'Jennifer Orwell';
SELECT animals.name FROM animals INNER JOIN owners ON owner_id = owners.id WHERE full_name = 'Dean Winchester' AND escape_attempts = 0;
SELECT full_name, COUNT(animals) FROM animals INNER JOIN owners ON owners.id = owner_id GROUP BY full_name ORDER BY COUNT(animals) DESC LIMIT 1;

SELECT animals.name, date_of_visit FROM animals
INNER JOIN visits ON animal_id = animals.id
WHERE vet_id = (SELECT id FROM vets WHERE name = 'William Tatcher')
ORDER BY date_of_visit DESC LIMIT 1;

SELECT animals.name FROM animals
INNER JOIN visits ON animal_id = animals.id
WHERE vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez');

SELECT vets.name, (SELECT species.name FROM species WHERE species_id = species.id)
FROM vets LEFT JOIN specializations ON vet_id = vets.id;

SELECT animals.name FROM animals 
INNER JOIN visits ON animal_id = animals.id
WHERE (vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez'))
AND date_of_visit BETWEEN '01-Apr-2020' AND '30-Aug-2020';

SELECT animals.name, COUNT(animal_id) FROM animals
INNER JOIN visits ON animal_id = animals.id
GROUP BY animals.name
ORDER BY COUNT(animal_id) DESC LIMIT 1;

SELECT * FROM animals
JOIN visits ON animal_id = animals.id
JOIN vets ON visits.vet_id = vets.id
ORDER BY date_of_visit DESC LIMIT 1;

SELECT animals.name FROM animals
INNER JOIN visits ON animal_id = animals.id
WHERE vet_id = (SELECT id FROM vets WHERE name = 'Maisy Smith')
ORDER BY date_of_visit LIMIT 1;

SELECT COUNT(*) FROM visits
JOIN animals ON animals.id = visits.animal_id
JOIN specializations ON specializations.vet_id = visits.vet_id
AND specializations.species_id != animals.species_id;

SELECT species.name, COUNT(*) FROM species
JOIN animals ON animals.species_id = species.id
JOIN vets ON vets.name = 'Maisy Smith'
JOIN visits ON visits.animal_id = animals.id AND visits.vet_id = vets.id
GROUP BY species.name
ORDER BY COUNT(*) DESC LIMIT 1;



