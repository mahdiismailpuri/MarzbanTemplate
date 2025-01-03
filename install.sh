#!/bin/bash

# Colors for output - Essential colors
GREEN='\033[0;32m'       # For successful operations
RED='\033[0;31m'        # For deletions and errors
YELLOW='\033[1;33m'     # For warnings and attention
BLUE='\033[38;5;117m'   # For menu items and headers
NC='\033[0m'            # No Color

# Template directory
TEMPLATE_DIR="/var/lib/marzban/templates/subscription/"

# Function to install theme
install_theme() {
    echo -e "${BLUE}Installing Marzban Theme...${NC}"
    mkdir -p "$TEMPLATE_DIR"
    echo -e "${BLUE}Downloading template files...${NC}"
    wget -N -P "$TEMPLATE_DIR" https://raw.githubusercontent.com/Troniza/MarzbanTemplate/main/index.html
    echo -e "${BLUE}Configuring Marzban...${NC}"
    echo 'CUSTOM_TEMPLATES_DIRECTORY="/var/lib/marzban/templates/"' | sudo tee -a /opt/marzban/.env
    echo 'SUBSCRIPTION_PAGE_TEMPLATE="subscription/index.html"' | sudo tee -a /opt/marzban/.env
    chown -R marzban:marzban "$TEMPLATE_DIR"
    chmod -R 755 "$TEMPLATE_DIR"
    echo -e "${YELLOW}Restarting Marzban...${NC}"
    marzban restart
    echo -e "${GREEN}Theme installed successfully!${NC}"
}

# Function to update theme
update_theme() {
    echo -e "${BLUE}Updating Marzban Theme...${NC}"
    wget -N -P "$TEMPLATE_DIR" https://raw.githubusercontent.com/Troniza/MarzbanTemplate/main/index.html
    chown -R marzban:marzban "$TEMPLATE_DIR"
    chmod -R 755 "$TEMPLATE_DIR"
    echo -e "${YELLOW}Restarting Marzban...${NC}"
    marzban restart
    echo -e "${GREEN}Theme updated successfully!${NC}"
}

# Function to check installation
check_installation() {
    echo -e "${BLUE}Checking installation status...${NC}"
    if [ -f "$TEMPLATE_DIR/index.html" ]; then
        echo -e "${GREEN}✓ Theme is installed!${NC}"
        echo -e "${BLUE}Installation path: $TEMPLATE_DIR${NC}"
        if grep -q "CUSTOM_TEMPLATES_DIRECTORY" /opt/marzban/.env; then
            echo -e "${GREEN}✓ Marzban configuration is correct${NC}"
        else
            echo -e "${RED}✗ Marzban configuration is missing${NC}"
        fi
    else
        echo -e "${RED}✗ Theme is not installed!${NC}"
    fi
}

# Function to restart Marzban
restart_marzban() {
    echo -e "${YELLOW}Restarting Marzban...${NC}"
    marzban restart
    echo -e "${GREEN}Marzban restarted successfully!${NC}"
}

# Function to uninstall theme
uninstall_theme() {
    echo -e "${RED}Uninstalling Marzban Theme...${NC}"
    rm -rf "$TEMPLATE_DIR/index.html"
    sed -i '/CUSTOM_TEMPLATES_DIRECTORY/d' /opt/marzban/.env
    sed -i '/SUBSCRIPTION_PAGE_TEMPLATE/d' /opt/marzban/.env
    echo -e "${YELLOW}Restarting Marzban...${NC}"
    marzban restart
    echo -e "${GREEN}Theme uninstalled successfully!${NC}"
}

# Main menu
while true; do
    clear
    echo -e "${BLUE}

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

    echo -e "\n${BLUE}Choose an option:${NC}"
    
    echo -e "${BLUE}1)${NC} ${GREEN}Install Theme${NC}"
    echo -e "${BLUE}2)${NC} ${BLUE}Update Theme${NC}"
    echo -e "${BLUE}3)${NC} ${NC}Check Installation${NC}"
    echo -e "${BLUE}4)${NC} ${YELLOW}Restart Marzban${NC}"
    
    echo -e "${BLUE}5)${NC} ${RED}Uninstall Theme${NC}"
    echo -e "${BLUE}6)${NC} ${RED}Exit${NC}\n"
    
    read -p $'\033[38;5;117mSelect an option [1-6]:\033[0m ' choice

    case $choice in
        1)
            install_theme
            read -p $'\033[38;5;117mPress Enter to continue...\033[0m'
            ;;
        2)
            update_theme
            read -p $'\033[38;5;117mPress Enter to continue...\033[0m'
            ;;
        3)
            check_installation
            read -p $'\033[38;5;117mPress Enter to continue...\033[0m'
            ;;
        4)
            restart_marzban
            read -p $'\033[38;5;117mPress Enter to continue...\033[0m'
            ;;
        5)
            echo -e "${RED}Are you sure you want to uninstall the theme? (y/n):${NC} "
            read -p $'\033[0;31m>\033[0m ' confirm
            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                uninstall_theme
            fi
            read -p $'\033[38;5;117mPress Enter to continue...\033[0m'
            ;;
        6)
            echo -e "${GREEN}Thank you for using Troniza Theme Manager!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option${NC}"
            read -p $'\033[38;5;117mPress Enter to continue...\033[0m'
            ;;
    esac
done
