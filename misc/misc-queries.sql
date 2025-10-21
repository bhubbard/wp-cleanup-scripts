-- 1. Delete post edit lock metadata
-- This removes the '_edit_lock' meta key, which can prevent post editing if it wasn't cleared correctly.
DELETE FROM `wp_postmeta` WHERE `meta_key` = '_edit_lock';

-- 2. Delete post last edit metadata
-- This removes the '_edit_last' meta key, which stores the user ID of the last editor.
DELETE FROM `wp_postmeta` WHERE `meta_key` = '_edit_last';

-- 3. Delete all empty postmeta records
-- This removes metadata from posts where the value is either an empty string or NULL.
DELETE FROM `wp_postmeta` WHERE `meta_value` IS NULL OR `meta_value` = '';

-- 4. Delete all empty option records
-- This removes options where the value is either an empty string or NULL.
DELETE FROM `wp_options` WHERE `option_value` IS NULL OR `option_value` = '';

-- 5. Delete all transients
-- This removes all transient options from the options table, which can help clear cached data.
DELETE FROM `wp_options` WHERE `option_name` LIKE '_transient_%' OR `option_name` LIKE '_site_transient_%';

-- 6. Empty the disallowed keys list
-- This clears the list of disallowed comment keys, which can sometimes become bloated.
UPDATE `wp_options` SET `option_value` = '' WHERE `option_name` = 'disallowed_keys';
