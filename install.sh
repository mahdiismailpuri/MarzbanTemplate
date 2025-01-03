#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
LIGHT_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
LIGHT_RED='\033[1;31m'
BLUE='\033[0;34m'
LIGHT_BLUE='\033[1;34m'
PURPLE='\033[0;35m'
LIGHT_PURPLE='\033[1;35m'
CYAN='\033[0;36m'
LIGHT_CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Template directory
TEMPLATE_DIR="/var/lib/marzban/templates/subscription/"

# Function to install theme
install_theme() {
    echo -e "${LIGHT_BLUE}Installing Marzban Theme...${NC}"
    mkdir -p "$TEMPLATE_DIR"
    echo -e "${CYAN}Downloading template files...${NC}"
    wget -N -P "$TEMPLATE_DIR" https://raw.githubusercontent.com/Troniza/MarzbanTemplate/main/index.html
    echo -e "${PURPLE}Configuring Marzban...${NC}"
    echo 'CUSTOM_TEMPLATES_DIRECTORY="/var/lib/marzban/templates/"' | sudo tee -a /opt/marzban/.env
    echo 'SUBSCRIPTION_PAGE_TEMPLATE="subscription/index.html"' | sudo tee -a /opt/marzban/.env
    echo -e "${LIGHT_PURPLE}Setting permissions...${NC}"
    chown -R marzban:marzban "$TEMPLATE_DIR"
    chmod -R 755 "$TEMPLATE_DIR"
    echo -e "${YELLOW}Restarting Marzban...${NC}"
    marzban restart
    echo -e "${LIGHT_GREEN}Theme installed successfully!${NC}"
}

# Function to update theme
update_theme() {
    echo -e "${LIGHT_CYAN}Updating Marzban Theme...${NC}"
    echo -e "${CYAN}Downloading latest version...${NC}"
    wget -N -P "$TEMPLATE_DIR" https://raw.githubusercontent.com/Troniza/MarzbanTemplate/main/index.html
    echo -e "${LIGHT_PURPLE}Updating permissions...${NC}"
    chown -R marzban:marzban "$TEMPLATE_DIR"
    chmod -R 755 "$TEMPLATE_DIR"
    echo -e "${YELLOW}Restarting Marzban...${NC}"
    marzban restart
    echo -e "${LIGHT_GREEN}Theme updated successfully!${NC}"
}

# Function to check installation
check_installation() {
    echo -e "${LIGHT_BLUE}Checking installation status...${NC}"
    if [ -f "$TEMPLATE_DIR/index.html" ]; then
        echo -e "${LIGHT_GREEN}✓ Theme is installed!${NC}"
        echo -e "${CYAN}Installation path: ${WHITE}$TEMPLATE_DIR${NC}"
        if grep -q "CUSTOM_TEMPLATES_DIRECTORY" /opt/marzban/.env; then
            echo -e "${LIGHT_GREEN}✓ Marzban configuration is correct${NC}"
        else
            echo -e "${LIGHT_RED}✗ Marzban configuration is missing${NC}"
        fi
    else
        echo -e "${LIGHT_RED}✗ Theme is not installed!${NC}"
    fi
}

# Function to restart Marzban
restart_marzban() {
    echo -e "${YELLOW}Restarting Marzban...${NC}"
    marzban restart
    echo -e "${LIGHT_GREEN}Marzban restarted successfully!${NC}"
}

# Function to uninstall theme
uninstall_theme() {
    echo -e "${LIGHT_RED}Uninstalling Marzban Theme...${NC}"
    echo -e "${RED}Removing theme files...${NC}"
    rm -rf "$TEMPLATE_DIR/index.html"
    echo -e "${PURPLE}Removing configuration...${NC}"
    sed -i '/CUSTOM_TEMPLATES_DIRECTORY/d' /opt/marzban/.env
    sed -i '/SUBSCRIPTION_PAGE_TEMPLATE/d' /opt/marzban/.env
    echo -e "${YELLOW}Restarting Marzban...${NC}"
    marzban restart
    echo -e "${LIGHT_GREEN}Theme uninstalled successfully!${NC}"
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
    echo -e "\n${LIGHT_PURPLE}╔══════════════════════════╗${NC}"
    echo -e "${LIGHT_PURPLE}║${LIGHT_BLUE}  Troniza Theme Manager  ${LIGHT_PURPLE}║${NC}"
    echo -e "${LIGHT_PURPLE}╚══════════════════════════╝${NC}"
    
    echo -e "\n${WHITE}Choose an option:${NC}"
    echo -e "${CYAN}1)${NC} ${GREEN}Install Theme${NC}"
    echo -e "${CYAN}2)${NC} ${BLUE}Update Theme${NC}"
    echo -e "${CYAN}3)${NC} ${PURPLE}Check Installation${NC}"
    echo -e "${CYAN}4)${NC} ${YELLOW}Restart Marzban${NC}"
    echo -e "${CYAN}5)${NC} ${RED}Uninstall Theme${NC}"
    echo -e "${CYAN}6)${NC} ${LIGHT_RED}Exit${NC}\n"
    
    read -p "$(echo -e ${WHITE}Select an option [1-6]:${NC} )" choice

    case $choice in
        1)
            install_theme
            read -p "$(echo -e ${WHITE}Press Enter to continue...${NC})"
            ;;
        2)
            update_theme
            read -p "$(echo -e ${WHITE}Press Enter to continue...${NC})"
            ;;
        3)
            check_installation
            read -p "$(echo -e ${WHITE}Press Enter to continue...${NC})"
            ;;
        4)
            restart_marzban
            read -p "$(echo -e ${WHITE}Press Enter to continue...${NC})"
            ;;
        5)
            read -p "$(echo -e ${LIGHT_RED}Are you sure you want to uninstall the theme? (y/n):${NC} )" confirm
            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                uninstall_theme
            fi
            read -p "$(echo -e ${WHITE}Press Enter to continue...${NC})"
            ;;
        6)
            echo -e "${LIGHT_GREEN}Thank you for using Marzban Theme Manager!${NC}"
            exit 0
            ;;
        *)
            echo -e "${LIGHT_RED}Invalid option${NC}"
            read -p "$(echo -e ${WHITE}Press Enter to continue...${NC})"
            ;;
    esac
done

