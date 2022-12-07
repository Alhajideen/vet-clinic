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