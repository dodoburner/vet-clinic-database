/* Database schema to keep the structure of entire database. */

 CREATE TABLE animals(
    id INT, 
    name TEXT,
    date_of_birth DATE, 
    escape_attempts INT, 
    neutered BOOLEAN, 
    weight_kg DECIMAL,
    PRIMARY KEY(id)
);
ALTER TABLE animals ADD COLUMN species text;
ALTER TABLE animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD CONSTRAINT species_fk FOREIGN KEY (species_id) REFERENCES species (id);

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name TEXT, age INT
);
ALTER TABLE owners ADD PRIMARY KEY (id);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT
);
ALTER TABLE species ADD PRIMARY KEY (id);

CREATE TABLE vets (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
    name TEXT, 
    age INT, 
    date_of_graduation DATE
);

CREATE TABLE specializations (
    species_id INT, 
    vet_id INT
);
ALTER TABLE specializations ADD PRIMARY KEY (species_id, vet_id);
ALTER TABLE specializations ADD CONSTRAINT species_fk FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE specializations ADD CONSTRAINT vets_fk FOREIGN KEY (vet_id) REFERENCES vets (id);

CREATE TABLE visits (
    animal_id INT, 
    vet_id INT,
    date_of_visit DATE
);
ALTER TABLE visits ADD PRIMARY KEY (animal_id, vet_id, date_of_visit);
ALTER TABLE visits ADD CONSTRAINT animals_fk FOREIGN KEY (animal_id) REFERENCES animals (id);
ALTER TABLE visits ADD CONSTRAINT vets_k FOREIGN KEY (vet_id) REFERENCES vets (id);
