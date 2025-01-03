#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Template directory
TEMPLATE_DIR="/var/lib/marzban/templates/subscription/"

# Function to install theme
install_theme() {
    echo -e "${GREEN}Installing Marzban Theme...${NC}"
    mkdir -p "$TEMPLATE_DIR"
    wget -N -P "$TEMPLATE_DIR" https://raw.githubusercontent.com/Troniza/MarzbanTemplate/main/index.html
    echo 'CUSTOM_TEMPLATES_DIRECTORY="/var/lib/marzban/templates/"' | sudo tee -a /opt/marzban/.env
    echo 'SUBSCRIPTION_PAGE_TEMPLATE="subscription/index.html"' | sudo tee -a /opt/marzban/.env
    chown -R marzban:marzban "$TEMPLATE_DIR"
    chmod -R 755 "$TEMPLATE_DIR"
    marzban restart
    echo -e "${GREEN}Theme installed successfully!${NC}"
}

# Function to update theme
update_theme() {
    echo -e "${YELLOW}Updating Marzban Theme...${NC}"
    wget -N -P "$TEMPLATE_DIR" https://raw.githubusercontent.com/Troniza/MarzbanTemplate/main/index.html
    chown -R marzban:marzban "$TEMPLATE_DIR"
    chmod -R 755 "$TEMPLATE_DIR"
    marzban restart
    echo -e "${GREEN}Theme updated successfully!${NC}"
}

# Function to check installation
check_installation() {
    if [ -f "$TEMPLATE_DIR/index.html" ]; then
        echo -e "${GREEN}Theme is installed!${NC}"
        echo -e "Installation path: $TEMPLATE_DIR"
        if grep -q "CUSTOM_TEMPLATES_DIRECTORY" /opt/marzban/.env; then
            echo -e "${GREEN}Marzban configuration is correct${NC}"
        else
            echo -e "${RED}Marzban configuration is missing${NC}"
        fi
    else
        echo -e "${RED}Theme is not installed!${NC}"
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
    marzban restart
    echo -e "${GREEN}Theme uninstalled successfully!${NC}"
}

# Main menu
while true; do
    clear
    echo -e "${GREEN}
█▄▀ █░█ █▀█ █▄▄ █▀█ █▀█ █▄▀ █ █▄░█ █▀▀   █▀▀ █ █░░ █▀▀ █▀ ▀ ▀ ▀
█▄▀ █▄█ ▀▄▀▄▀ █░▀█ █▄▄ █▄█ █▀█ █▄▀ █ █░▀█ █▄█   █▀░ █ █▄▄ ██▄ ▄█ ▄ ▄ ▄
${NC}"
    echo -e "\n${GREEN}Marzban Theme Manager${NC}"
    echo -e "\n1) Install Theme"
    echo "2) Update Theme"
    echo "3) Check Installation"
    echo "4) Restart Marzban"
    echo "5) Uninstall Theme"
    echo -e "6) Exit\n"
    read -p "Please select an option [1-6]: " choice

    case $choice in
        1)
            install_theme
            read -p "Press Enter to continue..."
            ;;
        2)
            update_theme
            read -p "Press Enter to continue..."
            ;;
        3)
            check_installation
            read -p "Press Enter to continue..."
            ;;
        4)
            restart_marzban
            read -p "Press Enter to continue..."
            ;;
        5)
            read -p "Are you sure you want to uninstall the theme? (y/n): " confirm
            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                uninstall_theme
            fi
            read -p "Press Enter to continue..."
            ;;
        6)
            echo -e "${GREEN}Goodbye!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option${NC}"
            read -p "Press Enter to continue..."
            ;;
    esac
done
