/* Populate database with sample data. */

/* animals */
INSERT INTO animals VALUES (1, 'Agumon', '03-Jan-2020', 0, 10.23, TRUE);
INSERT INTO animals VALUES (2, 'Gabumon', '15-Nov-2018', 2, 8, TRUE);
INSERT INTO animals VALUES (3, 'Pikachu', '07-Jan-2021', 1, 15.04, FALSE);
INSERT INTO animals VALUES (4, 'Devimon', '12-May-2017', 5, 11, TRUE);
INSERT INTO animals VALUES (5, 'Charmander', '08-Feb-2020', 0, 11, FALSE);
INSERT INTO animals VALUES (6, 'Plantmon', '15-Nov-2021', 2, 5.7, TRUE);
INSERT INTO animals VALUES (7, 'Squirtle', '02-Apr-1993', 3, 12.13, FALSE);
INSERT INTO animals VALUES (8, 'Angemon', '12-Jul-2005', 1, 45, TRUE);
INSERT INTO animals VALUES (9, 'Boarmon', '7-Jun-2005', 7, 20.4, TRUE);
INSERT INTO animals VALUES (10, 'Blossom', '13-Oct-1998', 3, 17, TRUE);
INSERT INTO animals VALUES (11, 'Ditto', '14-May-2022', 4, 22, TRUE);

/* owners */
INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES('Bob', 45);
INSERT INTO owners(full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES('Jodie Whittaker', 38);

/* species */
INSERT INTO species(name) VALUES('Digimon');
INSERT INTO species(name) VALUES('Pokemon');

UPDATE animals
   SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
   WHERE name LIKE '%mon';
UPDATE animals
   SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
   WHERE name NOT LIKE '%mon';
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';
