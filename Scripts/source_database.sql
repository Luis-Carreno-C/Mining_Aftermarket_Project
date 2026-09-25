/*
Creacion de base de datos

Objetivo:

Este script crea una nueva base de datos llamada 'Datasource' después de verificar si ya existe.
Si la base de datos existe, se elimina y se vuelve a crear.

ADVERTENCIA:
Al ejecutar este script se eliminará completamente la base de datos 'DataWarehouse' si ya existe.
Todos los datos en la base de datos serán eliminados permanentemente. Proceder con precaución
y asegúrese de tener respaldos adecuados antes de ejecutar este script.

*/
USE master
GO

-- Drop and recreate the 'DataSource' database
IF EXISTS (SELECT 1  FROM sys.databases WHERE name = 'DataSource')
BEGIN
	ALTER DATABASE DataSource SET SINGLE_USER  WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataSource;
END;
GO

-- Create the 'DataSource' database
CREATE DATABASE DataSource;
GO
