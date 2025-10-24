-- WARNING: Always back up your database before running any delete operations.

-- This query deletes all entries from the options table
-- where the option_name starts with 'updraft_', 'updraftplus-', or 'updraftplus_'

DELETE FROM wp_options
WHERE option_name LIKE 'updraft_%'
   OR option_name LIKE 'updraftplus-%'
   OR option_name LIKE 'updraftplus_%';

-- Note: If your WordPress table prefix is not 'wp_',
-- you will need to replace 'wp_options' with your actual table name
-- (e.g., 'wpab_options').
