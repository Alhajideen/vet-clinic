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