#!/bin/bash

# A wp-cli script to clean up database tables and options left by the WP Mail SMTP plugin.
#
# WARNING: This script performs destructive database operations.
# ALWAYS take a full database backup before running it.
#
# Usage:
# 1. Place this script in the root directory of your WordPress installation.
# 2. Make it executable: chmod +x cleanup_wpmailsmtp.sh
# 3. Run it: ./cleanup_wpmailsmtp.sh

# --- Configuration ---
# You can change the table prefix if yours is not 'wp_'.
TABLE_PREFIX="wp_"

# --- Script Start ---
echo "Starting WP Mail SMTP cleanup script..."

# 1. Drop the debug events table
echo "Attempting to drop table: ${TABLE_PREFIX}wpmailsmtp_debug_events..."
wp db query "DROP TABLE IF EXISTS \`${TABLE_PREFIX}wpmailsmtp_debug_events\`;" --skip-column-names
if [ $? -eq 0 ]; then
    echo "SUCCESS: Table dropped or did not exist."
else
    echo "ERROR: Failed to drop ${TABLE_PREFIX}wpmailsmtp_debug_events."
fi

# 2. Drop the tasks meta table
echo "Attempting to drop table: ${TABLE_PREFIX}wpmailsmtp_tasks_meta..."
wp db query "DROP TABLE IF EXISTS \`${TABLE_PREFIX}wpmailsmtp_tasks_meta\`;" --skip-column-names
if [ $? -eq 0 ]; then
    echo "SUCCESS: Table dropped or did not exist."
else
    echo "ERROR: Failed to drop ${TABLE_PREFIX}wpmailsmtp_tasks_meta."
fi

# 3. Delete options with a specific pattern
echo "Finding and deleting options with pattern: ${TABLE_PREFIX}mail_smtp_% ..."
OPTIONS_TO_DELETE=$(wp option list --search="${TABLE_PREFIX}mail_smtp_*" --field=option_name --format=list)

if [ -z "$OPTIONS_TO_DELETE" ]; then
    echo "No matching options found to delete."
else
    # Loop through the options and delete them. Using a loop is safer with xargs.
    echo "$OPTIONS_TO_DELETE" | while read -r option_name; do
        wp option delete "$option_name"
        echo "Deleted option: $option_name"
    done
    echo "SUCCESS: Finished deleting options."
fi

echo "Cleanup script finished."
