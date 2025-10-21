-- MySQL query to delete all options AND drop the index table created by the FacetWP plugin.
--
-- WARNING: This query performs destructive database operations.
-- ALWAYS take a full database backup before running it directly on your database.
--
-- The table prefix 'wp_' is used as an example.
-- You MUST adjust this to match your WordPress installation's prefix.

-- 1. Delete Options
-- This finds and removes all options that begin with 'facetwp_', which are
-- typically settings, rules, and cache data.
DELETE FROM `wp_options` WHERE `option_name` LIKE 'facetwp_%';

-- 2. Drop Index Table
-- This permanently deletes the custom index table used by FacetWP.
DROP TABLE IF EXISTS `wp_facetwp_index`;
