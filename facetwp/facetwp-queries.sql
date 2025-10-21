-- MySQL query to delete all options created by the FacetWP plugin.
--
-- WARNING: This query performs destructive database operations.
-- ALWAYS take a full database backup before running it directly on your database.
--
-- The table prefix 'wp_' is used as an example based on previous context.
-- You MUST adjust this to match your WordPress installation's prefix (e.g., 'wp_').

-- 1. Delete Options
-- This finds and removes all options that begin with 'facetwp_', which are typically settings.
DELETE FROM `wp_options` WHERE `option_name` LIKE 'facetwp_%';
