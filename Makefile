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
PKG_RELEASE:=1
PKG_LICENSE:=Custom-Open-Source

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(TOPDIR)/feeds/luci/luci.mk

define Package/$(PKG_NAME)
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=$(LUCI_TITLE)
  DEPENDS:=$(LUCI_DEPENDS)
endef

define Package/$(PKG_NAME)/description
  $(LUCI_DESCRIPTION)
endef

define Build/Prepare
	$(CP) -r ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	# Tidak ada proses kompilasi yang diperlukan untuk JS, PHP, atau shell scripts
endef

define Package/$(PKG_NAME)/install
	# Install PHP files
	$(INSTALL_DIR) $(1)/www/tinyfm
	$(CP) $(PKG_BUILD_DIR)/www/* $(1)/www/tinyfm/

	# Install Shell scripts
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/*.sh $(1)/usr/bin/

	# Install JS dan resource lainnya
	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/tinyfm
	$(CP) $(PKG_BUILD_DIR)/htdocs/luci-static/resources/view/tinyfm/* $(1)/www/luci-static/resources/view/tinyfm/
endef

# call BuildPackage - OpenWrt buildroot signature
$(eval $(call BuildPackage,$(PKG_NAME)))
