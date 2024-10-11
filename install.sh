#!/bin/sh

# Copyright (c) 2023 bobbyunknown
# https://github.com/bobbyunknown
# 
# Hak Cipta Dilindungi Undang-Undang
# https://rem.mit-license.org/

PACKAGE_NAME="luci-app-tinyfm"

get_latest_release_url() {
    REPO="bobbyunknown/luci-app-tinyfm"
    API_URL="https://api.github.com/repos/$REPO/releases/latest"
    DOWNLOAD_URL=$(curl -s "$API_URL" | grep "browser_download_url.*ipk" | cut -d '"' -f 4)
    echo "$DOWNLOAD_URL"
}

install_package() {
    echo "Menginstal $PACKAGE_NAME..."
    opkg update && opkg install php8 php8-cgi php8-fastcgi php8-fpm php8-mod-session php8-mod-ctype php8-mod-fileinfo php8-mod-zip php8-mod-iconv php8-mod-mbstring coreutils-stat zoneinfo-asia bash curl tar
    
    DOWNLOAD_URL=$(get_latest_release_url)
    FILENAME=$(basename "$DOWNLOAD_URL")
    wget -O "/tmp/$FILENAME" "$DOWNLOAD_URL"
    
    opkg install "/tmp/$FILENAME"
    
    rm "/tmp/$FILENAME"
    echo "Instalasi $PACKAGE_NAME selesai."
    read -p "Tekan Enter untuk melanjutkan..."
}

force_install_package() {
    echo "Melakukan force install $PACKAGE_NAME..."
    opkg update && opkg install php8 php8-cgi php8-fastcgi php8-fpm php8-mod-session php8-mod-ctype php8-mod-fileinfo php8-mod-zip php8-mod-iconv php8-mod-mbstring coreutils-stat zoneinfo-asia bash curl tar
    
    DOWNLOAD_URL=$(get_latest_release_url)
    FILENAME=$(basename "$DOWNLOAD_URL")
    wget -O "/tmp/$FILENAME" "$DOWNLOAD_URL"
    
    opkg install --force-reinstall "/tmp/$FILENAME"
    
    rm "/tmp/$FILENAME"
    echo "Force install $PACKAGE_NAME selesai."
    read -p "Tekan Enter untuk melanjutkan..."
}

uninstall_package() {
    echo "Menghapus $PACKAGE_NAME..."
    opkg remove "$PACKAGE_NAME"
    find / -type d -name "*openclash*" -exec rm -rf {} + 2>/dev/null
    find / -type f -name "*openclash*" -delete 2>/dev/null
    echo "Paket $PACKAGE_NAME dan file-file terkait berhasil dihapus."
    read -p "Tekan Enter untuk melanjutkan..."
}

while true; do
    clear
    echo "┌─────────────────────────────────────┐"
    echo "│         TinyFM Installer            │"
    echo "│     github.com/bobbyunknown         │"
    echo "├─────────────────────────────────────┤"
    echo "│                                     │"
    echo "│  1. Install TinyFM                  │"
    echo "│  2. Force Install TinyFM            │"
    echo "│  3. Uninstall TinyFM                │"
    echo "│  4. Keluar                          │"
    echo "│                                     │"
    echo "└─────────────────────────────────────┘"
    echo
    read -p "Pilihan Anda [1-4]: " choice
    echo

    case $choice in
        1)
            install_package
            ;;
        2)
            force_install_package
            ;;
        3)
            uninstall_package
            ;;
         4)
            echo "Keluar dari program."
            exit 0
            ;;
        *)
            echo "Pilihan tidak valid. Silakan coba lagi."
            ;;
    esac

    echo "Operasi selesai."
    echo
done