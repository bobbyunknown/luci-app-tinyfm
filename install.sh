#!/bin/bash

# Perbarui daftar paket
opkg update

# Daftar paket yang akan diinstal
PACKAGES="php8 php8-cgi php8-fastcgi php8-fpm php8-mod-session php8-mod-ctype php8-mod-fileinfo php8-mod-zip php8-mod-iconv php8-mod-mbstring coreutils-stat zoneinfo-asia bash curl tar"

# Instal paket-paket
for package in $PACKAGES; do
    echo "Menginstal $package..."
    opkg install $package
done

# Dapatkan URL unduhan rilis terbaru
echo "Mendapatkan informasi rilis terbaru..."
LATEST_RELEASE_URL=$(curl -s https://api.github.com/repos/bobbyunknown/luci-app-tinyfm/releases/latest | grep "browser_download_url.*ipk" | cut -d '"' -f 4)

if [ -z "$LATEST_RELEASE_URL" ]; then
    echo "Gagal mendapatkan URL unduhan. Keluar."
    exit 1
fi

# Unduh dan instal luci-app-tinyfm
echo "Mengunduh luci-app-tinyfm..."
curl -L -o /tmp/luci-app-tinyfm.ipk "$LATEST_RELEASE_URL"

if [ ! -f /tmp/luci-app-tinyfm.ipk ]; then
    echo "Gagal mengunduh file. Keluar."
    exit 1
fi

echo "Menginstal luci-app-tinyfm..."
opkg install /tmp/luci-app-tinyfm.ipk

# Bersihkan file sementara
rm -f /tmp/luci-app-tinyfm.ipk

echo "Instalasi selesai!"