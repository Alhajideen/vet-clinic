/* Populate database with sample data. */


INSERT INTO animals(id,name,
date_of_birth,escape_attempts,
neutered,weight_kg) VALUES (1,
'Agumon', '2020-02-03',0,true,10.23);


INSERT INTO animals(id,name,
date_of_birth,escape_attempts,
neutered,weight_kg) VALUES (2,
'Gabumon', '2018-11-15',2,true,8);

INSERT INTO animals(id,name,
date_of_birth,escape_attempts,
neutered,weight_kg) VALUES (3,
'Pikachu', '2021-06-07',1,false,15.04);

INSERT INTO animals(id,name,
date_of_birth,escape_attempts,
neutered,weight_kg) VALUES (4,
'Devimon', '2017-05-12',5,true,11);

-- DAY 2

INSERT INTO animals(id,name,
date_of_birth,escape_attempts,
neutered,weight_kg) VALUES (5,
'Charmander', '2020-02-08',0,false,11);

-- ADDING MULTIPLE COLUMNS AT ONCE
INSERT INTO animals (id,name,
date_of_birth,weight_kg,neutered,escape_attempts)
VALUES 
(6,'Plantmon','2021-11-15',5.7,true,2),
(7,'Squirtle','1993-04-02',12.13,false,3),
(8,'Angemon','2005-06-12',45,true,1),
(9,'Boarmon','2005-06-07',20.4,true,7),
(10,'Blossom','1998-10-13',17,true,3),
(11,'Ditto','2002-05-14',22,true,4);

-- DAY 3

-- INSER DATA IN owners TABLE

INSERT INTO owners 
(id,full_name,age)
VALUES
(DEFAULT,'Sam Smith',34),
(DEFAULT,'Jennifer Orwell',19),
(DEFAULT,'Bob',45),
(DEFAULT,'Melody Pond',77),
(DEFAULT,'Dean Winchester',14),
(DEFAULT,'Jodie Whittaker',38);

-- INSERT DATA IN Digimon TABLE

INSERT INTO species
(id,name)
VALUES
(DEFAULT, 'Pokemon'),
(DEFAULT, 'Digimon');

-- UPDATE species_id column

UPDATE animals
SET species_id = 2
WHERE name Like '%mon'

UPDATE animals
SET species_id=1
WHERE species_id IS NULL;

-- UPDATE owners_id column
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name IN ('Agumon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon','Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon','Boarmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander','Squirtle','Blossom');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon','Plantmon');

-- DAY 4

-- Insert into vets TABLE
INSERT INTO vets (name, age, date_of_graduation) 
VALUES 
('William Tatcher', 45, '04-23-2000'),
('Maisy Smith', 26, '01-17-2019'),
('Stephanie Mendez', 64, '05-04-1981'),
('Jack Harkness', 38, '06-08-2008');