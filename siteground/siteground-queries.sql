-- MySQL queries to clean up database tables and options from SiteGround plugins.
--
-- WARNING: These queries perform destructive database operations.
-- ALWAYS take a full database backup before running them directly on your database.
--
-- You may need to replace the table prefix `wp_` if your WordPress installation uses a different one.

-- 1. Drop the SGS log events table
DROP TABLE IF EXISTS `wp_sgs_log_events`;

-- 2. Drop the SGS log visitors table
DROP TABLE IF EXISTS `wp_sgs_log_visitors`;

-- 3. Delete options with specific patterns
-- This removes settings and configuration data for SiteGround plugins from the options table.
DELETE FROM `wp_options` 
WHERE 
    `option_name` LIKE 'siteground_%' OR 
    `option_name` LIKE 'sgs_%' OR 
    `option_name` LIKE 'sg_security_%' OR 
    `option_name` LIKE 'sg_cachepress%' OR 
    `option_name` LIKE 'sgo_%';

DELETE FROM wp_postmeta
WHERE meta_key LIKE 'siteground_optimizer_%';
