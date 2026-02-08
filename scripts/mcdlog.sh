#!/bin/bash
# --- SukaMCD Laravel Log Monitor ---

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

LOG_FILE="storage/logs/laravel.log"

# Validasi keberadaan file log
if [ ! -f "$LOG_FILE" ]; then
    echo -e "${YELLOW}${BOLD}⚠ Warning:${NC} File log belum ada di ${GRAY}$LOG_FILE${NC}"
    echo -e "Mungkin aplikasi belum pernah mengalami error atau baru di-install."
    exit 1
fi

clear
echo -e "${PINK}${BOLD}"
echo -e "  __  __         _ _                  "
echo -e " |  \/  |       | | |                 "
echo -e " | \\  / | ___ __| | |     ___   __ _  "
echo -e " | |\\/| |/ __/ _\` | |    / _ \\ / _\` | "
echo -e " | |  | | (_| (_| | |___| (_) | (_| | "
echo -e " |_|  |_|\\___\\__,_|______\\___/ \\__, | "
echo -e "                                __/ | "
echo -e "                               |___/  "
echo -e " ${NC}${GRAY}v1.2.0${NC} ${ITALIC}${GRAY}by SukaMCD${NC}"
echo -e ""
echo -e " ${ITALIC}${GRAY}Laravel Log Monitor by SukaMCD${NC}"
echo -e "${GRAY}───────────────────────────────────────────────────${NC}"

echo -e "${CYAN}${BOLD}📖 Monitoring Laravel Logs...${NC}"
echo -e "${GRAY}File: $LOG_FILE${NC}"
echo -e "${GRAY}Tekan ${RED}Ctrl+C ${GRAY}untuk berhenti.${NC}"
echo -e "${GRAY}───────────────────────────────────────────────────${NC}\n"

# Menjalankan tail dengan pewarnaan otomatis menggunakan sed
# - ERROR/CRITICAL/ALERT jadi Merah
# - WARNING jadi Kuning
# - INFO jadi Hijau/Cyan
tail -f "$LOG_FILE" | sed \
    -e "s/local.ERROR/$(echo -e "${RED}${BOLD}local.ERROR${NC}")/g" \
    -e "s/local.CRITICAL/$(echo -e "${RED}${BOLD}local.CRITICAL${NC}")/g" \
    -e "s/local.WARNING/$(echo -e "${YELLOW}${BOLD}local.WARNING${NC}")/g" \
    -e "s/local.INFO/$(echo -e "${CYAN}local.INFO${NC}")/g"
