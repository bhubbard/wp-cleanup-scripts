-- MySQL queries to clean up database tables and options, likely from a security plugin (e.g., Block A Vot).
--
-- WARNING: These queries perform destructive database operations.
-- ALWAYS take a full database backup before running them directly on your database.
--
-- The table prefix 'kkt_' is used as specified in the request. You may need to adjust this
-- if your WordPress installation uses a different prefix.

-- Step 1: Drop the plugin-specific tables.
-- This command removes the tables used for logging requests and storing IP data.
DROP TABLE IF EXISTS `wp_bv_fw_requests`, `wp_bv_ip_store`, `wp_bv_lp_requests`;


-- Step 2: Delete the specific plugin options.
-- This query removes the settings and stored data for the plugin from the options table.
-- The options table prefix (e.g., 'kkt_options') must match your installation.
DELETE FROM `wp_options`
WHERE `option_name` IN (
    'bvActivateTime',
    'bvAccountsList',
    'bvLastRecvTime',
    'bvApiPublic',
    'bvwatchtime'
);
