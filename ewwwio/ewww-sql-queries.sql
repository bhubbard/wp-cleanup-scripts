-- MySQL queries to clean up database tables and options from the EWWW Image Optimizer plugin.
--
-- WARNING: These queries perform destructive database operations.
-- ALWAYS take a full database backup before running them directly on your database.
--
-- You may need to replace the table prefix `wp_` if your WordPress installation uses a different one.

-- 1. Drop the ewwwio_images table
-- This table stores information about the images that have been optimized.
DROP TABLE IF EXISTS `wp_ewwwio_images`;

-- 2. Drop the ewwwio_queue table
-- This table holds images that are waiting to be optimized in the background.
DROP TABLE IF EXISTS `wp_ewwwio_queue`;

-- 3. Delete options with a specific pattern
-- This removes all settings and configuration data for the EWWW IO plugin from the options table.
DELETE FROM `wp_options` WHERE `option_name` LIKE 'ewww_%';
