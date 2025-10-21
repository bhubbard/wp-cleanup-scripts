-- MySQL query to delete old Tapp Customizations Plugin.
--
-- This script targets post meta with the exact key 'tapp_post_views_count'.
--
-- WARNING: This query performs a destructive database operation.
-- ALWAYS take a full database backup before running it directly on your database.
--
-- The table prefix 'wp_' is used as an example.
-- You MUST adjust this to match your WordPress installation's prefix.

-- 1. Delete Post Meta
-- This finds and removes all post meta entries with the specified key.
DELETE FROM `wp_postmeta` WHERE `meta_key` = 'tapp_post_views_count';
