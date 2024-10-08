# Ini adalah perangkat lunak open source, dilisensikan di bawah Lisensi Open Source Kustom
#
# Hak Cipta (C) 2024 BobbyUnknown
#
# Deskripsi:
# Perangkat lunak ini menyediakan aplikasi filemanager tinyfilemanager untuk OpenWrt.
# Aplikasi ini memungkinkan pengguna untuk mengelola file dan direktori pada router
# OpenWrt melalui antarmuka web yang mudah digunakan.

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI for filemanager
LUCI_DEPENDS:=+php8 +php8-cgi +php8-mod-session +php8-mod-zip +php8-mod-iconv +php8-mod-mbstring +php8-mod-fileinfo +zoneinfo-core
LUCI_DESCRIPTION:=Menyediakan aplikasi filemanager tinyfilemanager untuk OpenWrt.

PKG_MAINTAINER:=BobbyUnknown <bobbyun.known88@gmail.com>
PKG_VERSION:=1.0
PKG_LICENSE:=Custom-Open-Source

include $(TOPDIR)/feeds/luci/luci.mk


