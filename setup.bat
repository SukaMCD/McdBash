@echo off
setlocal
chcp 65001 >nul

:: --- Define Escape Character for Colors ---
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set ESC=%%b

:: --- Styling ---
set "BOLD=%ESC%[1m"
set "CYAN=%ESC%[38;5;51m"
set "PINK=%ESC%[38;5;198m"
set "GRAY=%ESC%[38;5;244m"
set "GREEN=%ESC%[38;5;46m"
set "NC=%ESC%[0m"

cls
echo %PINK%%BOLD%
echo   __  __         _  _____      _                
echo  ^|  \/  ^|       ^| ^|/ ____^|    ^| ^|               
echo  ^| \  / ^| ___ __^| ^| (___   ___^| |_ _   _ _ __   
echo  ^| ^|\/^| ^|/ __/ _` ^|\___ \ / _ \ __^| ^| ^| ^| '_ \  
echo  ^| ^|  ^| ^| (_^| (_^| ^|____) ^|  __/ |_^| |_^| ^| ^|_) ^| 
echo  ^| ^|_^|  ^|_^|\___^|__,_^|_____/ \___^|\__^|\__,_^| .__/  
echo                                         ^| ^|     
echo                                         ^|_^|     
echo  %NC%%GRAY%v1.3.0 Installation Wizard (Windows)%NC%
echo %GRAY%───────────────────────────────────────────────────%NC%

echo %CYAN%%BOLD%🚀 Memulai Instalasi McdBash...%NC%
echo.

:: Get absolute path of current directory
set "ROOT_DIR=%~dp0"
if "%ROOT_DIR:~-1%"=="\" set "ROOT_DIR=%ROOT_DIR:~0,-1%"

:: 1. Add to User PATH
echo %GRAY%  ●  Menambahkan McdBash ke PATH Windows...%NC%
setx PATH "%PATH%;%ROOT_DIR%" >nul 2>&1

if %ERRORLEVEL% EQU 0 (
    echo   %GREEN%✔%NC% %BOLD%PATH Berhasil Diperbarui!%NC%
) else (
    echo   %RED%❌ Gagal memperbarui PATH. Coba jalankan sebagai Administrator.%NC%
)

echo.
echo %GREEN%%BOLD%INSTALASI BERHASIL!%NC%
echo %GRAY%Silakan RESTART terminal kamu (CMD, PowerShell, atau Git Bash).%NC%
echo %GRAY%Sekarang kamu bisa menggunakan%NC% %PINK%mcd -h%NC% %GRAY%dari mana saja.%NC%
echo.
pause
