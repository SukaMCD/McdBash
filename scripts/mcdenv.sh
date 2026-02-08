#!/bin/bash
# --- SukaMCD Environment Switcher ---

# --- Styling (Ultra Premium Palette) ---
BOLD='\033[1m'
ITALIC='\033[3m'
CYAN='\033[38;5;51m'
PINK='\033[38;5;198m'
ORANGE='\033[38;5;208m'
YELLOW='\033[38;5;226m'
RED='\033[38;5;196m'
GRAY='\033[38;5;244m'
GREEN='\033[38;5;46m'
NC='\033[0m'

if [ ! -f ".env" ]; then
    echo -e "${RED}${BOLD}❌ Error:${NC} File .env tidak ditemukan!"
    exit 1
fi

clear
echo -e "${PINK}${BOLD}"
echo -e "  __  __         _ ______            "
echo -e " |  \\/  |       | |  ____|           "
echo -e " | \\  / | ___ __| | |__   _ ____   __"
echo -e " | |\\/| |/ __/ _\` |  __| | '_ \\ \\ / /"
echo -e " | |  | | (_| (_| | |____| | | \\ V / "
echo -e " |_|  |_|\\___\\__,_|______|_| |_|\\_/  "
echo -e " ${NC}${GRAY}v1.2.0${NC} ${ITALIC}${GRAY}by SukaMCD${NC}"
echo -e ""
echo -e " ${ITALIC}${GRAY}Laravel Environment Switcher by SukaMCD${NC}"
echo -e "${GRAY}───────────────────────────────────────────────────${NC}"

echo -e "${BOLD}Select Environment Mode:${NC}"
echo -e "  ${CYAN}1.${NC} Local      ${GRAY}(Debug: true, Env: local)${NC}"
echo -e "  ${CYAN}2.${NC} Production ${GRAY}(Debug: false, Env: production)${NC}"
echo -e "  ${CYAN}3.${NC} Cancel${NC}"
read -p "  Choose [1-3]: " ENV_CHOICE

case $ENV_CHOICE in
    1)
        sed -i "s|^APP_ENV=.*|APP_ENV=local|" .env
        sed -i "s|^APP_DEBUG=.*|APP_DEBUG=true|" .env
        echo -e "\n${GREEN}✔ Switched to LOCAL mode.${NC}"
        echo -e "${GRAY}Debug mode is now ENABLED.${NC}"
        ;;
    2)
        sed -i "s|^APP_ENV=.*|APP_ENV=production|" .env
        sed -i "s|^APP_DEBUG=.*|APP_DEBUG=false|" .env
        echo -e "\n${YELLOW}✔ Switched to PRODUCTION mode.${NC}"
        echo -e "${RED}⚠ Debug mode is now DISABLED.${NC}"
        ;;
    *)
        echo -e "Operation cancelled."
        exit 0
        ;;
esac

# Otomatis clear cache setelah ganti ENV agar perubahan langsung terasa
if [[ -f "artisan" ]]; then
    php artisan config:clear --quiet
    echo -e "${GRAY}Config cache cleared automatically.${NC}"
fi
