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