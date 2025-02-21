CREATE DATABASE Library
USE Library

CREATE TABLE Themes (
	id int PRIMARY KEY identity(1, 1),
	name nvarchar(50) UNIQUE)

CREATE TABLE Country (
	id int PRIMARY KEY identity(1, 1),
	name nvarchar(50) UNIQUE)

CREATE TABLE Authors (
	id int PRIMARY KEY identity(1, 1),
	firstname nvarchar(50) UNIQUE,
	lastname nvarchar(50) UNIQUE,
	id_country int REFERENCES Country(id))

CREATE TABLE Shops (
	id int PRIMARY KEY identity(1, 1),
	name nvarchar(50) UNIQUE,
	id_country int REFERENCES Country(id))

CREATE TABLE Books (
	id int PRIMARY KEY identity(1, 1),
	name nvarchar(50) UNIQUE,
	id_theme int REFERENCES Themes(id),
	id_author int REFERENCES Authors(id),
	price money,
	date_of_publish DATE,
	pages int)

CREATE TABLE Sales (
	id int PRIMARY KEY identity(1, 1),
	id_book int REFERENCES Books(id),
	date_of_sale DATE,
	price money,
	quantity int,
	id_shop int REFERENCES Shops(id))
