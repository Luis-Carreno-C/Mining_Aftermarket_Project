/*
Script de creacion de las tablas incluidas en la bronze layer, con metodo revisar, drop y re-crear
*/

IF OBJECT_ID ('contract_lines', 'U') IS NOT NULL
	DROP TABLE contract_lines;
CREATE TABLE contract_lines (
	contract_id				      NVARCHAR (50),
	product_id		        	  NVARCHAR (50),
	contract_unit_price_usd		  DECIMAL(18,2),
	min_order_qty		          INT,
	max_discount_pct	          DECIMAL(18,3)
);


IF OBJECT_ID ('contracts', 'U') IS NOT NULL
	DROP TABLE contracts;
CREATE TABLE contracts (
  contract_id		            NVARCHAR (50),
  customer_id			        NVARCHAR (50),
  contract_type		      		NVARCHAR (50),
  start_date	            	DATE,
  end_date		            	DATE,
  currency	               		NVARCHAR (50),
  price_adjustment_clause   	NVARCHAR (50),
  discount_pct              	DECIMAL(3,3),
  target_margin_pct         	DECIMAL(3,3),
  status                    	NVARCHAR (50)
);

IF OBJECT_ID ('customers', 'U') IS NOT NULL
	DROP TABLE customers;
CREATE TABLE customers (
	customer_id		    NVARCHAR (50),
	customer_group		NVARCHAR (50),
	site_name		    NVARCHAR (50),
	city	            NVARCHAR (50),
	commodity	      	NVARCHAR (50),
	segment		        NVARCHAR (50),
	account_tier	  	NVARCHAR (50),
	country	          	NVARCHAR (50)
);

IF OBJECT_ID ('demand_forecast', 'U') IS NOT NULL
	DROP TABLE demand_forecast;
CREATE TABLE demand_forecast (
	forecast_month		    DATE,
	customer_id		        NVARCHAR (50),
	product_id		        NVARCHAR (50),
	forecast_qty	        INT,
	forecast_revenue_usd	DECIMAL(18,2),
	forecast_version		NVARCHAR (50),
	confidence_level	  	NVARCHAR (50),
);

IF OBJECT_ID ('equipment_installed_base', 'U') IS NOT NULL
	DROP TABLE equipment_installed_base;
CREATE TABLE equipment_installed_base (
	equipment_id		    	  NVARCHAR (50),
	customer_id	       		      NVARCHAR (50),
  	site_name		              NVARCHAR (50),
	equipment_family	          NVARCHAR (50),
	equipment_model	              NVARCHAR (50),
	install_year		          INT,
	condition_status	  	      NVARCHAR (50),
  	avg_monthly_operating_hours   INT,
  	next_shutdown_date            DATE
);

IF OBJECT_ID ('exchange_rates', 'U') IS NOT NULL
	DROP TABLE exchange_rates;
CREATE TABLE exchange_rates (
	rate_month		    DATE,
	usd_clp	          	DECIMAL(10,2),
	eur_usd		        DECIMAL(10,2),
	cpi_monthly_pct	  	DECIMAL(10,2),
	freight_index	    DECIMAL(10,2)
);

IF OBJECT_ID ('inventory_snapshot', 'U') IS NOT NULL
	DROP TABLE inventory_snapshot;
CREATE TABLE inventory_snapshot (
  snapshot_month	   DATE,
  warehouse_id	       NVARCHAR (50),
  warehouse_name	   NVARCHAR (50),
  product_id		   NVARCHAR (50),
  available_qty	       INT,
  reserved_qty         INT,
  on_order_qty         INT,
  reorder_point_qty    INT,
  safety_stock_qty     INT,
  stock_value_usd      DECIMAL(18,2)
);

IF OBJECT_ID ('product_costs', 'U') IS NOT NULL
	DROP TABLE product_costs;
CREATE TABLE product_costs (
  cost_month		   DATE,
  product_id	       NVARCHAR (50),
  supplier_id	  	   NVARCHAR (50),
  standard_cost_usd    DECIMAL(18,2),
  updated_cost_usd     DECIMAL(18,2), 
  cost_source          NVARCHAR (50),
);

IF OBJECT_ID ('products', 'U') IS NOT NULL
	DROP TABLE products;
CREATE TABLE products (
  product_id			 VARCHAR (50),
  sku	            	 VARCHAR (50),
  product_name  		 NVARCHAR (50),
  equipment_family 		 NVARCHAR (50),
  product_family    	 NVARCHAR (50),
  criticality      	  	 NVARCHAR (50),
  uom               	 VARCHAR (50),
  list_price_usd    	 DECIMAL(18,2),
  standard_cost_usd 	 DECIMAL(18,2),
  is_mto             	 INT,
  lifecycle_status   	 VARCHAR (50),
);


IF OBJECT_ID ('purchase_orders', 'U') IS NOT NULL
	DROP TABLE purchase_orders;
CREATE TABLE purchase_orders (
  purchase_order_id	       VARCHAR (50),
  po_line_id               VARCHAR (50),
  order_date               DATE,
  supplier_id              VARCHAR (50),
  product_id               VARCHAR (50),
  warehouse_id             VARCHAR (50),
  ordered_qty              INT,
  received_qty             INT,
  unit_cost_usd            DECIMAL(10,2),
  expected_receipt_date    DATE,
  actual_receipt_date      DATE,
  po_status                VARCHAR(50),
  lead_time_days           INT,
  expedite_flag            INT
);

IF OBJECT_ID ('sales_orders', 'U') IS NOT NULL
	DROP TABLE sales_orders;
CREATE TABLE sales_orders (
	sales_order_id			VARCHAR(50),
	sales_order_line_id		VARCHAR(50),
	order_date 				DATE,
	customer_id				VARCHAR(50),
	site_name				NVARCHAR(50),
	product_id				VARCHAR(50),
	contract_id				VARCHAR(50),
	order_qty				INT,
	unit_price_usd			DECIMAL(18,2),
	unit_cost_usd			DECIMAL(18,2),
	revenue_usd				DECIMAL(18,2),
	gross_margin_usd		DECIMAL(18,2),
	gross_margin_pct		DECIMAL(10,3),
	requested_date			DATE,
	promised_date			DATE,
	shipped_date			DATE,	
	order_status			VARCHAR(50),
	sales_channel			VARCHAR(50)
);

IF OBJECT_ID ('suppliers', 'U') IS NOT NULL
	DROP TABLE suppliers;
CREATE TABLE suppliers (
	supplier_id				VARCHAR(50),
	supplier_name			NVARCHAR(50),
	country					VARCHAR(50),
	default_lead_time_days	INT,
	supplier_type			VARCHAR(50),
	currency				VARCHAR(50)
);
