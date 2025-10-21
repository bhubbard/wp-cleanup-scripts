#!/bin/bash

# A wp-cli script to clean up database tables and options from the BlogVault plugin.
#
# WARNING: This script performs destructive database operations.
# ALWAYS take a full database backup before running it.
#
# Usage:
# 1. Place this script in the root directory of your WordPress installation.
# 2. Make it executable: chmod +x cleanup_blogvault.sh
# 3. Run it: ./cleanup_blogvault.sh

# --- Configuration ---
# IMPORTANT: Verify this table prefix matches your WordPress installation.
TABLE_PREFIX="kkt_"

# --- Script Start ---
echo "Starting BlogVault cleanup script..."

# 1. Drop the plugin-specific tables
TABLES_TO_DROP=(
    "bv_fw_requests"
    "bv_ip_store"
    "bv_lp_requests"
)

echo "Attempting to drop plugin tables..."
for table in "${TABLES_TO_DROP[@]}"; do
    FULL_TABLE_NAME="${TABLE_PREFIX}${table}"
    echo " -> Dropping table: ${FULL_TABLE_NAME}..."
    # Execute the DROP TABLE query using wp-cli
    wp db query "DROP TABLE IF EXISTS \`${FULL_TABLE_NAME}\`;" --skip-column-names
    if [ $? -eq 0 ]; then
        echo "    SUCCESS: Table dropped or did not exist."
    else
        echo "    ERROR: Failed to drop ${FULL_TABLE_NAME}."
    fi
done

# 2. Delete the specific plugin options
OPTIONS_TO_DELETE=(
    "bvActivateTime"
    "bvAccountsList"
    "bvLastRecvTime"
    "bvApiPublic"
    "bvwatchtime"
)

echo "Attempting to delete plugin options..."
for option in "${OPTIONS_TO_DELETE[@]}"; do
    echo " -> Deleting option: ${option}..."
    wp option delete "$option"
    if [ $? -eq 0 ]; then
        echo "    SUCCESS: Deleted option or it did not exist."
    else
        echo "    ERROR: Failed to delete option ${option}."
    fi
done

echo "Cleanup script finished."
