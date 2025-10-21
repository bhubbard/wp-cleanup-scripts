# WordPress Database Cleanup Scripts

A collection of SQL queries and `wp-cli` bash scripts designed to clean up and optimize WordPress databases by removing data left behind by various plugins or by trimming unnecessary WordPress core data.

## ⚠️ Important Warning

**These scripts perform destructive database operations.** Running them will permanently delete data from your database. There is **no undo** option.

**ALWAYS create a full, verified backup of your database before running any of these scripts.** We are not responsible for any data loss that may occur. Proceed with extreme caution.

## How to Use

This repository contains two types of files: `.sql` queries and `.sh` bash scripts.

### 1. SQL Queries (`.sql` files)

The `.sql` files contain raw MySQL queries that can be run directly against your WordPress database.

**Before you run a query:**

1.  **Identify your database table prefix.** The default WordPress prefix is `wp_`. Many scripts in this repository use a placeholder like `kkt_` or `wp_`. You **must** open the `.sql` file and replace the placeholder prefix with your actual database prefix.
2.  **Backup your database.**

**To execute the queries, you can use a tool like:**

* phpMyAdmin (Look for the "SQL" tab)
* Adminer
* Sequel Pro / Sequel Ace
* The MySQL command-line interface

Copy the content of the desired `.sql` file and execute it in your chosen tool.

### 2. WP-CLI Bash Scripts (`.sh` files)

The `.sh` files are bash scripts that use the [WordPress Command-line Interface (wp-cli)](https://wp-cli.org/) to perform the cleanup tasks. `wp-cli` must be installed on your server for these scripts to work.

**Before you run a script:**

1.  **Check the table prefix variable.** Open the script and look for a `TABLE_PREFIX` variable near the top. Ensure it matches your WordPress installation's prefix.
2.  **Backup your database.**

**To execute a script:**

1.  Upload the `.sh` file to the root directory of your WordPress installation (the same directory where `wp-config.php` is located).
2.  Connect to your server via SSH.
3.  Navigate to the WordPress root directory.
4.  Make the script executable:
    ```bash
    chmod +x your-script-name.sh
    ```
5.  Run the script:
    ```bash
    ./your-script-name.sh
    ```

The script will print progress messages to the console.

## Contributing

Contributions are welcome! If you have a script that cleans up a specific plugin or performs a useful optimization, please feel free to open a pull request. Please ensure your script is well-documented with comments explaining what it does.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
