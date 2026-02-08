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

# --- Animasi Spinner ---
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
echo -e "  __  __         _ _                               _ "
echo -e " |  \/  |       | | |                             | |"
echo -e " | \\  / | ___ __| | |     __ _ _ __ __ ___   _____| |"
echo -e " | |\\/| |/ __/ _\` | |    / _\` | '__/ _\` \\ \\ / / _ \\ |"
echo -e " | |  | | (_| (_| | |___| (_| | | | (_| |\\ V /  __/ |"
echo -e " |_|  |_|\\___\\__,_|______\\__,_|_|  \\__,_| \\_/ \\___|_|"
echo -e " ${NC}${GRAY}v1.2.0${NC} ${ITALIC}${GRAY}by SukaMCD${NC}"
echo -e ""
echo -e " ${ITALIC}${GRAY}Laravel Installer Engine by SukaMCD${NC}"
echo -e "${GRAY}───────────────────────────────────────────────────${NC}"

# 1. Project Info (Wajib Diisi)
echo -e "${BOLD}1. PROJECT SETUP${NC}"
while true; do
    read -p "  📁 Nama Project (Wajib): " PROJECT
    if [[ -z "$PROJECT" ]]; then
        echo -e "     ${RED}⚠ Nama project tidak boleh kosong!${NC}"
    elif [ -d "$PROJECT" ]; then
        echo -e "     ${RED}⚠ Folder '$PROJECT' sudah ada. Gunakan nama lain!${NC}"
    else
        break
    fi
done

read -p "  🐙 Connect ke GitHub? [Y/n]: " USE_GIT
USE_GIT=${USE_GIT:-y}

if [[ "$USE_GIT" == "y" || "$USE_GIT" == "Y" ]]; then
    read -p "     Repo URL         : " GIT_URL
fi

# 2. Database Info
echo -e "\n${BOLD}2. DATABASE CONFIGURATION${NC}"
read -p "  🗄️ Setup Database? [Y/n]: " SET_ENV
SET_ENV=${SET_ENV:-y}

if [[ "$SET_ENV" == "y" || "$SET_ENV" == "Y" ]]; then
    read -p "     Connection [mysql]: " DB_CONNECTION; DB_CONNECTION=${DB_CONNECTION:-mysql}
    read -p "     Host [127.0.0.1]  : " DB_HOST; DB_HOST=${DB_HOST:-127.0.0.1}
    read -p "     Port [3306]       : " DB_PORT; DB_PORT=${DB_PORT:-3306}
    
    # Validasi Database Name (Wajib)
    while true; do
        read -p "     Database Name (Wajib): " DB_DATABASE
        if [[ -z "$DB_DATABASE" ]]; then
            echo -e "     ${RED}⚠ Nama database tidak boleh kosong!${NC}"
        else
            break
        fi
    done

    # Validasi Username (Wajib)
    while true; do
        read -p "     Username (Wajib): " DB_USERNAME
        if [[ -z "$DB_USERNAME" ]]; then
            echo -e "     ${RED}⚠ Username database tidak boleh kosong!${NC}"
        else
            break
        fi
    done

    # Validasi Password (Wajib & Hidden)
    while true; do
        read -sp "     Password (Wajib): " DB_PASSWORD; echo ""
        if [[ -z "$DB_PASSWORD" ]]; then
            echo -e "     ${RED}⚠ Password database tidak boleh kosong!${NC}"
        else
            break
        fi
    done
fi

# 3. Package Selection
echo -e "\n${BOLD}3. EXTENSION PACKS${NC}"
echo -e "  ${CYAN}1. Filament   2. Breeze   3. Jetstream   4. Telescope"
echo -e "  5. Debugbar   6. Spatie   7. Sanctum     8. Livewire"
echo -e "  9. Inertia    0. Skip${NC}"
read -p "  📦 Masukkan Pilihan : " CHOICE

# Mapping Nama untuk Summary
PKGS_NAME=""
for p in $CHOICE; do
    case $p in
        1) PKGS_NAME+="Filament "; ;;
        2) PKGS_NAME+="Breeze "; ;;
        3) PKGS_NAME+="Jetstream "; ;;
        4) PKGS_NAME+="Telescope "; ;;
        5) PKGS_NAME+="Debugbar "; ;;
        6) PKGS_NAME+="Spatie "; ;;
        7) PKGS_NAME+="Sanctum "; ;;
        8) PKGS_NAME+="Livewire "; ;;
        9) PKGS_NAME+="Inertia "; ;;
    esac
done

# 4. FINAL SUMMARY
echo -e "\n${GRAY}┌──────────────────────────────────────────────────┐"
echo -e "│${NC}  ${BOLD}INSTALLATION SUMMARY${NC}                            ${GRAY}│"
echo -e "├──────────────────────────────────────────────────┤${NC}"
printf "${GRAY}│${NC}  %-10s : ${CYAN}%-32s${NC} ${GRAY}│${NC}\n" "Project" "$PROJECT"
printf "${GRAY}│${NC}  %-10s : ${CYAN}%-32s${NC} ${GRAY}│${NC}\n" "GitHub" "${GIT_URL:-None}"
if [[ "$SET_ENV" == "y" || "$SET_ENV" == "Y" ]]; then
printf "${GRAY}│${NC}  %-10s : ${GRAY}%-32s${NC} ${GRAY}│${NC}\n" "Database" "$DB_DATABASE"
else
printf "${GRAY}│${NC}  %-10s : ${RED}%-32s${NC} ${GRAY}│${NC}\n" "Database" "Skipped"
fi
printf "${GRAY}│${NC}  %-10s : ${ORANGE}%-32s${NC} ${GRAY}│${NC}\n" "Packages" "${PKGS_NAME:-Minimalist}"
echo -e "${GRAY}└──────────────────────────────────────────────────┘${NC}"

read -p "  🔥 Execute Installation? [Y/n]: " FINAL_CONFIRM
FINAL_CONFIRM=${FINAL_CONFIRM:-y}

if [[ "$FINAL_CONFIRM" != "y" && "$FINAL_CONFIRM" != "Y" ]]; then
    echo -e "\n${RED}Instalasi dibatalkan.${NC}\n"
    exit 1
fi

# -----------------------------
# EKSEKUSI (ANIMASI)
# -----------------------------
echo -e "\n${BOLD}⚡ Memulai Proses Terotomasi...${NC}\n"

(composer create-project laravel/laravel "$PROJECT" --quiet) &
show_spinner $! "Mendownload Laravel Framework"
cd "$PROJECT" || exit 1

if [[ "$USE_GIT" == "y" || "$USE_GIT" == "Y" ]]; then
    (git init -q && git remote add origin "$GIT_URL") &
    show_spinner $! "Menginisialisasi Git Repository"
fi

if [[ "$SET_ENV" == "y" || "$SET_ENV" == "Y" ]]; then
    (
        cp .env.example .env
        sed -i "s|^#*\s*DB_CONNECTION=.*|DB_CONNECTION=$DB_CONNECTION|" .env
        sed -i "s|^#*\s*DB_HOST=.*|DB_HOST=$DB_HOST|" .env
        sed -i "s|^#*\s*DB_PORT=.*|DB_PORT=$DB_PORT|" .env
        sed -i "s|^#*\s*DB_DATABASE=.*|DB_DATABASE=$DB_DATABASE|" .env
        sed -i "s|^#*\s*DB_USERNAME=.*|DB_USERNAME=$DB_USERNAME|" .env
        sed -i "s|^#*\s*DB_PASSWORD=.*|DB_PASSWORD=$DB_PASSWORD|" .env
        php artisan key:generate --quiet
    ) &
    show_spinner $! "Mengonfigurasi File .env & Database"
fi

for pkg in $CHOICE; do
    case $pkg in
        1) (composer require filament/filament:"^3.0" -W --quiet && php artisan filament:install --panels) & show_spinner $! "Installing Filament PHP" ;;
        2) (composer require laravel/breeze --dev --quiet && php artisan breeze:install blade --quiet) & show_spinner $! "Installing Laravel Breeze" ;;
        3) (composer require laravel/jetstream --quiet && php artisan jetstream:install livewire --quiet) & show_spinner $! "Installing Laravel Jetstream" ;;
        4) (composer require laravel/telescope --dev --quiet && php artisan telescope:install --quiet) & show_spinner $! "Installing Laravel Telescope" ;;
        5) (composer require barryvdh/laravel-debugbar --dev --quiet) & show_spinner $! "Installing Laravel Debugbar" ;;
        6) (composer require spatie/laravel-permission --quiet) & show_spinner $! "Installing Spatie Permission" ;;
        7) (php artisan sanctum:install --quiet) & show_spinner $! "Installing Laravel Sanctum" ;;
        8) (composer require livewire/livewire --quiet) & show_spinner $! "Installing Livewire" ;;
        9) (php artisan inertia:install --quiet) & show_spinner $! "Installing Inertia.js" ;;
    esac
done

if [[ "$SET_ENV" == "y" || "$SET_ENV" == "Y" ]]; then
    echo -e ""
    read -p "  Jalankan migrasi database sekarang? [Y/n]: " RUN_MIGRATE
    RUN_MIGRATE=${RUN_MIGRATE:-y}
    if [[ "$RUN_MIGRATE" == "y" || "$RUN_MIGRATE" == "Y" ]]; then
        php artisan migrate
    fi
fi

echo -e "\n${GREEN}${BOLD}✨ INSTALLATION COMPLETED SUCCESSFULLY! ✨${NC}"
echo -e "${GRAY}───────────────────────────────────────────────────${NC}"
echo -e "  ${BOLD}Location:${NC} $(pwd)"
echo -e "  ${BOLD}Next Steps:${NC}"
echo -e "  ${CYAN}1.${NC} cd $PROJECT"
echo -e "  ${CYAN}2.${NC} php artisan serve"
echo -e "${GRAY}───────────────────────────────────────────────────${NC}\n"