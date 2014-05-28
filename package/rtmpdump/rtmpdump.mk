################################################################################
#
# rtmpdump
#
################################################################################

RTMPDUMP_VERSION = 2.4
RTMPDUMP_SOURCE = rtmpdump-$(RTMPDUMP_VERSION).tar.gz
RTMPDUMP_SITE = https://bitbucket.org/peng/gstreamer-unofficial-release/downloads/
GSTREAMER1_INSTALL_STAGING = YES
# Note that rtmpdump is GPLv2 but librtmp has its own license and since we only
# care about librtmp, it's LGPLv2.1+
RTMPDUMP_LICENSE = LGPLv2.1+
RTMPDUMP_LICENSE_FILES = librtmp/COPYING

RTMPDUMP_DEPENDENCIES = zlib

ifeq ($(BR2_PACKAGE_GNUTLS),y)
RTMPDUMP_DEPENDENCIES += gnutls
RTMPDUMP_CONF_OPT = --with-crypto=gnutls
else ifeq ($(BR2_PACKAGE_POLARSSL),y)
RTMPDUMP_DEPENDENCIES += polarssl
RTMPDUMP_CONF_OPT = --with-crypto=polarssl
else ifeq ($(BR2_PACKAGE_OPENSSL),y)
RTMPDUMP_DEPENDENCIES += openssl
RTMPDUMP_CONF_OPT = --with-crypto=openssl
else
# no crypto
RTMPDUMP_CONF_OPT = --with-crypto=none
endif

$(eval $(autotools-package))
