#!/bin/bash
# --- SukaMCD Laravel Optimizer ---

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

VERSION="1.2.0"

show_spinner() {
  local pid=$1
  local message=$2
  local spin='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
  local i=0
  while kill -0 $pid 2>/dev/null; do
    i=$(( (i+1) % 10 ))
    printf "\r  ${PINK}${spin:$i:1}${NC}  ${GRAY}$message...${NC}"
    sleep 0.1
  done
  printf "\r  ${GREEN}✔${NC}  ${BOLD}$message Selesai!${NC}          \n"
}

# Pastikan kita berada di root folder Laravel
if [ ! -f "artisan" ]; then
    echo -e "${RED}${BOLD}❌ Error:${NC} Jalankan command ini di root folder Laravel!"
    exit 1
fi

clear
echo -e "${PINK}${BOLD}"
echo -e "  __  __         _  ____        _   _            "
echo -e " |  \/  |       | |/ __ \\      | | (_)           "
echo -e " | \\  / | ___ __| | |  | |_ __ | |_ _ _ __ ___  "
echo -e " | |\\/| |/ __/ _\` | |  | | '_ \\| __| | '_ \` _ \\ "
echo -e " | |  | | (_| (_| | |__| | |_) | |_| | | | | | | "
echo -e " |_|  |_|\\___\\__,_|\\____/| .__/ \\__|_|_| |_| |_| "
echo -e "                         | |                    "
echo -e "                         |_|                    "
echo -e " ${NC}${GRAY}v1.2.0${NC} ${ITALIC}${GRAY}by SukaMCD${NC}"
echo -e ""
echo -e " ${ITALIC}${GRAY}Laravel Optimizer by SukaMCD${NC}"
echo -e "${GRAY}───────────────────────────────────────────────────${NC}"

echo -e "${CYAN}${BOLD}⚡ Memulai Optimasi Laravel...${NC}\n"

# 1. Clear Cache & Config
(php artisan optimize:clear --quiet) &
show_spinner $! "Membersihkan Cache, Config, Route, dan View"

# 2. Re-Caching
(php artisan optimize --quiet) &
show_spinner $! "Membangun Cache Optimasi Baru"

# 3. Event & View Cache (Opsional tapi bagus)
(php artisan event:cache --quiet && php artisan view:cache --quiet) &
show_spinner $! "Caching Events dan Compiled Views"

echo -e "\n${GREEN}${BOLD}✨ PROJECT BERHASIL DIOPTIMASI! ✨${NC}"
echo -e "Sekarang aplikasi kamu berjalan lebih kencang."
