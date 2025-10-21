-- MySQL query to remove data, tables, and options for The Events Calendar (TEC).
--
-- WARNING: This query performs destructive database operations.
-- ALWAYS take a full database backup before running it directly on your database.
--
-- The table prefix 'wp_' is used as an example.
-- You MUST adjust this to match your WordPress installation's prefix.

-- 1. Drop Custom Tables
-- This permanently deletes the custom tables used by The Events Calendar.
DROP TABLE IF EXISTS `wp_tec_events`;
DROP TABLE IF EXISTS `wp_tec_occurrences`;
DROP TABLE IF EXISTS `wp_tec_kv_cache`;
DROP TABLE IF EXISTS `wp_tec_series_relationships`;

-- 2. Delete Options
-- This removes settings from the options table, using both the new 'tec_'
-- prefix and the historical 'tribe_' prefix used by the plugin.
DELETE FROM `wp_options`
WHERE `option_name` LIKE 'tec_%'
   OR `option_name` LIKE 'tribe_%';

-- 3. Delete Usermeta
-- This removes user-specific data and settings for the plugin.
DELETE FROM `wp_usermeta`
WHERE `meta_key` LIKE 'tribe_%';
