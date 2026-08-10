/*
===============================================================================
Create Database and Schemas
===============================================================================

Script Purpose:
    This script creates the 'DataWarehouse' database and initializes the
    Bronze, Silver, and Gold schemas following the Medallion Architecture.

    If the 'DataWarehouse' database already exists, it is dropped and
    recreated to ensure a clean environment.

WARNING:
    This script will permanently delete the existing 'DataWarehouse'
    database, including all data and database objects.

    Use this script only in a development or test environment and ensure
    proper backups are available before execution.
===============================================================================
*/

-- Create Database
USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

-- Create Schemas
USE DataWarehouse;
GO

-- Create the Bronze schema for raw/source data
CREATE SCHEMA bronze;
GO

-- Create the Silver schema for cleaned/transformed data
CREATE SCHEMA silver;
GO

-- Create the Gold schema for business-ready data
CREATE SCHEMA gold;
GO
