###############################################################################
#
# gst-rtsp-server
#
################################################################################

GST_RTSP_SERVER_VERSION = 1.2.3
GST_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST_RTSP_SERVER_VERSION).tar.xz
GST_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server/

GST_RTSP_SERVER_LICENSE = LGPLv2+ LGPLv2.1+
GST_RTSP_SERVER_LICENSE_FILES = COPYING

GST_RTSP_SERVER_DEPENDENCIES = gstreamer1 gst1-plugins-base gst1-plugins-ugly

$(eval $(autotools-package))
