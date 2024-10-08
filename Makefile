#
include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI Filemanager
LUCI_DEPENDS:=+curl
LUCI_DESCRIPTION:=Upload Download filemanager

PKG_MAINTAINER:=BobbyUnknown <bobbyun.knowm88gmail.com>
PKG_VERSION:=1.0.0
PKG_LICENSE:=Apache-2.0

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
