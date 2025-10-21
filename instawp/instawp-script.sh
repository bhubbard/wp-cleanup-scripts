#!/bin/bash

# A wp-cli script to clean up database tables and options left by the InstaWP plugin.
#
# WARNING: This script performs destructive database operations.
# ALWAYS take a full database backup before running it.
#
# Usage:
# 1. Place this script in the root directory of your WordPress installation.
# 2. Make it executable: chmod +x cleanup_instawp.sh
# 3. Run it: ./cleanup_instawp.sh

# --- Configuration ---
# You can change the table prefix if yours is not 'wp_'.
TABLE_PREFIX="wp_"

# --- Script Start ---
echo "Starting InstaWP cleanup script..."

# 1. Drop the InstaWP tables
TABLES_TO_DROP=(
    "instawp_events"
    "instawp_event_sites"
    "instawp_event_sync_logs"
    "instawp_sync_history"
)

echo "Attempting to drop InstaWP tables..."
for table in "${TABLES_TO_DROP[@]}"; do
    FULL_TABLE_NAME="${TABLE_PREFIX}${table}"
    echo " -> Dropping table: ${FULL_TABLE_NAME}..."
    wp db query "DROP TABLE IF EXISTS \`${FULL_TABLE_NAME}\`;" --skip-column-names
    if [ $? -eq 0 ]; then
        echo "    SUCCESS: Table dropped or did not exist."
    else
        echo "    ERROR: Failed to drop ${FULL_TABLE_NAME}."
    fi
done

# 2. Delete options with the 'instawp_' pattern
echo "Finding and deleting options with pattern: instawp_% ..."
OPTIONS_TO_DELETE=$(wp option list --search="instawp_*" --field=option_name --format=list)

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
