# DEFINE COLOURS
end='\033[0m'
BRed='\033[1;31m'
BGreen='\033[1;32m'
Blue='\033[0;34m'
BBlue='\033[1;34m'

# PLUGIN
Plugin=$1

# VERIFY ARGUMENT IS NOT EMPTY
if [ -z "$Plugin" ]
then
    echo -e "${BRed}[!] NO PLUGIN SELECTED [!]${end}"
else
    echo -e "${BGreen}[+] Installing plugin '${Plugin}' for FusionDirectory${end}"

    #############################
    #### INSTALLING PACKAGES ####
    #############################
    echo -e "${BBlue}[i] Installing packages${end}"

    # TELECHARGER LE PLUGIN
    echo -e "${Blue}[i] Executing 'sudo apt-get install fusiondirectory-plugin-${Plugin}'${end}"
    # EXECUTE
    sudo apt-get install fusiondirectory-plugin-${Plugin} -y

    # TELECHARGER LE SCHEMA
    echo -e "${Blue}[i] Executing 'sudo apt-get install fusiondirectory-plugin-${Plugin}-schema'${end}"
    # EXECUTE
    sudo apt-get install fusiondirectory-plugin-${Plugin}-schema -y

    ############################
    #### INSTALLING SCHEMAS ####
    ############################
    echo -e "${BBlue}[i] Installing schemas${end}"

    echo -e "${Blue}[i] Executing 'sudo fusiondirectory-schema-manager --insert-schema /etc/ldap/schema/fusiondirectory/${Plugin}-fd-conf.schema'${end}"
    # EXECUTE
    sudo fusiondirectory-schema-manager --insert-schema /etc/ldap/schema/fusiondirectory/${Plugin}-fd-conf.schema

    echo -e "${Blue}[i] Executing 'sudo fusiondirectory-schema-manager --insert-schema /etc/ldap/schema/fusiondirectory/${Plugin}-fd.schema'${end}"
    # EXECUTE
    sudo fusiondirectory-schema-manager --insert-schema /etc/ldap/schema/fusiondirectory/${Plugin}-fd.schema

    ############################
    #### REGISTERING PLUGIN ####
    ############################
    echo -e "${BBlue}[i] Registering plugin${end}"

    echo -e "${Blue}[i] Executing 'sudo fusiondirectory-plugins-manager --register-plugin /etc/fusiondirectory/yaml/${Plugin}/description.yaml'${end}"
    # EXECUTE
    sudo fusiondirectory-plugins-manager --register-plugin /etc/fusiondirectory/yaml/${Plugin}/description.yaml


    # MESSAGE DE FIN
    echo -e "${BGreen}[+] DONE! [+]"
fi