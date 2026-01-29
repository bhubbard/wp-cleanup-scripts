DELETE FROM wp_options WHERE option_name LIKE '%shortpixel%';

DELETE FROM wp_postmeta WHERE meta_key LIKE '_shortpixel%';

DROP TABLE IF EXISTS wp_shortpixel_folders;
DROP TABLE IF EXISTS wp_shortpixel_meta;
DROP TABLE IF EXISTS wp_shortpixel_queue;
