#!/bin/bash
# --- McdUpdate: McdBash Update Module ---

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

# Get absolute path of current directory
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
SCRIPT_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

clear
echo -e "${PINK}${BOLD}"
echo -e "  __  __         _ _    _           _       _       "
echo -e " |  \/  |       | | |  | |         | |     | |      "
echo -e " | \  / | ___ __| | |  | |_ __   __| | __ _| |_ ___ "
echo -e " | |\/| |/ __/ _\` | |  | | '_ \ / _\` |/ _\` | __/ _ \\"
echo -e " | |  | | (_| (_| | |__| | |_) | (_| | (_| | ||  __/"
echo -e " |_|  |_|\\___\\__,_|\\____/| .__/ \\__,_|\\__,_|\\__\\___|"
echo -e "                         | |                        "
echo -e "                         |_|                        "
echo -e " ${NC}${GRAY}v1.3.0${NC} ${ITALIC}${GRAY}by SukaMCD${NC}"
echo -e "${GRAY}───────────────────────────────────────────────────${NC}"

echo -e "${CYAN}${BOLD}🔄 Memeriksa pembaruan McdBash...${NC}\n"

cd "$ROOT_DIR" || exit

if [ -d ".git" ]; then
    (git pull origin main --quiet) &
    show_spinner $! "Mengunduh pembaruan dari GitHub"

    (chmod +x mcd setup.sh scripts/*.sh) &
    show_spinner $! "Memperbarui izin eksekusi script"

    echo -e "\n${GREEN}${BOLD}INSTALASI BERHASIL!${NC}"
    echo -e "${GRAY}Semua komponen McdBash telah diperbarui ke versi terbaru.${NC}"
else
    echo -e "${RED}${BOLD}❌ Error:${NC} Folder ini bukan git repository."
    echo -e "${GRAY}Silakan update secara manual atau clone ulang repository.${NC}"
fi
