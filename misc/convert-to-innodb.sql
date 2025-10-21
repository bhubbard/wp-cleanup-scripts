-- ---------------------------------------------------------------------------------
-- SQL Script to Generate InnoDB Conversion Commands
--
-- Author:      Gemini
-- Created:     2025-10-21
--
-- Description:
-- This script generates the necessary 'ALTER TABLE' commands to convert all
-- tables in the *currently selected database* to the InnoDB storage engine.
--
-- It identifies any tables (BASE TABLE type only) that are not already 'InnoDB'
-- (e.g., MyISAM) and outputs the SQL command needed to convert them.
--
-- ---------------------------------------------------------------------------------
--
-- IMPORTANT: HOW TO USE THIS SCRIPT (TWO-STEP PROCESS)
--
-- 1.  **Select Your Database:**
--     You MUST run this command first to target the correct database:
--
--     USE `your_database_name_here`;
--
-- 2.  **Run This Script:**
--     Execute the SELECT query below. This will NOT alter any tables.
--     It will only *generate* a list of commands as its output.
--
-- 3.  **Run the OUTPUT:**
--     Copy the text output from Step 2 (it will look like a list of
--     'ALTER TABLE...' commands) and run that text as a new query.
--     This final step performs the actual table conversions.
--
-- ---------------------------------------------------------------------------------
--
-- WARNING: ⚠️ DATABASE MODIFICATION
--
-- ALWAYS take a full database backup before running any schema-altering
-- commands (i.e., the output from this script).
--
-- Converting large tables can be time-consuming and may lock tables
-- temporarily, impacting your site's availability.
--
-- ---------------------------------------------------------------------------------

-- Step 1 (Reminder): Run this first in your SQL client.
-- USE `your_database_name_here`;


-- Step 2: Run this query to generate the commands.
SELECT
  CONCAT('ALTER TABLE `', table_name, '` ENGINE=InnoDB;') AS 'Generated_InnoDB_Conversion_Command'
FROM
  `information_schema`.`tables`
WHERE
  -- Ensures we only check tables in the currently selected database.
  `table_schema` = DATABASE()
  -- Finds any tables that are NOT already InnoDB.
  AND `engine` != 'InnoDB'
  -- Excludes VIEWs, focusing only on actual data tables.
  AND `table_type` = 'BASE TABLE';

-- Step 3: Copy the output from the query above and run it.
