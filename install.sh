#!/bin/bash

# Colors for output
WHITE='\033[1;37m'
NC='\033[0m'
LIGHT_CYAN='\033[38;5;116m'
RED='\033[0;31m'
LIGHT_RED='\033[1;31m'
GREEN='\033[0;32m'
LIGHT_GREEN='\033[1;32m'

# Template directory
TEMPLATE_DIR="/var/lib/marzban/templates/subscription/"

# Function to install theme
install_theme() {
    echo -e "${WHITE}Installing Marzban Theme...${NC}"
    mkdir -p "$TEMPLATE_DIR"
    echo -e "${WHITE}Downloading template files...${NC}"
    wget -N -P "$TEMPLATE_DIR" https://raw.githubusercontent.com/Troniza/MarzbanTemplate/main/index.html
    echo -e "${WHITE}Configuring Marzban...${NC}"
    echo 'CUSTOM_TEMPLATES_DIRECTORY="/var/lib/marzban/templates/"' | sudo tee -a /opt/marzban/.env
    echo 'SUBSCRIPTION_PAGE_TEMPLATE="subscription/index.html"' | sudo tee -a /opt/marzban/.env
    chown -R marzban:marzban "$TEMPLATE_DIR"
    chmod -R 755 "$TEMPLATE_DIR"
    echo -e "${LIGHT_GREEN}Restarting Marzban...${NC}"
    marzban restart
    echo -e "${GREEN}Theme installed successfully!${NC}"
}

# Function to update theme
update_theme() {
    echo -e "${WHITE}Updating Marzban Theme...${NC}"
    wget -N -P "$TEMPLATE_DIR" https://raw.githubusercontent.com/Troniza/MarzbanTemplate/main/index.html
    chown -R marzban:marzban "$TEMPLATE_DIR"
    chmod -R 755 "$TEMPLATE_DIR"
    echo -e "${LIGHT_GREEN}Restarting Marzban...${NC}"
    marzban restart
    echo -e "${GREEN}Theme updated successfully!${NC}"
}

# Function to check installation
check_installation() {
    echo -e "${LIGHT_GREEN}Checking installation status...${NC}"
    if [ -f "$TEMPLATE_DIR/index.html" ]; then
        echo -e "${GREEN}✓ Theme is installed!${NC}"
        echo -e "${WHITE}Installation path: $TEMPLATE_DIR${NC}"
        if grep -q "CUSTOM_TEMPLATES_DIRECTORY" /opt/marzban/.env; then
            echo -e "${GREEN}✓ Marzban configuration is correct${NC}"
        else
            echo -e "${LIGHT_RED}✗ Marzban configuration is missing${NC}"
        fi
    else
        echo -e "${RED}✗ Theme is not installed!${NC}"
    fi
}

# Function to restart Marzban
restart_marzban() {
    echo -e "${LIGHT_GREEN}Restarting Marzban...${NC}"
    marzban restart
    echo -e "${GREEN}Marzban restarted successfully!${NC}"
}

# Function to uninstall theme
uninstall_theme() {
    echo -e "${LIGHT_RED}Uninstalling Marzban Theme...${NC}"
    rm -rf "$TEMPLATE_DIR/index.html"
    sed -i '/CUSTOM_TEMPLATES_DIRECTORY/d' /opt/marzban/.env
    sed -i '/SUBSCRIPTION_PAGE_TEMPLATE/d' /opt/marzban/.env
    echo -e "${LIGHT_GREEN}Restarting Marzban...${NC}"
    marzban restart
    echo -e "${GREEN}Theme uninstalled successfully!${NC}"
}

# Main menu
while true; do
    clear
    echo -e "${LIGHT_CYAN}

████████╗██████╗░░█████╗░███╗░░██╗██╗███████╗░█████╗░░░░░░░███╗░░░███╗░█████╗░██████╗░███████╗██████╗░░█████╗░███╗░░██╗
╚══██╔══╝██╔══██╗██╔══██╗████╗░██║██║╚════██║██╔══██╗░░░░░░████╗░████║██╔══██╗██╔══██╗╚════██║██╔══██╗██╔══██╗████╗░██║
░░░██║░░░██████╔╝██║░░██║██╔██╗██║██║░░███╔═╝███████║█████╗██╔████╔██║███████║██████╔╝░░███╔═╝██████╦╝███████║██╔██╗██║
░░░██║░░░██╔══██╗██║░░██║██║╚████║██║██╔══╝░░██╔══██║╚════╝██║╚██╔╝██║██╔══██║██╔══██╗██╔══╝░░██╔══██╗██╔══██║██║╚████║
░░░██║░░░██║░░██║╚█████╔╝██║░╚███║██║███████╗██║░░██║░░░░░░██║░╚═╝░██║██║░░██║██║░░██║███████╗██████╦╝██║░░██║██║░╚███║
░░░╚═╝░░░╚═╝░░╚═╝░╚════╝░╚═╝░░╚══╝╚═╝╚══════╝╚═╝░░╚═╝░░░░░░╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝╚═════╝░╚═╝░░╚═╝╚═╝░░╚══╝

████████╗███████╗███╗░░░███╗██████╗░██╗░░░░░░█████╗░████████╗███████╗░░░░░░██╗░░░██╗░█████╗░░░░░░███╗░░░░░░░███╗░░
╚══██╔══╝██╔════╝████╗░████║██╔══██╗██║░░░░░██╔══██╗╚══██╔══╝██╔════╝░░░░░░██║░░░██║██╔══██╗░░░░████║░░░░░░████║░░
░░░██║░░░█████╗░░██╔████╔██║██████╔╝██║░░░░░███████║░░░██║░░░█████╗░░█████╗╚██╗░██╔╝██║░░██║░░░██╔██║░░░░░██╔██║░░
░░░██║░░░██╔══╝░░██║╚██╔╝██║██╔═══╝░██║░░░░░██╔══██║░░░██║░░░██╔══╝░░╚════╝░╚████╔╝░██║░░██║░░░╚═╝██║░░░░░╚═╝██║░░
░░░██║░░░███████╗██║░╚═╝░██║██║░░░░░███████╗██║░░██║░░░██║░░░███████╗░░░░░░░░╚██╔╝░░╚█████╔╝██╗███████╗██╗███████╗
░░░╚═╝░░░╚══════╝╚═╝░░░░░╚═╝╚═╝░░░░░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝░░░░░░░░░╚═╝░░░░╚════╝░╚═╝╚══════╝╚═╝╚══════╝

${NC}"

    echo -e "\n${WHITE}Choose an option:${NC}"
    
    echo -e "${GREEN}1) Install Theme${NC}"
    echo -e "${LIGHT_GREEN}2) Update Theme${NC}"
    echo -e "${WHITE}3) Check Installation${NC}"
    echo -e "${WHITE}4) Restart Marzban${NC}"
    
    echo -e "${LIGHT_RED}5) Uninstall Theme${NC}"
    echo -e "${WHITE}6) Exit${NC}\n"
    
    read -p $'\033[1;37mSelect an option [1-6]:\033[0m ' choice

    case $choice in
        1)
            install_theme
            read -p $'\033[1;37mPress Enter to continue...\033[0m'
            ;;
        2)
            update_theme
            read -p $'\033[1;37mPress Enter to continue...\033[0m'
            ;;
        3)
            check_installation
            read -p $'\033[1;37mPress Enter to continue...\033[0m'
            ;;
        4)
            restart_marzban
            read -p $'\033[1;37mPress Enter to continue...\033[0m'
            ;;
        5)
            echo -e "${WHITE}Are you sure you want to uninstall the theme? (y/n):${NC} "
            read -p $'\033[1;37m>\033[0m ' confirm
            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                uninstall_theme
            fi
            read -p $'\033[1;37mPress Enter to continue...\033[0m'
            ;;
        6)
            echo -e "${WHITE}Thank you for using Troniza Theme Manager!${NC}"
            exit 0
            ;;
        *)
            echo -e "${WHITE}Invalid option${NC}"
            read -p $'\033[1;37mPress Enter to continue...\033[0m'
            ;;
    esac
done
