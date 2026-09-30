/*
===============================================================================
Stored Procedure: Load Bronze
===============================================================================
Script Purpose:
    Stored procedure usado para cargar la informacion de los archivos CSV. 
    It performs the following actions:
    - Trunca las tablas antes de cargar datos.
    - se ingresan los datos en modo `BULK INSERT.

Parameters: N/A
Este stored procedure no acepta ningun parametro ni genera ningun valor en su respuesta.

Uso: EXEC dbo.load_bronze;
===============================================================================
*/

CREATE OR ALTER PROCEDURE dbo.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '================================================';
		PRINT 'Loading Source';
		PRINT '================================================';

		SET @start_time = GETDATE();
		TRUNCATE TABLE dbo.contract_lines;
		BULK INSERT dbo.contract_lines
		FROM 'C:\Users\luisc\OneDrive\Documentos\Proyectos\Epiroc\mining_aftermarket_synthetic_csv_raw\contract_lines.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

    TRUNCATE TABLE dbo.contracts;
		BULK INSERT dbo.contracts
		FROM 'C:\Users\luisc\OneDrive\Documentos\Proyectos\Epiroc\mining_aftermarket_synthetic_csv_raw\contracts.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

    TRUNCATE TABLE dbo.customers;
		BULK INSERT dbo.customers
		FROM 'C:\Users\luisc\OneDrive\Documentos\Proyectos\Epiroc\mining_aftermarket_synthetic_csv_raw\customers.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

    TRUNCATE TABLE dbo.demand_forecast;
		BULK INSERT dbo.demand_forecast
		FROM 'C:\Users\luisc\OneDrive\Documentos\Proyectos\Epiroc\mining_aftermarket_synthetic_csv_raw\demand_forecast.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

    TRUNCATE TABLE dbo.equipment_installed_base;
		BULK INSERT dbo.equipment_installed_base
		FROM 'C:\Users\luisc\OneDrive\Documentos\Proyectos\Epiroc\mining_aftermarket_synthetic_csv_raw\equipment_installed_base.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

    TRUNCATE TABLE dbo.exchange_rates;
		BULK INSERT dbo.exchange_rates
		FROM 'C:\Users\luisc\OneDrive\Documentos\Proyectos\Epiroc\mining_aftermarket_synthetic_csv_raw\exchange_rates.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

    TRUNCATE TABLE dbo.inventory_snapshot;
		BULK INSERT dbo.inventory_snapshot
		FROM 'C:\Users\luisc\OneDrive\Documentos\Proyectos\Epiroc\mining_aftermarket_synthetic_csv_raw\inventory_snapshot.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

    TRUNCATE TABLE dbo.product_costs;
		BULK INSERT dbo.product_costs
		FROM 'C:\Users\luisc\OneDrive\Documentos\Proyectos\Epiroc\mining_aftermarket_synthetic_csv_raw\product_costs.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

    TRUNCATE TABLE dbo.products;
		BULK INSERT dbo.products
		FROM 'C:\Users\luisc\OneDrive\Documentos\Proyectos\Epiroc\mining_aftermarket_synthetic_csv_raw\products.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

    TRUNCATE TABLE dbo.purchase_orders;
		BULK INSERT dbo.purchase_orders
		FROM 'C:\Users\luisc\OneDrive\Documentos\Proyectos\Epiroc\mining_aftermarket_synthetic_csv_raw\purchase_orders.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

    TRUNCATE TABLE dbo.sales_orders;
		BULK INSERT dbo.sales_orders
		FROM 'C:\Users\luisc\OneDrive\Documentos\Proyectos\Epiroc\mining_aftermarket_synthetic_csv_raw\sales_orders.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

    TRUNCATE TABLE dbo.suppliers;
		BULK INSERT dbo.suppliers
		FROM 'C:\Users\luisc\OneDrive\Documentos\Proyectos\Epiroc\mining_aftermarket_synthetic_csv_raw\suppliers.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);


		SET @batch_end_time = GETDATE();
		PRINT '=========================================='
		PRINT 'Source Layer Completed';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '=========================================='

END TRY
      
	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
      
END
