#!/bin/bash

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

clear
echo -e "${PINK}${BOLD}"
echo -e "  __  __         _  _____      _                "
echo -e " |  \/  |       | |/ ____|    | |               "
echo -e " | \  / | ___ __| | (___   ___| |_ _   _ _ __   "
echo -e " | |\/| |/ __/ _\` |\\___ \\ / _ \\ __| | | | '_ \\  "
echo -e " | |  | | (_| (_| |____) |  __/ |_| |_| | |_) | "
echo -e " |_|  |_|\\___\\__,_|_____/ \\___|\\__|\\__,_| .__/  "
echo -e "                                        | |     "
echo -e "                                        |_|     "
echo -e " ${NC}${GRAY}v1.3.0${NC} ${ITALIC}${GRAY}Installation Wizard${NC}"
echo -e "${GRAY}───────────────────────────────────────────────────${NC}"

echo -e "${CYAN}${BOLD}🚀 Memulai Instalasi McdBash...${NC}\n"

# Get absolute path of current directory
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 1. Permissions
(
    chmod +x "$ROOT_DIR/mcd"
    for script in "$ROOT_DIR/scripts"/*.sh; do
        chmod +x "$script"
    done
) &
show_spinner $! "Mengatur Izin Eksekusi (Permissions)"

# 2. Add to PATH (Bash)
if [[ ":$PATH:" != *":$ROOT_DIR:"* ]]; then
    (echo "export PATH=\"\$PATH:$ROOT_DIR\"" >> ~/.bashrc) &
    show_spinner $! "Menambahkan ke ~/.bashrc"
else
    echo -e "  ${GREEN}✔${NC}  ${GRAY}McdBash sudah ada di PATH Bash.${NC}"
fi

# 3. Add to PATH (Zsh)
if [ -f ~/.zshrc ]; then
    if [[ ":$PATH:" != *":$ROOT_DIR:"* ]]; then
        (echo "export PATH=\"\$PATH:$ROOT_DIR\"" >> ~/.zshrc) &
        show_spinner $! "Menambahkan ke ~/.zshrc"
    else
        echo -e "  ${GREEN}✔${NC}  ${GRAY}McdBash sudah ada di PATH Zsh.${NC}"
    fi
fi

echo -e "\n${GREEN}${BOLD}INSTALASI BERHASIL!${NC}"
echo -e "${GRAY}Silakan restart terminal atau jalankan:${NC} ${CYAN}source ~/.bashrc${NC}"
echo -e "${GRAY}Sekarang kamu bisa menggunakan${NC} ${PINK}mcd -h${NC} ${GRAY}dari mana saja.${NC}"
