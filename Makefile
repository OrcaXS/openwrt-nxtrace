include $(TOPDIR)/rules.mk

PKG_NAME:=nexttrace
PKG_VERSION:=1.4.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/nxtrace/NTrace-core/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=acbc3a56cf3606314879986cf2a420a3dcb6c797c0611085fe13f514c12e4c91

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=OrcaXS <https://github.com/OrcaXS>

PKG_BUILD_DIR:=$(BUILD_DIR)/NTrace-core-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_BUILD_FLAGS:=no-mips16

GO_PKG:=github.com/nxtrace/NTrace-core

GO_PKG_LDFLAGS_X:=$(GO_PKG)/config.Version=$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/nexttrace
  TITLE:=NextTrace, an open source visual route tracking CLI tool
  SECTION:=net
  CATEGORY:=Network
  URL:=https://www.nxtrace.org/
  DEPENDS:=$(GO_ARCH_DEPENDS) +ca-bundle
endef

define Package/nexttrace/description
  An open source visual routing tool that pursues light weight, developed using Golang.
endef

define Package/nexttrace/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(GO_PKG_BUILD_BIN_DIR)/NTrace-core $(1)/usr/bin/nexttrace
endef

$(eval $(call BuildPackage,nexttrace))
