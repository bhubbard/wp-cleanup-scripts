-- MySQL query to remove data, tables, and options for the WP All Import (PMXI) plugin.
--
-- WARNING: This query performs destructive database operations.
-- ALWAYS take a full database backup before running it directly on your database.
--
-- The table prefix 'wp_' is used as an example.
-- You MUST adjust this to match your WordPress installation's prefix.

-- 1. Drop Custom Tables
-- This permanently deletes the custom tables used by WP All Import.
DROP TABLE IF EXISTS `wp_pmxi_files`;
DROP TABLE IF EXISTS `wp_pmxi_hash`;
DROP TABLE IF EXISTS `wp_pmxi_history`;
DROP TABLE IF EXISTS `wp_pmxi_images`;
DROP TABLE IF EXISTS `wp_pmxi_imports`;
DROP TABLE IF EXISTS `wp_pmxi_posts`;
DROP TABLE IF EXISTS `wp_pmxi_templates`;

-- 2. Delete Options
-- This removes specific plugin settings from the options table.
DELETE FROM `wp_options`
WHERE `option_name` = 'PMXI_Plugin_Options'
   OR `option_name` = 'pmxi_is_migrated';
