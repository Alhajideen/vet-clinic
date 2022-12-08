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

-- Many-to-many JOIN TABLE for species and vets
CREATE TABLE specializations(
vets_id INT NOT NULL,
species_id INT NOT NULL,
CONSTRAINT fk_species 
FOREIGN KEY (species_id) 
REFERENCES species(id),
CONSTRAINT fk_vets
FOREIGN KEY (vets_id)
REFERENCES vets(id)
);

-- Many-to-many JOIN TABLE for animals and vets
CREATE TABLE visits(
date DATE,
vets_id INT NOT NULL,
animals_id INT NOT NULL,
CONSTRAINT fk_animals
FOREIGN KEY (animals_id) 
REFERENCES animals(id),
CONSTRAINT fk_vets
FOREIGN KEY (vets_id)
REFERENCES vets(id)
);

-- Insert data in Visits

INSERT INTO visits (animals_id, vets_id, date) 
VALUES 
((SELECT id FROM animals WHERE name = 'Agumon'),
(SELECT id FROM vets WHERE name = 'William Tatcher'),
'2020-05-24'),
((SELECT id FROM animals WHERE name = 'Agumon'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
'2020-07-22'),
((SELECT id FROM animals WHERE name = 'Gabumon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'),
'2021-02-02'),
((SELECT id FROM animals WHERE name = 'Pikachu'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'2020-01-05'),
((SELECT id FROM animals WHERE name = 'Pikachu'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'2020-03-08'),
((SELECT id FROM animals WHERE name = 'Pikachu'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'2020-05-14'),
((SELECT id FROM animals WHERE name = 'Devimon'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
'2021-05-04'),
((SELECT id FROM animals WHERE name = 'Charmander'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'),
'2021-02-24'),
((SELECT id FROM animals WHERE name = 'Plantmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'2019-12-21'),
((SELECT id FROM animals WHERE name = 'Plantmon'),
(SELECT id FROM vets WHERE name = 'William Tatcher'),
'2020-08-10'),
((SELECT id FROM animals WHERE name = 'Plantmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'2021-04-07'),
((SELECT id FROM animals WHERE name = 'Squirtle'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
'2019-09-29'),
((SELECT id FROM animals WHERE name = 'Angemon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'),
'2020-10-03'),
((SELECT id FROM animals WHERE name = 'Angemon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'),
'2020-11-04'),
((SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'2019-01-24'),
((SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'2019-05-15'),
((SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'2020-02-27'),
((SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'2020-08-03'),
((SELECT id FROM animals WHERE name = 'Blossom'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
'2020-05-24'),
((SELECT id FROM animals WHERE name = 'Blossom'),
(SELECT id FROM vets WHERE name = 'William Tatcher'),
'2021-01-11');

