-- MySQL query to delete options and tables for the Stream plugin.
--
-- WARNING: This query performs destructive database operations.
-- ALWAYS take a full database backup before running it directly on your database.
--
-- The table prefix 'wp_' is used as an example.
-- You MUST adjust this to match your WordPress installation's prefix.

-- 1. Delete Options
-- This finds and removes all options that begin with 'wp_stream_'.
DELETE FROM `wp_options` WHERE `option_name` LIKE 'wp_stream_%';

-- 2. Drop Stream Tables
-- This permanently deletes the custom tables used by the Stream plugin.
DROP TABLE IF EXISTS `wp_stream`;
DROP TABLE IF EXISTS `wp_stream_meta`;
