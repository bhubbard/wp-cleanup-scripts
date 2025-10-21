-- MySQL queries to clean up database tables and options from the WP Mail SMTP plugin.
--
-- WARNING: These queries perform destructive database operations.
-- ALWAYS take a full database backup before running them directly on your database.
--
-- You may need to replace the table prefix `wp_` if your WordPress installation uses a different one.

-- 1. Drop the debug events table
DROP TABLE IF EXISTS `wp_wpmailsmtp_debug_events`;

-- 2. Drop the tasks meta table
DROP TABLE IF EXISTS `wp_wpmailsmtp_tasks_meta`;

-- 3. Delete options with a specific pattern
-- This removes settings and configuration data for the WP Mail SMTP plugin from the options table.
-- This corresponds to the script's search for `wp_mail_smtp_*`
DELETE FROM `wp_options` WHERE `option_name` LIKE 'wp_mail_smtp_%';
