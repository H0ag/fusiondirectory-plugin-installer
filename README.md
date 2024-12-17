# FusionDirectory Plugin Installation Script

This Bash script automates the installation of plugins for [FusionDirectory](https://www.fusiondirectory.org/). It installs the plugin, its schemas, and registers it within FusionDirectory.

## Prerequisites

Before running the script, ensure you have the following:

- **FusionDirectory** installed and configured.
- Root or `sudo` access to install packages and run system commands.
- The plugin you want to install must be available in your distribution’s repositories.

## Features

This script performs the following steps:

1. **Installs necessary packages**: It installs the main plugin package and its schema package.
2. **Inserts required schemas**: The script inserts the necessary schemas into FusionDirectory.
3. **Registers the plugin**: It registers the plugin in FusionDirectory using its YAML description file.

## Usage

### Running the Script

1. Clone this repository or copy the script to your environment.
2. Make the script executable:
    ```bash
    chmod +x install_fusiondirectory_plugin.sh
    ```
3. Run the script, providing the name of the plugin you want to install. For example:
    ```bash
    ./install_fusiondirectory_plugin.sh <my_plugin>
    ```

## Script Overview
The script uses color-coded messages to make the output more readable by distinguishing between informational, success, and error messages. Below are the steps the script follows:
1. **Check for the plugin name:**
- If no plugin name is provided, the script will display an error message.
- If a plugin name is provided, the script will show a success message and proceed with the installation.

2. **Install necessary packages:**
- The script installs the main plugin package and its schema using `apt-get`.
- Example:
    ```bash
    sudo apt-get install fusiondirectory-plugin-my_plugin -y
    sudo apt-get install fusiondirectory-plugin-my_plugin-schema -y
    ```

3. **Insert the schemas:**
- The script inserts the plugin’s configuration schemas into FusionDirectory’s LDAP system.
- Example commands:
    ```bash
    sudo fusiondirectory-schema-manager --insert-schema /etc/ldap/schema/fusiondirectory/my_plugin-fd-conf.schema

    sudo fusiondirectory-schema-manager --insert-schema /etc/ldap/schema/fusiondirectory/my_plugin-fd.schema
    ```

4. **Register the plugin:**
- The plugin is registered in FusionDirectory using the fusiondirectory-plugins-manager with its description file.
- Example command:
    ```bash
    sudo fusiondirectory-plugins-manager --register-plugin /etc/fusiondirectory/yaml/my_plugin/description.yaml
    ```
## Variables Used
- `Plugin`: The name of the plugin, provided as an argument when running the script. This name is used to install the corresponding packages and schemas.

---
**Made by [h0ag](https://github.com/h0ag)**
