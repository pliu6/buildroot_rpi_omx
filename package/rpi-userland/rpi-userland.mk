################################################################################
#
# rpi-userland
#
################################################################################

RPI_USERLAND_VERSION = 9f12d9508533d7d87bb2e2b5796a3d8f2f1e9a95
RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
RPI_USERLAND_LICENSE = BSD-3c
RPI_USERLAND_LICENSE_FILES = LICENCE
RPI_USERLAND_INSTALL_STAGING = YES
RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=OFF

RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg

define RPI_USERLAND_POST_TARGET_CLEANUP
    rm -Rf $(TARGET_DIR)/usr/src
endef
RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP

$(eval $(cmake-package))
