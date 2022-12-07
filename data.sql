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