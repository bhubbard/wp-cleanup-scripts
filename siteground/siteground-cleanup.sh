#!/bin/bash

# A wp-cli script to clean up database tables and options left by SiteGround plugins.
#
# WARNING: This script performs destructive database operations.
# ALWAYS take a full database backup before running it.
#
# Usage:
# 1. Place this script in the root directory of your WordPress installation.
# 2. Make it executable: chmod +x cleanup_siteground.sh
# 3. Run it: ./cleanup_siteground.sh

# --- Configuration ---
# You can change the table prefix if yours is not 'wp_'.
TABLE_PREFIX="wp_"

# --- Script Start ---
echo "Starting SiteGround cleanup script..."

# 1. Drop the SGS log events table
echo "Attempting to drop table: ${TABLE_PREFIX}sgs_log_events..."
wp db query "DROP TABLE IF EXISTS \`${TABLE_PREFIX}sgs_log_events\`;" --skip-column-names
if [ $? -eq 0 ]; then
    echo "SUCCESS: Table dropped or did not exist."
else
    echo "ERROR: Failed to drop ${TABLE_PREFIX}sgs_log_events."
fi

# 2. Drop the SGS log visitors table
echo "Attempting to drop table: ${TABLE_PREFIX}sgs_log_visitors..."
wp db query "DROP TABLE IF EXISTS \`${TABLE_PREFIX}sgs_log_visitors\`;" --skip-column-names
if [ $? -eq 0 ]; then
    echo "SUCCESS: Table dropped or did not exist."
else
    echo "ERROR: Failed to drop ${TABLE_PREFIX}sgs_log_visitors."
fi

# 3. Delete options with specific patterns
echo "Finding and deleting options with SiteGround patterns (siteground_%, sgs_%, sgo_%)..."

PATTERNS=("siteground_%" "sgs_%" "sgo_%")
OPTIONS_TO_DELETE=""

for pattern in "${PATTERNS[@]}"; do
    # Find options for the current pattern and append them to the main list
    CURRENT_OPTIONS=$(wp option list --search="$pattern" --field=option_name --format=list)
    if [ -n "$CURRENT_OPTIONS" ]; then
        OPTIONS_TO_DELETE="${OPTIONS_TO_DELETE}${CURRENT_OPTIONS}"$'\n'
    fi
done

# Remove any trailing newline that might have been added
OPTIONS_TO_DELETE=$(echo "$OPTIONS_TO_DELETE" | sed '/^$/d')

if [ -z "$OPTIONS_TO_DELETE" ]; then
    echo "No matching options found to delete."
else
    # Use `sort -u` to process only unique option names in case of overlap
    echo "The following options will be deleted:"
    echo "$OPTIONS_TO_DELETE" | sort -u
    echo "---"
    
    echo "$OPTIONS_TO_DELETE" | sort -u | while read -r option_name; do
        wp option delete "$option_name"
        echo "Deleted option: $option_name"
    done
    echo "SUCCESS: Finished deleting options."
fi

echo "Cleanup script finished."
