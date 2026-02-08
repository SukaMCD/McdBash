#!/bin/bash
# --- SukaMCD Laravel Dev Mode ---

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

# Validasi folder Laravel
if [ ! -f "artisan" ]; then
    echo -e "${RED}${BOLD}❌ Error:${NC} Jalankan command ini di root folder Laravel!"
    exit 1
fi

clear
echo -e "${PINK}${BOLD}"
echo -e "  __  __         _ _____             "
echo -e " |  \\/  |       | |  __ \\            "
echo -e " | \\  / | ___ __| | |  | | _____   __"
echo -e " | |\\/| |/ __/ _\` | |  | |/ _ \\\\ \\ / /"
echo -e " | |  | | (_| (_| | |__| |  __/\\ V / "
echo -e " |_|  |_|\\___\\__,_|_____/ \\___| \\_/  "
echo -e " ${NC}${GRAY}v1.2.0${NC} ${ITALIC}${GRAY}by SukaMCD${NC}"
echo -e ""
echo -e " ${ITALIC}${GRAY}Laravel Development Environment by SukaMCD${NC}"
echo -e "${GRAY}───────────────────────────────────────────────────${NC}"

echo -e "${CYAN}${BOLD}🚀 Memulai Laravel Dev Mode...${NC}"
echo -e "${GRAY}Tekan ${RED}Ctrl+C${GRAY} untuk menghentikan server.${NC}\n"

# Fungsi untuk mematikan semua proses saat user tekan Ctrl+C
cleanup() {
    echo -e "\n\n${RED}🛑 Menghentikan server...${NC}"
    kill $SERVE_PID $VITE_PID 2>/dev/null
    echo -e "${GREEN}✔ Selesai. Sampai jumpa lagi!${NC}"
    exit
}

trap cleanup SIGINT

# 1. Jalankan Artisan Serve
php artisan serve > /dev/null 2>&1 &
SERVE_PID=$!
echo -e "  ${GREEN}●${NC} PHP Artisan Serve : ${CYAN}http://127.0.0.1:8000${NC}"

# 2. Jalankan NPM Run Dev
npm run dev > /dev/null 2>&1 &
VITE_PID=$!
echo -e "  ${GREEN}●${NC} Vite / NPM Dev    : ${CYAN}Active${NC}"

echo -e "\n${ITALIC}${GRAY}Watching for changes...${NC}"

# Tunggu agar script tidak langsung selesai (menjaga proses background tetap hidup)
wait
