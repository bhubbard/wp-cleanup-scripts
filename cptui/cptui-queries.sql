-- MySQL query to delete all options created by the Custom Post Type UI (CPTUI) plugin.
--
-- WARNING: This query performs destructive database operations.
-- ALWAYS take a full database backup before running it directly on your database.
--
-- The table prefix 'wp_' is used as an example based on previous context.
-- You MUST adjust this to match your WordPress installation's prefix (e.g., 'wp_').

-- 1. Delete CPTUI Options
-- This finds and removes all options that begin with 'cptui_', which are typically settings
-- for post types and taxonomies created with the CPTUI plugin.
DELETE FROM `wp_options` WHERE `option_name` LIKE 'cptui_%';
