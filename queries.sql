/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE EXTRACT(year from date_of_birth) BETWEEN 2016 AND 2019;
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- UPDATE SPECIES;
BEGIN;

UPDATE animals 
SET species= 'unspecified';

-- check if update was successful
SELECT species from animas;

ROLLBACK;

-- A NEW TRANSACTION
BEGIN;

UPDATE animals
SET species='digimon' 
WHERE name LIKE '%mon';

UPDATE animals
SET species='' 
WHERE species=digimon;

-- Delete all records from animals
BEGIN;

DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- INSIDE A TRANSACTION
BEGIN;

DELETE FROM animals
WHERE date_of_birth > timestamp '2022-01-01 00:00:00';

UPDATE animals
SET weight_kg=weight_kg*-1;

UPDATE animals
SET weight_kg=weight_kg*-1
WHERE weight_kg<0;

-- How many animals are there?
SELECT COUNT(*) FROM animals;
-- How many animals have never tried to escape?
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts=0;
-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT MAX(COUNT(neutered) FROM animals GROUP BY neutered);
-- What is the minimum and maximum weight of each type of animal?
SELECT  species,max(weight_kg),min(weight_kg) FROM animals GROUP BY species;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT name, AVG(escape_attempts) FROM animals WHERE  date_of_birth> '1990-01-01 00:00:00' AND date_of_birth < '2000-12-31 12:00:00' GROUP BY name;

-- DAY 3
--1)
SELECT name,
full_name
FROM 
animals a
INNER JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';

-- 2)
SELECT *
FROM animals a
INNER JOIN species s
ON a.species_id = s.id
WHERE s.name='Pokemon';

-- 3)
SELECT
name,
date_of_birth,
neutered,
weight_kg,
full_name,
age
 FROM animals a
INNER JOIN owners o
ON  o.id = a.owner_id;

-- 4)

SELECT COUNT(a.name), s.name
FROM animals a
INNER JOIN species s ON a.species_id = s.id
GROUP BY s.name;

-- 5)
SELECT
name,
full_name
FROM animals a
INNER JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Jennifer Orwell' AND name Like '%mon';

-- 6)
SELECT
name,
full_name
FROM animals a
INNER JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' and escape_attempts=0;

-- 7)
SELECT o.full_name ,
COUNT(a.owner_id)
FROM animals a
INNER JOIN owners o ON o.id = a.owner_id
GROUP BY o.full_name;
