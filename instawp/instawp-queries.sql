-- MySQL queries to clean up database tables and options from the InstaWP plugin.
--
-- WARNING: These queries perform destructive database operations.
-- ALWAYS take a full database backup before running them directly on your database.
--
-- You may need to replace the table prefix `wp_` if your WordPress installation uses a different one.

-- Step 1: Drop the InstaWP plugin tables.
-- This command directly removes the specific tables used by the plugin.
DROP TABLE IF EXISTS `wp_instawp_events`, `wp_instawp_event_sites`, `wp_instawp_event_sync_logs`, `wp_instawp_sync_history`;


-- Step 2: Delete options with the 'instawp_' pattern.
-- This query removes all settings and data for the InstaWP plugin from the options table.
DELETE FROM `wp_options` WHERE `option_name` LIKE 'instawp_%';
