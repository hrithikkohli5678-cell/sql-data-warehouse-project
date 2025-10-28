
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
  USE DataWarehouse;

DELIMITER $$

CREATE PROCEDURE load_bronze()
BEGIN
    DECLARE batch_start_time DATETIME DEFAULT NOW();
    DECLARE batch_end_time DATETIME;

    -- ==============================
    -- Start Message
    -- ==============================
    SELECT '============================================' AS msg;
    SELECT 'Loading Bronze Layer - MySQL Version' AS msg;
    SELECT '============================================' AS msg;

    -- ================= CRM TABLES =================
    SELECT '--- Loading CRM Tables ---' AS msg;

    -- crm_cust_info
    TRUNCATE TABLE bronze_crm_cust_info;
    LOAD DATA LOCAL INFILE '/Users/hrithikkohli/Desktop/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
    INTO TABLE bronze_crm_cust_info
    FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
    LINES TERMINATED BY '\n' IGNORE 1 ROWS;
    SELECT CONCAT('Loaded crm_cust_info: ', COUNT(*)) AS msg FROM bronze_crm_cust_info;

    -- crm_prd_info
    TRUNCATE TABLE bronze_crm_prd_info;
    LOAD DATA LOCAL INFILE '/Users/hrithikkohli/Desktop/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
    INTO TABLE bronze_crm_prd_info
    FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
    LINES TERMINATED BY '\n' IGNORE 1 ROWS;
    SELECT CONCAT('Loaded crm_prd_info: ', COUNT(*)) AS msg FROM bronze_crm_prd_info;

    -- crm_sales_details
    TRUNCATE TABLE bronze_crm_sales_details;
    LOAD DATA LOCAL INFILE '/Users/hrithikkohli/Desktop/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
    INTO TABLE bronze_crm_sales_details
    FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
    LINES TERMINATED BY '\n' IGNORE 1 ROWS;
    SELECT CONCAT('Loaded crm_sales_details: ', COUNT(*)) AS msg FROM bronze_crm_sales_details;

    -- ================= ERP TABLES =================
    SELECT '--- Loading ERP Tables ---' AS msg;

    -- erp_loc_a101
    TRUNCATE TABLE bronze_erp_loc_a101;
    LOAD DATA LOCAL INFILE '/Users/hrithikkohli/Desktop/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
    INTO TABLE bronze_erp_loc_a101
    FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
    LINES TERMINATED BY '\n' IGNORE 1 ROWS;
    SELECT CONCAT('Loaded erp_loc_a101: ', COUNT(*)) AS msg FROM bronze_erp_loc_a101;

    -- erp_cust_az12
    TRUNCATE TABLE bronze_erp_cust_az12;
    LOAD DATA LOCAL INFILE '/Users/hrithikkohli/Desktop/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
    INTO TABLE bronze_erp_cust_az12
    FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
    LINES TERMINATED BY '\n' IGNORE 1 ROWS;
    SELECT CONCAT('Loaded erp_cust_az12: ', COUNT(*)) AS msg FROM bronze_erp_cust_az12;

    -- erp_px_cat_g1v2
    TRUNCATE TABLE bronze_erp_px_cat_g1v2;
    LOAD DATA LOCAL INFILE '/Users/hrithikkohli/Desktop/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
    INTO TABLE bronze_erp_px_cat_g1v2
    FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
    LINES TERMINATED BY '\n' IGNORE 1 ROWS;
    SELECT CONCAT('Loaded erp_px_cat_g1v2: ', COUNT(*)) AS msg FROM bronze_erp_px_cat_g1v2;

    -- ================= END =================
    SET batch_end_time = NOW();
    SELECT CONCAT(
        'Bronze load completed in ',
        TIMESTAMPDIFF(SECOND, batch_start_time, batch_end_time),
        ' seconds.'
    ) AS msg;
END $$

DELIMITER ;

