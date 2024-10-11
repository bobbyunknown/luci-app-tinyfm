# Ini adalah perangkat lunak open source, dilisensikan di bawah Lisensi Open Source Kustom
#
# Hak Cipta (C) 2024 BobbyUnknown
#
# Deskripsi:
# Perangkat lunak ini menyediakan aplikasi filemanager tinyfilemanager untuk OpenWrt.
# Aplikasi ini memungkinkan pengguna untuk mengelola file dan direktori pada router
# OpenWrt melalui antarmuka web yang mudah digunakan.
include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI Filemanager
LUCI_DEPENDS:=+curl
LUCI_DESCRIPTION:=Upload Download filemanager

PKG_MAINTAINER:=BobbyUnknown <bobbyun.knowm88gmail.com>
PKG_VERSION:=1.0.1
PKG_LICENSE:=Apache-2.0

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
