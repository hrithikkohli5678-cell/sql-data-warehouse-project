/*
ニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニ
Create Database and Schemas
ニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニニ
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze' , 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'Datawarehouse' database if it exists.
    All data in the database will be permanently deleted. Proceed with caution and ensure you have proper backups before running this script.
*/

-- Create the database
CREATE DATABASE DataWarehouse;

-- Use the new database
USE DataWarehouse;

-- Simulate schemas with table names
CREATE TABLE bronze_example (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE silver_example (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE gold_example (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);
