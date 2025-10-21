#!/bin/bash

# A wp-cli script to clean up database tables and options left by the EWWW Image Optimizer plugin.
#
# WARNING: This script performs destructive database operations.
# ALWAYS take a full database backup before running it.
#
# Usage:
# 1. Place this script in the root directory of your WordPress installation.
# 2. Make it executable: chmod +x cleanup_ewwwio.sh
# 3. Run it: ./cleanup_ewwwio.sh

# --- Configuration ---
# IMPORTANT: You mentioned table names with a "kkt_" prefix.
# Please change the value below to match your WordPress table prefix.
TABLE_PREFIX="wp_"

# --- Script Start ---
echo "Starting EWWW Image Optimizer cleanup script..."

# 1. Drop the ewwwio_images table
echo "Attempting to drop table: ${TABLE_PREFIX}ewwwio_images..."
wp db query "DROP TABLE IF EXISTS \`${TABLE_PREFIX}ewwwio_images\`;" --skip-column-names
if [ $? -eq 0 ]; then
    echo "SUCCESS: Table dropped or did not exist."
else
    echo "ERROR: Failed to drop ${TABLE_PREFIX}ewwwio_images."
fi

# 2. Drop the ewwwio_queue table
echo "Attempting to drop table: ${TABLE_PREFIX}ewwwio_queue..."
wp db query "DROP TABLE IF EXISTS \`${TABLE_PREFIX}ewwwio_queue\`;" --skip-column-names
if [ $? -eq 0 ]; then
    echo "SUCCESS: Table dropped or did not exist."
else
    echo "ERROR: Failed to drop ${TABLE_PREFIX}ewwwio_queue."
fi

# 3. Delete options with a specific pattern
echo "Finding and deleting options with pattern: ewww_%"
OPTIONS_TO_DELETE=$(wp option list --search="ewww_*" --field=option_name --format=list)

if [ -z "$OPTIONS_TO_DELETE" ]; then
    echo "No matching options found to delete."
else
    echo "The following options will be deleted:"
    echo "$OPTIONS_TO_DELETE"
    echo "---"
    
    # Loop through the options and delete them.
    echo "$OPTIONS_TO_DELETE" | while read -r option_name; do
        wp option delete "$option_name"
        echo "Deleted option: $option_name"
    done
    echo "SUCCESS: Finished deleting options."
fi

echo "Cleanup script finished."
