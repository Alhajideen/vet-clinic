/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT PRIMARY KEY,
    name varchar(100) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL NOT NULL
);

ALTER TABLE animals
ADD species varchar(100);

-- DAY 3

CREATE TABLE owners(
id INT GENERATED ALWAYS AS IDENTITY
(START WITH 1 INCREMENT BY 1),
full_name VARCHAR(100),
age INT,
PRIMARY KEY(id)
);

CREATE TABLE species(
id INT GENERATED ALWAYS AS IDENTITY
(START WITH 1 INCREMENT BY 1),
name varchar(100),
PRIMARY KEY(id)
);

ALTER TABLE animals 
ALTER COLUMN id TYPE INT GENERATED ALWAYS AS IDENTITY
(START WITH 1 INCREMENT BY 1);

ALTER TABLE animals
DROP COLUMN species;

-- ADD species_id column
ALTER TABLE animals
ADD COLUMN species_id INT;

-- ADD owner_id column
ALTER TABLE animals
ADD COLUMN owner_id INT;

-- ADD FOREIGN KEY CONSTRAINTS
ALTER TABLE animals
ADD CONSTRAINT fk_species
FOREIGN KEY(species_id) 
REFERENCES species(id);

ALTER TABLE animals
ADD CONSTRAINT fk_owner
FOREIGN KEY(owner_id) 
REFERENCES owners(id);

-- Day 4
-- Create a table called vet

CREATE TABLE vets(
id SERIAL NOT NULL PRIMARY KEY,
name CHAR(50),
age INT NOT NULL,
date_of_graduation DATE
);

